<%@page language="java" contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%@page language="java"   session="true"   import="com.jf.bchyj.bean.User" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
	<jsp:param name="title" value="���׼���" />
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
	
	<%
	String id=(String)request.getAttribute("ID");
	ExecuteConnection ec = new ExecuteConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String zw="";
	try {
		String sql = "select zw from DWXJS_ZW where DYID='"+id+"' order by to_number (jfid) ";
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
	
	<!-- no menu page -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">���׼���</h3>
					</div>
					<div class="mod-bd">
					<form name="f1" method="post" action="">
						<table class="w">
							<colgroup>
								<col style="width:45%">
								<col>
							</colgroup>
<mt:mastersheet>
<mt:uinput id="dqbfb:jfid:str:P" name="dqbfb:jfid:str:P" type="hidden"/>
					<%
						if("1".equals(zt)) {
					%>
<tr>
  <td align="right" ><div class="cell-wrap">���⣺</div></td>
  <td  width="400px"align="left">
        <mt:ulabel name="DWXJS:bt:str:s"/>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">��Դ:</div></td>
      <td width="400px"align="left">
		<mt:ulabel name="DWXJS:ly:str:s"/>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">��������:</div></td>
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
      <td align="right"><div class="cell-wrap">����:</div></td>
      <td width="400px"align="left">
								<table class="J_xxfj">
								<mt:mastersheet detailindex="1">
									<tr><td>
										<a onclick="window.open('/insect/file_down.jsp?path=<mt:ulabel name="d:lj:str:s"/>&mc=encodeURI(<mt:ulabel name="d:wjm:str:s"/>)')" href="javascript:void(0)"><mt:ulabel name="d:mc:str:s"/></a>
									</td></tr>
								</mt:mastersheet>
								</table>
      </td>
    </tr>
<tr>
    <td colspan=4 align=center>
        <input name = "jfid" type="hidden" value="<%=jfid %>">
        <input name="U_find1" type="button"  style='cursor:hand' class='btn' onclick='f_query(2)'  id="find" value=" ȡ������ "/>
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" �� �� ">
	</td>
</tr>
					<%
						} else {
					%>
<tr>
  <td align="right" ><div class="cell-wrap">���⣺</div></td>
  <td  width="400px"align="left">
       <mt:uinput id="dwxjs:bt:str:s" name="dwxjs:bt:str:s" other="style='width:30%'"/>
  </td>
</tr>
    <tr>
      <td align="right"><div class="cell-wrap">��Դ:</div></td>
      <td width="400px"align="left">
		<mt:uinput id="dwxjs:ly:str:s" name="dwxjs:ly:str:s" other="style='width:30%'"/>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">����:</div></td>
      <td width="400px"align="left">
		<mt:uinput id="dwxjs:zz:str:s" name="dwxjs:zz:str:s" other="style='width:30%'"/>
      </td>
    </tr>
    <tr>
      <td align="center" colspan="2">       
         <textarea id="summernote" name="zw"><%=zw %></textarea>
         <script>
         $(document).ready(function() {
         $('#summernote').summernote({
           height: 300,
           width:800
           // ����༭��߶�
           });
         });
         </script>
      </td>
    </tr>
    <tr>
      <td align="right"><div class="cell-wrap">����:</div></td>
      <td width="400px"align="left">       
								<a href="javascript:void(0);" onclick="up('${ID}','dwxjs_fj');return false;" class="choose" title="ѡ�񸽼�">ѡ��</a>
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
										<a onclick="window.open('/insect/file_down.jsp?path=<mt:ulabel name="d:lj:str:s"/>&mc=encodeURI(<mt:ulabel name="d:mc:str:s"/>)')" href="javascript:void(0)"><mt:ulabel name="d:mc:str:s"/></a>
										<a class="del" title="ɾ��" onclick="return confirm('ȷʵҪɾ����?');" href="/insect/wxjs_Action.do?ACT_TYPE=DEL&idd=${ID}&path=<mt:ulabel name="d:lj:str:s"/>&id=<mt:ulabel name="d:jfid:str:s"/>">X</a>
									</td></tr>
								</mt:mastersheet>
								</table>
      </td>
    </tr>
<tr>
    <td colspan=4 class="tc p10">
    <input name = "bmbm" type="hidden" value="<%=bmbm %>">
    <input name = "jfid" type="hidden" value="<%=jfid %>">
        <input name="U_find1" type="button"  style='cursor:hand' class='btn' onclick='return f_query(0)'  id="find" value=" �� �� "/>
        <input name="U_find1" type="button"  style='cursor:hand' class='btn' onclick='return f_query(1)'  id="find" value=" �ύ "/>
      <input name="confirm" type="button" class="btn" style="cursor:hand" onclick="javascript:window.close()" id="confirm" value=" �� �� ">
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
	if(zt=='3')
	{
		if(confirm("��ȷ��ɾ����"))
		{
       document.f1.action = "/insect/wxjs_Action.do?ACT_TYPE=DELZJ&zt="+zt;
       document.f1.method = "post";
       document.f1.submit();
		}
	}else{
       document.f1.action = "/insect/wxjs_Action.do?ACT_TYPE=UPDATE&zt="+zt;
       document.f1.method = "post";
       document.f1.submit();
	}
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
<mt:successrefresh successMes="�ύ�ɹ�"/>