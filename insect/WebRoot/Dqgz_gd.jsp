<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@ page language="java" pageEncoding="GBK"%>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
	<link href="/insect/assets/css/base.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/css/layout.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/css/com.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/plug/jquery-ui-1.10.4 2/css/custom/jquery-ui-1.10.4.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-ui-1.10.4.js" type="text/javascript"></script>
	<script type="text/javascript" src="/insect/javascript/validate.min.js"></script>
	<script type="text/javascript" src="/insect/javascript/common.js"></script>
	<link href="/insect/assets/css/home.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<%
	String bmbm = ((User) session.getAttribute("user")).getBmbm();
	String bmmc = ((User) session.getAttribute("user")).getBmmc();
	String jfuserrid=((User) session.getAttribute("user")).getUserid();
	String username=((User) session.getAttribute("user")).getUsername();
	request.setAttribute("BMBM", bmbm);
 %>
<style>
 *{ font-size:13px; }
  table td{
  border-bottom: 1px solid gray;
  }
</style>
<script type="text/javascript">
function report(rwid,zbid,dyid,lb){
	if (dyid) {
		window.open("/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "&rwid=" + rwid + "&lb=" + lb + "&jfid=" + dyid,"report_update","");
	} else {
		window.open("/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "&rwid=" + rwid + "&lb=" + lb,"report_add","");
	}
}
</script>
<table class="w">
							<thead>
								<tr>
									<td><div class="cell-wrap">序号</div></td>
									<td><div class="cell-wrap">类别</div></td>
									<td><div class="cell-wrap">表名</div></td>
									<td><div class="cell-wrap">地区</div></td>
									<td><div class="cell-wrap">（正常/逾期）截止填报日期</div></td>
								</tr>
							</thead>
							<%
							if(bmbm.equals("10"))
							{
							%>
									<mt:sheet pagesize="30">
							<tr class="<mt:vlabel name="d:style:str:s"/>">
								<td>
									<div class="cell-wrap">
										<mt:index/>
									</div>
								</td>
								<td>
									<div class="cell-wrap">
										<mt:vlabel name="d:gzlb:str:s"/>
									</div>
								</td>
								<td>
									<div class="cell-wrap">
										<mt:vlabel name="d:bbmc:str:s"/>
									</div>
								</td>
									<td>
									<div class="cell-wrap">
									<mt:vlabel name="d:BMBM:str:s"/>
									</div>
								</td>
								<td>
									<div class="cell-wrap">
										<mt:vlabel name="d:gzrq:str:s"/>
									</div>
								</td>
							</tr>
							</mt:sheet>						
							<%
							}
							else
							{
							%>
								<mt:sheet pagesize="30">
							<tr class="<mt:vlabel name="d:style:str:s"/>">
								<td>
									<div class="cell-wrap">
										<mt:index/>
									</div>
								</td>
								<td>
									<div class="cell-wrap">
										<mt:vlabel name="d:gzlb:str:s"/>
									</div>
								</td>
								<td>
									<div class="cell-wrap">
										<a href="/insect/scblei.do?ACT_TYPE=Q<mt:vlabel name="d:dbbzb_id:str:s"/>&zbid=<mt:vlabel name="d:dbbzb_id:str:s"/>&rwid=<mt:vlabel name="d:jfid:str:s"/>&lb=<mt:vlabel name="d:lb:str:s"/>&jfid=<mt:vlabel name="d:dyid:str:s"/>" target="_blank"><mt:vlabel name="d:bbmc:str:s"/></a>
									</div>
								</td>
									<td>
									<div class="cell-wrap">
									<mt:vlabel name="d:BMBM:str:s"/>
									</div>
								</td>
								<td>
									<div class="cell-wrap">
										<mt:vlabel name="d:gzrq:str:s"/>
									</div>
								</td>
							</tr>
							</mt:sheet>
							<%
							}
							 %>
						
							<tr>
								<td colspan="5">
								<div class="cell-wrap"><mt:pagenavigate/></div>
								</td>
							</tr>
						</table>
