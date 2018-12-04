<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>地图查询</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
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
		 var bzl=marker.get("bzl");
		 var sj=marker.get("sj");
		 var mc=marker.get("mc");
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
		 markers.openInfoWindow("<p style='width:150px; height:50px; border: 1px solid #000000;background: white'><font size='2'><B>"+titl+"</B></font></br><font size='2'><B>时间："+sj+"</B></font></br><font size='2'><B>"+mc+"："+bzl+"</B></font></p>",new EzCoord(jd,wd));
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
		var id=marker.get("id");
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
//设置级别
map.zoomTo(8);
} 
function addpoin(id,map,jd,wd,jb,titl,bzl,sj,mc)
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
		poins.set("id",id);
		poins.set("jd",jd);
		poins.set("wd",wd);
		poins.set("titl",titl);
		poins.set("bzl",bzl);
		poins.set("sj",sj);
		if(mc=="Y09")
		{
		poins.set("mc","百株虫量");
		}
		else if(mc=="Y13")
		{
		poins.set("mc","病株率");
		}
		else if(mc=="Y16")
		{
		poins.set("mc","病果率");
		}
		else if(mc=="Y12")
		{
		poins.set("mc","虫株率");
		}
		else if(mc=="Y14")
		{
		poins.set("mc","百株虫量");
		}
		map.addOverlay(poins);
		map.zoomTo(8);
		 }
		 </script>
	</head>
 	<body>
 	<%
 	String fxfs=request.getParameter("fxfs");
 	String bchVal=request.getParameter("bchVal");
 	String fxzbVal=request.getParameter("fxzbVal");
 	String rwsjVal=request.getParameter("rwsjVal");
 	String ndVal=request.getParameter("ndVal");
 	rwsjVal=ndVal+"-"+rwsjVal;
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
	</body>
	<script>
window.onload=function(){
	  	var map = new EzMap("map");
		map.showMapControl();
		addsj(map);
		<%
	try {
		if(fxfs.equals("1"))
		{
		 String sql="select "+bchVal+"_body."+fxzbVal+", "+bchVal+"_head.rwsj, "+bchVal+"_body.y01,dsys06.jfregname,dsys06.jd,dsys06.wd "+
                     " from "+bchVal+"_head,"+bchVal+"_body,dsys06 "+
                     " where "+bchVal+"_head.jfid = "+bchVal+"_body.jfdyid "+
                     " and "+bchVal+"_head.rwsj = to_date('"+rwsjVal+"', 'yyyy-mm-dd') "+
                     " and dsys06.jfregcode="+bchVal+"_body.y01 "+
                     " group by "+bchVal+"_body."+fxzbVal+", "+bchVal+"_head.rwsj, "+bchVal+"_body.y01,dsys06.jd,dsys06.wd,dsys06.jfregname";
		 QueryConnection qc = new QueryConnection();
         Statement stmt =  qc.con.createStatement();
         ResultSet rs = stmt.executeQuery(sql);
         String jd="";
         String wd="";
         String jb="";
         String xz="";
         while (rs.next()) {
         jd=rs.getString(5);
         wd=rs.getString(6);
         String bzcl=rs.getString(1);
         if(bzcl==null)
         {
        	 bzcl="0";
         }
         if(fxzbVal.equals("Y09"))
         {
         double bz=Double.parseDouble(bzcl);
         if(bz<=500)
         {
         jb="1";
         }
         else if(bz>500 && bz<=1500)
         {
         jb="2";
         }
         else if(bz>1500&&bz<=2500)
         {
          jb="3";
         }
         else if(bz>2500 && bz<=3500)
         {
          jb="4";
         }
         else if(bz>3500)
         {
          jb="5";
         }
         }
         else if(fxzbVal.equals("Y13"))
         {
         double bz=Double.parseDouble(bzcl);
         if(bz<=10)
         {
         jb="1";
         }
         else if(bz>10 && bz<=20)
         {
         jb="2";
         }
         else if(bz>20&&bz<=50)
         {
          jb="3";
         }
         else if(bz>50 && bz<=70)
         {
          jb="4";
         }
         else if(bz>70)
         {
          jb="5";
         }
         }
         else if(fxzbVal.equals("Y16"))
         {
        	
          double bz=Double.parseDouble(bzcl);
         if(bz<=1)
         {
         jb="1";
         }
         else if(bz>1 && bz<=5)
         {
         jb="2";
         }
         else if(bz>5&&bz<=10)
         {
          jb="3";
         }
         else if(bz>10 && bz<=20)
         {
          jb="4";
         }
         else if(bz>20)
         {
          jb="5";
         }
         }
         else if(fxzbVal.equals("Y12"))
         {
         double bz=Double.parseDouble(bzcl);
         if(bz<=10)
         {
         jb="1";
         }
         else if(bz>10 && bz<=30)
         {
         jb="2";
         }
         else if(bz>30&&bz<=50)
         {
          jb="3";
         }
         else if(bz>50 && bz<=90)
         {
          jb="4";
         }
         else if(bz>90)
         {
          jb="5";
         }
         }
         else if(fxzbVal.equals("Y14"))
         {
             double bz=Double.parseDouble(bzcl);
         if(bz<=100)
         {
         jb="1";
         }
         else if(bz>100 && bz<=300)
         {
         jb="2";
         }
         else if(bz>300&&bz<=500)
         {
          jb="3";
         }
         else if(bz>500 && bz<=1000)
         {
          jb="4";
         }
         else if(bz>1000)
         {
          jb="5";
         }
         }
         xz=rs.getString(4);
           if(jd!=null&&wd!=null)
           {
		%>
		 addpoin('1',map,<%=jd%>,<%=wd%>,<%=jb%>,'<%=xz%>','<%=bzcl%>','<%=rwsjVal%>','<%=fxzbVal%>');
		<%
           }
		 }
		}
		else
		{
		String sql="select "+bchVal+"_body."+fxzbVal+", "+bchVal+"_head.rwsj, "+bchVal+"_body.y01,dsys06.jfregname,dsys06.jd,dsys06.wd "+
                     " from "+bchVal+"_head,"+bchVal+"_body,dsys06 "+
                     " where "+bchVal+"_head.jfid = "+bchVal+"_body.jfdyid "+
                     " and rwsj = to_date('"+rwsjVal+"', 'yyyy-mm-dd') "+
                     " and dsys06.jfregcode="+bchVal+"_body.y01 "+
                     " group by "+bchVal+"_body."+fxzbVal+", "+bchVal+"_head.rwsj, "+bchVal+"_body.y01,dsys06.jd,dsys06.wd,dsys06.jfregname";
         QueryConnection qc = new QueryConnection();
         Statement stmt =  qc.con.createStatement();
         ResultSet rs = stmt.executeQuery(sql);
         String jd="";
         String wd="";
         String zbs="";
         while (rs.next()) {
         jd=rs.getString(5);
         wd=rs.getString(6);
         if(jd!=null&&wd!=null)
         {
          zbs+=jd+","+wd+"-";
		 }
         }
		%>
		hotpoin(map,'<%=zbs%>');
		<%
		}
	} catch(SQLException e) {
    	e.printStackTrace();
    }
		%>
		
}
	</script>
</html>
