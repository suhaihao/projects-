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
    <title>��ʭ����</title>
  </head>
  <body>
  <%
  String cxsjstr=request.getParameter("cxsjstr");
  String cxsjend=request.getParameter("cxsjend");
  String dbsjstr=request.getParameter("dbsjstr");
  String dbsjend=request.getParameter("dbsjend");
  String bblx=request.getParameter("bblx");
  String lssj=request.getParameter("lssj");
  String ssqyval=request.getParameter("ssqyval");
  String fxdx=request.getParameter("fxdx");
  String p=request.getParameter("p");
  if (p!=null&&"exp".equals(p)) {
		response.setHeader("Content-disposition","attachment; filename=sjcx_export.xls");
	}
  String tit="";
  String zd="";
  if(fxdx.equals("1"))
  {
  tit="������";
  zd="Y12";
  }
  else
  {
  tit="�������";
  zd="Y14";
  }
   %>
  <%
  //��ֵX��ʱ�������Լ���׼
  String sql="select to_char(rwsj,'mm-dd') from D898_HEAD where to_char(rwsj,'yyyy-mm-dd')>='"+cxsjstr+"' and to_char(rwsj,'yyyy-mm-dd')<='"+cxsjend+"' and to_char(rwsj,'yyyy-mm-dd') is not null group by to_char(rwsj, 'mm-dd') order by to_char(rwsj, 'mm-dd')";
  QueryConnection qc = new QueryConnection();
  Statement stmt = qc.con.createStatement();
  ResultSet rs = stmt.executeQuery(sql);
  String sj="";
  String yj="";
  String ej="";
  String saj="";
  String sij="";
  while (rs.next())
  {
  sj +="\""+rs.getString(1)+"\",";
  if(fxdx.equals("1"))
  {
  yj+="10,";
  ej+="30,";
  saj+="50,";
  sij+="90,";
  }
  else
  {
  yj+="100,";
  ej+="300,";
  saj+="500,";
  sij+="1000,";
  }
  }
  if(!sj.equals(""))
  {
  sj=sj.substring(0,sj.length()-1);
  }
  if(!yj.equals(""))
  {
  yj=yj.substring(0,yj.length()-1);
  }
  if(!ej.equals(""))
  {
  ej=ej.substring(0,ej.length()-1);
  }
  if(!saj.equals(""))
  {
  saj=saj.substring(0,saj.length()-1);
  }
  if(!sij.equals(""))
  {
  sij=sij.substring(0,sij.length()-1);
  }
   %>
   <%
   //ʵ�ʷ���������
  String sjsj="select round((nvl((sum(b."+zd+")/count(*)),0)),2) from d898_body b,d898_head h where b.jfdyid=h.jfid and to_char(h.rwsj,'yyyy-mm-dd')>='"+cxsjstr+"' and to_char(h.rwsj,'yyyy-mm-dd')<='"+cxsjend+"'";
  if(ssqyval!=null&&!ssqyval.equals(""))
  {
  if(ssqyval.length()==2)
  {
  sjsj+=" and h.bmbm='"+ssqyval+"' ";
  }else if(ssqyval.length()==4)
  {
  sjsj+=" and b.xz='"+ssqyval+"' ";
  }
  else 
  {
  sjsj+=" and b.y01='"+ssqyval+"' ";
  }
  }
  if(bblx!=null&&!bblx.equals(""))
  {
  sjsj+=" and h.bblx='"+bblx+"' ";
  }
  sjsj+=" group by to_char(h.rwsj, 'mm-dd') order by to_char(h.rwsj, 'mm-dd')";
  QueryConnection qcsj = new QueryConnection();
  Statement stmtsj = qcsj.con.createStatement();
  ResultSet rssj = stmtsj.executeQuery(sjsj);
  String sjfa="";
  while(rssj.next())
  {
  sjfa+=rssj.getString(1)+",";
  }
  if(!sjfa.equals(""))
  {
  sjfa=sjfa.substring(0,sjfa.length()-1);
  }
   %>
   <%
   //��ʷ����
   String lsfs="";
   if(lssj.equals(""))
   {
    lsfs="select round((nvl((sum(b."+zd+")/count(*)),0)),2),to_char(h.rwsj, 'mm-dd') from d898_body b,d898_head h where b.jfdyid=h.jfid and to_char(h.rwsj,'yyyy-mm-dd')>='"+dbsjstr+"' and to_char(h.rwsj,'yyyy-mm-dd')<='"+dbsjend+"'";
   }
   else
   {
	int nd=Integer.parseInt(cxsjstr.substring(0, 4))-Integer.parseInt(lssj);
	dbsjend=cxsjend;
	dbsjstr=nd+cxsjstr.substring(4,cxsjstr.length());
    lsfs="select round((nvl((sum(b."+zd+")/count(*)),0)),2),to_char(h.rwsj, 'mm-dd') from d898_body b,d898_head h where b.jfdyid=h.jfid and to_char(h.rwsj,'yyyy-mm-dd')>='"+dbsjstr+"' and to_char(h.rwsj,'yyyy-mm-dd')<='"+dbsjend+"' and to_char(h.rwsj,'mm-dd')>='"+cxsjstr.substring(4,cxsjstr.length())+"' and to_char(h.rwsj,'mm-dd')<='"+cxsjend.substring(4,cxsjend.length())+"'";
   }
  if(ssqyval!=null&&!ssqyval.equals(""))
  {
    if(ssqyval.length()==2)
  {
  lsfs+=" and h.bmbm='"+ssqyval+"' ";
  }else if(ssqyval.length()==4)
  {
  lsfs+=" and b.xz='"+ssqyval+"' ";
  }
  else 
  {
  lsfs+=" and b.y01='"+ssqyval+"' ";
  }
  }
  if(bblx!=null&&!bblx.equals(""))
  {
  lsfs+=" and h.bblx='"+bblx+"' ";
  }
  lsfs+=" group by to_char(h.rwsj, 'mm-dd') order by to_char(h.rwsj, 'mm-dd')";
  QueryConnection qclssj = new QueryConnection();
  Statement stmtlssj = qclssj.con.createStatement();
  ResultSet rslssj = stmtlssj.executeQuery(lsfs);
  String sjlsfa="";
  String [] sjs=sj.split(",");
  while(rslssj.next())
  {
	  for(int i=0;i<sjs.length;i++)
	  {
		  if(!sj.equals("")){
			  
		if(rslssj.getString(2).equals(sjs[i].substring(1, sjs[i].length()-1)))
		{
			 sjlsfa+=rslssj.getString(1)+",";
		}
		  }
	  }
  }
  if(!sjlsfa.equals(""))
  {
  sjlsfa=sjlsfa.substring(0,sjlsfa.length()-1);
  }
    %>
    <%
    //K�� 
     String zdzx="select min(b."+zd+") zx,max(b."+zd+") zd from d898_body b,d898_head h where b.jfdyid=h.jfid and to_char(h.rwsj,'yyyy-mm-dd')>='"+cxsjstr+"' and to_char(h.rwsj,'yyyy-mm-dd')<='"+cxsjend+"'";
  if(ssqyval!=null&&!ssqyval.equals(""))
  {
      if(ssqyval.length()==2)
  {
  zdzx+=" and h.bmbm='"+ssqyval+"' ";
  }else if(ssqyval.length()==4)
  {
  zdzx+=" and b.xz='"+ssqyval+"' ";
  }
  else 
  {
  zdzx+=" and b.y01='"+ssqyval+"' ";
  }
  }
  if(bblx!=null&&!bblx.equals(""))
  {
  zdzx+=" and h.bblx='"+bblx+"' ";
  }
  zdzx+=" group by to_char(h.rwsj, 'mm-dd') order by to_char(h.rwsj, 'mm-dd')";
  QueryConnection qczdzx = new QueryConnection();
  Statement stmtzdzx = qczdzx.con.createStatement();
  ResultSet rszdzx = stmtzdzx.executeQuery(zdzx);
  String zdzxfa="";
  while(rszdzx.next())
  {
  zdzxfa+="["+rszdzx.getString(2)+","+rszdzx.getString(1)+","+rszdzx.getString(1)+","+rszdzx.getString(2)+"],";
  }
  if(!zdzxfa.equals(""))
  {
  zdzxfa=zdzxfa.substring(0,zdzxfa.length()-1);
  }
    %>
   <div id="main" style="width:100%;height:400px;"></div>
   <div style="">
   <center>
   <%
   if(ssqyval.length()!=6)
   {
   %>
   <input class="btn" type="button" value="��ͬ����<%=tit%>�仯����" onclick="sjfxt()"/>&nbsp;
   <input class="btn" type="button" value="�����ʱ仯����" onclick="sjfzz()"/>&nbsp;
   <input class="btn" type="button" value="����Excel" onclick="f_exp('<%=cxsjstr %>','<%=cxsjend %>','<%=dbsjstr %>','<%=dbsjend %>','<%=bblx %>','<%=lssj %>','<%=ssqyval %>','<%=fxdx%>')"/>&nbsp;
   <%
   }
   %>
   </center>
   </div>
   <!-- ��ʾ���� -->
         <div class="sh_sj" style="width: 100%;text-align: center;margin-top: 10px;">
   <table class="w">
   <tr>
   <th >NO.</th>
   <th >ʱ��</th>
   <th >ʵ�ʷ���</th>
   <th >��ʷ����</th>
   </tr>
 <%
    String [] sjfas=sjfa.split(",");
    String [] sjlsfas=sjlsfa.split(",");
    String sjf="";
    String lsf="";
    for(int i=0;i<sjs.length;i++)
    {
    if(i>=sjfas.length)
    {
     sjf="";
    }
    else
    {
    sjf=sjfas[i];
    }
       if(i>=sjlsfas.length)
    {
     lsf="";
    }
    else
    {
    lsf=sjlsfas[i];
    }
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
   <td><%=sjf%></td>
   <td><%=lsf%></td>
   </tr>
    <%
    }
    %>
   </table>
   </div>
    <script type="text/javascript">
  function f_exp(cxsjstr,cxsjend,dbsjstr,dbsjend,bblx,lssj,ssqyval,fxdx)
 {
   window.location="/insect/tjfx/fsfx_qxt.jsp?&cxsjstr="+cxsjstr+"&cxsjend="+cxsjend+"&dbsjstr="+dbsjstr+"&dbsjend="+dbsjend+"&bblx="+bblx+"&lssj="+lssj+"&ssqyval="+ssqyval+"&fxdx="+fxdx+"&p=exp";
 }
 function sjfxt()
 {
 window.open("/insect/tjfx/fsfx_dqt.jsp?cxsjstr=<%=cxsjstr%>&cxsjend=<%=cxsjend%>&dbsjstr=<%=dbsjstr%>&dbsjend=<%=dbsjend%>&ssqyval=<%=ssqyval%>&fxdx=<%=fxdx%>","","width=1200,height=600")
 }
  function sjfzz()
 {
 window.open("/insect/tjfx/fsfx_zzt.jsp?cxsjstr=<%=cxsjstr%>&cxsjend=<%=cxsjend%>&ssqyval=<%=ssqyval%>&fxdx=<%=fxdx%>","","width=1200,height=600")
 }
