<%@page language="java" contentType="text/html;charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
<%
	String fxfs=request.getParameter("fxfs");
 	String bchVal=request.getParameter("bchVal");
 	String fxzbVal=request.getParameter("fxzbVal");
 	String rwsjVal1=request.getParameter("rwsjVal1");
 	String rwsjVal2=request.getParameter("rwsjVal2");
 	String ndVal1=request.getParameter("ndVal1");
 	String ndVal2=request.getParameter("ndVal2");
 %>
<div id="content">
	<!-- navigation -->
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
                    <div class="mod-bd" style="float: left; width: 50%;text-align: center;">
					    年度一
					</div>
					<div class="mod-bd" style="float: left; width: 50%;text-align: center;">
					    年度二
					</div>
					<div class="mod-bd" style="float: left; width: 50%;height: 900px;">
					   <iframe id="ifr_b" name="ifr_b" src="/insect/dzdt/dbfx/dbfx_map.jsp?bchVal=<%=bchVal%>&fxzbVal=<%=fxzbVal%>&rwsjVal1=<%=rwsjVal1%>&ndVal1=<%=ndVal1%>&fxfs=<%=fxfs%>" width="100%" height="100%" frameborder="0"></iframe>
					</div>
					<div class="mod-bd" style="float: left;width: 50%;height: 900px;">
					   <iframe id="ifr_e" name="ifr_e" src="/insect/dzdt/dbfx/dbfx_map.jsp?bchVal=<%=bchVal%>&fxzbVal=<%=fxzbVal%>&rwsjVal2=<%=rwsjVal2%>&ndVal2=<%=ndVal2%>&fxfs=<%=fxfs%>"  width="100%" height="100%" frameborder="0"></iframe>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
</body>
</html>
