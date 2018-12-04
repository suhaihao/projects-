<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%!
int tablehead_rowcount = 1;
private List<String> data_imp_head(String cs) {
	String sql_xx=" select jfcolname,jfcolcode,jfcolwidth,jfcolheight,"; //1-4(0-3)
	sql_xx=sql_xx + " jfcolnumber,jfcolrows,jfcolorder,jfcolroword, "; //5-8(4-7)
	sql_xx=sql_xx + " jfcolid,jfcolattr"; //9-10(8-9)
	sql_xx=sql_xx + " from dbbtjbt ";
	sql_xx=sql_xx + " where jfdbbzb_id='" + cs + "' ";
	sql_xx=sql_xx + " order by jfcolroword,jfcolorder,jfcolid ";
    List<String> list = new ArrayList<String>();
    QueryConnection qc = new QueryConnection();
    Statement stmt = null;
    ResultSet rs = null;
    try {
	    String item = "";
	    stmt = qc.con.createStatement();
	    rs = stmt.executeQuery(sql_xx);
	    while (rs.next()) {
	    	item=cBlank(rs.getString(1)) + "###" + cBlank(rs.getString(2)) + "###" + cBlank(rs.getString(3))
	    		+ "###" + cBlank(rs.getString(4))  + "###" + cBlank(rs.getString(5))  + "###" + cBlank(rs.getString(6));
	    	item=item + "###" + cBlank(rs.getString(7)) + "###" + cBlank(rs.getString(8)) + "###" + cBlank(rs.getString(9)) 
	    		+ "###" + cBlank(rs.getString(10));
	        list.add(item);
	    }
    } catch(SQLException e) {
    	e.printStackTrace();
    } finally {
    	try {
    		if (rs != null ) rs.close();
        	if (stmt != null ) stmt.close();
    	    qc.close();
    	} catch (SQLException ex) {
    		ex.printStackTrace();
    	}
    }
    return list;
}

//cs1 报表ID,cs0 显示方式
public String draw_table_head(String cs1, String cs0) {
	List<String> list = data_imp_head(cs1);
	String cur_row = "", outerHtml = "", xx_label = "";
	if ("0".equals(cs0)) {
		outerHtml = "<table class=\"w\"><tr>";
	}
	tablehead_rowcount = 1;
	for (int i = 0; list != null && i < list.size(); i++) {
		String[] item = cStr(list.get(i)).split("###");
		if (!cur_row.equals(cStr(item[7]))) {
			if (!"".equals(cur_row)) {
				outerHtml = outerHtml + "<tr>";
				tablehead_rowcount = tablehead_rowcount + 1;
			}
		}
		xx_label = "<th colspan=" + item[4];
		xx_label = xx_label + " rowspan=" + item[5];
		xx_label = xx_label + " " + item[9];
		xx_label = xx_label + " style='WORD-BREAK: break-all;text-align:center;color: black";
		xx_label = xx_label + ";width:";
		xx_label = xx_label + item[2];
		xx_label = xx_label + ";height:";
		xx_label = xx_label + item[3];
		xx_label = xx_label + "'>";
		outerHtml = outerHtml + xx_label;

		outerHtml = outerHtml + "" + item[0] + "";
		outerHtml = outerHtml + "</th>";
		cur_row = item[7];
	}
	if ("0".equals(cs0)) {
		outerHtml = outerHtml + "</tr></table>";
	}
	return outerHtml;
}
public String cBlank(String str) {
	if ("".equals(str) || str == null) {
		return " ";
	}
	return str;
}
public String cStr(String str) {
	if ("".equals(str) || str == null) {
		return "";
	}
	return str;
}
%>
<%
	String dbbzb_tj_jfid = request.getParameter("dbbzb_tj_jfid");
	String p = request.getParameter("p"); // whether export
	String _select = request.getParameter("sl");
	String wh = request.getParameter("wh");
	String expcolspan = request.getParameter("col"); // 导出excel时标题跨列
	if (expcolspan == null || "".equals(expcolspan)) {
		expcolspan = "6";
	}
	String _select_ = ""; // 用来传递给导出excel页面的参数
	if (_select != null) {
		_select = java.net.URLDecoder.decode(_select, "UTF-8");
	}
	// export to excel
	if ("exp".equals(p)) {
		response.setHeader("Content-disposition","attachment; filename=bbhz_export.xls");
	}
	String dbbzb_jfid = "", jftabname = "",headTable = "", bodyTable = "",jftjpj="",jftjhz="",selectStr="",fromStr="",whereStr="",groupStr = "",htmlStr="",sqlAvg="";
	User user = (User) session.getAttribute("user");
	String sqlStr = "select dbbzb.jfid dbbzb_jfid,dbbzb.jftabname jftabname,dtjbb.jftjpj jftjpj, dtjbb.jftjhz jftjhz ";
	sqlStr = sqlStr+" from dtjbb,dbbzb ";
	sqlStr = sqlStr+" where dtjbb.jfid='"+dbbzb_tj_jfid+"' ";
	sqlStr = sqlStr+" and dtjbb.jfdbbzb_id=dbbzb.jfid ";
	
	QueryConnection qc = new QueryConnection();
	Statement stmt = qc.con.createStatement();
	ResultSet rs = stmt.executeQuery(sqlStr);
	if (rs.next()) {
		dbbzb_jfid = rs.getString("dbbzb_jfid");
		jftabname = rs.getString("jftabname");
		jftjpj = rs.getString("jftjpj");
		jftjhz = rs.getString("jftjhz");
	}
	headTable = "D"+dbbzb_jfid+"_head";
	bodyTable = "D"+dbbzb_jfid+"_body";
