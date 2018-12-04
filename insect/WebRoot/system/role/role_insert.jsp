<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="增加角色" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="8012" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">增加角色</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<tr>
  <td align="right" ><div class="cell-wrap">角色名称：</div></td>
  <td  width="400px"align="left">
    <input name="jsmc" size="30"  chname="部门名称" nullable="no"/>
  </td>
    <tr>
      <td align="right"><div class="cell-wrap">备&nbsp;&nbsp;&nbsp;&nbsp;注:</div></td>
      <td class=forumRowright width="400px"align="left">       
        <textarea name="bz" cols='50' rows='3' ></textarea>
      </td>
    </tr>
<tr>
    <td colspan=4 class="tc p10">
	<input class='btn' style='cursor:hand'  name="U_insert" type="button" onclick="return f_save()" value="提 交" />
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" 关 闭 ">
	</td>
</tr>
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

 function window_onload()
{
  initcal();
}
function f_save(){
       document.f1.action = "/insect/roleAction.do?ACT_TYPE=INSERT";
       document.f1.method = "post";
       document.f1.submit();
  }
</script>
<mt:messagedialog/>