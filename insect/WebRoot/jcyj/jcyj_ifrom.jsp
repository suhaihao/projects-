<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<link href="/insect/assets/css/base.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<link href="/insect/assets/css/layout.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<link href="/insect/assets/css/com.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<link href="/insect/assets/plug/jquery-ui-1.10.4 2/css/custom/jquery-ui-1.10.4.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<script src="/insect/javascript/echarts.js"></script>
<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-ui-1.10.4.js" type="text/javascript"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>模型预测</title>
  </head>
  <body>
  <%
  String p=request.getParameter("p");
  TreeMap<String,String> mapy=(TreeMap<String,String>)request.getAttribute("mapy");
  TreeMap<String,String> maps=(TreeMap<String,String>)request.getAttribute("maps");
  String ycks="";
  for (String key:mapy.keySet()) {
	  ycks=key.substring(0, 4);
	  break;
  }
  if (p!=null&&"exp".equals(p)) {
		response.setHeader("Content-disposition","attachment; filename=bjyl_export.xls");
	}
    String tit="";
    tit="小麦百株蚜量";
    String sj="";
    for (String key:maps.keySet()) {
	  sj+="\""+key+"\",";
	}
    sj=sj.substring(0, sj.length()-1);
    
    String zdzxfa="";
    for (String val:maps.values()) {
    	zdzxfa+=val+",";
	}
    zdzxfa=zdzxfa.substring(0, zdzxfa.length()-1);
    String yj="";
    for (String val:mapy.values()) {
    	yj+=val+",";
	}
    yj=yj.substring(0, yj.length()-1);
    %>
     <div id="main" style="width:100%;height:400px;"></div>
   <div style="">
   <center>
   <!-- 
   <input class="btn" type="button" value="导出Excel" onclick="f_exp()"/>&nbsp;
    -->
   </center>
   </div>
   <!-- 显示数据 -->
   <div class="sh_sj" style="width: 100%;text-align: center;margin-top: 10px;">
   <table class="w">
   <tr>
   <th>NO.</th>
   <th>日期</th>
   <th>实际</th>
   <th>预测</th>
   </tr>
   <%
   int size=1;
   for (String key:maps.keySet()) {
	   %>
	   <tr>
	   <td>
	   <%=size%>
	   </td>
	   <td>
	   <%=key%>
	   </td>
	   <td>
	   <%=maps.get(key)%>
	   </td>
	   <td>
	   <%=mapy.get(ycks+key.substring(4, key.length()))%>
	   </td>
	   </tr>
	   <%
	   size++;
	}
   %>
   </table>
   </div>
    <script type="text/javascript">
 function f_exp(cxsjstr,cxsjend,dbsjstr,dbsjend,bblx,lssj,ssqyval,fxdx)
 {
   window.location="/insect/tjfx/mypcfx_qxt.jsp?&cxsjstr="+cxsjstr+"&cxsjend="+cxsjend+"&dbsjstr="+dbsjstr+"&dbsjend="+dbsjend+"&bblx="+bblx+"&lssj="+lssj+"&ssqyval="+ssqyval+"&fxdx="+fxdx+"&p=exp";
 }
var div = document.getElementById("main");
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(div);
// 指定图表的配置项和数据
option = {
	title : {
		text : '小麦百株蚜量（头）模型预测',
		top:-10,
		left:'45%'
	},
	tooltip : {
		trigger : 'axis',
	},
	legend : {
		data : ['实际','预测'],
		top:20
	},
	color:['#00ffff','#00ff00'],
	dataZoom : {
	    type: 'inside',
		show : true,
		realtime : true,
		start : 0,
		end : 100,
		borderColor:'#ddd',
	},
	xAxis : [ {
		type : 'category',
		name:'日期',
		nameLocation:'middle',
		nameGap:20,
		splitLine : {
			show : false
		},
		min:'dataMix',
		max:'dataMax',
		axisTick:{
		alignWithLabel:true
		},
		data : [<%=sj%>]
	} ],
	yAxis : [ {
		type : 'value',
		name : '<%=tit%>',
		nameLocation:'middle',
		nameGap:50,
		min:0,
		splitLine : {
			show : true
		},
		scale : false,
		boundaryGap : [ 0.01, 0.01 ],
	} ],
	series : [ {
		name : '实际',
		type : 'line',
		data : [<%=zdzxfa%>],
	        itemStyle: {
                normal: {
                    color: 'red',
                    color0: 'red',
                    borderColor: 'red',
                    borderColor0: 'red'
                    //opacity:0.2
                },
                emphasis:{
                    color: 'black',
                    color0: 'black',
                    borderColor: 'black',
                    borderColor0: 'black'
                }
            }
	},
	{
            name: '预测',
            type: 'line',
            data:[<%=yj%>],
            smooth: true,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 1,
                    color: '#00ffff',
                    type:'dashed'
                }
            }
    }
  ]
};

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
 </script>
  </body>
</html>
