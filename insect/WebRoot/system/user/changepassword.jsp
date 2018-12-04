<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="密码修改" />
</jsp:include>
<%@page language="java"   session="true"   import="com.jf.bchyj.bean.User" %>
<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">密码修改</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action=""  target="result">
							<table class="w">
								<tr>
									<td class="tr" align="right" width="50%">
										<div class="cell-wrap">用户名称:</div>
									</td>
									<td style="width:100px" align="left">
										<% User user=(com.jf.bchyj.bean.User)session.getAttribute("user");
            out.print(user.getUsername()); %>
									</td>
								</tr>
								<tr>
									<td class="tr" style="width:80px" align="right">
										<div class="cell-wrap">新密码:</div>
									</td>
									<td style="width:100px" align="left">
										<input name="kl" type="password" tabindex="text" maxlength="10">
									</td>
								</tr>
								<tr>
									<td class="tr" style="width:80px" align="right">
										<div class="cell-wrap">核实密码:</div>
									</td>
									<td style="width:90px" align="left">
       								 <input name="hskl" type="password"  maxlength="10">
									</td>
								</tr>
							<tr>
								<td class="tc p10" colspan="2">
										<input type="button" value="提 交" class="btn"  onclick='return f_submit()' />&nbsp;&nbsp;
								</td>
							</tr>
							</table>
						</form>
					</div>
				</div>
        	</div>
    	</div>
		<div class="layout-sub">
			<div class="layout-wrap">
				<%@include file="/menu.jsp"%>
			</div>
		</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
<script language="javascript">
   function f_submit(){
       if (f1.kl.value ==""){
           alert("请录入口令!")
           f1.kl.focus()
           return false
	   }
	   if (f1.kl.value !=f1.hskl.value){
		   alert("请确认核实口令与口令录入是否一致!")
		   return false
	   }
       document.f1.action = "/insect/loginerPasswordModify.do?ACT_TYPE=QUERY";
       document.f1.method = "post";
       document.f1.submit();
   }
   function f_cancel(){
      window.close();
  }
</script>
<mt:messagedialog/>