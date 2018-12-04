<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page language="java"   session="true"   import="com.jf.bchyj.bean.User" %>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="���溦��Ϣ" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="8050" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">���溦��Ϣ</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<mt:mastersheet>
<mt:uinput id="dqbfb:jfid:str:P" name="dqbfb:jfid:str:P" type="hidden"/>
    <tr>
      <td align="right"><div class="cell-wrap">���溦����:</div></td>
      <td >
		<mt:uinput id="dqbfb:JFINSECTCODE:str:s" other="readonly" name="dqbfb:JFINSECTCODE:str:s" />
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">���溦����:</div></td>
      <td >
		<mt:uinput id="dqbfb:JFINSECTNAME:str:s" name="dqbfb:JFINSECTNAME:str:s" />
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">����������:</div></td>
      <td >
		<mt:uinput id="dqbfb:JFLATIN:str:s" other="size='50'" name="dqbfb:JFLATIN:str:s" />
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">Ӣ������:</div></td>
      <td >
		<mt:uinput id="dqbfb:JFENGLISH:str:s" name="dqbfb:JFENGLISH:str:s" />
      </td>
    </tr>
<tr>
  <td align="right" ><div class="cell-wrap">���溦���</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
           <mt:uselect name="dqbfb:JFSTATCODE:str:s" datamember="dbchlb" chname="��������" nullable="no" select="JFSTATCODE,JFSTATNAME" where=" JFSTATE='1' " other="style='width:135px;margin:-2px'">
           </mt:uselect>
      </span>
  </td>
</tr>
 <tr>
  <td align="right" ><div class="cell-wrap">״&nbsp;&nbsp;&nbsp;&nbsp;̬:</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <mt:ufreeselect chname="��������" name="dqbfb:JFSTATE:str:s"  nullable="no" optvalue="0:1" opttext="����:ʹ��">
          </mt:ufreeselect>
      </span>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">���溦��̬ͼƬ:</div></td>
      <td >       
								<a href="javascript:void(0);" onclick="up('${ID}','dbch_img');return false;" class="choose" title="ѡ�񸽼�">ѡ��</a>
								<style type="text/css">
								.J_xxfj td{
									border:0px;
								}
								.J_xxfj a.del{
									vertical-align: middle;
									padding: 0 3px;
									font-family: arial;
									font-style: normal;
									font-size: 8px;
									line-height: 8px;
									background-color: #cc3;
									color: #fff;
									border: 1px solid #cc3;
								}
								.J_xxfj a.del:hover{
									border-color: #f00;
									background-color: #f40;
									text-decoration: none;
								}
								</style>
								<table class="J_xxfj">
								<mt:mastersheet detailindex="1">
									<tr><td>
										<a onclick="window.open('<mt:ulabel name="d:lj:str:s"/>')" href="javascript:void(0)"><mt:ulabel name="d:wjm:str:s"/></a>
										<a class="del" title="ɾ��" onclick="return confirm('ȷʵҪɾ����?');" href="/insect/bchAction.do?ACT_TYPE=DEL&idd=${ID}&path=<mt:ulabel name="d:lj:str:s"/>&id=<mt:ulabel name="d:jfid:str:s"/>">X</a>
									</td></tr>
								</mt:mastersheet>
								</table>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">���溦��̬����:</div></td>
      <td >       
        <mt:utextarea name="dqbfb:JFREMARK:str:s" other="cols='' rows=''"></mt:utextarea>
      </td>
    </tr>
	<div class="mod-bd">
		<table class="w">
					<div class="mod-hd">
						<h3 class="mod-tit">�������</h3>
					</div>
			<thead>
				<tr>
					<td><div class="cell-wrap">���</div></td>
					<td><div class="cell-wrap">�������</div></td>
					<td><div class="cell-wrap">��������</div></td>
					<td><div class="cell-wrap">ɾ��</div></td>
				</tr>
			</thead>
			<mt:mastersheet detailindex="2">
			<tr>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bchAction.do?ACT_TYPE=DETAIL_ZW&id=<mt:ulabel name="d:jfid:str:s"/>"><mt:uindex/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bchAction.do?ACT_TYPE=DETAIL_ZW&id=<mt:ulabel name="d:jfid:str:s"/>"><mt:ulabel name="d:JFPLANTCODE:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/bchAction.do?ACT_TYPE=DETAIL_ZW&id=<mt:ulabel name="d:jfid:str:s"/>"><mt:ulabel name="d:JFPLANTNAME:str:s"/></a></div></td>
				<td><div class="cell-wrap"><mt:uinput name= "d:jfid:str:s" type='checkbox' other=" onclick='f_del(this)'"/></div></td>
			</tr>
			</mt:mastersheet>
<tr>
    <td colspan=4 class="tc p10">
        <input name="U_find2" type="button"  style='cursor:hand' class='btn' onclick='return f_open()'  id="find" value=" �������� "/>
        <input name="U_find1" type="button"  style='cursor:hand' class='btn' onclick='return f_query()'  id="find" value=" �� �� "/>
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" �� �� ">
	</td>
</tr>
		</table>
	</div>
   </mt:mastersheet>
						</table>
					</form>	
					</div>
					
				</div>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
<script language="javascript">
function f_query(){
       document.f1.action = "/insect/bchAction.do?ACT_TYPE=UPDATE";
       document.f1.method = "post";
       document.f1.submit();
  }
	function f_refreshOpener() {
		parent.window.location = "/insect/bchAction.do?ACT_TYPE=DETAIL&id=${ID}";
	}
function up(id, tb, lx) {
	var w = window.open("/insect/common/upload/upload.jsp?tb=" + tb + "&id=" 
			+ id + "&lx='bch'" , "upload", "height=380px,width=800px,scrollbars=yes,resizable=yes");
	w.focus();
}
function f_open() {
	var bchbm = document.f1.elements["dqbfb:JFINSECTCODE:str:s"].value;
	var bchmc = document.f1.elements["dqbfb:JFINSECTNAME:str:s"].value;
	var jfid = document.f1.elements["dqbfb:jfid:str:P"].value;
	window.open("/insect/system/bch/bchzw_insert.jsp?bchbm=" + bchbm + "&bchmc=" 
			+ bchmc+ "&jfid=" + jfid , "newbchzsw")
}
function f_del(obj){
	if (f_confirm()) {
	       document.f1.action = "/insect/bchAction.do?ACT_TYPE=DELZW&id=" + obj.value;
	       document.f1.method = "post";
	       document.f1.submit();
	} else {
		obj.checked = false;
	}
}

</script>
<mt:successrefresh successMes="�ύ�ɹ�"/>