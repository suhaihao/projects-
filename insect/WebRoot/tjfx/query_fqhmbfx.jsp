<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%@page import="java.util.Calendar"%>
<%
	response.setHeader("X-UA-Compatible","IE=EmulateIE11");
%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="病虫害数据查询" />
</jsp:include>
<style type="text/css">
.w th {
	text-align: right;
	width: 45%;
	padding-top: 5px;
	padding-bottom: 5px;
}

.w td {
	padding-left: 15px;
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>
<script type="text/javascript">
	function sjfxt() {
		var fxlx = $('#fxlx option:selected').val();//选中的值
		if (fxlx == "") {
			alert("请选择分析类型");
			return;
		}
		if(fxlx==5||fxlx==1||fxlx==0)
		{
		var cxsjstr = document.getElementById("cxsjstr").value;
		var cxsjend = document.getElementById("cxsjend").value;
		if(cxsjstr==""||cxsjend=="")
		{
			alert("请选择完整查询时间范围");
			return;
		}
		else
		{
			if(cxsjstr.substring(0,4)!=cxsjend.substring(0,4))
			{
				alert("查询范围必须一年内的");
				return
			}
		}
		var dbsjstr = document.getElementById("dbsjstr").value;
		var dbsjend = document.getElementById("dbsjend").value;
		if(dbsjstr!="")
		{
			if(dbsjend=="")
			{
			alert("请选择完整对比时间范围");
			return;
			}
		}
		if(dbsjend!="")
		{
			if(dbsjstr=="")
			{
			alert("请选择完整对比时间范围");
			return;
			}
		}
		var lssjs = document.getElementsByName("lssj");
		var lssj = "";
		if(dbsjstr==""&&dbsjend=="")
		{
		for (var i = 0; i < lssjs.length; i++) {
			if (lssjs[i].checked == true) {
				lssj = lssjs[i].value;
				break;
			}
		}
		}
		else
		{
			lssj="";
		}
		var ssqyval = document.getElementById("ssqyval").value;
		
		var bblx = $('#bblx option:selected').val();
		}
		else
		{
		alert("暂无数据");
		return;
		}
		if (fxlx == 5) {
			var fxdxs = document.getElementsByName("fxdxqb");
			var fxdx = "";
			for (var j = 0; j < fxdxs.length; j++) {
				if (fxdxs[j].checked == true) {
					fxdx = fxdxs[j].value;
					window.open("/insect/tjfx/fqhmbfx_qxt.jsp?cxsjstr="+ cxsjstr + "&cxsjend=" + cxsjend + "&dbsjstr="+dbsjstr+"&dbsjend="+dbsjend+"&lssj="+lssj+"&ssqyval=" + ssqyval + "&bblx=" + bblx+"&fxdx="+fxdx,"","width=1200,height=600,resizable=yes");
				}
			}
		}
		if (fxlx == 0) {
			var fxdxs = document.getElementsByName("fxdxqx");
			var fxdx = "";
			for (var j = 0; j < fxdxs.length; j++) {
				if (fxdxs[j].checked == true) {
					fxdx = fxdxs[j].value;
					window.open("/insect/tjfx/ssscfx_qxt.jsp?cxsjstr="+ cxsjstr + "&cxsjend=" + cxsjend + "&dbsjstr="+dbsjstr+"&dbsjend="+dbsjend+"&lssj="+lssj+"&ssqyval=" + ssqyval + "&bblx=" + bblx+"&fxdx="+fxdx,"","width=1200,height=600,resizable=yes");
				}
			}
		}
		if (fxlx == 1) {
			var fxdxs = document.getElementsByName("fxdxjd");
			var fxdx = "";
			for (var j = 0; j < fxdxs.length; j++) {
				if (fxdxs[j].checked == true) {
					fxdx = fxdxs[j].value;
					window.open("/insect/tjfx/fsfx_qxt.jsp?cxsjstr="+ cxsjstr + "&cxsjend=" + cxsjend + "&dbsjstr="+dbsjstr+"&dbsjend="+dbsjend+"&lssj="+lssj+"&ssqyval=" + ssqyval + "&bblx=" + bblx+"&fxdx="+fxdx,"","width=1200,height=600,resizable=yes");
				}
			}
		}
	}
	function xzqy() {
		var txval = window.showModalDialog("/insect/tjfx/Mytree.jsp", "",
				"status:false;dialogWidth:550px;dialogHeight:600");
		if (txval != null) {
			var val = txval.split(",");
			document.getElementById("ssqy").value = val[0];
			document.getElementById("ssqyval").value = val[1];
		}
	}
	function xgdbsj()
	{
		var dbsjstr = document.getElementById("dbsjstr").value;
		var dbsjend = document.getElementById("dbsjend").value;
		if(dbsjstr==""&&dbsjend=="")
		{
			$("#ls").css("display","");
		}
		else
		{
			$("#ls").css("display","none");
		}
	}
	function fxlxxz()
	{
		var fxlx = $('#fxlx option:selected').val();//选中的值
		if(fxlx==0)
		{
			$("#fsqx").css("display","");
			$("#fsjd").css("display","none");
			$("#fqb").css("display","none");
		}
		if(fxlx==1)
		{
			$("#fsqx").css("display","none");
			$("#fsjd").css("display","");
			$("#fqb").css("display","none");
		}
		if(fxlx==5)
		{
			$("#fsqx").css("display","none");
			$("#fsjd").css("display","none");
			$("#fqb").css("display","");
		}
	}
</script>
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true" />
	<div class="layout grid-s5m0">
		<div class="layout-main">
			<div class="layout-wrap">
				<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">设施病虫害分析</h3>
					</div>
					<div class="mod-bd">
						<table class="w">
							<colgroup>
								<col style="width:40%"></col>
							</colgroup>
							<tr>
								<td style="text-align: right;">分析类型选择</td>
								<td style="text-align: left"><select id="fxlx" name="fxlx"
									style="width:100px;" onchange="fxlxxz()">
										<option></option>
										<option value="0" selected="selected">粉虱(区县)</option>
										<option value="1">粉虱(基点)</option>
										<option value="2">蓟马</option>
										<option value="3">蚜虫</option>
										<option value="4">白粉</option>
										<option value="5">灰霉</option>
								</select></td>
							</tr>
							<tr>
								<td style="text-align: right;">查询时间范围</td>
								<td style="text-align: left"><input id="cxsjstr"
									name="cxsjstr" type="text" class="Wdate"
									onFocus="WdatePicker({skin:'whyGreen'})" />至<input
									id="cxsjend" name="cxsjend" type="text" class="Wdate"
									onFocus="WdatePicker({skin:'whyGreen'})" /></td>
							</tr>
							<tr>
								<td style="text-align: right;">对比时间范围</td>
								<td style="text-align: left"><input id="dbsjstr"
									name="dbsjstr" type="text" class="Wdate"
									onFocus="WdatePicker({skin:'whyGreen'})" onchange="xgdbsj()" />至<input
									id="dbsjend" name="dbsjend" type="text" class="Wdate"
									onFocus="WdatePicker({skin:'whyGreen'})" onchange="xgdbsj()" /></td>
							</tr>
							<tr id="ls">
								<td style="text-align: right;">历史数据选取</td>
								<td style="text-align: left;"><input name="lssj"
									type="radio" value="1" checked="checked">上年</input>&nbsp;&nbsp;
									<input name="lssj" type="radio" value="2">近两年</input>&nbsp;&nbsp;
									<input name="lssj" type="radio" value="3">近三年</input>&nbsp;&nbsp;
									<input name="lssj" type="radio" value="5">近五年</input>&nbsp;&nbsp;
									<input name="lssj" type="radio" value="10">近十年</input>&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">所属区域</td>
								<td style="text-align: left;"><input id="ssqy" name="ssqy"
									type="text" value="" readonly="readonly" />&nbsp;&nbsp; <input
									class="btn" type="button" value="选择" style="height: 25px;"
									onclick="xzqy()" /> <input id="ssqyval" name="ssqyval"
									type="hidden" value="" /></td>
							</tr>
							<tr id="fqb" style="display: none;">
								<td style="text-align: right;">分析指标</td>
								<td style="text-align: left;"><input name="fxdxqb"
									type="checkbox" value="1" checked="checked">病株率</input>&nbsp;&nbsp;
									<input name="fxdxqb" type="checkbox" value="2">病果率</input>&nbsp;&nbsp;
								</td>
							</tr>
							<tr id="fsjd" style="display: none;">
								<td style="text-align: right">分析指标</td>
								<td style="text-align: left;">
								<input name="fxdxjd" type="checkbox" value="1" checked="checked">虫株率&nbsp;&nbsp;
								<input name="fxdxjd" type="checkbox" value="2">百株虫量&nbsp;&nbsp;
								</td>
							</tr>
							<tr id="fsqx">
								<td style="text-align: right">分析指标</td>
								<td style="text-align: left;">
								<input name="fxdxqx" type="checkbox" value="1" checked="checked">虫株率&nbsp;&nbsp;
								<input name="fxdxqx" type="checkbox" value="2">百株虫量&nbsp;&nbsp;
								<input name="fxdxqx" type="checkbox" value="3">烟粉虱占比&nbsp;&nbsp;
								<input name="fxdxqx" type="checkbox" value="4">粉虱百株虫量&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">报表类型</td>
								<td style="text-align: left"><select id="bblx" name="bblx"
									style="width:100px;">
										<option></option>
										<option value="0">区县</option>
										<option value="1">基点</option>
								</select></td>
							</tr>
							<tr>
								<td class="tc p10" colspan="2"><input class="btn"
									type="button" value="确定" onclick="sjfxt()" />&nbsp;</td>
							</tr>
						</table>
						<script type="text/javascript">
							function back(id, bb) {
								window.location = "/insect/sjcx.do?ACT_TYPE=LIST&dbbzb_jfid="
										+ id
										+ "&bbmc="
										+ encodeURIComponent(encodeURIComponent(bb));
							}
							function iFrameHeight() {
								var ifm = document.getElementById("result");
								var subWeb = document.frames ? document.frames["result"].document
										: ifm.contentDocument;
								if (ifm != null && subWeb != null) {
									ifm.height = subWeb.body.scrollHeight;
								}
							}
						</script>
					</div>
				</div>
				<iframe id="result" name="result" style="width:100%;border:0px;"
					scrolling="no" onload="iFrameHeight()"></iframe>
			</div>
		</div>
		<div class="layout-sub">
			<div class="layout-wrap">
				<%@include file="/menu.jsp"%>
			</div>
		</div>
	</div>
</div>
<%@include file="/footer.jsp"%>