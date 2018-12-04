<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%@page import="java.util.Calendar"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="病虫害数据查询" />
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
var nd=document.getElementById("nd").value
var ssqyval=document.getElementById("ssqyval").value
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
 int year=calendar.get(Calendar.YEAR);//得到年
%>
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">设施蔬菜粉虱分析</h3>
					</div>
					<div class="mod-bd">
							<table class="w">
								<colgroup>
									<col style="width:40%"></col>
								</colgroup>
								<tr>
								<td style="text-align: right">年度</td>
								<td style="text-align: left;"><input id="nd" name="nd" type="text" value="<%=year %>"/></td>
								</tr>
								<tr>
								<td style="text-align: right">历史数据选取</td>
								<td style="text-align: left">
								<input name="lssj" type="radio" value="1" checked="checked">上年</input>&nbsp;&nbsp;
								<input name="lssj" type="radio" value="2">近两年</input>&nbsp;&nbsp;
								<input name="lssj" type="radio" value="3">近三年</input>&nbsp;&nbsp;
								<input name="lssj" type="radio" value="5">近五年</input>&nbsp;&nbsp;
								<input name="lssj" type="radio" value="10">近十年</input>&nbsp;&nbsp;
								</td>
								</tr>
								<tr>
								<td style="text-align: right">所属区域</td>
								<td style="text-align: left;">
								<input id="ssqy" name="ssqy" type="text" value="" readonly="readonly"/>&nbsp;&nbsp;
								<input class="btn" type="button" value="选择" style="height: 25px;" onclick="xzqy()"/>
								<input id="ssqyval" name="ssqyval" type="hidden" value=""/>
								</td>
								</tr>
								<tr>
								<td style="text-align: right">分析对象</td>
								<td style="text-align: left;">
								<input name="fxdx" type="radio" value="1" checked="checked">虫株率</input>&nbsp;&nbsp;
								<input name="fxdx" type="radio" value="2">百株虫量</input>&nbsp;&nbsp;
								<input name="fxdx" type="radio" value="3">烟粉虱占比</input>&nbsp;&nbsp;
								<input name="fxdx" type="radio" value="4">粉虱百株虫量</input>&nbsp;&nbsp;
								</td>
								</tr>
								<tr>
								<td style="text-align: right;">报表类型</td>
								<td style="text-align: left">
								<select id="bblx" name="bblx" style="width:100px;">
								<option></option>
								<option value="0">区县</option>
								<option value="1">基点</option>
								</select>
								</td>
								</tr>
								<tr>
									<td class="tc p10" colspan="2">
										<input class="btn" type="button" value="确定" onclick="sjfxt()"/>&nbsp;
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
