package mt.project.user;

import mt.controller.InitAction;
import javax.servlet.http.HttpServletRequest;
import mt.controller.base.ContainDivPage;
import mt.database.DbConnection;
import mt.database.analyseTable;
import mt.controller.base.ServletObject;

public class User_gzgw_ListAction extends InitAction{
  protected void actionQuery(ServletObject servletObject){
    String dsys01_jfid ="";
    dsys01_jfid=servletObject.httpServletRequest.getParameter("dsys01:jfid:str:P");
    String sql ="";
    sql+="select bm ,hzmc ,dsys01_jfid,gzgw from dsys11,";
    sql+="(select dsys01_jfid, gzgw from dsys01_gzgw where dsys01_jfid='"+dsys01_jfid+"')";
    sql+="   where bm = gzgw(+) and bmlb='GZGW'";
    javax.servlet.http.HttpSession session = servletObject.httpServletRequest.getSession(true);
    ContainDivPage cdp=new ContainDivPage();
    cdp.sqlselect=sql;
    cdp.sqlsort =  " ";
    cdp.sqlWhole =sql;
    session.setAttribute(servletObject.actionMapping.findForward(switchForward(servletObject.actForward)).getPath()+"_sql",cdp);
  }
  protected void insert(ServletObject servletObject){
     String dsys01_jfid = " ";
     String jfid=" ";
     String deleteSql="";
     dsys01_jfid= ((String[])servletObject.httpServletRequest.getParameterValues("dsys01_gzgw:dsys01_jfid:str:N"))[0];
     deleteSql = "";
     deleteSql += "delete from dsys01_gzgw where dsys01_jfid ='"+dsys01_jfid+"'";
     String[] addCol=new String[2];
     String[] addVal=new String[2];
     addCol[0]="dsys01_gzgw:dsys01_jfid:str:M";
     addVal[0]=dsys01_jfid;

     addCol[1]="dsys01_gzgw:jfid:str:P";
     addVal[1]="";
     servletObject.dc.attachCol= addCol;
     servletObject.dc.attachVal= addVal;
     servletObject.dc.pjdo.execute(deleteSql);
     super.insert(servletObject);
     //pageClose();

   }

}
