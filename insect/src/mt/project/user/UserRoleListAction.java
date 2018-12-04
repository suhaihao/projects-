package mt.project.user;

import java.io.IOException;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class UserRoleListAction extends InitAction {

  protected void actionQuery(ServletObject servletObject){
    String sqlSelect="" ;
    String sqlWhere="";
    //String sf_sjrole="";

    String sqlSort="";
    String dsys01_jfid="";
    //String bmbm="";
    dsys01_jfid=servletObject.httpServletRequest.getParameter("jfid");

    //User user=(User)servletObject.httpServletRequest.getSession().getAttribute("user");
    //bmbm = user.userUnit;
    sqlSelect=" select dsys20.jfid,jfname,dsys20_jfid,nvl(dsys01_jfid,'"+dsys01_jfid+"') dsys01_jfid \n";
    sqlSelect+=" from dsys20,(\n";
    sqlSelect+=" select dsys01_jfid,dsys20_jfid \n";
    sqlSelect+="        from dsys01_dsys03 where dsys01_jfid='"+dsys01_jfid+"' \n";
    sqlSelect+="   ) b ";
    sqlWhere="  dsys20.jfid=b.dsys20_jfid(+) ";

    javax.servlet.http.HttpSession session = servletObject.httpServletRequest.getSession(true);
    ContainDivPage cdp=new ContainDivPage();
    cdp.sqlWhole = sqlSelect + " where " + sqlWhere +" order by jfid" ;
    //System.out.println(cdp.sqlWhole);
    cdp.sqlsort = sqlSort;
    cdp.sqlselect =sqlSelect + " where " + sqlWhere;
    //System.out.println(cdp.sqlselect);
    session.setAttribute(servletObject.actionMapping.findForward(switchForward(servletObject.actForward)).getPath()+"_sql",cdp);
  }
  protected void insert(ServletObject servletObject){
    String dsys01_jfid="";
    dsys01_jfid= servletObject.httpServletRequest.getParameter("dsys01_dsys03:dsys01_jfid:str:N");
    String[] col=new String[1];
    String[] val=new String[1];

    col[0]="dsys01_dsys03:dsys01_jfid:str:M";
    val[0]=dsys01_jfid;
    servletObject.dc.attachCol =col;
    servletObject.dc.attachVal =val;
    String sqlTemp="";
    sqlTemp=" delete from dsys01_dsys03 where dsys01_jfid='" +dsys01_jfid +"' " ;
    //System.out.println(sqlTemp);
    servletObject.dc.pjdo.execute(sqlTemp);
    servletObject.httpServletResponse.setCharacterEncoding("GBK");
    //servletObject.httpServletResponse.setContentType("text/html;charset=GBK");
    String chakename[]=servletObject.httpServletRequest.getParameterValues("dsys01_dsys03:dsys20_jfid:str:M");
    for (int i = 0; i < chakename.length; i++) {
    	 sqlTemp=" insert into DSYS01_DSYS03 (dsys01_jfid,dsys20_jfid) values('"+dsys01_jfid+"','"+chakename[i]+"')" ;
    	    //System.out.println(sqlTemp);
    	    servletObject.dc.pjdo.execute(sqlTemp);
	}
     try {
    	 servletObject.httpServletResponse.getWriter().write("<script type=\"text/javascript\">alert(\"插入成功\");window.open('','_parent','');window.close();</script>"); 
       //servletObject.httpServletResponse.getOutputStream().print("<script type=\"text/javascript\">");
       //servletObject.httpServletResponse.getOutputStream().print("window.alert(\"插入成功\")");
       //servletObject.httpServletResponse.getOutputStream().print("</script>");
       //servletObject.httpServletResponse.getOutputStream().flush();
//            servletObject.httpServletResponse.getOutputStream().close();
//            servletObject.httpServletResponse.flushBuffer();

     }
     catch (IOException Ioe) {
       new mt.tools.customException(Ioe, this.toString());
 }
//    super.insert(servletObject);
  }

}
