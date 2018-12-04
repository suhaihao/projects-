package com.jf.util;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import mt.controller.InitAction;
import mt.controller.base.ServletObject;
import mt.database.extend.QueryConnection;

public class GetSJBM extends InitAction {
	
	protected void actionQuery(ServletObject so) {
		String code=so.httpServletRequest.getParameter("code");
		Map<String, String> maps=new HashMap<String, String>();
		String sql="";
		if(code.equals("1"))
		{
			QueryConnection qc = new QueryConnection();
			sql="select JFDEPTCODE,JFDEPTNAME from DSYS05 where JFDEPTPROP=0";
			try {
				Statement stmt = qc.con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()) {
					maps.put(rs.getString(2), rs.getString(1));
				}
				JSONObject jsonObj=JSONObject.fromObject(maps);
				so.httpServletResponse.getWriter().print(jsonObj);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(code.equals("2"))
		{
			QueryConnection qc = new QueryConnection();
			sql="select JFDEPTCODE,JFDEPTNAME from DSYS05 where JFDEPTPROP=1";
			try {
				Statement stmt = qc.con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()) {
					maps.put(rs.getString(2), rs.getString(1));
				}
				JSONObject jsonObj=JSONObject.fromObject(maps);
				so.httpServletResponse.getWriter().print(jsonObj);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
}
