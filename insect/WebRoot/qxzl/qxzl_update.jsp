<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="气象资料修改" />
</jsp:include>

<!-- start content -->
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true">
		<jsp:param value="7010" name="c"/>
	</jsp:include>
	
	
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">修改气象资料</h3>
					</div>
					<div class="mod-bd">
					<mt:form name="f1" method="post" action="">
						<table class="w">
<mt:sheet pagesize="1">						
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">气象站点：</div></td>
  <td  width="20%"><div class="cell-wrap">
<span style="width:180px;border:1px solid #797a98">
	<mt:vselect other="style='width:192px;margin:-2px'" name="d:JFSTATIONCODE:str:s" datamember="dsys11" select="JFCODE,JFCODENAME" where=" jfsort='ZDBM' order by JFCODE" >
	</mt:vselect>
	<mt:vinput name="d:jfid:str:P" type="hidden" />
</span>
       </div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">日期：</div></td>
  <td  width="40%"><div class="cell-wrap">
    <mt:vinput name="d:jfdate:str:s" other="size='30'"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">气压0.1mb/hpa：</div></td>
  <td  width="20%"><div class="cell-wrap">
    <mt:vinput name="d:JFPP:str:s" other="size='30'"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">平均气温0.1°C：</div></td>
  <td  width="40%"><div class="cell-wrap">
    <mt:vinput name="d:JFTT:str:s" other="size='30'"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">最高气温0.1°C：</div></td>
  <td  width="20%"><div class="cell-wrap">
    <mt:vinput name="d:JFTMAX:str:s" other="size='30'"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">最低气温0.1°C：</div></td>
  <td  width="40%"><div class="cell-wrap">
    <mt:vinput name="d:JFTMIN:str:s" other="size='30'"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">平均相对湿度％：</div></td>
  <td  width="20%"><div class="cell-wrap">
    <mt:vinput name="d:JFRH:str:s" other="size='30'"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">降水0.1mm：</div></td>
  <td  width="40%"><div class="cell-wrap">
    <mt:vinput name="d:JFRR:str:s" other="size='30'"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">最高风速0.1m/s：</div></td>
  <td  width="20%"><div class="cell-wrap">
    <mt:vinput name="d:JFFMAX:str:s" other="size='30'"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">风向：</div></td>
  <td  width="40%"><div class="cell-wrap">
    <mt:vinput name="d:JFDD:str:s" other="size='30'"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">平均风速0.1m/s：</div></td>
  <td  width="20%"><div class="cell-wrap">
    <mt:vinput name="d:JFFF:str:s" other="size='30'"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">平均地温0.1°C：</div></td>
  <td  width="40%"><div class="cell-wrap">
    <mt:vinput name="d:JFDK0:str:s" other="size='30'"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">最高地温0.1°C：</div></td>
  <td  width="20%"><div class="cell-wrap">
    <mt:vinput name="d:JFDMAX:str:s" other="size='30'"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">最低地温0.1°C：</div></td>
  <td  width="40%"><div class="cell-wrap">
    <mt:vinput name="d:JFDMIN:str:s" other="size='30'"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">5CM地温0.1°C：</div></td>
  <td  width="20%"><div class="cell-wrap">
    <mt:vinput name="d:JFDK5:str:s" other="size='30'"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">10CM地温0.1°C：</div></td>
  <td  width="40%"><div class="cell-wrap">
    <mt:vinput name="d:JFDK10:str:s" other="size='30'"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">15CM地温0.1°C：</div></td>
  <td  width="20%"><div class="cell-wrap">
    <mt:vinput name="d:JFDK15:str:s" other="size='30'"  /></div>
  </td>
  <td width="10%" class="tr"><div class="cell-wrap">20CM地温0.1°C：</div></td>
  <td  width="40%"><div class="cell-wrap">
    <mt:vinput name="d:JFDK20:str:s" other="size='30'"  /></div>
  </td>
</tr>
<tr>
  <td width="30%" class="tr"><div class="cell-wrap">日照时数0.1hp：</div></td>
  <td  width="20%"><div class="cell-wrap">
    <mt:vinput name="d:JFS:str:s" other="size='30'"  /></div>
  </td>
</tr>
</mt:sheet>
<tr>
    <td colspan=4 class="tc p10">
	<input class='btn' style='cursor:hand'  name="U_insert" type="button" onclick="return f_save()" value="提 交" />&nbsp;
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" 关 闭 ">
	</td>
</tr>
						</table>
					</mt:form>	
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
       document.f1.action = "/insect/qxzlAction.do?ACT_TYPE=UPDATE";
       document.f1.method = "post";
       document.f1.submit();
  }
</script>
<mt:messagedialog/>