<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<link href="/insect/assets/css/com.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<head>
		<title>区域选择</title>
		<style type="text/css">
.kzclass {
	margin-top: 20px;
}
</style>
	</head>
	<script type="text/javascript">
		function qx(obj)
		{
		document.getElementById("xz").value=obj.value;
		if(obj.value==3)
		{
		    document.getElementById("sel").style.display="";
		}
		else
		{
		    document.getElementById("sel").style.display="none";
		}
        }
        function sjfxt()
        {	
            var obj=document.getElementById("xz");
            if(document.getElementById("sel").style.display=="none")
            {
    	    document.getElementById("result").src="/insect/tjfx/Mytree_ifrom.jsp?xz="+obj.value;
            }
            else
            {
            var selval=document.getElementById("sel").options[document.getElementById("sel").selectedIndex].value
    		document.getElementById("result").src="/insect/tjfx/Mytree_ifrom.jsp?xz="+obj.value+"&tj="+selval;
            }	    
        }
</script>	
<%
String sqlj="select JFDEPTCODE,JFDEPTNAME from DSYS05 t where JFDEPTPROP='1' and JFSTATE='1' order by jfremark asc";
    //区
    QueryConnection qcj = new QueryConnection();
	Statement stmtj = qcj.con.createStatement();
	ResultSet rsj = stmtj.executeQuery(sqlj);
	List<String> lisNA=new ArrayList();
	List<String> lisVL=new ArrayList();
	String strj="[";
	while(rsj.next())
	{
	   strj+="{\"id\""+":"+"\""+rsj.getString(1)+"\",\"text\":\""+rsj.getString(2)+"\"},";
	   lisVL.add(rsj.getString(1));
	   lisNA.add(rsj.getString(2));
	}
	stmtj.close();
	rsj.close();
	strj+="]";
%>

	<body>
		<dir class="kzclass" style="height: 1500px">
			<h2>
				区域选择
			</h2>
			<input name="xz" type="radio" value="1" checked="checked" onclick="qx(this)">区县</input>
			<input name="xz" type="radio" value="2" onclick="qx(this)">乡镇</input>
			<input name="xz" type="radio" value="3" onclick="qx(this)">村</input>
			<input id="xz" type="hidden" value="1"/>
			&nbsp;&nbsp;
		    <select id="sel" style="display: none;">
			<%
			for(int i=0;i<lisVL.size();i++)
			{
			  
			  %>
			  <option value="<%=lisVL.get(i)%>"><%=lisNA.get(i)%></option>
			  <%
			}
			 %>
			</select>
			&nbsp;&nbsp;
			<input class="btn" type="button" value="确定" onclick="sjfxt()"/>
			<iframe src="/insect/tjfx/Mytree_ifrom.jsp?sj=<%=strj%>" id="result" name="result" style="width:100%;border:0px; " scrolling="no" onload="iFrameHeight()"></iframe>
				<script type="text/javascript">
					function iFrameHeight() {
						var ifm= document.getElementById("result");
						var subWeb = document.frames ? document.frames["result"].document : ifm.contentDocument;
						if(ifm != null && subWeb != null) {
							ifm.height = subWeb.body.scrollHeight;
						}
					}
			</script>
		</dir>
	</body>
</html>
