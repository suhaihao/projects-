<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<link href="/insect/dist/themes/default/style.min.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script
	src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-ui-1.10.4.js"
	type="text/javascript"></script>
<script src="/insect/dist/jstree.min.js"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>区域选择</title>
		<style type="text/css">
.kzclass {
	margin-top: 20px;
}
</style>
	</head>
	<body>
	<%
	String xz=request.getParameter("xz"); 
	String tj=request.getParameter("tj"); 
	%>
		<dir class="kzclass" style="height: 1500px">
		<div id="tree"></div>
		</dir>
		<script type="text/javascript">
	$(function(){
		var ay_mssys="";
<%
String where="";
if(tj!=null)
{
where=" and jfdeptcode="+tj;
}
String sql="select JFDEPTCODE,JFDEPTNAME from DSYS05 t where JFDEPTPROP='1' and JFSTATE='1'"+where+" order by jfremark asc";
		String xian="";
		String xiang="";
		    //区
		    QueryConnection qc = new QueryConnection();
			Statement stmt = qc.con.createStatement();
			//县
			QueryConnection qcxz = new QueryConnection();
			//乡
			QueryConnection qxxz = new QueryConnection();
			boolean x=false;
			boolean xx=false;
			ResultSet rs = stmt.executeQuery(sql);
			String str="[";
			while(rs.next())
			{
			str+="{\"id\""+":"+"\""+rs.getString(1)+"\",\"text\":\""+rs.getString(2)+"\",children:[";
			if(xz!=null&&!xz.equals("1"))
			{
			xian="select jfregcode,jfregname from dsys06 where jfdsys05_code='"+rs.getString(1)+"' and jc='2' ";
			Statement stmtxz = qcxz.con.createStatement();
			ResultSet rsxz = stmtxz.executeQuery(xian);
			   //遍历县 
			   while(rsxz.next()){
			   str+="{\"id\":\""+rsxz.getString(1)+"\",\"text\":\""+rsxz.getString(2)+"\",children:[";
			   if(xz!=null&&xz.equals("3"))
			   {
			   xiang="select jfregcode,jfregname from dsys06 where jfdsys05_code='"+rs.getString(1)+"' and jc='3' and jfregcode like '"+rsxz.getString(1)+"%'";
			   Statement stmtxx = qxxz.con.createStatement();
			   ResultSet rsxx = stmtxx.executeQuery(xiang);
			   while(rsxx.next())
			   {
			   str+="{\"id\":\""+rsxx.getString(1)+"\",\"text\":\""+rsxx.getString(2)+"\"},";
			   }
			   stmtxx.close();
			   rsxx.close();
			   }
			   str+="]},";
			   }
			   stmtxz.close();
			   rsxz.close();
			   }
			str+="]},";
			}
			stmt.close();
			
			str+="]";
%>
ay_mssys=<%=str%>
		//加载树状数据
		$("#tree").jstree( {
			'core' : {
				'data' : ay_mssys
			},
			'types' : {
				"#" : {
					"icon" : "/insect/dist/themes/default/40px.png",
					"valid_children" : [ "root" ]
				},
				"root" : {
					"icon" : "/insect/dist/themes/default/40px.png"
				}
			},
			"plugins" : [ "wholerow", "changed", "types", "search" ]
		});
		//获取点击信息
		$('#tree').on("changed.jstree", function(e, data) {
		window.parent.returnValue=data.node.text+","+data.node.id;
		window.close();
			});
	});
</script>
	</body>
</html>
