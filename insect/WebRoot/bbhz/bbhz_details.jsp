<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="采集数据统计" />
</jsp:include>
<style>
.w td{
text-align: right;
}
</style>
<body>
<div class="mod">
	<div class="mod-bd">
    <%
    String where=(String)request.getAttribute("where");
    String bodyTable=(String)request.getAttribute("bodyTable");
    String headTable=(String)request.getAttribute("headTable");
    String clickwhere=(String)request.getAttribute("clickwhere");
    String DCRQ=(String)request.getAttribute("DCRQ");
    String BMBM=(String)request.getAttribute("BMBM");
    String XZ=(String)request.getAttribute("XZ");
    String Y01=(String)request.getAttribute("Y01");
    String Y02=(String)request.getAttribute("Y02");
    String sjpd=(String)request.getAttribute("sjpd");
    List<String> list=new ArrayList();
    List<String> listsj=new ArrayList();
    Map<String,String> map=new HashMap();
     %>
     <table class="w">
     <tr>
     <td>
             序列号
     </td>
     <td>
             调查单位
     </td>
     <td>
             经办人
     </td>
     <td>
             要求调查日期
     </td>
     <%
     String jfid=bodyTable.substring(1,bodyTable.indexOf("_"));
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
     String sql="select jfcolname,jfcolid,JFCOLSTYLE,JFCOLMEANS from dbbzb_jg where jfdbbzb_id="+jfid+" and jfcolvest='2'";
     QueryConnection qc = new QueryConnection();
     try {
	 Statement stmt = qc.con.createStatement();
	 ResultSet rs = stmt.executeQuery(sql);
	 while(rs.next())
	 {
	 %>
    
     <td>
     <%=rs.getString("jfcolname")%>
     <%
     list.add(rs.getString("jfcolid"));
     if(rs.getString("JFCOLSTYLE").equals("1"))
     {
     listsj.add(rs.getString("jfcolid"));
     }
     if(rs.getString("JFCOLMEANS")!=null&&!rs.getString("JFCOLMEANS").equals(""))
     {
     map.put(rs.getString("jfcolid"),rs.getString("JFCOLMEANS"));
     }
     %>
     </td>
     
	 <%
	 }
	 rs.close();
	 stmt.close();
	 } catch(Exception e) {
    	e.printStackTrace();
     }
     %>
     </tr>
     <%
     list.add(0,"RWSJ");
     list.add(0,"JBR");
     list.add(0,"BMBM");
     sql="SELECT f_get_mc('DEPT',"+headTable+".bmbm) bmbm,"+headTable+".jbr,to_char("+headTable+".rwsj,'yyyy-mm-dd') rwsj,"+bodyTable+".* from "+bodyTable+","+headTable+where+" and "+clickwhere;
     //加入时间条件
     if(DCRQ!=null&&sjpd!=null)
     {
     if(sjpd.equals("3"))
     {
       sql+=" and  to_date(to_char(DCRQ,'yyyy-mm-dd'),'yyyy-mm-dd') = to_date('"+DCRQ.substring(0,10)+"','yyyy-mm-dd')";
     }
     else if(sjpd.equals("2"))
     {
       sql+=" and  to_date(to_char(DCRQ,'yyyy-mm'),'yyyy-mm') = to_date('"+DCRQ.substring(0,7)+"','yyyy-mm')";
     }
     else if(sjpd.equals("1"))
     {
       sql+=" and  to_date(to_char(DCRQ,'yyyy'),'yyyy') = to_date('"+DCRQ.substring(0,4)+"','yyyy')";
     }
     }
     if(BMBM!=null)
     {
      sql+=" and bmbm="+BMBM;
     }
     if(XZ!=null)
     {
      sql+=" and xz="+XZ;
     }
     if(Y01!=null)
     {
       sql+=" and Y01="+Y01;
     }
     if(Y02!=null)
     {
        sql+=" and Y02="+Y02;
     }
     QueryConnection qcc = new QueryConnection();
     QueryConnection qccxz = new QueryConnection();
     QueryConnection qccdcdd = new QueryConnection();
     QueryConnection qccxyq = new QueryConnection();
     try {
	 Statement stmtc = qcc.con.createStatement();
	 ResultSet rsc = stmtc.executeQuery(sql);
	 int seed=1;
	 while(rsc.next())
	 {
	 %>
     <tr>
     <td>
     <%=seed %>
     </td>
     <%
     for(String lis:list)
	 {
     %>
     <td>
     <%
     if(rsc.getString(lis)!=null)
     {
      for(String lisj:listsj)
       {
       if(lisj.equals(lis))
       {
       %>
       <%=sdf.format(rsc.getDate(lis))%>
       <%
       }
       else
       {
          //判断map中是否存在
          if(map.get(lis)!=null)
          {
          //判断是否为乡镇
          if(lis.equals("XZ"))
          {
          Statement stmtcxz = qccxz.con.createStatement();
          ResultSet rscxz =stmtcxz.executeQuery("select JFREGNAME from dsys06 where jc='2' and jfregcode='"+rsc.getString(lis)+"'");
          if(rscxz.next())
          {
          %>
          <%=rscxz.getString(1)%>
          <%
          }
          rscxz.close();
          stmtcxz.close();
          }
          else
          {
          //判断
          if(map.get(lis).equals("DCDD"))
          {
          
          Statement stmtcdcdd = qccdcdd.con.createStatement();
          ResultSet rscdcdd =stmtcdcdd.executeQuery("select jfregname from dsys06 where jc='3' and jfregcode='"+rsc.getString(lis)+"'");
          if(rscdcdd.next())
          {
          %>
          <%=rscdcdd.getString(1)%>
          <%
          }
          rscdcdd.close();
          stmtcdcdd.close();
          }
          else
          {
          //例如小麦生育期
          Statement stmtcxyq = qccxyq.con.createStatement();
          ResultSet rsxyq =stmtcxyq.executeQuery("select JFCODENAME from dsys11 where jfcode='"+rsc.getString(lis)+"' and jfsort='"+map.get(lis)+"'");
          if(rsxyq.next())
          {
          %>
          <%=rsxyq.getString(1)%>
          <%
          }
          rsxyq.close();
          stmtcxyq.close();
          }
          
          }
          
          }
          else
          {
          if(rsc.getString(lis).substring(0,1).equals("."))
          {
          %>
          <%="0"+rsc.getString(lis)%>
          <%
          }
          else
          {
          %>
          <%=rsc.getString(lis)%>
          <%
          }
          }       
       }
       }
     }
     %>
     </td>
     <%
	 }
     %>
     </tr>
	 <%
	 seed++;
	 }
	 rsc.close();
	 stmtc.close();
	 } catch(Exception e) {
    	e.printStackTrace();
     }
     %>
     </table>
	</div>
	<div class="mod-bd" style="text-align: center;">
	<input class="btn" value="关闭" onclick="window.opener=null;window.open('','_self');window.close();" type="button">
	</div>
</div>
</body>
<%@include file="/footer_nocopy.jsp"%>
