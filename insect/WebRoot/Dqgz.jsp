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
	String nowbmb=bmbm;
	String bmmc = ((User) session.getAttribute("user")).getBmmc();
	String jfdeptprop = ((User) session.getAttribute("user")).getJfdeptprop();
	String jfuserrid=((User) session.getAttribute("user")).getUserid();
	String username=((User) session.getAttribute("user")).getUsername();
	User user=(User)session.getAttribute("user");
	String bbzt="";
	String chongbao="";
	if(bmbm.trim().length()==4)
	{
	bmbm="BMBM='"+bmbm+"' and SHBZ='0' ";
	bbzt=" and BBZT<='1'";
	request.setAttribute("BMBM", bmbm);
	request.setAttribute("BBZT", bbzt);
	}
	else
	{
	bbzt=" AND (( BBZT<='1' and length(bmbm)=2) or ( BBZT='2' and length(bmbm)=4)) ";
	bmbm="BMBM like '"+bmbm+"%' AND SHBZ!='2'";
	chongbao="BMBM like '"+nowbmb+"%' AND SHBZ='2' ";
	request.setAttribute("BMBM", bmbm);
	request.setAttribute("BBZT", bbzt);
	request.setAttribute("chongbao", chongbao);
	}
	
 %>
<style>
 *{ font-size:13px; }
 table td{
  border-bottom: 1px solid #D0D0D0;
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
 <div style="width: 100%;background-color: white;">
	     <table class="w">
							<colgroup>
								<col style="width: 3%"  />
								<col style="width: 5%"/>
								<col style="width: 15%"/>
								<col style="width: 10%"/>
								<col style="width: 10%"/>
								<col style="width: 10%"/>
							</colgroup>
							<thead>
								<tr>
									<td>
										<div class="cell-wrap">
											序列
										</div>
									</td>
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
						    <tbody style="text-align: left;">
							<%
							if(jfdeptprop.equals("0"))
							{
							%>
							    <mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE THBZ='1' and SHBZ<'2' AND ND=TO_CHAR(SYSDATE,'YYYY')">
								<tr class="repeat">
							     	<td>
										<div class="cell-wrap">
											<mt:index/>
										</div>
									</td>
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
								<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE LBJHBZ='1' AND SHBZ<'2' AND ND=TO_CHAR(SYSDATE,'YYYY') ORDER BY JZCBRQ">
								<tr class="miss">
								    <td>
										<div class="cell-wrap">
											<mt:index/>
										</div>
									</td>
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
							<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') AND SHBZ<'2' AND TO_CHAR(TBRQ+JZCBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') AND TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD')<TO_CHAR(SYSDATE,'YYYY-MM-DD') ORDER BY JZCBRQ">
								<tr class="urge">
								    <td>
										<div class="cell-wrap">
											<mt:index/>
										</div>
									</td>
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
											<mt:vlabel name="d:BMBM:str:s"/>
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
							<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD') JZTBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') AND TO_CHAR(TBRQ+JZTBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') AND SHBZ<'2' AND TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD')<=TO_CHAR(SYSDATE,'YYYY-MM-DD') ORDER BY JZTBRQ">
								<tr>
								    <td>
										<div class="cell-wrap">
											<mt:index/>
										</div>
									</td>
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
											<mt:vlabel name="d:BMBM:str:s"/>
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
							    <mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE THBZ='1' AND ND=TO_CHAR(SYSDATE,'YYYY') AND ${chongbao}">
								<tr class="repeat">
								    <td>
										<div class="cell-wrap">
											<mt:index/>
										</div>
									</td>
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
								<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE LBJHBZ='1' AND ND=TO_CHAR(SYSDATE,'YYYY') AND ${BMBM} ORDER BY JZCBRQ">
								<tr class="miss">
							    	<td>
								 		<div class="cell-wrap">
											<mt:index/>
										</div>
									</td>
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
								<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZCBTS,'YYYY-MM-DD') JZCBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') ${BBZT} AND TO_CHAR(TBRQ+JZCBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') AND TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD')<TO_CHAR(SYSDATE,'YYYY-MM-DD') AND ${BMBM} ORDER BY JZCBRQ">
								<tr class="urge">
								    <td>
										<div class="cell-wrap">
											<mt:index/>
										</div>
									</td>
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
											<a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','cb')"><mt:vlabel name="d:BMBM:str:s"/></a>
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
								<mt:sheet pagesize="20" datasource="SELECT JFID,decode(BBZT,'0','未填报','1','已填报未上报','2','正常上报','3','迟报','4','漏报') BBZT,DBBZB_ID,DYID,F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ+JZTBTS,'YYYY-MM-DD') JZTBRQ,F_GET_MC('DEPT',BMBM) BMBM FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') ${BBZT} AND TO_CHAR(TBRQ+JZTBTS+1,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') AND TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD')<=TO_CHAR(SYSDATE,'YYYY-MM-DD') AND ${BMBM} ORDER BY JZTBRQ">
								<tr>
								    <td>
										<div class="cell-wrap">
											<mt:index/>
										</div>
									</td>
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
											<a href="javascript:void(0);" onclick="report('<mt:vlabel name="d:jfid:str:s"/>','<mt:vlabel name="d:dbbzb_id:str:s"/>','<mt:vlabel name="d:dyid:str:s"/>','zc')"><mt:vlabel name="d:BMBM:str:s"/></a>
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
