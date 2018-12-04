package com.jf.util;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;
import mt.controller.InitAction;
import mt.controller.base.ServletObject;
import mt.database.extend.QueryConnection;

public class GetBBLB extends InitAction {
	
	protected void actionQuery(ServletObject so) {
		String sql="select jfcode,jfcodename from dsys11 t where jfsort='BBLB' and length(jfcode)=4 order by jfid";
		Map<String, String> maps=new LinkedHashMap<String, String>();
		QueryConnection qc = new QueryConnection();
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
