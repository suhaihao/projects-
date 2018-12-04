<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<%@page language="java"   session="true"   import="com.jf.bchyj.bean.User" %>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="增加病虫情报" />
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
						<h3 class="mod-tit">增加病虫情报</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<tr>
  <td align="right" ><div class="cell-wrap">类别：</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" id="lb" name="lb" onchange="return f_onchange(this.value)">
			<option value="01">区县</option>
			<option value="02">全市</option>
			<option value="03">全国</option>
			<option value="04">其他省市</option>
        </select>
      </span>
  </td>
</tr>
<tr id="qx" style="display: ">
  <td align="right" ><div class="cell-wrap">区县：</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <mt:freeselect other="style='width:192px;margin:-2px'" name="qx" datamember="dsys05" select="JFDEPTCODE,JFDEPTNAME" where=" JFDEPTPROP='1' or JFDEPTPROP='2' and jfstate='1' order by JFDEPTCODE" >
        </mt:freeselect>
      </span>
  </td>
</tr>
<tr id="sf" style="display: none">
  <td align="right" ><div class="cell-wrap">其他省市：</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <mt:freeselect other="style='width:192px;margin:-2px'" name="sf" datamember="dsys11" select="JFCODE,JFcodeNAME" where=" jfsort='BCQB_QTSS' order by JFCODE" >
        </mt:freeselect>
      </span>
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">标题：</div></td>
  <td  width="400px"align="left">
    <input name="bt" size="30"  chname="部门名称" nullable="no"/>
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
    <input name = "bmbm" type="hidden" value="<%=bmbm %>>">
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
		window.location = "/insect/xxfb_bcqbAction.do?ACT_TYPE=DETAIL&zt=0&id=${id}";
		parent.opener.window.location = "/insect/xxfb/bcqb_query.jsp";
	}

function f_save(zt){
var bmbm = document.f1.bmbm.value;
var lb = document.f1.lb.value;
if(bmbm.substr(0,1)=="1"){

}else{
  if(lb!="01"){
  alert("区县用户只能发布区县病虫情报！")
  document.getElementById('lb').focus();
  return false;
  }
}
       document.f1.action = "/insect/xxfb_bcqbAction.do?ACT_TYPE=INSERT&zt="+zt;
       document.f1.method = "post";
       document.f1.submit();
  }
function f_onchange(lb){
	if(lb=="01"){
	document.getElementById("qx").style.display="";
	document.getElementById("sf").style.display="none";
	}else if(lb=="04"){
	document.getElementById("qx").style.display="none";
	document.getElementById("sf").style.display="";
	}else{
	document.getElementById("qx").style.display="none";
	document.getElementById("sf").style.display="none";
	}
  }
</script>
<mt:successrefresh successMes="提交成功"/>