package com.jf.bchyj.action.system.bbcx;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.FileItem;

import jxl.biff.ByteArray;

import net.sf.json.JSONObject;

import com.jf.util.ExportExcel;

import mt.controller.InitAction;
import mt.controller.base.ServletObject;
import mt.database.extend.QueryConnection;

public class CreatexlAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String zbid=so.httpServletRequest.getParameter("code");
		String jfid=so.httpServletRequest.getParameter("jfid");
		//生成表头
		String sql="select dbbzb_gs.jfcolname,"+
        "jfcolcode,"+
        "jfcolnumber,"+
        "jfcolrows,"+
        "jfcolorder,"+
        "jfcolroword,"+
        "dbbzb_gs.jfcolid,"+
        "jfcolattr,"+
        "jftitleweight,"+
        "jfsubheadweight,"+
        "jftabheadweight,"+
        "jftabbodyweight,"+
        "jftabendweight,"+
        "jftitlesize,"+
        "jfsubheadsize,"+
        "jftabheadsize,"+
        "jftabbodysize,"+
        "jftabendsize,"+
        "jfcolwidth,"+
        "jfcolheight,"+
        "jfcolstyle,"+
        "jfcollength,"+
        "jfcolfashion,"+
        "jfcolmeans,"+
        "jfcolcount,"+
        "dbbzb_jg.jfnull,"+
        "JFCOLJYGX,"+
        " JFCOLJYTS,"+
        " DY_JL_COL"+
   " from dbbzb_gs, dbbzb, dbbzb_jg "+
  " where dbbzb_gs.jfdbbzb_id = dbbzb.jfid "+
    " and (dbbzb_jg.jfdbbzb_id = dbbzb.jfid or dbbzb_jg.jfdbbzb_id is null) "+
    " and dbbzb_jg.jfcolid(+) = dbbzb_gs.jfcolcode "+
    " and dbbzb_gs.jfdbbzb_id = '"+zbid+"' "+
    " and dbbzb_gs.jfcolvest = '1' "+
    " and jfcolnumber='1' "+
  " order by jfcolorder ";  
		QueryConnection qc = new QueryConnection();
		List<String> title=new ArrayList();  
		List<String> li=new ArrayList();  
	    try {
		    Statement stmt = qc.con.createStatement();
		    ResultSet rs = stmt.executeQuery(sql);
		    while (rs.next()) {
		    	title.add(rs.getString(1));
		    }
	    } catch (Exception e) {
	    }
	    String[] Title=new String[title.size()];  
	    for (int i = 0; i < title.size(); i++) {
	    	Title[i]=title.get(i);
		}
	    //查询相关数据
		if(jfid!=null&&!jfid.equals("null")&&!jfid.equals(""))
		{
			 //查询字段
			 sql="select JFCOLID,JFCOLSTYLE,JFCOLVEST,JFCOLMEANS  from DBBZB_JG t where jfdbbzb_id="+zbid+" and JFCOLVEST=2  order by jfcolid asc";
			 QueryConnection qcbody = new QueryConnection();
			 String zdm="";
			    Statement stmtbody = null;
			    ResultSet rsbody = null;
			    try {
				    int a=1;
				    stmtbody = qcbody.con.createStatement();
				    rsbody = stmtbody.executeQuery(sql);
				    while (rsbody.next()) {
				    	if(a==1)
				    	{
				    			if(rsbody.getString("JFCOLSTYLE").equals("1"))
				    			{
				    				zdm +="to_char("+rsbody.getString("JFCOLID")+",'yyyy-mm-dd')"+rsbody.getString("JFCOLID")+",";
				    				a=2;
				    			}
				    			else
				    			{
				    				if(rsbody.getString("JFCOLMEANS")!=null&&!rsbody.getString("JFCOLMEANS").equals(""))
				    				{
				    					zdm +="f_get_mc('"+rsbody.getString("JFCOLMEANS")+"',"+rsbody.getString("JFCOLID")+") "+rsbody.getString("JFCOLID")+",";
				    					a=2;
				    				}
				    				else
				    				{
				    					zdm +=rsbody.getString("JFCOLID")+",";
				    					a=2;
				    				}
				    			}
				    	}
				    	else
				    	{
				    		if(rsbody.getString("JFCOLSTYLE").equals("1"))
				    		{
				    		      zdm +="to_char("+rsbody.getString("JFCOLID")+",'yyyy-mm-dd') "+rsbody.getString("JFCOLID")+",";
				    		}
				    		else
				    		{
				    			    if(rsbody.getString("JFCOLMEANS")!=null&&!rsbody.getString("JFCOLMEANS").equals(""))
				    				{
				    					zdm +="f_get_mc('"+rsbody.getString("JFCOLMEANS")+"',"+rsbody.getString("JFCOLID")+") "+rsbody.getString("JFCOLID")+",";
				    				}
				    				else
				    				{
				    					zdm +=rsbody.getString("JFCOLID")+",";
				    				}
				    		}
				    	}
				    }
			    } catch(Exception e) {
			    	e.printStackTrace();
			    }
			    zdm=zdm.substring(0,zdm.length()-1);
			    //查询
			    sql = "SELECT "+zdm+" FROM D"+zbid+"_BODY where JFDYID="+jfid;
			    try {
			            QueryConnection qcsel = new QueryConnection();
					    Statement stmtsel = qcsel.con.createStatement();
					    ResultSet  rssel = stmtsel.executeQuery(sql);
					    String lssj="";
					    while (rssel.next()) {
					    	for (int i = 1; i <=title.size(); i++) {
					    		if(rssel.getString(i)==null)
					    		{
					    			lssj +=""+",";
					    		}
					    		else
					    		{
					    			lssj +=rssel.getString(i)+",";
					    		}
							}
					    	li.add(lssj);
					    	lssj="";
					    }
				} catch (Exception e) {
				}
			    
		}    
		try {
		    String path = so.httpServletRequest.getRealPath("/system/excelload/");
		    ExportExcel excel=new ExportExcel();  
		    String messger=excel.exportExcel("D"+zbid+".xls",Title,li,so.httpServletResponse,path);
		    JSONObject msg=new JSONObject();
		    msg.put("001",messger);
				so.httpServletResponse.getWriter().print(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
}
