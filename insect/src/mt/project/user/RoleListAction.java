package mt.project.user;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;
import mt.database.DbConnection;
import mt.project.share.User;


public class RoleListAction extends InitAction {
  protected void actionQuery(ServletObject servletObject) {
    //String bmbm="";
    String role_bm="";
    String role_name="";
    String sql="";
    String user_id="";
    String sf_fjrole="";
    User user= (User)servletObject.httpServletRequest.getSession().getAttribute("user");
    user_id=user.userId.trim();
    sql = "select sf_fjrole from dsys03 a,dsys01_dsys03 b where a.jfid=b.dsys03_jfid and dsys01_jfid='"+user_id+"'";
    servletObject.dc.pjdo.executeQuery(sql);
    try {
      while (servletObject.dc.pjdo.rs.next()) {
        sf_fjrole=servletObject.dc.pjdo.rs.getString(1);
        if(sf_fjrole.trim().equals("0")){
          break;
        }
      }
    }
    catch (SQLException ex) {
    }
    sql="select jfid,role_bm,role_name,bz,bmbm,sf_fjrole from dsys03 ";
//    sql+="where bmbm like (select tjzt from dsys05 where bmbm ='"+bmbm+"')";
    sql+="where 1=1 ";
    if(sf_fjrole.trim().equals("0")){

    }else{
//      sql+=" and sf_fjrole='1'";
    }
    role_bm= servletObject.httpServletRequest.getParameter("dsys03:role_bm:str:like");
    role_name=servletObject.httpServletRequest.getParameter("dsys03:role_name:str:like");
    if (role_bm!=null&&!role_bm.trim().equals("")){
      sql+=" and role_bm like '%"+role_bm+"%'";
    }
    if (role_name!=null&&!role_name.trim().equals("")){
      sql+=" and role_name like '%"+role_name+"%'";
    }
    //System.out.println(sql);
    ContainDivPage cdp=new ContainDivPage();
    cdp.sqlWhole = sql;
    cdp.sqlsort = " ";
    cdp.sqlselect = sql;

    //dc.setQuerySqlWhere("bmbm like (select tjzt from dsys05 where bmbm ='"+bmbm+"')");
    //cdp.sqlWhole = dc.getQuerySql(formData, 'Q');
    //cdp.sqlsort = dc.sqlorder;
    //cdp.sqlselect = dc.sqlselect;
    //System.out.println(cdp.sqlselect);
    servletObject.getSession().setAttribute(servletObject.actionMapping.findForward(
        switchForward(servletObject.actForward)).
        getPath() + "_sql", cdp);
  }

	protected void insert(ServletObject so) {
		String[] col = new String[1];
		String[] val = new String[1];

		col[0] = "dsys03:jfid:lon:S";

		DbConnection dbc = (DbConnection) so.dc.ec;
		mt.database.analyseTable at = new mt.database.analyseTable(dbc, "dsys03");
		val[0] = at.getMaxId();

		so.dc.attachCol = col;
		so.dc.attachVal = val;
		HttpServletResponse resp = so.httpServletResponse;
		resp.setContentType("text/html;charset=GBK");
		if (so.dc.dataInDataBase(so.formData, 'I') > 0) {
			so.dc.ec.commit();
			try {
				resp.getWriter().print("<script type=\"text/javascript\">window.alert(\"插入成功\");window.close()</script>");
				resp.getWriter().flush();
				resp.getWriter().close();
			} catch (IOException Ioe) {
				new mt.tools.customException(Ioe, this.toString());
			}
		} else {
			try {
				resp.getWriter().print("<script type=\"text/javascript\">window.alert(\"插入角色已存在,插入失败\");window.close()</script>");
				resp.getWriter().flush();
				resp.getWriter().close();
			} catch (Exception Ioe) {
				new mt.tools.customException(Ioe, this.toString());
			}
		}
	}

  protected void update(ServletObject servletObject) {
      if ( servletObject.dc.dataInDataBase(servletObject.formData, 'U') > 0){
      servletObject.dc.ec.commit();
      servletObject.httpServletRequest.setAttribute("Message", "成功!");
      }
  }
  protected void delete(ServletObject servletObject) {
     if (servletObject.dc.dataInDataBase(servletObject.formData, 'D') > 0){
       servletObject.dc.ec.commit();
     String jfid = "";
     jfid=servletObject.httpServletRequest.getParameter("dsys03:jfid:str:P");
     String sql ="delete from dsys02_dsys03 where dsys03_jfid = '"+jfid+"'";
     servletObject.dc.pjdo.execute(sql);
     servletObject.dc.ec.commit();
     }

  }


}
