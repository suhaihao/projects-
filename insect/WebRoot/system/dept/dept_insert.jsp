<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="���Ӳ���" />
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
						<h3 class="mod-tit">���Ӳ���</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
<tr>
  <td class="tr"><div class="cell-wrap">���ű��룺</div></td>
  <td  width="400px"align="left">
       <input type="text" id="freeselect1" name="bmbm" size="30">
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">�������ƣ�</div></td>
  <td  width="400px"align="left">
    <input name="bmmc" size="30"  />
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">��������:</div></td>
      <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" name="bmsx" onchange="chakebm(this)">
        	<option value="0" selected>�ܲ�</option>
        	<option value="1">����</option>
        	<option value="2">����</option>
        </select>
      </span>
      </td>
    </tr>
    <!-- �¸Ķ� -->
    <tr>
    <td align="right"><div class="cell-wrap">�ϼ�����</div></td>
    <td  width="400px"align="left">
     <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" id="sjbm" name="sjbm" onchange="chakesjbm(this)">
        </select>
     </span>
    </td>
    </tr>
    <tr>
    <td align="right"><div class="cell-wrap">����</div></td>
    <td  width="400px"align="left">
     <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" id="xz" name="xz" onchange="chakexz(this)">
        </select>
     </span>
    </td>
    </tr>
    <tr>
    <td align="right"><div class="cell-wrap">��</div></td>
    <td  width="400px"align="left">
     <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" id="cun" name="cun">
        </select>
     </span>
    </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">״&nbsp;&nbsp;&nbsp;&nbsp;̬:</div></td>
      <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <select style="width:192px;margin:-2px" name="zt">
        	<option value="0">����</option>
        	<option value="1" selected>ʹ��</option>
        </select>
      </span>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">��&nbsp;&nbsp;&nbsp;&nbsp;ע:</div></td>
      <td  width="400px" align="left" class=forumRowright>       
        <textarea name="bz" cols='50' rows='3' ></textarea>
      </td>
    </tr>
<tr>
    <td colspan=4 class="tc p10">
	<input class='btn' style='cursor:hand'  name="U_insert" type="button" onclick="return f_save()" value="�� ��" />&nbsp;
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" �� �� ">
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
              $jqsel.append("<option value='0'>��ѡ��</option>");
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
              $jqsel.append("<option value='0'>��ѡ��</option>");
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
              $jqsel.append("<option value='0'>��ѡ��</option>");
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