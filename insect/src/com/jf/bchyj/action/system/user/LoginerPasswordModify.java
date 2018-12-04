package com.jf.bchyj.action.system.user;

import javax.servlet.http.HttpServletRequest;

import com.jf.util.MD5YZJM;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class LoginerPasswordModify extends InitAction{
   protected void actionQuery(ServletObject servletObject) {
	   MD5YZJM md5=new MD5YZJM();
     HttpServletRequest httpServletRequest = servletObject.httpServletRequest;
     String sql = "",sql_where="";
     javax.servlet.http.HttpSession session = null;
    session = servletObject.httpServletRequest.getSession();
    String lrry = ( (com.jf.bchyj.bean.User) session.getAttribute("user")).getUserjfid();

     String password = httpServletRequest.getParameter("kl");
     String repassword=httpServletRequest.getParameter("hskl");


     sql = "update dsys01 set jfpassword='"+md5.md5Password(password)+"'where jfid='"+lrry+"'";

     if(servletObject.dc.pjdo.execute(sql)>0){
     servletObject.dc.pjdo.dbConn.commit();
      httpServletRequest.setAttribute("Message", "±£´æ³É¹¦!");
   }else{
     servletObject.dc.ec.rollback();
   servletObject.httpServletRequest.setAttribute("Message", "Ê§°Ü!");
     return;
   }


    }
}
