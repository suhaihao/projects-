<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
	String id = request.getParameter("id");
	String sql = "SELECT BT,ZW FROM DTZGG WHERE JFID='" + id + "'";
	
	QueryConnection qc = new QueryConnection();
	Statement stmt = qc.con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	String title = "", content = "";
	if (rs.next()) {
		title = rs.getString(1);
	}
	String zw="";
	try {
		ExecuteConnection ec = new ExecuteConnection();
		PreparedStatement pstmt = null;
		rs = null;
		sql = "select zw from DTZGG_ZW where DYID='"+id+"' order by to_number (jfid) ";
		pstmt = ec.con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			zw+=rs.getString(1);
		}
		rs.close();
		pstmt.close();
		ec.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	zw=zw.replaceAll("!", "'");
%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="信息浏览-北京市植物保护站" />
</jsp:include>
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- start content -->
<div id="content">
	<div class="breadcrumb"><ol><li class="home"> <a title="首页" href="/insect/index.jsp">首页</a></li><li> <a href="/insect/xxll.do?ACT_TYPE=QUERY">信息浏览</a></li><li> <span>信息详情</span></li></ol></div>
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod m_article">
					<div class="mod-hd">
						<h3 class="mod-tit"><%=title %></h3>
					</div>
					<div class="mod-bd"><%=zw %></div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
