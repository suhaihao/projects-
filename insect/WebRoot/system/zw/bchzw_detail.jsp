<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page language="java"   session="true"   import="com.jf.bchyj.bean.User" %>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="病虫害作物信息" />
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
						<h3 class="mod-tit">病虫害作物信息</h3>
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
      <td align="right"><div class="cell-wrap">作物:</div></td>
      <td >
		<mt:uinput id="dqbfb:JFPLANTNAME:str:s" other="readonly" name="dqbfb:JFPLANTNAME:str:s" />
      </td>
    </tr>
<tr>
  <td align="right" ><div class="cell-wrap">病虫害名称：</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
           <mt:uselect name="dqbfb:JFINSECTCODE:str:s" datamember="dbch" chname="部门名称" nullable="no" select="JFINSECTCODE,JFINSECTNAME" where=" JFSTATE='1' " >
           </mt:uselect>
      </span>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">危害症状:</div></td>
      <td >       
        <mt:utextarea name="dqbfb:JFHARM:str:s" other="cols='' rows=''"></mt:utextarea>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">发病条件或生活习性:</div></td>
      <td >       
        <mt:utextarea name="dqbfb:JFHABIT:str:s" other="cols='' rows=''"></mt:utextarea>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">防治方法:</div></td>
      <td >       
        <mt:utextarea name="dqbfb:JFCURE:str:s" other="cols='' rows=''"></mt:utextarea>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">病虫害形态图片:</div></td>
      <td >       
								<a href="javascript:void(0);" onclick="up('${ID}','dbchzw_img');return false;" class="choose" title="选择附件">选择</a>
								<style type="text/css">
								.J_xxfj td{
									border:0px;
								}
								.J_xxfj a.del{
									vertical-align: middle;
									padding: 0 3px;
									font-family: arial;
									font-style: normal;
									font-size: 8px;
									line-height: 8px;
									background-color: #cc3;
									color: #fff;
									border: 1px solid #cc3;
								}
								.J_xxfj a.del:hover{
									border-color: #f00;
									background-color: #f40;
									text-decoration: none;
								}
								</style>
								<table class="J_xxfj">
								<mt:mastersheet detailindex="1">
									<tr><td>
										<a onclick="window.open('<mt:ulabel name="d:lj:str:s"/>')" href="javascript:void(0)"><mt:ulabel name="d:wjm:str:s"/></a>
										<a class="del" title="删除" onclick="return confirm('确实要删除吗?');" href="/insect/zwAction.do?ACT_TYPE=DEL_ZW&idd=${ID}&path=<mt:ulabel name="d:lj:str:s"/>&id=<mt:ulabel name="d:jfid:str:s"/>">X</a>
									</td></tr>
								</mt:mastersheet>
								</table>
      </td>
    </tr>
<tr>
    <td colspan=4 class="tc p10">
        <input name="U_find1" type="button"  style='cursor:hand' class='btn' onclick='return f_query()'  id="find" value=" 保 存 "/>
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" 关 闭 ">
	</td>
</tr>
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
       document.f1.action = "/insect/zwAction.do?ACT_TYPE=UPDATE_ZW&bch_id=${BCH_ID}";
       document.f1.method = "post";
       document.f1.submit();
  }
	function f_refreshOpener() {
		window.location = "/insect/zwAction.do?ACT_TYPE=DETAIL_ZW&id=${id}";
		parent.opener.window.location = "/insect/zwAction.do?ACT_TYPE=DETAIL&id=${bch_id}";
	}
function up(id, tb, lx) {
	var w = window.open("/insect/common/upload/upload.jsp?tb=" + tb + "&id=" 
			+ id + "&lx='bch'" , "upload", "height=380px,width=800px,scrollbars=yes,resizable=yes");
	w.focus();
}

</script>
<mt:successrefresh successMes="提交成功"/>