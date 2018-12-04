<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<%@page language="java"   session="true"   import="com.jf.bchyj.bean.User" %>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="文献检索" />
</jsp:include>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<%
User user=(com.jf.bchyj.bean.User)session.getAttribute("user");
String bmbm= user.getBmbm();
 %>
<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="4010" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">文献检索</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<tr>
  <td align="right" ><div class="cell-wrap">标题：</div></td>
  <td  width="400px"align="left">
    <input name="bt" size="30" />
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">来源：</div></td>
  <td  width="400px"align="left">
    <input name="ly" size="30"  value=""/>
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">作者：</div></td>
  <td  width="400px"align="left">
    <input name="zz" size="30"  value=""/>
  </td>
</tr>
    <tr>
     <td align="center" colspan="2">       
         <textarea id="summernote" name="zw"></textarea>
         <script>
         $(document).ready(function() {
        $('#summernote').summernote({
           height: 300,
           width:800
           // 定义编辑框高度
           });
         });
         </script>
      </td>
    </tr>
<tr>
    <td colspan=4 class="tc p10">
    <input name = "bmbm" type="hidden" value="<%=bmbm %>">
	<input class='btn' style='cursor:hand'  name="U_insert" type="button" onclick="return f_save(0)" value="保存" />
	<input class='btn' style='cursor:hand'  name="U_insert" type="button" onclick="return f_save(1)" value="提 交" />
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
	function f_refreshOpener() {
		window.location = "/insect/wxjs_Action.do?ACT_TYPE=DETAIL&zt=${zt}&id=${id}";
		parent.opener.window.location = "/insect/xxfb/wxjs_query.jsp";
	}

function f_save(zt){
var bmbm = document.f1.bmbm.value;
       document.f1.action = "/insect/wxjs_Action.do?ACT_TYPE=INSERT&zt="+zt;
       document.f1.method = "post";
       document.f1.submit();
}
</script>
<mt:successrefresh successMes="提交成功"/>