%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="采集数据统计" />
</jsp:include>
<div class="mod">

	<div class="mod-bd">

	<%
		String outerHtml=draw_table_head(dbbzb_tj_jfid ,"1");
	%>
		<table class="w" style="text-align: center;">
			<tr>
	<%
		sqlStr = " select dbbzb_jg.jfcolid jfcolid,dbbzb_jg.jfcolname jfcolname,dbbzb_jg.jfcolvest jfcolvest, ";
		sqlStr = sqlStr+" dbbzb_jg.jfcolstyle jfcolstyle,dbbzb_jg.jfcolfashion jfcolfashion, ";
		sqlStr = sqlStr+" dbbzb_jg.jfcolmeans jfcolmeans,jfcolgs,dtjbb_sc.jfcolstate jfcolstate,"+
		         "JFCOMUPTE_METHOD,"+
		         "JFCOMUPTE_NAME,"+
                 "JFCOMUPTE_CLICK,"+
                 "JFCOMUPTE_CONDITION,"+
                 "SUM_COLGS,"+
                 "SUM_COMUPTE_METHOD,"+
                 "SUM_COMUPTE_CLICK,"+
                 "SUM_COMUPTE_CONDITION ";	
		sqlStr = sqlStr+" from dtjbb_sc,dbbzb_jg ";
		sqlStr = sqlStr+" where dtjbb_sc.jfdbbzb_jg_id=dbbzb_jg.jfid and dtjbb_sc.jfdbbzb_tj_id='"+dbbzb_tj_jfid+"' ";
		sqlStr = sqlStr+" order by dtjbb_sc.jfid ";
		
		String tjfs_out = "",tjfsStr = "",tjs="";
		String[] tjfss = null;
		String[] tjfs_tag = null;
		String[] tj=null;
		int size=0;
		if ("exp".equals(p)) {
			String[] _tjfss = _select.split("@");
			tjfss = _tjfss;
			tjfs_tag = new String[tjfss.length];
		} else {
			tjfss = request.getParameterValues("tjfs");
			tjfs_tag = new String[tjfss.length];
			for (int i=0; i<tjfss.length; i++){
				_select_ += tjfss[i] + "@";
			}
		}
		for (int i=0; i<tjfss.length; i++){
			//tjfsStr = tjfsStr&request.Form("tjfs").Item(i)&"$";
			String[] array_tjfs = tjfss[i].split("\\|");
			if((i+1)==tjfss.length){
				tjfs_out = tjfs_out+ array_tjfs[0];
			} else {
				tjfs_out = tjfs_out+ array_tjfs[0]+",";
			}
			tjfs_tag[i]=array_tjfs[1];
		}
		String fhdc =request.getParameter("dc");
		if(fhdc!=null)
		{
		tj=fhdc.split("!");
		}
		else
		{
		tj=request.getParameterValues("tj");
		}
		//导出改动
		//tj=request.getParameterValues("tj");
		//生成导出str
		String dc="";
		for(int d=0;d<tj.length;d++)
		{
		dc+=tj[d]+"!";
		}
		
		
		int dx=0;
		String kz="";
		for(String pd:tj)
		{ 
		  //判断是否选中
		  if(tjfs_out.indexOf(pd)>=0)
		  {
		  //第一次赋值
		  if(pd.subSequence(0,7).equals("to_char")&&dx==0)
		  {
		   kz=pd;
		   dx=pd.subSequence(pd.indexOf("'"),pd.lastIndexOf("'")).length();
		   size++;
		  }
		  else
		  {
		   if(pd.subSequence(0,7).equals("to_char"))
		   {
		    if(pd.subSequence(pd.indexOf("'"),pd.lastIndexOf("'")).length()>dx)
		    {
		      kz=pd;
		      dx=pd.subSequence(pd.indexOf("'"),pd.lastIndexOf("'")).length();
		    } 
		   }
		   else
		   {
		    size++;
		    tjs+=pd+",";
		   } 
		  }
		  
		  }
		}
		if(!kz.equals(""))
		{
		tjs=kz+","+tjs;
		}
		selectStr="select " + tjfs_out+","+tjs.substring(0,tjs.length()-1);
		
		htmlStr = "";
		String colName="";
		int colNumber=0;
		rs = stmt.executeQuery(sqlStr);
		int f=1;
		int s=1;
        int t=1;
		while (rs.next()) {
			colNumber++;
			if ("2".equals(rs.getString("jfcolvest"))) { // 2:表体body
				colName = bodyTable + "." + rs.getString("jfcolid");
			} else {
				colName = headTable + "." + rs.getString("jfcolid");
			}
			if ("1".equals(rs.getString("jfcolstyle"))) { // 字段类型：date
				colName = "to_char("+colName+",'yyyy-mm-dd')";
			}
			if (!"".equals(rs.getString("jfcolmeans")) && rs.getString("jfcolmeans") != null) {
			    if(rs.getString("jfcolmeans").equals("DCDD"))
			    {
				colName = "f_get_mc('BBSSXZ',"+colName+")";
			    }
			    else
			    {
				colName = "f_get_mc('"+rs.getString("jfcolmeans").toUpperCase() +"',"+colName+")";
			    }
			}
			if ("1".equals(rs.getString("jfcolstate"))) { // 计算列
				
				selectStr +=","+rs.getString("JFCOMUPTE_METHOD")+",'"+rs.getString("JFCOMUPTE_CLICK")+"' JFCOMUPTE_CLICK,'"+(rs.getString("JFCOMUPTE_CONDITION")==null? "":rs.getString("JFCOMUPTE_CONDITION"))+"' JFCOMUPTE_CONDITION";
				sqlAvg +=","+rs.getString("SUM_COMUPTE_METHOD")+",'"+rs.getString("SUM_COMUPTE_CLICK")+"' SUM_COMUPTE_CLICK,'"+(rs.getString("SUM_COMUPTE_CONDITION")==null? "":rs.getString("SUM_COMUPTE_CONDITION"))+"' SUM_COMUPTE_CONDITION";
			
			} else { // 非计算列
				if (rs.getString("jfcolgs").indexOf("avg") >= 0) { // 平均值保留2位小数
				  
					selectStr = selectStr +",round(nvl("+ rs.getString("jfcolgs") + "(" + colName+"),0),2),'"+rs.getString("JFCOMUPTE_CLICK")+"' JFCOMUPTE_CLICK,'"+(rs.getString("JFCOMUPTE_CONDITION")==null? "":rs.getString("JFCOMUPTE_CONDITION"))+"' JFCOMUPTE_CONDITION";
					sqlAvg = sqlAvg +",round(nvl("+ rs.getString("jfcolgs") + "(" + colName+"),0),2),'"+rs.getString("SUM_COMUPTE_CLICK")+"' SUM_COMUPTE_CLICK,'"+(rs.getString("SUM_COMUPTE_CONDITION")==null? "":rs.getString("SUM_COMUPTE_CONDITION"))+"' SUM_COMUPTE_CONDITION";
				  
				} else {
				 
					selectStr = selectStr +",nvl("+ rs.getString("jfcolgs") + "(" + colName+"),0),'"+rs.getString("JFCOMUPTE_CLICK")+"' JFCOMUPTE_CLICK,'"+(rs.getString("JFCOMUPTE_CONDITION")==null? "":rs.getString("JFCOMUPTE_CONDITION"))+"' JFCOMUPTE_CONDITION";
					sqlAvg = sqlAvg +",nvl("+ rs.getString("jfcolgs") + "(" + colName+"),0),'"+rs.getString("SUM_COMUPTE_CLICK")+"' SUM_COMUPTE_CLICK,'"+(rs.getString("SUM_COMUPTE_CONDITION")==null? "":rs.getString("SUM_COMUPTE_CONDITION"))+"' SUM_COMUPTE_CONDITION";
				    
				 
				}
			}
			//htmlStr += "<td rowspan="+tablehead_rowcount+" height='20' valign='middle' align='center'>&nbsp;"+rs.getString("jfcolname")+"&nbsp;</td>";
		}
	%>
	<%
		for(int i=0;i<tjfs_tag.length;i++){
	%>
		<th rowspan="<%=tablehead_rowcount%>"><div class="cell-wrap" style="color: black;"><%=tjfs_tag[i] %></div></th>
	<%
		}
		out.print(outerHtml);
	%>
	</tr>
	<%
		fromStr = " from "+headTable+","+bodyTable;
		String _where = Function.f_dbb_query(request,dbbzb_jfid);
		_where=_where.replaceAll("≥", ">=");
		_where=_where.replaceAll("≤", "<=");
	
		if ("exp".equals(p)) { // append condition when export
			whereStr = " where "+headTable+".zt='1' and "+headTable+".jfid="+bodyTable+".jfdyid " + wh;
		} else {
			whereStr = " where "+headTable+".zt='1' and "+headTable+".jfid="+bodyTable+".jfdyid " + _where;
		}
		//whereStr = " where "+headTable+".zt='1' and "+headTable+".jfid="+bodyTable+".jfdyid "+ Function.f_dbb_query(request,dbbzb_jfid);
		groupStr = " group by "+tjfs_out+","+tjs.substring(0,tjs.length()-1);
		String[] tjsz=tjs.split(",");
		int jianqu=0;
		if(tjs.indexOf("DCRQ")>=0)
		{
		for(int zh=0;zh<tjsz.length-1;zh++)
		{
		  if(zh>=1)
		  {
		  tjsz[zh]=tjsz[zh+1];
		  }
		}
		jianqu=1;
		}
		String[] tjmz=new String[(tjsz.length==1?tjsz.length:tjsz.length-jianqu)];
		for(int i=0;i<(tjsz.length==1?tjsz.length:tjsz.length-jianqu);i++)
		{
		  if(tjsz.length==1)
		  {
		  tjmz[0]=tjsz[0].substring(tjsz[0].indexOf(".")+1,tjsz[0].length());
		  break;
		  }
		  else
		  {
		  tjmz[i]=tjsz[i].substring(tjsz[i].indexOf(".")+1,tjsz[i].length());
		  }
		}
		
		String sjpd="";
		if(tjfs_out.split("dd").length>1)
		{
		  sjpd="3";
		}
		else if(tjfs_out.split("mm").length>1)
		{
		  sjpd="2";
		}
		else if(tjfs_out.split("yyyy").length>1)
		{
		  sjpd="1";
		}
		sqlStr = selectStr + fromStr + whereStr + groupStr;
		sqlAvg = sqlAvg + fromStr + whereStr;
		htmlStr = "";
		int rowNumber=0,computerCol=0;
		rs = stmt.executeQuery(sqlStr);
		while (rs.next()) {
			rowNumber++;
			htmlStr += "<tr>";
			computerCol = 0;
			//这里也得加1
			for(int i=0;i<=(colNumber+tjfs_tag.length+size);i++){
			    //这里加1
				if(i>tjfs_tag.length+size){
				    //判断是否点击
				    if(rs.getString(i+computerCol+1).equals("1"))
				    {
				    //判断小数前面加0
				    if(rs.getString(i+computerCol).substring(0,1).equals("."))
				    {
					htmlStr = htmlStr +"<td style=\"text-align:right\"><div class=\"cell-wrap\"><a href=\"/insect/desits.do?ACT_TYPE=QUERY&where="+whereStr+"&bodyTable="+bodyTable+"&headTable="+headTable+"&clickwhere="+rs.getString(i+computerCol+2);
					for(int j=0;j<tjmz.length;j++)
					{
					  htmlStr+="&"+tjmz[j]+"="+rs.getString(tjfs_tag.length+j+1);
					}
					htmlStr +="&sjpd="+sjpd+"\" target='_blank'>0" + rs.getString(i+computerCol)+ "</a></div></td>";
				    }
				    else
				    {
				    //判断是否为小数
				    if(rs.getString(i+computerCol).indexOf(".")>0)
				    {
					htmlStr = htmlStr +"<td style=\"text-align:right\"><div class=\"cell-wrap\"><a href=\"/insect/desits.do?ACT_TYPE=QUERY&where="+whereStr+"&bodyTable="+bodyTable+"&headTable="+headTable+"&clickwhere="+rs.getString(i+computerCol+2);
					for(int j=0;j<tjmz.length;j++)
					{
					  htmlStr+="&"+tjmz[j]+"="+rs.getString(tjfs_tag.length+j+1);
					}
					htmlStr +="&sjpd="+sjpd+"\" target='_blank'>" + rs.getString(i+computerCol).substring(0,rs.getString(i+computerCol).indexOf(".")+3)+ "</a></div></td>";
				    }
				    else
				    {
					htmlStr = htmlStr +"<td style=\"text-align:right\"><div class=\"cell-wrap\"><a href=\"/insect/desits.do?ACT_TYPE=QUERY&where="+whereStr+"&bodyTable="+bodyTable+"&headTable="+headTable+"&clickwhere="+rs.getString(i+computerCol+2);
					for(int j=0;j<tjmz.length;j++)
					{
					  htmlStr+="&"+tjmz[j]+"="+rs.getString(tjfs_tag.length+j+1);
					}
					htmlStr +="&sjpd="+sjpd+"\" target='_blank'>" + rs.getString(i+computerCol)+ "</a></div></td>";
				    }
				    }
				    
				    }
				    else
				    {
				     //判断小数前面加0
				    if(rs.getString(i+computerCol).subSequence(0,1).equals("."))
				    {
					htmlStr = htmlStr +"<td style=\"text-align:right\"><div class=\"cell-wrap\">0" + rs.getString(i+computerCol)+ "</div></td>";
				    }
				    else
				    {
				    if(rs.getString(i+computerCol).indexOf(".")>0)
				    {
					htmlStr = htmlStr +"<td style=\"text-align:right\"><div class=\"cell-wrap\">" + rs.getString(i+computerCol)+ "</div></td>";
				    }
				    else
				    {
					htmlStr = htmlStr +"<td style=\"text-align:right\"><div class=\"cell-wrap\">" + rs.getString(i+computerCol)+ "</div></td>";
				    }
				    }
				    
				    }
					if(rowNumber==1){
						htmlStr += "<script>var avg"+computerCol+"=0;</script>";
					}
					if(i<colNumber+tjfs_tag.length+size)
					{
					htmlStr += "<script>avg"+computerCol+"=avg"+computerCol+" + "+rs.getString(i+computerCol+3)+";</script>";
					}
					computerCol+=2;
				}else {
				    //这里不输出多余列
				    if(i<tjfs_tag.length)
				    {
					htmlStr = htmlStr+ "<td><div class=\"cell-wrap\">" + rs.getString(i+1) + "&nbsp</div></td>";
				    }
				}
			}
		htmlStr += "</tr>";
		}
		

		// calculate average value and the total value
		int avsize=0;
		if(computerCol==0)
		{
		avsize=colNumber*3-1;
		}
		else
		{
		avsize=computerCol+colNumber;
		}
		String[] arrAvg = new String[avsize];
		sqlAvg = "select " + sqlAvg.substring(1);
		rs = stmt.executeQuery(sqlAvg);
		if (rs.next()) {
			for(int i=0;i<avsize;i++){
				arrAvg[i] = rs.getString(i+1);
			}
		}

			htmlStr += "<tr><td style='text-align:center' colspan='"+tjfs_tag.length+"'><div class=\"cell-wrap\">合计值</div></td>";
	
			for(int i=0;i<arrAvg.length;i++){
				htmlStr += "<td style='text-align:right'><div class=\"cell-wrap\">";
				//是否该加0
				if(arrAvg[i]!=null&&arrAvg[i].substring(0,1).equals("."))
				{
				//判断是否可点击
				if(arrAvg[i+1]!=null&&arrAvg[i+1].equals("1"))
				{
				htmlStr +="<a href=\"/insect/desits.do?ACT_TYPE=QUERY&where="+whereStr+"&bodyTable="+bodyTable+"&headTable="+headTable+"&clickwhere="+arrAvg[i+2]+"\" target='_blank'>"+"0"+arrAvg[i]+"</a>";
				}
				else
				{
				htmlStr +="0"+arrAvg[i];
				}
				}
				else if(arrAvg[i]!=null&&arrAvg[i].indexOf(".")>0)
				{
				//判断可否点击
				if(arrAvg[i+1]!=null&&arrAvg[i+1].equals("1"))
				{
				htmlStr +="<a href=\"/insect/desits.do?ACT_TYPE=QUERY&where="+whereStr+"&bodyTable="+bodyTable+"&headTable="+headTable+"&clickwhere="+arrAvg[i+2]+"\" target='_blank'>"+arrAvg[i].substring(0,arrAvg[i].indexOf(".")+3)+"</a>";
				}
				else
				{
				if(arrAvg[i].substring(arrAvg[i].indexOf(".")).length()>=3)
				{
				htmlStr +=arrAvg[i].substring(0,arrAvg[i].indexOf(".")+3);
				}
				else
				{
				htmlStr +=arrAvg[i].substring(0,arrAvg[i].indexOf(".")+2);
				}
				}
				
				}
				else
				{
				//判断可否点击
				if(arrAvg[i+1]!=null&&arrAvg[i+1].equals("1"))
				{
				htmlStr +="<a href=\"/insect/desits.do?ACT_TYPE=QUERY&where="+whereStr+"&bodyTable="+bodyTable+"&headTable="+headTable+"&clickwhere="+arrAvg[i+2]+"\" target='_blank'>"+arrAvg[i]+"</a>";
				}
				else
				{
				htmlStr +=arrAvg[i];
				}
				}
				htmlStr += "</div></td>";
				i+=2;
			}
			htmlStr += "</tr>";
		out.print(htmlStr);
		
		rs.close();
		stmt.close();
		qc.close();
	%>
	</table>
	<%
	if (p == null || !"exp".equals(p)) {
	%>
	<table class="w">
		<tr>
			<td class="tc p10">
				<input type="button" class="btn" value="EXCEL导出" onclick="f_exp()">
			</td>
		</tr>
	</table>
	<%
	}
	if ("exp".equals(p)) {
		//response.getWriter().write("<script>window.close();</script>");
	}
	%>
	<script type="text/javascript">
		function back(id,bb) {
			window.open("/insect/bbhz.do?ACT_TYPE=LIST&dbbzb_jfid=" + id + "&bbmc="+encodeURIComponent(encodeURIComponent(bb)),"bbhz_list","");
		}
		function f_exp(){
			window.location = "/insect/bbhz/bbhz_ny_update.jsp?p=exp&dbbzb_tj_jfid=<%=dbbzb_tj_jfid %>&wh=<%=_where %>&dc=<%=dc%>&col=<%=colNumber+tjfs_tag.length %>&sl=" + encodeURIComponent(encodeURIComponent("<%=_select_%>"));
		}
	</script>

	</div>
</div>

<%@include file="/footer_nocopy.jsp"%>
