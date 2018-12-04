<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>地图查询</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link href="/insect/assets/css/base.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	    <link href="/insect/assets/css/layout.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	    <link href="/insect/assets/css/com.css" type="text/css" rel="stylesheet" media="screen,projection"/>
		<link rel="stylesheet" type="text/css" href="http://218.247.232.13/EzServerClientV7.1/lib/EzServerClient.min.css">
		 <script reload="true" id="www" type="text/javascript">
		 function addsj(map)
		 {
		 //点的滑入画出
		var  markers=null;
		var  lasmakers=null;
		map.addMapEventListener(Ez.Event.MAP_MOUSEMOVE,function(evt){
		var marker = map.forEachFeatureAtPixel(evt.pixel,function(feature,layer){
			if (feature instanceof Point) {
				return feature;
			}
		});
		
		if (marker) {
		 map.getViewport().style.cursor="pointer";
		 var jd=marker.get("jd");
		 var wd=marker.get("wd");
		 var titl=marker.get("titl");
		 if(lasmakers==null)
		 {
		 lasmakers=marker;
		 }
		 else
		 {
		 lasmakers.closeInfoWindow();
		 lasmakers=marker;
		 }
		 markers=marker;
		 markers.openInfoWindow("<p style='width:200px; height:50px; border: 1px solid #000000;background: white'><font size='2'><B>"+titl+"</B></font></p>",new EzCoord(jd,wd));
		}
		else
		{
		map.getViewport().style.cursor="";
		if(!markers) return;
		markers.closeInfoWindow();
		}
	    });
	    //点击
	    map.addMapEventListener(Ez.Event.MAP_CLICK,function(evt){
		var marker = map.forEachFeatureAtPixel(evt.pixel,function(feature,layer){
			if (feature instanceof Point) {
				return feature;
			}
		});
		if (marker){
		//window.open("/zbzgis/yqda.do?ACT_TYPE=DETAIL&f=1&jfid=" + id, "", "");
		}
	    });
}
function hotpoin(map,zbs)
{
var render =new Array();
var jwds=zbs.split("-");
for ( var i = 0; i < jwds.length-1; i++) {
	var jwd=jwds[i].split(",");
	render[i]={'lng':jwd[0],'lat':jwd[1],'count':5};
}
//构建注册参数列表用于构建自定义的热力图
var config = {
    radius: 10,
    blur:10,
   xField: 'lng',
   yField: 'lat',
    valueField: 'count',
   gradient:['#02FEFE', '#01FE00', '#FEFE01', '#FEA902', '#FE0002']
};
//构建热力图对象
var heatmap = new EzLayerHeatMap(config);
//增加到地图上
map.addOverlay(heatmap);
//添加渲染数据
heatmap.addData(render);
map.zoomTo(8);
} 
function addpoin(map,jd,wd,jb,titl)
		 {
		 var yse="";
		 if(jb==1)
		 {
		 yse="#02fefe";
		 }
		 else
		 {
		 if(jb==2)
		 {
		 yse="#01fe00";
		 }
		 else
		 {
		 if(jb==3)
		 {
		 yse="#fefe01";
		 }
		 else
		 {
		 if(jb==4)
		 {
		 yse="#fea902";
		 }
		 else
		 {
		 if(jb==5)
		 {
		 yse="#fe0002";
		 }
		 else
		 {
		 yse="#000000";
		 }
		 }
		 }
		 }
		 }
			var poins = new Point(new EzCoord(jd,wd),{
            'radius' : 5,
		    'fillColor' : yse,
		    'strokeColor': yse,
		    'strokeWidth': 1
            });
		poins.set("jd",jd);
		poins.set("wd",wd);
		poins.set("titl",titl);
		map.addOverlay(poins);
		map.zoomTo(8);
		 }
		 </script>
	</head>
 	<body>
 	<%
 	String YJJB=request.getParameter("YJJB");
 	String JFID_HEAD=request.getParameter("JFID_HEAD");
 	String JFID_BODY=request.getParameter("JFID_BODY");
 	String TNAME=request.getParameter("TNAME");
 	TNAME=TNAME.substring(1,4);
 	String LRRQ=request.getParameter("LRRQ");
 	String YJNR=request.getParameter("YJNR");
    YJNR=new String(YJNR.getBytes("iso-8859-1"),"gbk");//这里写转换后的编码方式
 	 %>
	  	<table style="width:100%;height:100%">
	  		<tr>
	  			<td style="width:*; height:600px; border: 1px solid #FF0000;">
					<div id="map" style="width:100%; height:100%;border: 0px solid #FF0000;"></div>
					<script src="http://218.247.232.13/EzServerClientV7.1/lib/assign.polyfill.js"></script>
					<script src="http://218.247.232.13/EzServerClientV7.1/lib/EzMapAPI.js"></script>
                    <script src="http://218.247.232.13/EzServerClientV7.1/lib/EzServerClient.min.js"></script>
					<div style="position: absolute; left: 10; bottom: 10;">
						一&nbsp;&nbsp;&nbsp;&nbsp;级：<img src="/insect/images/blue.png"/><br/>
						二&nbsp;&nbsp;&nbsp;&nbsp;级：<img src="/insect/images/green.png"/><br/>
						三&nbsp;&nbsp;&nbsp;&nbsp;级：<img src="/insect/images/yellow.png"/><br/>
						四&nbsp;&nbsp;&nbsp;&nbsp;级：<img src="/insect/images/org.png"/><br/>
						五&nbsp;&nbsp;&nbsp;&nbsp;级：<img src="/insect/images/red.png"/>
					</div>
				</td>
		  	</tr>
		</table>
		<div>
		<font size="3" color="black"><center><%=YJNR %></center></font>
		</div>
		<table class="w" style="font-size: 13px;">
		<tr>
		<% 
		String sql_hed="select jfcolname,jfcolid,jfcolstyle,jfcolmeans from dbbzb_jg where jfdbbzb_id="+TNAME+" and jfcolvest=2";
		QueryConnection qc_h = new QueryConnection();
		Statement stmt_h = qc_h.con.createStatement();
		ResultSet rs_h = stmt_h.executeQuery(sql_hed);
		String zds="";
		while(rs_h.next())
		{
		if(rs_h.getString("jfcolstyle").equals("1"))
		{
		   zds+="to_char("+rs_h.getString("jfcolid")+",'yyyy-mm-dd')"+"~";
		}
		else
		{
		   if(rs_h.getString("jfcolmeans")!=null)
		   {
		   zds+="f_get_mc('"+rs_h.getString("jfcolmeans")+"',"+rs_h.getString("jfcolid")+") "+rs_h.getString("jfcolid")+"~";
		   }
		   else
		   {
		   zds+=rs_h.getString("jfcolid")+"~";
		   }
		}
		%>
		<th><%=rs_h.getString("jfcolname") %></th>
		<%
		}
		   zds=zds.substring(0,zds.length()-1);
		%>
		</tr>
		<%
		String [] dbzds=zds.split("~");
		zds=zds.replaceAll("~",",");
		String sql_bd="select jfid,"+zds+" from D"+TNAME+"_body where jfdyid="+JFID_HEAD;
		QueryConnection qc_bd = new QueryConnection();
		Statement stmt_bd = qc_bd.con.createStatement();
		ResultSet rs_bd = stmt_bd.executeQuery(sql_bd);
		while(rs_bd.next())
		{
		%>
		<tr>
		<%
		for(int i=1;i<=dbzds.length;i++)
		{
		if(rs_bd.getString(1).equals(JFID_BODY))
		{
		if(rs_bd.getString(i+1)==null)
		{
		   %>
		<td><font color="red"></font></td>
		   <%
		}
		else
		{
		   %>
		<td><font color="red"><%=rs_bd.getString(i+1)%></font></td>
		   <%
		}
		
		}
		else
		{
		if(rs_bd.getString(i+1)==null)
		{
		    %>
		<td></td>
		   <%
		}
		else
		{
		   %>
		<td><%=rs_bd.getString(i+1)%></td>
		   <%
		}
		}
		}
		 %>
		</tr>
		<%
		}
		 %>
		</table>
		<div>
		<%
		String sql_bt="select F_GET_MC('DEPT',bmbm) bmbm,to_char(lrrq,'yyyy-mm-dd')lrrq,decode(jbr,null,' ',jbr) jbr,f_get_mc('RYBM',lrry)lrry from D"+TNAME+"_Head where jfid="+JFID_HEAD;
		QueryConnection qc_bt = new QueryConnection();
		Statement stmt_bt = qc_bt.con.createStatement();
		ResultSet rs_bt = stmt_bt.executeQuery(sql_bt);
		while(rs_bt.next())
		{
		%>
		<center>部门地区：<%=rs_bt.getString(1) %>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;录入日期：<%=rs_bt.getString(2) %>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
		                      经办人：<%=rs_bt.getString(3) %>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;录入人员：<%=rs_bt.getString(4) %></center>
		<%
		}
		 %>
		</div>
        </div>
	</body>
	<script>
window.onload=function(){
	  	var map = new EzMap("map");
		map.showMapControl();
		addsj(map);
		<%
		String sql="SELECT S.JD,S.WD from D"+TNAME+"_BODY b,DSYS06 s where b.JFID="+JFID_BODY+" and b.Y01=s.JFREGCODE";
		QueryConnection qc = new QueryConnection();
		Statement stmt = qc.con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		String jd="";
		String wd="";
		while(rs.next())
		{
		jd=rs.getString("JD");
		wd=rs.getString("WD");
		%>
		addpoin(map,'<%=jd%>','<%=wd%>','<%=YJJB%>','<%=YJNR%>');
		<%
		}
		%>
}
	</script>
</html>
