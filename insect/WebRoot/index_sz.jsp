<%@page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<% session.removeAttribute("C"); %>
<%-- import header --%>
<jsp:include page="header.jsp" flush="true">
	<jsp:param name="title" value="北京市植物保护站" />
</jsp:include>

	<link href="/insect/assets/css/home.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<!-- 
	<link href="http://192.168.1.128:8082/assets/css/home.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	 -->
<!-- start content -->
<div id="content">
	<div class="layout grid-s5m0">
		<div class="layout-main">
			<div class="layout-wrap">
				<div class="mod">
                    <div class="mod-hd"><h3 class="mod-tit">区县工作完成情况</h3></div>
                    <div class="mod-bd">
                        <table class="w tablefix table_s_b">
                            <colgroup>
                                <col />
                                <col />
                                <col />
                                <col />
                                <col />
                                <col />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td rowspan="2" class="tc"><div class="cell-wrap">区县</div></td>
                                    <td rowspan="2" class="tc"><div class="cell-wrap">应报数</div></td>
                                    <td colspan="2" class="tc"><div class="cell-wrap">已报数</div></td>
                                    <td colspan="2" class="tc"><div class="cell-wrap">未报数</div></td>
                                </tr>
                                <tr>
                                    <td><div class="cell-wrap">正常</div></td>
                                    <td><div class="cell-wrap">迟报</div></td>
                                    <td><div class="cell-wrap">正常</div></td>
                                    <td><div class="cell-wrap">漏报</div></td>
                                </tr>
                            <mt:sheet pagesize="30" datasource="SELECT BMBM,F_GET_MC('DEPT',BMBM) QX,(SELECT COUNT(JFID) FROM DBBZB_RW A WHERE A.BMBM=T.BMBM AND A.ND=TO_CHAR(SYSDATE,'YYYY')) YBS,(SELECT COUNT(JFID) FROM DBBZB_RW B WHERE B.BMBM=T.BMBM AND B.BBZT='2') YBZC,(SELECT COUNT(JFID) FROM DBBZB_RW C WHERE C.BMBM=T.BMBM AND C.BBZT='3') YBCB,(SELECT COUNT(JFID) FROM DBBZB_RW D WHERE D.BMBM=T.BMBM AND D.BBZT IN ('0','1')) WBZC,(SELECT COUNT(JFID) FROM DBBZB_RW E WHERE E.BMBM=T.BMBM AND E.BBZT='4') WBLB FROM DBBZB_RW T WHERE ND=TO_CHAR(SYSDATE,'YYYY') GROUP BY BMBM,F_GET_MC('DEPT',BMBM)">
                                <tr>
                                    <td><div class="cell-wrap"><mt:vlabel name="d:qx:str:s"/></div></td>
                                    <td><div class="cell-wrap"><a href="javascript:list('ybs','<mt:vlabel name="d:bmbm:str:s"/>');"><mt:vlabel name="d:ybs:str:s"/></a></div></td>
                                    <td><div class="cell-wrap"><a href="javascript:list('ybzc','<mt:vlabel name="d:bmbm:str:s"/>');"><mt:vlabel name="d:ybzc:str:s"/></a></div></td>
                                    <td><div class="cell-wrap"><a href="javascript:list('ybcb','<mt:vlabel name="d:bmbm:str:s"/>');"><mt:vlabel name="d:ybcb:str:s"/></a></div></td>
                                    <td><div class="cell-wrap"><a href="javascript:list('wbzc','<mt:vlabel name="d:bmbm:str:s"/>');"><mt:vlabel name="d:wbzc:str:s"/></a></div></td>
                                    <td><div class="cell-wrap"><a href="javascript:list('wblb','<mt:vlabel name="d:bmbm:str:s"/>');"><mt:vlabel name="d:wblb:str:s"/></a></div></td>
                                </tr>
                            </mt:sheet>
                            </tbody>
                        </table>
                    </div>
                </div>
				<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">
							信息浏览
						</h3>
					</div>
					<div class="mod-bd">
						<div style="height:220px;overflow:hidden;">
						<table class="w">
							<colgroup>
								<col />
								<col style="width:94px" />
							</colgroup>
							<thead>
								<tr>
									<td>
										<div class="cell-wrap">
											标题
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											发布日期
										</div>
									</td>
								</tr>
							</thead>
							<tbody>
							<mt:sheet pagesize="5" datasource="SELECT JFID,BT,TO_CHAR(FBRQ,'YYYY-MM-DD') FBRQ,DECODE(SIGN(SYSDATE-FBRQ-3),1,'none','inline') ISNEW FROM DTZGG WHERE ZT='1' ORDER BY FBRQ DESC">
								<tr>
									<td>
										<div class="cell-wrap">
											<a target="_blank" href="index/xxll_detail.jsp?id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:bt:str:s"/></a><span class="new" style="display:<mt:vlabel name="d:isnew:str:s"/>">NEW</span>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:fbrq:str:s"/>
										</div>
									</td>
								</tr>
							</mt:sheet>
							</tbody>
						</table>
						</div>
						<div class="more tr">
							<a href="javascript:void(0);" onclick="more()">更多》</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- menu -->
		<div class="layout-sub">
			<div class="layout-wrap">
				<%@include file="/menu.jsp"%>
			</div>
		</div>
	</div>
</div>
<!-- end content -->
<script type="text/javascript">
function more(lb){
	window.open("/insect/xxll.do?ACT_TYPE=QUERY","more_xxll_sz","");
}
function list(lb,qx){
	window.open("/insect/qxrwtj.do?ACT_TYPE=QUERY&lb=" + lb + "&qx=" + qx,"qx_rw_list","");
}
</script>
<%@include file="footer.jsp"%>
