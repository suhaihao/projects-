package com.jf.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import mt.controller.InitAction;
import mt.controller.base.ServletObject;
import mt.database.extend.QueryConnection;

public class GetXZJH extends InitAction {

	protected void actionQuery(ServletObject so) {
		try {
		String sql="select JFDEPTCODE,JFDEPTNAME from DSYS05 t where JFDEPTPROP='1' and JFSTATE='1'";
		String xian="";
		String xiang="";
		    //区
		    QueryConnection qc = new QueryConnection();
			Statement stmt = qc.con.createStatement();
			//县
			QueryConnection qcxz = new QueryConnection();
			//乡
			QueryConnection qxxz = new QueryConnection();
			boolean x=false;
			boolean xx=false;
			ResultSet rs = stmt.executeQuery(sql);
			String str="[";
			while(rs.next())
			{
			str+="{\"id\""+":"+"\""+rs.getString(1)+"\",\"text\":\""+rs.getString(2)+"\",children:[";
			xian="select jfregcode,jfregname from dsys06 where jfdsys05_code='"+rs.getString(1)+"' and jc='2' ";
			Statement stmtxz = qcxz.con.createStatement();
			ResultSet rsxz = stmtxz.executeQuery(xian);
			   //遍历县 
			   while(rsxz.next()){
			   str+="{\"id\":\""+rsxz.getString(1)+"\",\"text\":\""+rsxz.getString(2)+"\",children:[";
			   xiang="select jfregcode,jfregname from dsys06 where jfdsys05_code='"+rs.getString(1)+"' and jc='3' and jfregcode like '"+rsxz.getString(1)+"%'";
			   Statement stmtxx = qxxz.con.createStatement();
			   ResultSet rsxx = stmtxx.executeQuery(xiang);
			   while(rsxx.next())
			   {
			   str+="{\"id\":\""+rsxx.getString(1)+"\",\"text\":\""+rsxx.getString(2)+"\"},";
			   }
			   stmtxx.close();
			   rsxx.close();
			   str+="]},";
			   }
			   stmtxz.close();
			   rsxz.close();
			str+="]},";
			}
			stmt.close();
			
			str+="]";
			so.httpServletResponse.getWriter().print(str);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
}
