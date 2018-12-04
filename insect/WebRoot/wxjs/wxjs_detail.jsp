<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java"   session="true"   import="com.jf.bchyj.bean.User" %>
<%-- import header --%>
<% 
String zt = request.getParameter("zt"); 
String jfid=(String)request.getAttribute("id");
if(jfid==null)
{
 jfid=(String)request.getAttribute("ID");
}
User user=(com.jf.bchyj.bean.User)session.getAttribute("user");
String bmbm= user.getBmbm();
 %>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="文献检索" />
</jsp:include>
	<%
	String id=(String)request.getAttribute("ID");
	ExecuteConnection ec = new ExecuteConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String zw="";
	try {
		String sql = "select zw from dwxjs_zw where DYID='"+id+"' order by to_number (jfid) ";
		pstmt = ec.con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			zw+=rs.getString(1);
		}
		rs.close();
		pstmt.close();
		ec.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	zw=zw.replaceAll("!", "'");
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
<mt:mastersheet>
<mt:uinput id="dqbfb:jfid:str:P" name="dqbfb:jfid:str:P" type="hidden"/>
					<%
						if("1".equals(zt)) {
					%>
<tr>
  <td align="right" ><div class="cell-wrap">标题：</div></td>
  <td  width="400px"align="left">
        <mt:ulabel name="DWXJS:bt:str:s"/>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">来源:</div></td>
      <td width="400px"align="left">
		<mt:ulabel name="DWXJS:ly:str:s"/>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">发布日期:</div></td>
      <td width="400px"align="left">
		<mt:ulabel name="DWXJS:fbrq:str:s"/>
      </td>
    </tr>
    <tr>
      <td align="center" colspan="2">
      <%=zw %>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">附件:</div></td>
      <td width="400px"align="left">
								<table class="J_xxfj">
								<mt:mastersheet detailindex="1">
									<tr><td>
										<a onclick="window.open('/insect/file_down.jsp?path=<mt:ulabel name="d:lj:str:s"/>&mc=encodeURI(<mt:ulabel name="d:mc:str:s"/>)')" href="javascript:void(0)"><mt:ulabel name="d:mc:str:s"/></a>
									</td></tr>
								</mt:mastersheet>
								</table>
      </td>
    </tr>
<tr>
    <td colspan=4 align=center>
        <input name = "jfid" type="hidden" value="<%=jfid %>">
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" 关 闭 ">
	</td>
</tr>
					<%
						} else {
					%>
<tr>
  <td align="right" ><div class="cell-wrap">标题：</div></td>
  <td  width="400px"align="left">
       <mt:uinput id="dwxjs:bt:str:s" name="dwxjs:bt:str:s" />
  </td>
</tr>
<tr>
  <td align="right" ><div class="cell-wrap">病虫害：</div></td>
  <td  width="400px"align="left">
        <span style="width:180px;border:1px solid #797a98">
           <mt:uselect name="dwxjs:bch:str:s" datamember="dbch" chname="病虫害" nullable="no" select="JFINSECTCODE,JFINSECTNAME" where=" 1=1 " other="style='width:135px;margin:-2px'">
           </mt:uselect>
        </span>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">来源:</div></td>
      <td width="400px"align="left">
		<mt:uinput id="dwxjs:ly:str:s" name="dwxjs:ly:str:s" />
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">作者:</div></td>
      <td width="400px"align="left">
		<mt:uinput id="dwxjs:zz:str:s" name="dwxjs:zz:str:s" />
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">正文:</div></td>
      <td width="400px"align="left">       
        <mt:utextarea name="dwxjs:zw:str:s" other="cols='' rows=''"></mt:utextarea>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">附件:</div></td>
      <td width="400px"align="left">       
								<a href="javascript:void(0);" onclick="up('${ID}','dwxjs_fj');return false;" class="choose" title="选择附件">选择</a>
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
										<a onclick="window.open('<mt:ulabel name="d:lj:str:s"/>')" href="javascript:void(0)"><mt:ulabel name="d:mc:str:s"/></a>
										<a class="del" title="删除" onclick="return confirm('确实要删除吗?');" href="/insect/wxjs_Action.do?ACT_TYPE=DEL&idd=${ID}&path=<mt:ulabel name="d:lj:str:s"/>&id=<mt:ulabel name="d:jfid:str:s"/>">X</a>
									</td></tr>
								</mt:mastersheet>
								</table>
      </td>
    </tr>
<tr>
    <td colspan=4 class="tc p10">
    <input name = "bmbm" type="hidden" value="<%=bmbm %>">
    <input name = "jfid" type="hidden" value="<%=jfid %>">
        <input name="U_find1" type="button"  style='cursor:hand' class='btn' onclick='return f_query(0)'  id="find" value=" 保 存 "/>
        <input name="U_find1" type="button"  style='cursor:hand' class='btn' onclick='return f_query(1)'  id="find" value=" 提交 "/>
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" 关 闭 ">
	</td>
</tr>
					<%
						}
					%>
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
function f_query(zt){
       document.f1.action = "/insect/wxjs_Action.do?ACT_TYPE=UPDATE&zt="+zt;
       document.f1.method = "post";
       document.f1.submit();
}
	function f_refreshOpener() {
		parent.window.location = "/insect/wxjs_Action.do?ACT_TYPE=DETAIL&id=${ID}&zt=${ZT}";
		parent.opener.window.location="/insect/wxjs_Action.do?ACT_TYPE=QUERY";
	}
function up(id, tb, lx) {
	var w = window.open("/insect/common/upload/upload.jsp?tb=" + tb + "&id=" 
			+ id + "&lx=''" , "upload", "height=380px,width=800px,scrollbars=yes,resizable=yes");
	w.focus();
}
</script>
<mt:successrefresh successMes="提交成功"/>