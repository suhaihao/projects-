<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="�ʱ��ѡ��" />
</jsp:include>

<!-- start content -->
<div id="content">
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">�ʱ��ѡ��</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/tbsjxz.do?ACT_TYPE=QUERY">
							<table class="w">
								<tr>
									<td class="tr">
										<div class="cell-wrap">�ϱ�����:</div>
									</td>
									<td style="width:280px">
										<input type="text" id="sbrq_b" name="sbrq_b" style="width:75px" readonly="readonly" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)" />
										��
										<input type="text" id="sbrq_e" name="sbrq_e" style="width:75px" readonly="readonly" class="Wdate" onFocus="WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })" onkeyup="changeiput(this)"/>
									</td>
									<td>
										<input type="submit" value="��ѯ" class="btn" />
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
                <div class="mod">
					<div class="mod-bd">
						<form id="f1" name="f1" method="post">
							<table class="w" name="t1" id="t1">
								<colgroup>
									<col style="width:7%">
									<col>
									<col style="width:18%">
									<col style="width:18%">
									<col style="width:18%">
									<col style="width:18%">
									<col style="width:7%">
								</colgroup>
								<thead>
									<tr class="tc">
										<td><div class="cell-wrap">���</div></td>
										<td><div class="cell-wrap">�ϱ�����</div></td>
										<td><div class="cell-wrap">��ʼ��ʾ����</div></td>
										<td><div class="cell-wrap">��ʼ�����</div></td>
										<td><div class="cell-wrap">������ֹ�����</div></td>
										<td><div class="cell-wrap">ֹͣ�߱�����</div></td>
										<td><div class="cell-wrap">ѡ��</div></td>
									</tr>
								</thead>
								<mt:sheet pagesize="20">
								<tr class="tc">
									<td><div class="cell-wrap"><mt:index/></div></td>
									<td><div class="cell-wrap"><mt:vlabel name="d:rq:str:s" /></div></td>
									<td><div class="cell-wrap"><mt:vlabel name="d:kststs:str:s" /></div></td>
									<td><div class="cell-wrap"><mt:vlabel name="d:kstbts:str:s" /></div></td>
									<td><div class="cell-wrap"><mt:vlabel name="d:jztbts:str:s" /></div></td>
									<td><div class="cell-wrap"><mt:vlabel name="d:jzcbts:str:s" /></div></td>
									<td><div class="cell-wrap"><a href="#" act="select" sbrq="<mt:vlabel name="d:rq:str:s" />" sbrq2="<mt:vlabel name="d:rq2:str:s" />" ksts="<mt:vlabel name="d:kststs:str:s" />" kstb="<mt:vlabel name="d:kstbts:str:s" />" jztb="<mt:vlabel name="d:jztbts:str:s" />" jzcb="<mt:vlabel name="d:jzcbts:str:s" />" tbrqid="<mt:vlabel name="d:jfid:str:s" />">ѡ��</a></div></td>
								</tr>
								</mt:sheet>
								<tr><td colspan="7"><div class="cell-wrap"><mt:pagenavigate/></div></td></tr>
							</table>
						</form>
						<script type="text/javascript">
							$("body").css("min-height", "500px");
							$("#content").css("min-height", "500px");
							$("a[act='select']").on("click", function() { // ��ֵ
								$(window.opener.document).find("#sbrq").val($(this).attr("sbrq"));
								$(window.opener.document).find("#kststs").val($(this).attr("ksts"));
								$(window.opener.document).find("#kstbts").val($(this).attr("kstb"));
								$(window.opener.document).find("#jztbts").val($(this).attr("jztb"));
								$(window.opener.document).find("#jzcbts").val($(this).attr("jzcb"));
								$(window.opener.document).find("#tbrq_id").val($(this).attr("tbrqid"));
								$(window.opener.document).find("#sbrq").blur();
								window.opener.valRWMC($(this).attr("sbrq2")); // �Զ�������������
								window.close();
							});
						</script>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer_nocopy.jsp"%>
