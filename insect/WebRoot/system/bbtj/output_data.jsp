<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="java.sql.PreparedStatement"%>
	<%
		String dbbzb_tj_id = request.getParameter("jfdbbzb_tj_id");
		String[] jg_ids = request.getParameterValues("jfdbbzb_jg_id");
		String[] colstates = request.getParameterValues("jfcolstate");
		String[] colgss = request.getParameterValues("jfcolgs"); // 计算列
		//新添加代码
		String[] JFCOMUPTE_METHOD = request.getParameterValues("JFCOMUPTE_METHOD"); 
		String[] JFCOMUPTE_NAME = request.getParameterValues("JFCOMUPTE_NAME"); 
		String[] JFCOMUPTE_CLICK = request.getParameterValues("JFCOMUPTE_CLICK"); 
		String[] JFCOMUPTE_CONDITION = request.getParameterValues("JFCOMUPTE_CONDITION"); 
		String[] SUM_COLGS = request.getParameterValues("SUM_COLGS"); 
		String[] SUM_COMUPTE_METHOD = request.getParameterValues("SUM_COMUPTE_METHOD"); 
		String[] SUM_COMUPTE_CLICK = request.getParameterValues("SUM_COMUPTE_CLICK"); 
		String[] SUM_COMUPTE_CONDITION = request.getParameterValues("SUM_COMUPTE_CONDITION"); 
		String sql = "delete from dtjbb_sc where jfdbbzb_tj_id='" + dbbzb_tj_id + "'";
		ExecuteConnection ec = new ExecuteConnection();
		PreparedStatement pstmt = ec.con.prepareStatement(sql);		
		if (pstmt.executeUpdate() >= 0) {
			for(int i=0; jg_ids != null && i<jg_ids.length; i++){
			//有所改动
				sql = "insert into dtjbb_sc(jfid,JFdbbzb_tj_ID,JFDBBZB_JG_ID,JFCOLGS,JFCOLSTATE,JFCOMUPTE_METHOD,JFCOMUPTE_NAME,JFCOMUPTE_CLICK,JFCOMUPTE_CONDITION,SUM_COLGS,SUM_COMUPTE_METHOD,SUM_COMUPTE_CLICK,SUM_COMUPTE_CONDITION) values(sequ_dtjbb_sc.nextval,'" 
						+ dbbzb_tj_id + "','" + jg_ids[i] + "','" + colgss[i] + "','" + colstates[i] + "','"+(JFCOMUPTE_METHOD[i]== null ? "" : JFCOMUPTE_METHOD[i])+"','"+(JFCOMUPTE_NAME[i]== null ? "" : JFCOMUPTE_NAME[i])+"','"+(JFCOMUPTE_CLICK[i]== null ? "" : JFCOMUPTE_CLICK[i])+"','"+(JFCOMUPTE_CONDITION[i]== null ? "" : JFCOMUPTE_CONDITION[i])+"','"+(SUM_COLGS[i]== null ? "" : SUM_COLGS[i])+"','"+(SUM_COMUPTE_METHOD[i]== null ? "" : SUM_COMUPTE_METHOD[i])+"','"+(SUM_COMUPTE_CLICK[i]== null ? "" : SUM_COMUPTE_CLICK[i])+"','"+(SUM_COMUPTE_CONDITION[i]== null ? "" :SUM_COMUPTE_CONDITION[i])+"')";
				pstmt = ec.con.prepareStatement(sql);
				pstmt.executeUpdate();
			}
			ec.commit();
			out.print("<script>window.close();opener.location.reload();</script>");
		} else {
			ec.rollback();
			out.print("<script>alert('保存失败');window.close();</script>");
		}
		pstmt.close();
		ec.close();
	%>
