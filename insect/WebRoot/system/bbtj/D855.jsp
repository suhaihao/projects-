<%@ page language="java" import="java.util.*" pageEncoding="GBK"%><%@ taglib
	uri="/WEB-INF/mt.tld" prefix="mt"%><%@page
	import="com.jf.util.DrawTable"%><%@page import="com.jf.bchyj.bean.User"%><%@page
	import="java.util.Date"%><%@page import="java.text.DateFormat"%><%@page
	import="java.text.SimpleDateFormat"%><html>
<head>
<title>数据填报</title>
<script type="text/javascript"
	src="/insect/javascript/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/insect/javascript/function.js"></script>
<script type="text/javascript" src="/insect/javascript/jy.js"></script>
<script type="text/javascript"
	src="/insect/javascript/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/insect/javascript/common.js"></script>
<script type="text/javascript">var ops=new Array();var f=1;function xuanze(obj){var index = obj.selectedIndex;var panduan = obj.id;var opnvalue = obj.options[index].value;if(panduan=='XZ'){var fu=obj.getAttribute("fu");if(fu!=null&&fu!=""){var zisele=fu;var js=zisele.split(",");for(var i=0;i<js.length;i++){zisele=js[i];var sele=document.getElementById(zisele);if(f==1){ops=sele.innerHTML;sessionStorage.setItem("htl",ops);f=2;}var sel = obj.parentNode.parentNode.childNodes;var $sel = $(sel);var $sels=$sel.children("select");for (var i = 0; i < $sels.length; i++) {if($sels.eq(i).attr("id")==zisele){sele=$sels.eq(i);}}var $jqsel = $(sele);$jqsel.empty(); var str=sessionStorage.getItem("htl");var zz=/^[<\w\s>=\"]+[\u4e00-\u9fa5a-zA-Z0-9\s]*[<\W\S>/]{9}/;var lsstr="";lsstr=zz.exec(str);ops=str.split(zz); while(true){var zzs=/[0-9]+/;var sz =zzs.exec(lsstr);sz+="";if(sz.indexOf(opnvalue+"")>=0){$jqsel.append(lsstr);}str=ops[1]; ops=str.split(zz);lsstr=zz.exec(str); if(str.length<10) {break;}}}}else { if("zi" in obj){}}}else{var fu=obj.getAttribute("fu");var zbid=document.getElementById("zbid").value;if(fu!=null&&fu!=""){$.ajax( {type : "post",url : "/insect/cesdm.do?ACT_TYPE=QUERY",data : {code : opnvalue,"zbid":zbid},dataType : "json",async : true,error : function(XMLResponse) {},success : function(data) {var zisele=fu;var js=zisele.split(",");for(var i=0;i<js.length;i++){zisele=js[i];var futr = obj.parentNode.parentNode.childNodes;var $futr = $(futr);var $ziseles=$futr.children("select");for (var j = 0; j < $ziseles.size(); j++) {if($ziseles.eq(j).attr("id")==zisele){sele=$ziseles.eq(j);}}var $jqsel = $(sele);$jqsel.empty();$.each(data, function(key, val) {if($jqsel.attr("id")==key){$.each(val, function(key, val) {$jqsel.append("<option value="+key+">"+val+"</option>");});}});}}});}}}var jsgs = new Array();var gsjg = new Array();$(document).keyup(function(event){f_jsgs(event.target);});var jygx = new Array();var jyts = new Array();$(document).ready(function(){$("#btnAddRow").click(function(){add_row();});$("#btnDel").click(function(){del_row();});$("#btnSave").click(function(){$("#bbzt").val("bc");f_jygx();var delid = document.getElementsByName("delid")[0].value;var zbid=document.getElementById("zbid").value;var rwid=document.getElementsByName("rwid")[0].value;var lb=document.getElementsByName("tblb")[0].value;var rw = document.getElementsByName("rw")[0].value;document.forms[0].action = "/insect/sjtb/add_ht.jsp?jfid="+delid+"&zbid="+zbid+"&rwid="+rwid+"&lb="+lb+"&rw="+rw;var tj=true;var ips=document.getElementsByTagName('input');for ( var i = 0; i < ips.length; i++) {var nulable=ips[i].getAttribute("nullable");if(nulable!=null){if(verifyInput(ips[i])){tj=true;}else{tj=false;break;}}}if(tj){var selects=document.getElementsByTagName('select');for ( var j = 0; j < selects.length; j++) {var nulable=selects[j].getAttribute("nullable");if(nulable!=null){if(verifyInput(selects[j])){tj=true;}else{tj=false;break;}}}}if(tj){document.forms[0].submit();}else{return;}});$("#btnSubmit").click(function(){$("#bbzt").val("tj");$("input[name*='_HEAD:ZT']").val("1");f_jygx();document.forms[0].submit();});$("#okUp").click(function(){var path = $("#file").val();var delid = document.getElementsByName("delid")[0].value;if (path.indexOf(".xls") > 0) {var _con_ = "";$("input[name*='_HEAD']").each(function(){_con_ += $(this).attr("name") + "," + $(this).val() + "@";});$("#f2").attr("action", $("#f2").attr("action") + "&hd=" + _con_+"&lujing="+path+"&deltid="+delid);$("#f2").submit();} else {alert("请选择Excel格式文件");}});$("#btnUpload").click(function(){$("#upLayer").show();});$("#cancelUp").click(function(){$("#upLayer").hide();});if (document.getElementById("hbs")) {$("#f2").attr("action", $("#f2").attr("action") + "&hbs=1");}});function scexcel(zbid,jfid){$.ajax({type:"post",url:"/insect/scExcel.do?ACT_TYPE=QUERY",data:{code:zbid,jfid:jfid},dataType:"json",async: false,error:function(XMLResponse){alert("失败");},success:function(data){document.getElementById("mb").href="system\\excelload\\D"+zbid+".xls";document.getElementById("mb").click();}});}</script>
</head>
<body>
	<form id="f1" name="f1" action="/insect/sjtb/add_ht.jsp" method="post">
		<%
			String zbid = (String) request.getAttribute("zbid");
			String rwid = (String) request.getAttribute("rwid");
			String lb = (String) request.getAttribute("lb");
			String jfid = (String) request.getAttribute("jfid");
			String rw = (String) request.getAttribute("rw");
			String bbzt = request.getParameter("bbzt");
			String shbz = request.getParameter("shbz");
			if (bbzt == null) {
				bbzt = "0";
			}
			String cxbm = (String) request.getAttribute("cxbm");
			String cxbmmc = (String) request.getAttribute("cxbmmc");
			String cxzt = (String) request.getAttribute("cxzt");
			String cxuserid = (String) request.getAttribute("cxuserid");
			String cxxz = (String) request.getAttribute("cxxz");
			String cxcun = (String) request.getAttribute("cxcun");
			String rwsj = (String) request.getAttribute("rwsj");
			String zt = "";
			if (cxzt.equals("1")) {
				zt = "提交";
			} else {
				zt = "初始";
			}
			String cxlrrq = (String) request.getAttribute("cxlrrq");
			String cxlrry = (String) request.getAttribute("cxlrry");
			request.setAttribute("BBZT", "bc");
			String usebm = ((User) request.getSession().getAttribute("user"))
					.getBmbm();
			String jfdeptprop = ((User) request.getSession().getAttribute(
					"user")).getJfdeptprop();
			if (cxbm != null && !cxbm.equals("")) {
				usebm = cxbm;
			}
			String userbmbm = usebm;
			if (usebm.equals("10")) {
				cxbm = "JFDSYS05_CODE='" + cxbm + "'";
				request.setAttribute("usebm", cxbm);
				request.setAttribute("usecun", cxbm);
			} else {
				if (usebm.trim().length() == 4) {
					String xz = ((User) request.getSession().getAttribute(
							"user")).getXz();
					String cun = ((User) request.getSession().getAttribute(
							"user")).getCun();
					if (cxxz != null && !cxxz.equals("")) {
						xz = cxxz;
						cun = cxcun;
					}
					usebm = "JFREGCODE='" + xz + "'";
					String usecun = "JFREGCODE='" + cun + "'";
					request.setAttribute("usebm", usebm);
					request.setAttribute("usecun", usecun);
				} else {
					usebm = "JFDSYS05_CODE='" + usebm + "'";
					request.setAttribute("usebm", usebm);
					request.setAttribute("usecun", usebm);
				}
			}
			String bmmc = ((User) request.getSession().getAttribute("user"))
					.getBmmc();
			if (usebm.equals("10")) {
				bmmc = cxbmmc;
			}
			if (cxbmmc != null && !cxbmmc.equals("")) {
				bmmc = cxbmmc;
			}
			String username = ((User) request.getSession().getAttribute("user"))
					.getUsername();
			if (usebm.equals("10")) {
				username = cxlrry;
			}
			if (cxlrry != null && !cxlrry.equals("")) {
				username = cxlrry;
			}
			String userid = ((User) request.getSession().getAttribute("user"))
					.getUserjfid();
			if (cxuserid != null && !cxuserid.equals("")) {
				userid = cxuserid;
			}
			Date date = new Date();
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = format.format(date);
			if (usebm.equals("10")) {
				time = cxlrrq;
			}
			if (cxlrrq != null && !cxlrrq.equals("")) {
				time = cxlrrq;
			}
		%><table
			border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=8 rowspan=1
					style="text-align:center;font-size=30;width: ;height: "><b>小麦吸浆虫化蛹进度调查表(<%=rwsj%>)
				</b><br>
				<br></td>
			</tr>
			<tr>
				<td colspan=1 rowspan=1 style="font-size:12;width:60;height: "><b>调查单位:</b></td>
				<td colspan=1 rowspan=1><input type="hidden"
					name="D855_HEAD:BMBM:S" value="<%=userbmbm%>" /><input type="text"
					readonly="readonly"
					style="border:0;border-bottom:1px solid #000000;width:100;height: "
					value="<%=bmmc%>" /></td>
				<td colspan=1 rowspan=1 style="font-size:12;width:100;height: "><b>
				</b></td>
				<td colspan=1 rowspan=1 style="font-size:12;width:40;height: "><b>年度:</b></td>
				<td colspan=1 rowspan=1><input type="hidden"
					name="D855_HEAD:ND:S" value="" /><input type="text"
					readonly="readonly"
					style="border:0;border-bottom:1px solid #000000;width:80;height: "
					value="" /></td>
				<td colspan=1 rowspan=1 style="font-size:12;width:60;height: "><b>
				</b></td>
				<td colspan=1 rowspan=1 style="font-size:12;width:40;height: "><b>状态:</b></td>
				<td colspan=1 rowspan=1><input type="hidden"
					name="D855_HEAD:ZT:S" value="0" /><input type="text"
					readonly="readonly"
					style="border:0;border-bottom:1px solid #000000;width:60;height: "
					value="<%=zt%>" /></td>
			</tr>
		</table>
		<table border=1 borderColorDark=black borderColorLight=white
			cellpadding=1 cellspacing=1 align=center id=zg name=zg>
			<tbody id="zg_head">
				<tr>
					<td colspan=1 rowspan=3
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>调查日期</b></td>
					<td colspan=1 rowspan=3
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>乡镇</b></td>
					<td colspan=1 rowspan=3
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>调查地点</b></td>
					<td colspan=1 rowspan=3
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>取样方数(个)</b></td>
					<td colspan=1 rowspan=3
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>总虫数(头)</b></td>
					<td colspan=16 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>其中各虫态头数及其比率</b></td>
					<td colspan=1 rowspan=3
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>化蛹率（%）</b></td>
					<td colspan=1 rowspan=3
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>平均密度(头/样方)</b></td>
					<td colspan=1 rowspan=3
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>备注</b></td>
				</tr>
				<tr>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>圆茧</b></td>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>活动幼虫</b></td>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>蛹</b></td>
					<td colspan=2 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>长茧</b></td>
					<td colspan=8 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>各蛹期比率（%）</b></td>
				</tr>
				<tr>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>头</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>%</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>头</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>%</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>头</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>%</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>头</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>%</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>前蛹数</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>占比</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>初蛹数</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>占比</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>中蛹数</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>占比</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>后蛹数</b></td>
					<td colspan=1 rowspan=1
						style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>占比</b></td>
				</tr>
			</tbody>
			<tbody id="zg_body">
				<mt:sheet pagesize="20">
					<tr onclick="focusTR(this)">
						<input name="delid" type="hidden"
							value="<mt:vlabel name="D855_BODY:JFDYID:str:S" />" />
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="DCRQ" name="D855_BODY:DCRQ:D"
							style="width:80;height: ;font-size:12"
							value=" <mt:vlabel name="D855_BODY:DCRQ:str:D" />" class="Wdate"
							onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)" /></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><mt:vselect
								id="XZ" name="D855_BODY:XZ:str:S" datamember=" dsys06 "
								select=" jfregcode,jfregname "
								where=" ${usebm} and jc='2' and jfstate='1' order by jfregcode"></mt:vselect></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><mt:vselect
								id="DCDD" name="D855_BODY:DCDD:str:S" datamember=" dsys06 "
								select=" jfregcode,jfregname "
								where=" ${usecun} and jc='3' and jfstate='1' order by jfregcode"></mt:vselect></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y01" name="D855_BODY:Y01:N"
							style="width:80;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y01:str:N" />" /></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y02" name="D855_BODY:Y02:N"
							style="width:80;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y02:str:N" />" />
						<script type="text/javascript">jsgs[jsgs.length]="Y03+Y05+Y07+Y09";gsjg[gsjg.length]="Y02";</script></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y03" name="D855_BODY:Y03:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y03:str:N" />" /></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y04" name="D855_BODY:Y04:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y04:str:N" />" />
						<script type="text/javascript">jsgs[jsgs.length]="Y03/Y02*100";gsjg[gsjg.length]="Y04";</script></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y05" name="D855_BODY:Y05:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y05:str:N" />" /></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y06" name="D855_BODY:Y06:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y06:str:N" />" />
						<script type="text/javascript">jsgs[jsgs.length]="Y05/Y02*100";gsjg[gsjg.length]="Y06";</script></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y07" name="D855_BODY:Y07:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y07:str:N" />" /></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y08" name="D855_BODY:Y08:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y08:str:N" />" />
						<script type="text/javascript">jsgs[jsgs.length]="Y07/Y02*100";gsjg[gsjg.length]="Y08";</script></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y09" name="D855_BODY:Y09:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y09:str:N" />" /></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y10" name="D855_BODY:Y10:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y10:str:N" />" />
						<script type="text/javascript">jsgs[jsgs.length]="Y09/Y02*100";gsjg[gsjg.length]="Y10";</script></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y11" name="D855_BODY:Y11:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y11:str:N" />" /></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y12" name="D855_BODY:Y12:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y12:str:N" />" />
						<script type="text/javascript">jsgs[jsgs.length]="Y11/(Y07+Y09)*100";gsjg[gsjg.length]="Y12";</script></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y13" name="D855_BODY:Y13:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y13:str:N" />" /></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y14" name="D855_BODY:Y14:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y14:str:N" />" />
						<script type="text/javascript">jsgs[jsgs.length]="Y13/(Y07+Y09)*100";gsjg[gsjg.length]="Y14";</script></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y15" name="D855_BODY:Y15:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y15:str:N" />" /></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y16" name="D855_BODY:Y16:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y16:str:N" />" />
						<script type="text/javascript">jsgs[jsgs.length]="Y15/(Y07+Y09)*100";gsjg[gsjg.length]="Y16";</script></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y17" name="D855_BODY:Y17:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y17:str:N" />" /></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y18" name="D855_BODY:Y18:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y18:str:N" />" />
						<script type="text/javascript">jsgs[jsgs.length]="Y17/(Y07+Y09)*100";gsjg[gsjg.length]="Y18";</script></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y19" name="D855_BODY:Y19:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y19:str:N" />" />
						<script type="text/javascript">jsgs[jsgs.length]="(Y07+Y09)/(Y02-Y03)*100";gsjg[gsjg.length]="Y19";</script></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y20" name="D855_BODY:Y20:N"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y20:str:N" />" />
						<script type="text/javascript">jsgs[jsgs.length]="Y02/Y01";gsjg[gsjg.length]="Y20";</script></td>
						<td align=left style="height:25px" colspan=1 rowspan=1><input
							type="text" id="Y21" name="D855_BODY:Y21:S"
							style="width:50;height: ;font-size:12"
							value="<mt:vlabel name="D855_BODY:Y21:str:S" />" /></td>
					</tr>
				</mt:sheet>
			</tbody>
			<tr>
				<td colspan=100 align="center">
					<%
						if (!bbzt.equals("2") && !bbzt.equals("3") && !bbzt.equals("4")) {
					%> <input
					type=button value="增加" id="btnAddRow" />&nbsp;&nbsp; <input
					type=button value="删除" id="btnDel" />&nbsp;&nbsp; <input
					type=button value="上载" id="btnUpload" />&nbsp;&nbsp; <input
					type=button value="保存" id="btnSave" />&nbsp;&nbsp; <input
					type=button value="提交" id="btnSubmit" /> <%
 	} else {
 		if (shbz.equals("1")) {
 %><input
					type=button value="增加" id="btnAddRow" />&nbsp;&nbsp;<input
					type=button value="删除" id="btnDel" />&nbsp;&nbsp;<input
					type=button value="提交" id="btnSubmit" />
					<%
						}
					%> <input type=button value="导出Excel" id="btnExport"
					onclick="scexcel(<%=zbid%>,<%=jfid%>)" /> <a id="mb" href="" />
					<%
						}
					%>
				</td>
			</tr>
		</table>
		<table border=0 cellpadding=0 cellspacing=0 align=center>
			<tr>
				<td colspan=1 rowspan=1
					style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>经办人:</b></td>
				<td colspan=1 rowspan=1><input type="text"
					name="D855_HEAD:JBR:S"
					style="border:0;border-bottom:1px solid #000000;width:80;height: ;font-size:12"
					value="<%=request.getAttribute("jbr")%>" /></td>
				<td colspan=1 rowspan=1
					style="word-break: break-all;text-align:center; font-size:12;width:60;height: "><b>
				</b></td>
				<td colspan=1 rowspan=1
					style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>录入日期:</b></td>
				<td colspan=1 rowspan=1><input type="hidden"
					name="D855_HEAD:LRRQ:D" value="<%=time%>" /><input type="text"
					readonly="readonly"
					style="border:0;border-bottom:1px solid #000000;width:80;height: ;font-size:12"
					value="<%=time%>" /></td>
				<td colspan=1 rowspan=1
					style="word-break: break-all;text-align:center; font-size:12;width:60;height: "><b>
				</b></td>
				<td colspan=1 rowspan=1
					style="word-break: break-all;text-align:center; font-size:12;width: ;height: "><b>录入人员:</b></td>
				<td colspan=1 rowspan=1><input type="hidden"
					name="D855_HEAD:LRRY:S" value="<%=userid%>" /><input type="text"
					readonly="readonly"
					style="border:0;border-bottom:1px solid #000000;width:90;height: ;font-size:12"
					value="<%=username%>" /></td>
			</tr>
		</table>
		<input type="hidden" name="zbid" id="zbid" value="<%=zbid %>" /><input
			type="hidden" name="rwid" value="<%=rwid %>" /><input type="hidden"
			name="tblb" value="<%=lb %>" /><input type="hidden" name="jfid"
			value="<%=jfid%>" /><input type="hidden" name="rw" value="<%=rw%>" /><input
			type="hidden" name="bbzt" id="bbzt" value="bc" />
	</form>
	<div id="upLayer"
		style="display:none; width:300px; font-size:12px; border:#D8D8D8 4px solid; position:absolute; left:600px; top:100px; background-color:#F6F6F6">
		<form id="f2" name="f2"
			action="/insect/sjtb/xls_upload.jsp?zbid=<%=zbid %>&rwid=<%=rwid %>&lb=<%=lb %>&rwsj=<%=rw %>&bbzt=<%=bbzt %>"
			method="post" enctype="multipart/form-data">
			<table style="text-align: center;width:100%">
				<tr>
					<td><align center>请录入需要上载的文件</align></td>
				</tr>
				<tr>
					<td><input id="file" name="file" type="file" style="width:90%"></td>
				</tr>
				<tr>
					<td><input type="button" value="确认" id="okUp">&nbsp;&nbsp;<input
						type="button" value="取消" id="cancelUp"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>