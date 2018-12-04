<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%@page import="java.util.Calendar"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="���溦���ݲ�ѯ" />
</jsp:include>
<style type="text/css">
.w th{
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
function sjfxt()
{
var lssjs=document.getElementsByName("lssj");
var lssj="";
for ( var i = 0; i < lssjs.length; i++) {
	if(lssjs[i].checked==true){
	lssj=lssjs[i].value;
	break;
	}
}
var fxdxs=document.getElementsByName("fxdx");
var fxdx="";
for ( var j = 0; j < fxdxs.length; j++) {
	if(fxdxs[j].checked==true){
	fxdx=fxdxs[j].value;
	break;
	}
}
var bblx=$('#bblx option:selected') .val();
var nd=document.getElementById("nd").value;
var ssqyval=document.getElementById("ssqyval").value;
document.getElementById("result").src="/insect/tjfx/fsfx_qxt.jsp?lssj="+lssj+"&nd="+nd+"&ssqyval="+ssqyval+"&fxdx="+fxdx+"&bblx="+bblx;
}
function xzqy()
{
var txval=window.showModalDialog("/insect/tjfx/Mytree.jsp","","status:false;dialogWidth:550px;dialogHeight:600");
if(txval!=null)
{
var val=txval.split(",");
document.getElementById("ssqy").value=val[0];
document.getElementById("ssqyval").value=val[1];
}
}
</script>
<%
 Calendar calendar=Calendar.getInstance();
 int year=calendar.get(Calendar.YEAR);//�õ���
%>
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">��ʭ����</h3>
					</div>
					<div class="mod-bd">
							<table class="w">
								<colgroup>
									<col style="width:40%"></col>
								</colgroup>
								<tr>
								<td style="text-align: right">���</td>
								<td style="text-align: left;"><input id="nd" name="nd" type="text" value="<%=year %>"/></td>
								</tr>
								<tr>
								<td style="text-align: right">��ʷ����ѡȡ</td>
								<td style="text-align: left">
								<input name="lssj" type="radio" value="1" checked="checked">����</input>&nbsp;&nbsp;
								<input name="lssj" type="radio" value="2">������</input>&nbsp;&nbsp;
								<input name="lssj" type="radio" value="3">������</input>&nbsp;&nbsp;
								<input name="lssj" type="radio" value="5">������</input>&nbsp;&nbsp;
								<input name="lssj" type="radio" value="10">��ʮ��</input>&nbsp;&nbsp;
								</td>
								</tr>
								<tr>
								<td style="text-align: right">��������</td>
								<td style="text-align: left;">
								<input id="ssqy" name="ssqy" type="text" value="" readonly="readonly"/>&nbsp;&nbsp;
								<input class="btn" type="button" value="ѡ��" style="height: 25px;" onclick="xzqy()"/>
								<input id="ssqyval" name="ssqyval" type="hidden" value=""/>
								</td>
								</tr>
								<tr>
								<td style="text-align: right">��������</td>
								<td style="text-align: left;">
								<input name="fxdx" type="radio" value="1" checked="checked">������</input>&nbsp;&nbsp;
								<input name="fxdx" type="radio" value="2">�������</input>&nbsp;&nbsp;
								</td>
								</tr>
								<tr>
								<td style="text-align: right;">��������</td>
								<td style="text-align: left">
								<select id="bblx" name="bblx" style="width:100px;">
								<option></option>
								<option value="0">����</option>
								<option value="1">����</option>
								</select>
								</td>
								</tr>
								<tr>
									<td class="tc p10" colspan="2">
										<input class="btn" type="button" value="ȷ��" onclick="sjfxt()"/>&nbsp;
									</td>
								</tr>
							</table>
							<script type="text/javascript">
								function back(id,bb){
									window.location = "/insect/sjcx.do?ACT_TYPE=LIST&dbbzb_jfid=" + id + "&bbmc="+encodeURIComponent(encodeURIComponent(bb));
								}
								function iFrameHeight() {
									var ifm= document.getElementById("result");
									var subWeb = document.frames ? document.frames["result"].document : ifm.contentDocument;
									if(ifm != null && subWeb != null) {
										ifm.height = subWeb.body.scrollHeight;
									}
								}
							</script>
					</div>
				</div>
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()"></iframe>
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
