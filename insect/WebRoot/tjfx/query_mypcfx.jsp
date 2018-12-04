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
	<jsp:param name="title" value="���溦���ݲ�ѯ" />
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
		var fxlx = $('#fxlx option:selected').val();//ѡ�е�ֵ
		if(fxlx=="")
		{
			alert("��ѡ���������");
			return;
		}
		if (fxlx == 0) {
			var cxsjstr = document.getElementById("cxsjstr").value;
			var cxsjend = document.getElementById("cxsjend").value;
			if(cxsjstr==""||cxsjend=="")
			{
				alert("��ѡ��������ѯʱ�䷶Χ");
				return;
			}
			else
			{
				if(cxsjstr.substring(0,4)!=cxsjend.substring(0,4))
				{
					alert("��ѯ��Χ����һ���ڵ�");
					return
				}
			}
			var dbsjstr = document.getElementById("dbsjstr").value;
			var dbsjend = document.getElementById("dbsjend").value;
			if(dbsjstr!="")
			{
				if(dbsjend=="")
				{
				alert("��ѡ�������Ա�ʱ�䷶Χ");
				return;
				}
			}
			if(dbsjend!="")
			{
				if(dbsjstr=="")
				{
				alert("��ѡ�������Ա�ʱ�䷶Χ");
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
			var ssqyval = document.getElementById("ssqyval").value;//��������
			
			var bblx = $('#bblx option:selected').val();//ѡ�е�ֵ
			
			var fxdxs = document.getElementsByName("fxdx");
			var fxdx = "";
			for (var j = 0; j < fxdxs.length; j++) {
				if (fxdxs[j].checked == true) {
					fxdx = fxdxs[j].value;
					window.open("/insect/tjfx/mypcfx_qxt.jsp?cxsjstr="+ cxsjstr + "&cxsjend=" + cxsjend + "&dbsjstr="+dbsjstr+"&dbsjend="+dbsjend+"&lssj="+lssj+"&ssqyval=" + ssqyval + "&bblx=" + bblx+"&fxdx="+fxdx,"","width=1200,height=600,resizable=yes");
				}
			}
		} else {
			alert("��������");
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
</script>
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true" />
	<!-- navigation -->
	<div class="layout grid-s5m0">
		<div class="layout-main">
			<div class="layout-wrap">
				<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">С�󲡳溦</h3>
					</div>
					<div class="mod-bd">
						<table class="w">
							<colgroup>
								<col style="width:40%"></col>
							</colgroup>
							<tr>
								<td style="text-align: right;">��������ѡ��</td>
								<td style="text-align: left"><select id="fxlx" name="fxlx"
									style="width:100px;">
										<option></option>
										<option value="0" selected="selected">С������</option>
										<option value="1">������</option>
										<option value="2">С��׷۲�</option>
								</select></td>
							</tr>
							<tr>
								<td style="text-align: right;">��ѯʱ�䷶Χ</td>
								<td style="text-align: left"><input id="cxsjstr"
									name="cxsjstr" type="text" class="Wdate"
									onFocus="WdatePicker({skin:'whyGreen'})" />��<input
									id="cxsjend" name="cxsjend" type="text" class="Wdate"
									onFocus="WdatePicker({skin:'whyGreen'})" /></td>
							</tr>
							<tr>
								<td style="text-align: right;">�Ա�ʱ�䷶Χ</td>
								<td style="text-align: left"><input id="dbsjstr"
									name="dbsjstr" type="text" class="Wdate"
									onFocus="WdatePicker({skin:'whyGreen'})" onchange="xgdbsj()"/>��<input
									id="dbsjend" name="dbsjend" type="text" class="Wdate"
									onFocus="WdatePicker({skin:'whyGreen'})" onchange="xgdbsj()"/></td>
							</tr>
							<tr id="ls">
								<td style="text-align: right;">��ʷ����ѡȡ</td>
								<td style="text-align: left"><input name="lssj"
									type="radio" value="1" checked="checked">����</input>&nbsp;&nbsp;
									<input name="lssj" type="radio" value="2">������</input>&nbsp;&nbsp;
									<input name="lssj" type="radio" value="3">������</input>&nbsp;&nbsp;
									<input name="lssj" type="radio" value="5">������</input>&nbsp;&nbsp;
									<input name="lssj" type="radio" value="10">��ʮ��</input>&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">��������</td>
								<td style="text-align: left;"><input id="ssqy" name="ssqy"
									type="text" value="" readonly="readonly" />&nbsp;&nbsp; <input
									class="btn" type="button" value="ѡ��" style="height: 25px;"
									onclick="xzqy()" /> <input id="ssqyval" name="ssqyval"
									type="hidden" value="" /></td>
							</tr>
							<tr>
								<td style="text-align: right;">����ָ��</td>
								<td style="text-align: left;"><input name="fxdx"
									type="checkbox" value="1" checked="checked">�������</input>&nbsp;&nbsp;
									<input name="fxdx" type="checkbox" value="2">��������</input>&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td style="text-align: right;">��������</td>
								<td style="text-align: left"><select id="bblx" name="bblx"
									style="width:100px;">
										<option></option>
										<option value="0">����</option>
										<option value="1">����</option>
								</select></td>
							</tr>
							<tr>
								<td class="tc p10" colspan="2"><input class="btn"
									type="button" value="ȷ��" onclick="sjfxt()" />&nbsp;</td>
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
				<div style="text-align: center;">
					<iframe id="result" name="result" style="width:100%;border:0px;"
						scrolling="no" onload="iFrameHeight()"></iframe>
				</div>
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
