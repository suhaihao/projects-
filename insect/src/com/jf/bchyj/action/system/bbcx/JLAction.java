package com.jf.bchyj.action.system.bbcx;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import mt.controller.InitAction;
import mt.controller.base.ServletObject;
import mt.database.extend.QueryConnection;

public class JLAction extends InitAction {
	
	protected void actionQuery(ServletObject so) {
		String code=so.httpServletRequest.getParameter("code");
		String zbid=so.httpServletRequest.getParameter("zbid");
		String sql="SELECT JFCOLMEANS,DY_JL_COL FROM DBBZB_JG t WHERE JFDBBZB_ID='"+zbid+"' AND JFCOLFASHION='6'";
		Map<String, Map> maps=new HashMap<String, Map>();
		try {
		QueryConnection qc = new QueryConnection();
	    Statement stmt = null;
	    Statement stmtz = null;
	    Statement stmtzjh = null;
	    ResultSet rs = null;
	    ResultSet rsz = null;
	    ResultSet rszjh = null;
	    String dyjl="";
	    String []dyjlsz=null;
	    String sqlz="";
	    String jfmansf="";
	    String jfmansz="";
	    String fzgx="";
	    String sqlzjh="";
			stmt = qc.con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				dyjl=rs.getString("DY_JL_COL");
				dyjlsz=dyjl.split(",");
				jfmansf=rs.getString("JFCOLMEANS");
				for (int i = 0; i < dyjlsz.length; i++) {
					sqlz="SELECT JFCOLMEANS FROM DBBZB_JG WHERE  JFDBBZB_ID='"+zbid+"' AND JFCOLID='"+dyjlsz[i]+"'";
					QueryConnection qcz = new QueryConnection();
					stmtz = qcz.con.createStatement();
					rsz = stmtz.executeQuery(sqlz);
					Map<String, String> mapi=new HashMap<String, String>();
					while(rsz.next())
					{
						jfmansz=rsz.getString("JFCOLMEANS");
						sqlzjh="select a.jfcode,a.jfcodename from dsys11 a,dsys11_jl b where a.jfcode=b.c_jfcode and b.jllb='"+jfmansf+"-"+jfmansz+"' and a.jfsort='"+jfmansz+"' and b.p_jfcode='"+code+"'";
						QueryConnection qczjh = new QueryConnection();
						stmtzjh = qczjh.con.createStatement();
						rszjh = stmtzjh.executeQuery(sqlzjh);
						while(rszjh.next())
						{
							mapi.put(rszjh.getString(1), rszjh.getString(2));
						}
					}
					maps.put(dyjlsz[i], mapi);
				}
			}
			//maps.put("1", "°¡¹þ¹þ");
			//maps.put("2", "ÍÛ¹þ¹þ");
			JSONObject jsonObj=JSONObject.fromObject(maps);
			so.httpServletResponse.getWriter().print(jsonObj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
