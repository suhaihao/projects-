package com.jf.bchyj.action.system.code;

import mt.controller.InitAction;
import javax.servlet.http.HttpServletRequest;
import mt.controller.base.ContainDivPage;
import mt.database.DbConnection;
import mt.database.analyseTable;
import java.sql.*;
import mt.controller.base.ServletObject;
import mt.database.JavaDataObject;

public class SystemCodeUpdate extends InitAction{
    protected void actionQuery(ServletObject servletObject)
    {
      String bmlb = "";
      String sql = "";
      String sql_q="";
      String col_bl_z = "";
      String col_bz0 = "";
      String col_bz1 = "";
      bmlb = new mt.tools.CustString().nullToString(servletObject.httpServletRequest.getParameter("bmlb"));
      sql_q +="select jfid,jfsort,jfsortname from dsys10 where jfsort='"+bmlb+"'";
      servletObject.dc.pjdo.executeQuery(sql_q);
      try {
        servletObject.dc.pjdo.rs.first();
        col_bl_z=new mt.tools.CustString().nullToString(servletObject.dc.pjdo.rs.getString("jfid"));
        col_bz0=new mt.tools.CustString().nullToString(servletObject.dc.pjdo.rs.getString("jfsort"));
        col_bz1=new mt.tools.CustString().nullToString(servletObject.dc.pjdo.rs.getString("jfsortname"));
      }
      catch (SQLException ex) {
      }

      servletObject.getSession().setAttribute("syscode_bmlb",bmlb);
      servletObject.getSession().setAttribute("syscode_col_bz1", col_bl_z);
      servletObject.getSession().setAttribute("syscode_col_bz2", col_bz0);
      servletObject.getSession().setAttribute("syscode_col_bz3", col_bz1);
      if(bmlb==null||bmlb.trim().equals("")){
        bmlb=new mt.tools.CustString().nullToString(servletObject.httpServletRequest.getParameter("bmlb"));
      }
      sql = "select jfid,jfcode,jfcodename,jfsort,jfremark bz1,jfstate bz2 from dsys11 "
          + "where jfsort='" + bmlb + "' order by jfcode";
      //System.out.println(sql);
      servletObject.setActForward("QUERY");
      ContainDivPage cdp = new ContainDivPage();
      cdp.sqlWhole = sql;
      cdp.sqlsort = " ";
      cdp.sqlselect = sql;
      servletObject.getSession().setAttribute(servletObject.actionMapping.findForward(switchForward(servletObject.getActForward())).getPath() + "_sql", cdp);
  }
  protected void update(ServletObject servletObject)
  {
    HttpServletRequest httpServletRequest = servletObject.httpServletRequest;
    String sql = "";
    boolean success = true;
    String message = "";
    String dsys11_jfid_seq = "";
    String bmlb = (String)servletObject.getSession().getAttribute("syscode_bmlb");
    String bm[] = httpServletRequest.getParameterValues("dsys11:jfcode:str:M");
    String hzmc[] = httpServletRequest.getParameterValues("dsys11:jfcodename:str:M");
    String dsys11_jfid[] = httpServletRequest.getParameterValues("dsys11:jfid:str:M");
    String dsys11_jfremark[] = httpServletRequest.getParameterValues("dsys11:bz1:str:M");
    analyseTable at = new analyseTable( (DbConnection) servletObject.dc.ec, "dsys11");
    for (int i = 0; i < bm.length; i++)
    {
      if (new mt.tools.CustString().nullToString(dsys11_jfid[i]).equals(""))
      {
        dsys11_jfid_seq= at.getSequence();
        sql = " insert into dsys11(jfid, ";
        sql += "jfsort,jfcode,jfcodename,jfremark,jfstate) ";
        sql += " values('" + dsys11_jfid_seq + "',"
            +  "'" + bmlb + "','" + bm[i].trim() + "','" + hzmc[i].trim() + "','" + dsys11_jfremark[i].trim() + "','1') ";
      //System.out.println(sql);
      }
      else {
        sql = "update dsys11 "
            + "set jfcode='" + bm[i].trim() + "',jfcodename='" + hzmc[i].trim() + "'" + ",jfremark='"+dsys11_jfremark[i].trim()+"'"
            + " where jfid='" + dsys11_jfid[i] + "'";
        System.out.println(sql);
        //System.out.println(dsys11_jfid[i]);
      }
      if(servletObject.dc.pjdo.execute(sql) <=0 )
      {
        success = false;
        servletObject.dc.ec.rollClose();
        break;
      }
    }
    servletObject.dc.pjdo.dbConn.commitClose();
    if(success)
    {
      message = "保存成功！";
    }
    else
    {
      message = "保存失败！";
    }
    servletObject.getSession().setAttribute("MessageRedirect", message);

//    try
//    {
//      servletObject.httpServletResponse.sendRedirect("/hnzx/systemCodeUpdate.do?ACT_TYPE=QUERY&bmlb=" + bmlb );
//    }
//    catch (Exception e)
//    {
//      e.printStackTrace();
//    }
  }//update over
  protected void other(ServletObject servletObject) {
    //dc.dataInDataBase(formData, 'D');

    mt.database.extend.JdbcConnection  jdbc=new mt.database.extend.JdbcConnection();
    mt.database.JavaDataObject jdo= new JavaDataObject(jdbc);
    String jfidDelete = servletObject.httpServletRequest.getParameter("dsys11:jfid:str:P");
    try {
      jdo.execute("delete from dsys11 where jfid='" +
                                    jfidDelete + "'");
      servletObject.setActForward("DELETE");
      jdo.dbConn.commit();
      servletObject.httpServletRequest.setAttribute("MessageRedirect", "提交成功!");
    }
    catch (Exception ex) {
      jdo.dbConn.rollClose();
      ex.printStackTrace();
    }
    }
}
