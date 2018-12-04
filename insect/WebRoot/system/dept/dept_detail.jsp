<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="部门修改" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="8015" name="c"/>
	</jsp:include>
	
<%
String JFDEPTPROP=(String)request.getAttribute("JFDEPTPROP"); 
%>
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">部门修改</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:50%">
								<col>
							</colgroup>
    <mt:sheet pagesize="1">
<tr>
  <td align="right" ><div class="cell-wrap">部门编码：</div></td>
  <td  width="400px"align="left">
        <mt:vlabel name="d_hy_zx:JFDEPTCODE:str:s"/>
        <mt:vinput name="d_hy_zx:JFDEPTCODE:str:s" type="hidden"/>
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">部门名称：</div></td>
  <td  width="400px"align="left">
    <mt:vinput name="dfirm_zhg:JFDEPTNAME:str:s" other="size='50' maxlength='100'"/>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">部门属性:</div></td>
      <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <mt:vfreeselect chname="部门属性" name="dfirm_zhg:JFDEPTPROP:str:s" nullable="no" optvalue="0:1:2" opttext="总部:市县:基点" other="onchange='chakebm(this)'">
          </mt:vfreeselect>
      </span>
      </td>
    </tr>
    <!-- 新加 -->
    <tr>
      <td align="right"><div class="cell-wrap">上级部门:</div></td>
      <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
         <%
         if(JFDEPTPROP.equals("1"))
         {
         %>
         <mt:vselect id="sjbm" name="dfirm_zhg:sjbm:str:s" datamember="DSYS05" select="JFDEPTCODE,JFDEPTNAME" where="JFDEPTPROP=0" sort="JFDEPTCODE" other="onchange='chakesjbm(this)'"></mt:vselect>
         <%
         }
         else if(JFDEPTPROP.equals("2"))
         {
         %>
         <mt:vselect id="sjbm" name="dfirm_zhg:sjbm:str:s" datamember="DSYS05" select="JFDEPTCODE,JFDEPTNAME" where="JFDEPTPROP=1" sort="JFDEPTCODE" other="onchange='chakesjbm(this)'"></mt:vselect>
         <%
         }
          %>
      </span>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">乡镇:</div></td>
      <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
                 <mt:vselect id="xz" name="dfirm_zhg:xz:str:s" datamember="dsys06" select="JFREGCODE,JFREGNAME" where="JFDSYS05_CODE=${SJBM} and jc=2" sort="JFREGCODE" other="onchange='chakexz(this)'"></mt:vselect>
      </span>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">村:</div></td>
      <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
                 <mt:vselect id="cun" name="dfirm_zhg:cun:str:s" datamember="dsys06" select="JFREGCODE,JFREGNAME" where="jfregcode like '${XZ}%' and jc=3" sort="JFREGCODE"></mt:vselect>
      </span>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">状&nbsp;&nbsp;&nbsp;&nbsp;态:</div></td>
      <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
        <mt:vfreeselect chname="部门状态" name="dfirm_zhg:JFSTATE:str:s" nullable="no" optvalue="0:1" opttext="废弃:使用">
          </mt:vfreeselect>
      </span>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">备&nbsp;&nbsp;&nbsp;&nbsp;注:</div></td>
      <td  width="400px"align="left">       
        <mt:vtextarea name="dfirm_zhg:JFREMARK:str:s" other="cols='50' rows='3'"></mt:vtextarea>
        <mt:vinput name="dfirm_zhg:jfid:str:s" type="hidden" />
      </td>
    </tr>
    </mt:sheet>
<tr>
    <td colspan=4 class="tc p10">
        <input name="jfid" type="hidden" />
        <input name="U_find1" type="button"  style='cursor:hand' class='btn' onclick='return f_query()'  id="find" value=" 保 存 "/>
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
function f_query(){
       document.f1.action = "/insect/deptAction.do?ACT_TYPE=UPDATE";
       document.f1.method = "post";
       document.f1.submit();
  }
function window_onload()
{
  initcal();
}
<%String hybm = (String)request.getAttribute("jfid");
%>
document.f1.jfid.value=<%=hybm%>;
function f_refreshOpener()
{
  var jfid=document.f1.jfid.value;
  window.document.location.replace("/insect/deptAction.do?ACT_TYPE=DETAIL&jfid="+jfid);
}

</script>
<mt:successrefresh successMes="成功!"/>
