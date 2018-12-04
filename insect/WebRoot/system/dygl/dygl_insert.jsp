<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="增加地域" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="8020" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">增加地域</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<tr>
  <td align="right" ><div class="cell-wrap">地域编码：</div></td>
  <td  width="400px"align="left">
       <input type="text" id="freeselect1" chname="部门编码" nullable="no"  name="bmbm" size="30">
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">地域名称：</div></td>
  <td  width="400px"align="left">
    <input name="bmmc" size="30"  chname="部门名称" nullable="no"/>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">地域属性:</div></td>
      <td width="400px"align="left">
        <select style="width:192px;margin:-2px" name="bmsx">
        	<option value="0" selected>近郊区</option>
        	<option value="1">远郊区</option>
        </select>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">状&nbsp;&nbsp;&nbsp;&nbsp;态:</div></td>
      <td width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" name="zt">
        	<option value="0">废弃</option>
        	<option value="1" selected>使用</option>
        </select>
      </span>
      </td>
    </tr>
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
       document.f1.action = "/insect/dyglAction.do?ACT_TYPE=INSERT";
       document.f1.method = "post";
       document.f1.submit();
  }
</script>
<mt:messagedialog/>