<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="农业部汇总" />
</jsp:include>
<%
	String dbbzb_jfid = request.getParameter("dbbzb_jfid"), jftabname = "", headTable = "", bodyTable = "";
	User user = (User) session.getAttribute("user");
	String sqlStr = "select jfid dbbzb_jfid,jftabname jftabname  ";
	sqlStr = sqlStr + " from dbbzb ";
	sqlStr = sqlStr + " where dbbzb.jfid='" + dbbzb_jfid + "' ";

	QueryConnection qc = new QueryConnection();
	Statement stmt = qc.con.createStatement();
	ResultSet rs = stmt.executeQuery(sqlStr);
	if (rs.next()) {
		dbbzb_jfid = rs.getString("dbbzb_jfid");
		jftabname = rs.getString("jftabname");
	}

	String vallageOption = "<option value=''></option>";
	sqlStr = "select jfregcode,jfregname from dsys06 where (jfdsys05_code like '"
			+ user.getBmbm()
			+ "%' or  '"
			+ user.getBmbm()
			+ "'='10')  and jfstate='1' and length(jfregcode) > 2  ORDER BY nlssort(jfregname, 'NLS_SORT=SCHINESE_PINYIN_M')";
	rs = stmt.executeQuery(sqlStr);
	while (rs.next()) {
		vallageOption = vallageOption + "<option value='"
				+ rs.getString("jfregcode") + "'>"
				+ rs.getString("jfregname") + "</option>";
	}

	String cityOption = "<option value=''></option>";
	sqlStr = "select jfdeptcode,jfdeptname from dsys05 where jfstate='1' order by jfdeptcode ";
	rs = stmt.executeQuery(sqlStr);
	while (rs.next()) {
		cityOption = cityOption + "<option value='"
				+ rs.getString("jfdeptcode") + "'>"
				+ rs.getString("jfdeptname") + "</option>";
	}
%>
<!-- start content -->
<style>
.w td {
	text-align: right;
	width: 200px;
}

.enniu {
	text-align: center;
}

.bt {
	text-align: center;
}

.tbl {
	padding-top: 5px;
	padding-bottom: 5px;
	width: 100%;
	color: black;
	text-align: right;
}

.tbl tr {
	height: 50px;
}
</style>
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true" />
	<div class="layout grid-m0">
		<div class="layout-main">
			<div class="layout-wrap">
				<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">农业部汇总</h3>
					</div>
					<div class="mod-bd">
						<div class="mod-bd-tj">
							<form name="f1" action="/insect/ymscExcel_tj.do?ACT_TYPE=Q<%=dbbzb_jfid%>" method="post"
								target="result">
								<input type="hidden" name="zbid" value="<%=dbbzb_jfid%>">
								<table class="tbl">
									<tr>
										<td colspan="12" class="bt"><div class="cell-wrap"
												style="font-size:20px;font-weight:bold"><%=jftabname%></div></td>
									</tr>
									<tr>
										<td>调查日期(≥):</td>
										<td style="text-align: left;"><input type="text"
											name="DCRQUP" class="Wdate"
											onfocus="WdatePicker({skin:'whyGreen',maxDate: '%y-%M-%d' })"
											onkeyup="changeiput(this)"></td>
										<td>调查日期(≤):</td>
										<td style="text-align: left;"><input type="text"
											name="DCRQDOWN" class="Wdate"
											onfocus="WdatePicker({skin:'whyGreen',maxDate: '%y-%M-%d' })"
											onkeyup="changeiput(this)"></td>
										<td>调查单位(like):</td>
										<td style="text-align: left;"><select
											name="BMBM">
											<%=cityOption %>
										</select></td>
									</tr>
									<tr>
										<td class="enniu" colspan="12"><input class="btn"
											type="button" value="确认" onclick="query()">&nbsp; <input
											class="btn" type="button" value="关闭"
											onclick="javascript:window.opener=null;window.open('','_self');window.close();">
										</td>
									</tr>
								</table>
								<script type="text/javascript">
							function back(id,bb){
								window.location = "/insect/bbhz.do?ACT_TYPE=LIST&dbbzb_jfid=" + id + "&bbmc="+encodeURIComponent(encodeURIComponent(bb));
							}
							function query(){
									document.forms[0].submit();
							}
							function iFrameHeight() {
								var ifm= document.getElementById("result");
								var subWeb = document.frames ? document.frames["result"].document : ifm.contentDocument;
								if(ifm != null && subWeb != null) {
									ifm.height = subWeb.body.scrollHeight;
								}
							}
						</script>
							</form>
						</div>
					</div>
				</div>
				<iframe id="result" name="result" style="width:100%;border:0px;"
					scrolling="no" onload="iFrameHeight()"></iframe>
			</div>
		</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
