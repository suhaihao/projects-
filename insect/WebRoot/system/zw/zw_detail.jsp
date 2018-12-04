<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page language="java"   session="true"   import="com.jf.bchyj.bean.User" %>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="作物信息" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="8060" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">作物信息</h3>
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
      <td align="right"><div class="cell-wrap">作物编码:</div></td>
      <td >
		<mt:uinput id="dqbfb:JFPLANTCODE:str:s" other="readonly" name="dqbfb:JFPLANTCODE:str:s" />
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">作物名称:</div></td>
      <td >
		<mt:uinput id="dqbfb:JFPLANTNAME:str:s" name="dqbfb:JFPLANTNAME:str:s" />
      </td>
    </tr>
<tr>
  <td align="right" ><div class="cell-wrap">作物类别：</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
           <mt:uselect name="dqbfb:JFSTATCODE:str:s" datamember="dzwlb" chname="部门名称" nullable="no" select="JFSTATCODE,JFSTATNAME" where=" JFSTATE='1' " other="style='width:135px;margin:-2px'">
           </mt:uselect>
      </span>
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">蔬菜种类：</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
           <mt:uselect name="dqbfb:SCZL:str:s" datamember="DSYS11" chname="部门名称" nullable="no" select="JFCODE,JFCODENAME" where=" JFSORT='SCZL' AND JFSTATE='1' " >
           </mt:uselect>
      </span>
  </td>
</tr>
 <tr>
  <td align="right" ><div class="cell-wrap">状&nbsp;&nbsp;&nbsp;&nbsp;态:</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <mt:ufreeselect chname="部门属性" name="dqbfb:JFSTATE:str:s"  nullable="no" optvalue="0:1" opttext="废弃:使用">
          </mt:ufreeselect>
      </span>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">备注:</div></td>
      <td >       
        <mt:utextarea name="dqbfb:JFREMARK:str:s" other="cols='' rows=''"></mt:utextarea>
      </td>
    </tr>
	<div class="mod-bd">
		<table class="w">
					<div class="mod-hd">
						<h3 class="mod-tit">相关病虫害</h3>
					</div>
			<thead>
				<tr>
					<td><div class="cell-wrap">序号</div></td>
					<td><div class="cell-wrap">病虫害编码</div></td>
					<td><div class="cell-wrap">病虫害名称</div></td>
					<td><div class="cell-wrap">删除</div></td>
				</tr>
			</thead>
			<mt:mastersheet detailindex="2">
			<tr>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/zwAction.do?ACT_TYPE=DETAIL_ZW&id=<mt:ulabel name="d:jfid:str:s"/>"><mt:uindex/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/zwAction.do?ACT_TYPE=DETAIL_ZW&id=<mt:ulabel name="d:jfid:str:s"/>"><mt:ulabel name="d:JFINSECTCODE:str:s"/></a></div></td>
				<td><div class="cell-wrap"><a target="_blank" href="/insect/zwAction.do?ACT_TYPE=DETAIL_ZW&id=<mt:ulabel name="d:jfid:str:s"/>"><mt:ulabel name="d:JFINSECTNAME:str:s"/></a></div></td>
				<td><div class="cell-wrap"><mt:uinput name= "d:jfid:str:s" type='checkbox' other=" onclick='f_del(this)'"/></div></td>
			</tr>
			</mt:mastersheet>
<tr>
    <td colspan=4 class="tc p10">
        <input name="U_find2" type="button"  style='cursor:hand' class='btn' onclick='return f_open()'  id="find" value=" 增加病虫害 "/>
        <input name="U_find1" type="button"  style='cursor:hand' class='btn' onclick='return f_query()'  id="find" value=" 保 存 "/>
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" 关 闭 ">
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
       document.f1.action = "/insect/zwAction.do?ACT_TYPE=UPDATE";
       document.f1.method = "post";
       document.f1.submit();
  }
	function f_refreshOpener() {
		parent.window.location = "/insect/zwAction.do?ACT_TYPE=DETAIL&id=${ID}";
	}
function f_open() {
	var bchbm = document.f1.elements["dqbfb:JFPLANTCODE:str:s"].value;
	var bchmc = document.f1.elements["dqbfb:JFPLANTNAME:str:s"].value;
	var jfid = document.f1.elements["dqbfb:jfid:str:P"].value;
	window.open("/insect/system/zw/bchzw_insert.jsp?bchbm=" + bchbm + "&bchmc=" 
			+ bchmc+ "&jfid=" + jfid , "newbchzsw")
}
function f_del(obj){
	if (f_confirm()) {
	       document.f1.action = "/insect/zwAction.do?ACT_TYPE=DELZW&id=" + obj.value;
	       document.f1.method = "post";
	       document.f1.submit();
	} else {
		obj.checked = false;
	}
}

</script>
<mt:successrefresh successMes="提交成功"/>