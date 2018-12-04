package mt.project.user;

import mt.controller.InitAction;
import javax.servlet.http.HttpServletRequest;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;
import mt.project.share.User;

public class User_bz_ListAction extends InitAction{
  protected void actionQuery(ServletObject servletObject){
   String dsys01_jfid = "";
   String tjzt = "";
   String bmbm = "";
   User user=(User)servletObject.httpServletRequest.getSession().getAttribute("user");
   tjzt = user.userUnitServer;
   bmbm = user.userUnit;
   dsys01_jfid =servletObject.httpServletRequest.getParameter("dcw01_dsys01:dsys01_jfid:str:P");
   String sql = "";
   sql += "select jfid,ztbm,hzmc,dsys01_jfid,b.dcw01_jfid from dcw01 ";
   sql += " ,( select dsys01_jfid,dcw01_jfid from dcw01_dsys01  where dsys01_jfid='" + dsys01_jfid + "') b ";
   sql += "where dcw01.ztbm=b.dcw01_jfid(+)";
   if(bmbm.trim().equals("010000")){

   }else{
   sql += " and dcw01.dy_bmbm like '"+tjzt+"'";
   }
   sql += "order by ztbm";
   javax.servlet.http.HttpSession session = servletObject.httpServletRequest.getSession(true);
   ContainDivPage cdp=new ContainDivPage();
   cdp.sqlselect=sql;
   cdp.sqlsort =  " ";
   cdp.sqlWhole =sql;
   session.setAttribute(servletObject.actionMapping.findForward(switchForward(servletObject.actForward)).getPath()+"_sql",cdp);
  }
   protected void insert(ServletObject servletObject){
     String dsys01_jfid = " ";
     String deleteSql="";
     dsys01_jfid= ((String[])servletObject.httpServletRequest.getParameterValues("dcw01_dsys01:dsys01_jfid:str:N"))[0];
     deleteSql = "";
     deleteSql += "delete from dcw01_dsys01 where dsys01_jfid ='"+dsys01_jfid+"'";
     //System.out.println(deleteSql);
     String[] addCol=new String[2];
     String[] addVal=new String[2];
     addCol[0]="dcw01_dsys01:dsys01_jfid:str:M";
     addVal[0]=dsys01_jfid;
     addCol[1]="dcw01_dsys01:qx:str:M";
     addVal[1]="5";
     servletObject.dc.attachCol= addCol;
     servletObject.dc.attachVal= addVal;
     servletObject.dc.pjdo.execute(deleteSql);
     super.insert(servletObject);
     // pageClose();
   }
}
