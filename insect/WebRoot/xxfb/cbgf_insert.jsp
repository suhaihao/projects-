<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="增加测报规范" />
</jsp:include>
 <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
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
						<h3 class="mod-tit">增加测报规范</h3>
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
        <select style="width:192px;margin:-2px" name="lb">
        	<option value="01">北京</option>
        	<option value="02">全国</option>
        </select>
      </span>
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">类型：</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" name="lx">
        	<option value="01">国家标准</option>
        	<option value="02">农业行业标准</option>
        	<option value="03">本市地方标准</option>
        	<option value="04">本市测报办法</option>
        </select>
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
		window.location = "/insect/xxfb_cbgfQueryAction.do?ACT_TYPE=DETAIL&zt=0&id=${id}";
		parent.opener.window.location = "/insect/xxfb/cbgf_query.jsp";
	}

function f_save(zt){
       document.f1.action = "/insect/xxfb_cbgfQueryAction.do?ACT_TYPE=INSERT&zt="+zt;
       document.f1.method = "post";
       document.f1.submit();
  }
</script>
<mt:successrefresh successMes="提交成功"/>