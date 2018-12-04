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
	String par=request.getParameter("par");
	String son=request.getParameter("son");
	String qx=request.getParameter("qx");
	String where="";
	if(!par.equals("0"))
	{
	  where+=" AND DBBZB_ID in (select jfid from dbbzb where jflb='"+par+"')";
	}
	if(!son.equals("0"))
	{
	  where+=" AND DBBZB_ID="+son+" ";
	}
	if(qx!=null&&!qx.equals(""))
	{
	  qx=qx.substring(0, qx.length()-1);
	  where+=" AND BMBM IN ("+qx+")";
	}
	request.setAttribute("WHERE", where);
 %>
<style>
 *{ font-size:13px; }
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
 <div style="width: 100%;background-color: white;">
	     <table class="w">
							<colgroup>
								<col width="60" />
								<col />
								<col style="width:102px" />
							</colgroup>
							<thead>
								<tr>
									<td>
										<div class="cell-wrap">
											类别
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											表名
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											地区
										</div>
									</td>
									<!--  11.25新修改 -->
										<td>
										<div class="cell-wrap">
											状态
										</div>
									   </td>
									<td>
										<div class="cell-wrap">
											（正常/逾期）<br/>截止填报日期
										</div>
									</td>
								</tr>
							</thead>
						    <tbody>
						    <%
						    if(bmbm.equals("10"))
						    {
						    %>
						    <mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE THBZ='1' AND ND=TO_CHAR(SYSDATE,'YYYY') ${WHERE}">
								<tr class="repeat">
									<td>
										<div class="cell-wrap">
											重报
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
										    <mt:vlabel name="DBBZB_RW:BBZT:str:s"/>
										</div>
									    </td>
									<td></td>
								</tr>
							</mt:sheet>
							<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE LBJHBZ='1' AND ND=TO_CHAR(SYSDATE,'YYYY') ${WHERE} ORDER BY JZCBRQ">
								<tr class="miss">
									<td>
										<div class="cell-wrap">
											漏报
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:bbmc:str:s"/>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:bmbm:str:s"/>
										</div>
									</td>
									
										<td>
										<div class="cell-wrap">
										    <mt:vlabel name="DBBZB_RW:BBZT:str:s"/>
										</div>
									    </td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:jzcbrq:str:s"/>
										</div>
									</td>
								</tr>
							</mt:sheet>
							<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') AND BBZT<='1' AND TO_CHAR(TBRQ+JZCBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') AND TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD')<TO_CHAR(SYSDATE,'YYYY-MM-DD') ${WHERE} ORDER BY JZCBRQ">
								<tr class="urge">
									<td>
										<div class="cell-wrap">
											催报
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:bbmc:str:s"/>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:bmbm:str:s"/>
										</div>
									</td>
									    <td>
										<div class="cell-wrap">
										    <mt:vlabel name="DBBZB_RW:BBZT:str:s"/>
										</div>
									    </td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:jzcbrq:str:s"/>
										</div>
									</td>
								</tr>
							</mt:sheet>
							<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD') JZTBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') AND BBZT<='1' AND TO_CHAR(TBRQ+JZTBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') AND TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD')<=TO_CHAR(SYSDATE,'YYYY-MM-DD') ${WHERE} ORDER BY JZTBRQ">
								<tr>
									<td>
										<div class="cell-wrap">
											<font color="black">当前</font>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:bbmc:str:s"/>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:bmbm:str:s"/>
										</div>
									</td>
										<td>
										<div class="cell-wrap">
										    <mt:vlabel name="DBBZB_RW:BBZT:str:s"/>
										</div>
									    </td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:jztbrq:str:s"/>
										</div>
									</td>
								</tr>
							</mt:sheet>
						    <%
						    }
						    else
						    {
						    %>
						      <mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE THBZ='1' AND ND=TO_CHAR(SYSDATE,'YYYY') AND BMBM LIKE '${BMBM}%' ${WHERE}">
								<tr class="repeat">
									<td>
										<div class="cell-wrap">
											重报
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','chb')"><mt:vlabel name="d:bbmc:str:s"/></a>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','chb')"><mt:vlabel name="d:BMBM:str:s"/></a>
										</div>
									</td>
										<td>
										<div class="cell-wrap">
										    <mt:vlabel name="DBBZB_RW:BBZT:str:s"/>
										</div>
									    </td>
									<td></td>
								</tr>
							</mt:sheet>
							<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE LBJHBZ='1' AND ND=TO_CHAR(SYSDATE,'YYYY') AND BMBM LIKE '${BMBM}%' ${WHERE} ORDER BY JZCBRQ">
								<tr class="miss">
									<td>
										<div class="cell-wrap">
											漏报
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','lb')"><mt:vlabel name="d:bbmc:str:s"/></a>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','lb')"><mt:vlabel name="d:bmbm:str:s"/></a>
										</div>
									</td>
									
										<td>
										<div class="cell-wrap">
										    <mt:vlabel name="DBBZB_RW:BBZT:str:s"/>
										</div>
									    </td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:jzcbrq:str:s"/>
										</div>
									</td>
								</tr>
							</mt:sheet>
							<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') AND BBZT<='1' AND TO_CHAR(TBRQ+JZCBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') AND TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD')<TO_CHAR(SYSDATE,'YYYY-MM-DD') AND (BMBM='${BMBM}' or (BMBM LIKE '${BMBM}%' AND SHBZ=1)) ${WHERE} ORDER BY JZCBRQ">
								<tr class="urge">
									<td>
										<div class="cell-wrap">
											催报
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','cb')"><mt:vlabel name="d:bbmc:str:s"/></a>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','cb')"><mt:vlabel name="d:bmbm:str:s"/></a>
										</div>
									</td>
									    <td>
										<div class="cell-wrap">
										    <mt:vlabel name="DBBZB_RW:BBZT:str:s"/>
										</div>
									    </td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:jzcbrq:str:s"/>
										</div>
									</td>
								</tr>
							</mt:sheet>
							<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD') JZTBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') AND BBZT<='1' AND TO_CHAR(TBRQ+JZTBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') AND TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD')<=TO_CHAR(SYSDATE,'YYYY-MM-DD') AND (BMBM='${BMBM}' or (BMBM LIKE '${BMBM}%' AND SHBZ=1)) ${WHERE} ORDER BY JZTBRQ">
								<tr>
									<td>
										<div class="cell-wrap">
											<font color="black">当前</font>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','zc')"><mt:vlabel name="d:bbmc:str:s"/></a>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','zc')"><mt:vlabel name="d:bmbm:str:s"/></a>
										</div>
									</td>
										<td>
										<div class="cell-wrap">
										    <mt:vlabel name="DBBZB_RW:BBZT:str:s"/>
										</div>
									    </td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:jztbrq:str:s"/>
										</div>
									</td>
								</tr>
							</mt:sheet>
						    <%
						    }
						     %>
						    </tbody>
						</table>
</div>
