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
    <title>不同地区百株虫量变化分析</title>
  </head>
  <body>
  <%
  String cxsjstr=request.getParameter("cxsjstr");
  String cxsjend=request.getParameter("cxsjend");
  String dbsjstr=request.getParameter("dbsjstr");
  String dbsjend=request.getParameter("dbsjend");
  String ssqyval=request.getParameter("ssqyval");
  String fxdx=request.getParameter("fxdx");
  String tit="";
  String zd="";
  if(fxdx.equals("1"))
  {
  tit="百株虫量";
  zd="Y09";
  }
  else
  {
  tit="有蚜株率";
  zd="Y05";
  }
  String p=request.getParameter("p");
  if (p!=null&&"exp".equals(p)) {
		response.setHeader("Content-disposition","attachment; filename=sjcx_export.xls");
	}
   %>
  <%
  //赋值X轴时间数据以及标准
  String sql="select to_char(rwsj,'mm-dd') from D849_HEAD where to_char(rwsj,'yyyy-mm-dd')>='"+cxsjstr+"' and to_char(rwsj,'yyyy-mm-dd')<='"+cxsjend+"' and to_char(rwsj,'yyyy-mm-dd') is not null group by to_char(rwsj, 'mm-dd') order by to_char(rwsj, 'mm-dd')";
  QueryConnection qc = new QueryConnection();
  Statement stmt = qc.con.createStatement();
  ResultSet rs = stmt.executeQuery(sql);
  String sj="";
  while (rs.next())
  {
  sj +="\""+rs.getString(1)+"\",";
  }
  if(!sj.equals(""))
  {
  sj=sj.substring(0,sj.length()-1);
  }
  %>
   <%
   //动态生成区县信息
   String sqsc="";
   Map<String,String> map=new HashMap();
   List<String> list=new ArrayList();
   if(ssqyval.equals(""))
   {
    sqsc="select JFDEPTCODE,JFDEPTNAME from DSYS05 t where JFDEPTPROP='1' and JFSTATE='1' and JFDEPTCODE not in ('21','20','27','60')";
   }
   else if(ssqyval.length()==2)
   {
   sqsc="select jfregcode,jfregname from dsys06 where jc='2' and jfdsys05_code ='"+ssqyval+"'";
   }
   else if(ssqyval.length()==4)
   {
    sqsc="select jfregcode,jfregname from dsys06 where jc='3' and jfregcode like '"+ssqyval+"%'";
   }
   else
   {
    sqsc="select jfregcode,jfregname from dsys06 where jfregcode='"+ssqyval+"'";
   }
   String are="";
   String sz="";
   String sjz="";
   //区县
  QueryConnection qcq = new QueryConnection();
  //数据
  QueryConnection qcsz = new QueryConnection();
  Statement stmtq = qcq.con.createStatement();
  ResultSet rsq = stmtq.executeQuery(sqsc);
  while (rsq.next())
  {
    sz="select sum(b."+zd+") from d849_body b,d849_head h where b.jfdyid=h.jfid and to_char(h.rwsj,'yyyy-mm-dd')>='"+cxsjstr+"' and to_char(h.rwsj,'yyyy-mm-dd')<='"+cxsjend+"'";
  if(rsq.getString(1).length()==2)
  {
  sz+=" and h.bmbm='"+rsq.getString(1)+"' ";
  }else if(rsq.getString(1).length()==4)
  {
  sz+=" and b.xz='"+rsq.getString(1)+"' ";
  }
  else 
  {
  sz+=" and b.y01='"+rsq.getString(1)+"' ";
  }
    sz+=" group by to_char(h.rwsj, 'mm-dd') order by to_char(h.rwsj, 'mm-dd')";
    Statement stmtsz = qcsz.con.createStatement();
    ResultSet rssz = stmtsz.executeQuery(sz);
    sjz="";
    while(rssz.next())
    {
     sjz+="\""+rssz.getString(1)+"\",";
    }
    //判断是否为空
    if(!sjz.equals(""))
    {
    sjz=sjz.substring(0,sjz.length()-1);
    }
    map.put(rsq.getString(2),sjz);
    list.add(rsq.getString(2));
    are+="\""+rsq.getString(2)+"\",";
  }
  if(!are.equals(""))
  {
  are=are.substring(0,are.length()-1);
  }
    %>
   <div style="width: 100%;margin-top: 10px;"><center><font size="5px" color="black"><b>不同地区<%=tit%>变化分析</b></font></center></div>
   <div id="main" style="width: 100%;height:400px;"></div>
   
   <div>
   <center>
   <%
   if(ssqyval.length()!=6)
   {
   %>
   <input class="btn" type="button" value="导出Excel" onclick="f_exp('<%=cxsjstr %>','<%=cxsjend %>','<%=dbsjstr %>','<%=dbsjend %>','<%=ssqyval %>','<%=fxdx %>')"/>&nbsp;
   <%
   }
   %>
   </center>
   </div>
   
   <div class="sh_sj" style="width: 100%;text-align: center;margin-top: 10px;">
   <table class="w">
   <tr>
   <th >NO.</th>
   <th >时间</th>
   <%
   for(String ls:list)
   {
   %>
   <th ><%=ls %></th>
   <%
   }
   %>
    </tr>
    <%
    String[] sjs=sj.split(",");
    String[] qu=null;
    String qxnr="";
    for(int i=0;i<sjs.length;i++)
    {
    %>
   <tr>
   <td><%=i+1 %></td>
   <%if(sjs[i].length()>=1)
	   {
		   %>
		   <td><%=sjs[i].substring(1, sjs[i].length()-1) %>&nbsp;</td>
		   <%
	   }else{
		   %>
		    <td><%=sjs[i]%>&nbsp;</td>
		   <%
	   }%>
   <%
    for(String ls:list)
   {
   qu=map.get(ls).split(",");
   if(i>=qu.length)
    {
     qxnr="";
    }
    else
    {
    if(!qu[i].equals(""))
    {
    	if(!qu[i].equals("\"null\""))
    	{
         qxnr=qu[i].substring(1, qu[i].length()-1);
    	}
    	else
    	{
    		qxnr="";
    	}
    }
    else
    {
    	qxnr=qu[i];
    }
    }
   %>
   <td><%=qxnr %></td>
   <%
   }
   %>
   </tr>
      <%
    }
     %>
   </table>
   </div>
    <script type="text/javascript">
 function f_exp(cxsjstr,cxsjend,dbsjstr,dbsjend,ssqyval,fxdx)
 {
   window.location="/insect/tjfx/mypcfx_dqt.jsp?cxsjstr="+cxsjstr+"&cxsjend="+cxsjend+"&dbsjstr="+dbsjstr+"&dbsjend="+dbsjend+"&ssqyval="+ssqyval+"&fxdx="+fxdx+"&p=exp";
 }    
    
var div = document.getElementById("main");
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(div);
// 指定图表的配置项和数据
option = {
	tooltip : {
		trigger : 'axis'
	},
	legend : {
		data : [<%=are%>]
	},
	dataZoom : {
	    type: 'inside',
		show : true,
		realtime : true,
		start : 0,
		end : 100
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
	series : [ 
	<%
	for(String ls:list)
	{
	%>
	{
            name: '<%=ls%>',
            type: 'line',
            data:[<%=map.get(ls)%>],
            smooth: true,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 1,
                }
            }
    },
    <%
	}
	%>
  ]
};

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
 </script>
  </body>
</html>
