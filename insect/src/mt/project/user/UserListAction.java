package mt.project.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class UserListAction extends InitAction {

	protected void insert(ServletObject so) {
		HttpServletRequest req = so.httpServletRequest;
		String sql = "";
		String firm_bm = req.getParameter("dfirm:firm_bm:str:s");
		String zydm = req.getParameter("dsys01:zydm:str:S");
		String zymc = req.getParameter("dsys01:zymc:str:S");
		String kl = req.getParameter("dsys01:kl:str:S");

		sql = "INSERT INTO DSYS01(JFID,ZYDM,ZYMC,BMBM,USER_BZ,KL,LRRQ) \n";
		sql += "VALUES (S_DSYS01.NEXTVAL,'" + zydm + "','" + zymc + "','"
				+ firm_bm + "','1','" + kl + "',SYSDATE)";

		HttpServletResponse resp = so.httpServletResponse;
		resp.setContentType("text/html;charset=GBK");
		if (so.dc.pjdo.execute(sql) > 0) {
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
				resp.getWriter().print("<script type=\"text/javascript\">window.alert(\"插入失败\");window.close()</script>");
				resp.getWriter().flush();
				resp.getWriter().close();
			} catch (IOException Ioe) {
				new mt.tools.customException(Ioe, this.toString());
			}
		}
	}

  protected void update(ServletObject servletObject) {
      String sql = "";
      String firm_bm = servletObject.httpServletRequest.getParameter("dfirm:firm_bm:str:s");
      String zydm = servletObject.httpServletRequest.getParameter("dsys01:zydm:str:S");
      String zymc = servletObject.httpServletRequest.getParameter("dsys01:zymc:str:S");
      String kl = servletObject.httpServletRequest.getParameter("dsys01:kl:str:S");
      String jfid = servletObject.httpServletRequest.getParameter("dsys01:jfid:str:P");

      sql = "update dsys01 set bmbm='"+firm_bm+"',zydm='"+zydm+"',zymc='"+zymc+"',kl='"+kl+"' where jfid='"+jfid+"'";
    if ( servletObject.dc.pjdo.execute(sql) > 0){
    servletObject.dc.ec.commit();}
    servletObject.httpServletRequest.setAttribute("Message", "保存成功!");
  }

  protected void actionQuery(ServletObject servletObject) {

    //User user = (User)servletObject.httpServletRequest.getSession().getAttribute("user");
    //String bmbm = user.userUnit;
    String firm_bm = servletObject.httpServletRequest.getParameter("dfirm:firm_bm:str:s");
    String zydm = servletObject.httpServletRequest.getParameter("dsys01:zydm:str:=");
    if(firm_bm==null){firm_bm="";}
    if(zydm==null){zydm="";}

    String sql=" select dsys01.zymc,dsys01.zydm,f_get_mc('BMBM',bmbm) bmmc,bmbm,";
    sql+=" decode(user_bz,'0','否','是') user_bz,to_char(lrrq,'yyyy-mm-dd') lrrq ,";
    sql+=" decode(zt,'3','作废','4','冻结','5','初始','6','正常','其他') zt,jfid ";
    sql+=" from dsys01 where 1=1 ";
    if(firm_bm.trim().length()>0){
        sql +=" and bmbm = '"+firm_bm+"' ";
    }
    if(zydm.trim().length()>0){
        sql +=" and zydm = '"+zydm+"' ";
    }

   ContainDivPage cdp = new ContainDivPage();
   cdp.sqlWhole = sql;
   cdp.sqlsort = "";
   cdp.sqlselect = sql;
   servletObject.httpServletRequest.getSession().setAttribute(servletObject.actionMapping.findForward(switchForward(
       servletObject.actForward)).getPath() + "_sql", cdp);

  }
  protected void querySingle(ServletObject servletObject) {

    //User user = (User)servletObject.httpServletRequest.getSession().getAttribute("user");
    //String bmbm = user.userUnit;
    String jfid = servletObject.httpServletRequest.getParameter("dsys01:jfid:str:P");

    String sql=" select dsys01.jfid,dsys01.zymc,dsys01.zydm,f_get_mc('BMBM',bmbm) firm_mc,bmbm firm_bm,";
    sql+=" decode(user_bz,'0','否','是') user_bz,to_char(lrrq,'yyyy-mm-dd') lrrq ,kl,kl kl_hs,";
    sql+=" decode(zt,'3','作废','4','冻结','5','初始','6','正常','其他') zt,jfid ";
    sql+=" from dsys01 where 1=1 ";
        sql +=" and jfid = '"+jfid+"' ";

   ContainDivPage cdp = new ContainDivPage();
   cdp.sqlWhole = sql;
   cdp.sqlsort = "";
   cdp.sqlselect = sql;
   servletObject.httpServletRequest.getSession().setAttribute(servletObject.actionMapping.findForward(switchForward(
       servletObject.actForward)).getPath() + "_sql", cdp);

  }
  protected void delete(ServletObject servletObject) {
     if (servletObject.dc.dataInDataBase(servletObject.formData, 'D') > 0){
              servletObject.dc.ec.commit();
     }
     String jfid = "";
          jfid=servletObject.httpServletRequest.getParameter("dsys01:jfid:str:P");
          String sql ="delete from dsys01_dsys03 where dsys01_jfid = '"+jfid+"'";
          servletObject.dc.pjdo.execute(sql);
     servletObject.dc.ec.commit();
  }


}