var div = document.getElementById("main");
// ����׼���õ�dom����ʼ��echartsʵ��
var myChart = echarts.init(div);
// ָ��ͼ��������������
option = {
	title : {
		text : '��ʭ����',
		top:-10,
		left:'45%'
	},
	tooltip : {
		trigger : 'axis',
		formatter : function(params) {
			var res = params[0].seriesName + ' ' + params[0].name;
			if(params[0].value!=undefined)
			{
			res += '<br/>  ��� : ' + params[0].value[0];
			}
			else 
			{
			res += '<br/>  ��� : 0'
			}
			if(params[0].value!=undefined)
			{
			res += '<br/>  ��С : '+ params[0].value[2];
			}
			else 
			{
			res += '<br/>  ��С : 0'
			}
			if(params[0].value!=undefined)
			{
			res += '<br/>  ��ʷ���� : '+ params[5].value;
			}
			else 
			{
			res += '<br/>  ��ʷ���� : 0'
			}
			if(params[0].value!=undefined)
			{
			res += '<br/>  ʵ�ʷ��� : '+ params[6].value;
			}
			else 
			{
			res += '<br/>  ʵ�ʷ��� : 0'
			}
			return res;
		}
		
	},
	legend : {
		data : ['K��','�񼶷�����׼','�򼶷�����׼','�󼶷�����׼','����������׼','��ʷ����','ʵ�ʷ���'],
		top:20
	},
	color:['#00ffff','#00ff00','#ffff00','#ffA500','#000000','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3'],
	dataZoom : {
	    type: 'inside',
		show : true,
		realtime : true,
		start : 0,
		end : 100
	},
	xAxis : [ {
		type : 'category',
		name:'����',
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
		name : 'K��',
		type : 'k',
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
            name: '�񼶷�����׼',
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
    },
    {
            name: '�򼶷�����׼',
            type: 'line',
            data:[<%=ej%>],
            smooth: true,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 1,
                    color: '#00ff00',
                    type:'dashed'
                }
            }
    },
     {
            name: '�󼶷�����׼',
            type: 'line',
            data:[<%=saj%>],
            smooth: true,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 1,
                    color: '#ffff00',
                    type:'dashed'
                }
            }
    },
     {
            name: '����������׼',
            type: 'line',
            data:[<%=sij%>],
            smooth: true,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 1,
                    color: '#ffA500',
                    type:'dashed'
                }
            }
    },
    {
            name: '��ʷ����',
            type: 'line',
            data:[<%=sjlsfa%>],
            smooth: true,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 1,
                }
            }
    },
      {
            name: 'ʵ�ʷ���',
            type: 'line',
            data:[<%=sjfa%>],
            smooth: true,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 1,
                }
            }
    },
  ]
};

// ʹ�ø�ָ�����������������ʾͼ��
myChart.setOption(option);
 </script>
  </body>
</html>
