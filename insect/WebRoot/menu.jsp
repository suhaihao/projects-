<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.util.Map"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt" %>
<%
	Object menuid = (String) session.getAttribute("C"); // 菜单id
	Object obj = session.getAttribute("BREADCRUMB"); // 导航信息Map类型

	Map<String, String> map = null;
	String active = "0"; // 激活当前菜单
	if (null != obj) {
		map = (Map<String, String>) obj;
	}
	if (null != map && null != menuid) {
		active = map.get("-" + menuid.toString().substring(0, 2));
	}
%>
<script type="text/javascript">
    $(function() {
        $("#accordion").accordion({
                heightStyle: "content",
                collapsible: true,
                active: <%=active%>,
                animate: {}
         }
        );
    });
    /*$(function() {
        $( "input[type=submit], button" )
            .button()
            .click(function( event ) {
                event.preventDefault();
            });
    });*/
</script>

<div class="mod menu">
	<div class="mod-hd">
		<h3 class="mod-tit">
		</h3>
	</div>
	<div class="mod-bd">
		<!-- Accordion -->
		<div id="accordion">
			<mt:menuview />
		</div>
	</div>
</div>
