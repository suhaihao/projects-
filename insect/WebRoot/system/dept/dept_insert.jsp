<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="增加部门" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="8015" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">增加部门</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<tr>
  <td class="tr"><div class="cell-wrap">部门编码：</div></td>
  <td  width="400px"align="left">
       <input type="text" id="freeselect1" name="bmbm" size="30">
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">部门名称：</div></td>
  <td  width="400px"align="left">
    <input name="bmmc" size="30"  />
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">部门属性:</div></td>
      <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" name="bmsx" onchange="chakebm(this)">
        	<option value="0" selected>总部</option>
        	<option value="1">市县</option>
        	<option value="2">基点</option>
        </select>
      </span>
      </td>
    </tr>
    <!-- 新改动 -->
    <tr>
    <td align="right"><div class="cell-wrap">上级部门</div></td>
    <td  width="400px"align="left">
     <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" id="sjbm" name="sjbm" onchange="chakesjbm(this)">
        </select>
     </span>
    </td>
    </tr>
    <tr>
    <td align="right"><div class="cell-wrap">乡镇</div></td>
    <td  width="400px"align="left">
     <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" id="xz" name="xz" onchange="chakexz(this)">
        </select>
     </span>
    </td>
    </tr>
    <tr>
    <td align="right"><div class="cell-wrap">村</div></td>
    <td  width="400px"align="left">
     <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" id="cun" name="cun">
        </select>
     </span>
    </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">状&nbsp;&nbsp;&nbsp;&nbsp;态:</div></td>
      <td  width="400px"align="left">
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
      <td  width="400px" align="left" class=forumRowright>       
        <textarea name="bz" cols='50' rows='3' ></textarea>
      </td>
    </tr>
<tr>
    <td colspan=4 class="tc p10">
	<input class='btn' style='cursor:hand'  name="U_insert" type="button" onclick="return f_save()" value="提 交" />&nbsp;
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
function chakebm(obj){
var index = obj.selectedIndex;
var opnvalue=obj.options[index].value;
$.ajax({
            type:"post",
            url:"/insect/hqsjbm.do?ACT_TYPE=QUERY",
            data:{code:opnvalue},
            dataType:"json",        
            async: false,
            error:function(XMLResponse){
              var sel=document.getElementById("sjbm");
              var $jqsel=$(sel);
              $jqsel.empty();
            },
            success:function(data){
              var sel=document.getElementById("sjbm");
              var $jqsel=$(sel);
              $jqsel.empty();
              $jqsel.append("<option value='0'>请选择</option>");
              $.each(data,function(key,city){
              $jqsel.append("<option value="+city+">"+key+"</option>"); 
              })  
            }
       });
}
function chakesjbm(obj)
{
var index = obj.selectedIndex;
var opnvalue=obj.options[index].value;
$.ajax({
            type:"post",
            url:"/insect/hqxz.do?ACT_TYPE=QUERY",
            data:{code:opnvalue},
            dataType:"json",        
            async: false,
            error:function(XMLResponse){
              var sel=document.getElementById("xz");
              var $jqsel=$(sel);
              $jqsel.empty();
            },
            success:function(data){
              var sel=document.getElementById("xz");
              var $jqsel=$(sel);
              $jqsel.empty();
              $jqsel.append("<option value='0'>请选择</option>");
              $.each(data,function(key,city){
              $jqsel.append("<option value="+city+">"+key+"</option>"); 
              })  
            }
       });
}
function chakexz(obj)
{
var index = obj.selectedIndex;
var opnvalue=obj.options[index].value;
$.ajax({
            type:"post",
            url:"/insect/hqcun.do?ACT_TYPE=QUERY",
            data:{code:opnvalue},
            dataType:"json",        
            async: false,
            error:function(XMLResponse){
              var sel=document.getElementById("cun");
              var $jqsel=$(sel);
              $jqsel.empty();
            },
            success:function(data){
              var sel=document.getElementById("cun");
              var $jqsel=$(sel);
              $jqsel.empty();
              $jqsel.append("<option value='0'>请选择</option>");
              $.each(data,function(key,city){
              $jqsel.append("<option value="+city+">"+key+"</option>"); 
              })  
            }
       });
}
 function window_onload()
{
  initcal();
}
function f_save(){
       document.f1.action = "/insect/deptAction.do?ACT_TYPE=INSERT";
       document.f1.method = "post";
       document.f1.submit();
  }
</script>
<mt:messagedialog/>