<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%
	String dbbzb_cx_jfid = request.getParameter("dbbzb_cx_jfid");
	String p = request.getParameter("p"); // whether export
	String wh = request.getParameter("wh");
	String uppage = request.getParameter("uppage");
	String downpage = request.getParameter("downpage");
	String pyl = request.getParameter("pyl");
	if(pyl==null)
	{
	pyl="0";
	}
	int inpyl=Integer.parseInt(pyl);
	//һҳ����
	int ys=10;
	if(uppage==null||downpage==null)
	{
	uppage="1";
	downpage=ys+"";
	}
	int inuppage=Integer.parseInt(uppage);
	int indownpage=Integer.parseInt(downpage);
	String expcolspan = request.getParameter("col"); // ����excelʱ�������
	if (expcolspan == null || "".equals(expcolspan)) {
		expcolspan = "6";
	}
	
	// export to excel
	if ("exp".equals(p)) {
		response.setHeader("Content-disposition","attachment; filename=sjcx_export.xls");
	}
	String dbbzb_jfid = "", jftabname = "",styleStr = "",headTable = "",bodyTable = "",selectStr = "",fromStr = "",whereStr = "",orderStr = "",htmlStr = "";
	User user = (User) session.getAttribute("user");
	
	String sqlStr = "select dbbzb.jfid dbbzb_jfid,dbbzb.jftabname jftabname  ";
	sqlStr = sqlStr+" from dbbzb_cx,dbbzb ";
	sqlStr = sqlStr+" where dbbzb_cx.jfid='"+dbbzb_cx_jfid+"' ";
	sqlStr = sqlStr+" and dbbzb_cx.jfdbbzb_id=dbbzb.jfid ";
	
	QueryConnection qc = new QueryConnection();
	Statement stmt = qc.con.createStatement();
	ResultSet rs = stmt.executeQuery(sqlStr);
	if (rs.next()) {
		dbbzb_jfid = rs.getString("dbbzb_jfid");
		jftabname = rs.getString("jftabname");
	}
	headTable = "D"+dbbzb_jfid+"_head";
	bodyTable = "D"+dbbzb_jfid+"_body";
	
	sqlStr = "select dbbzb_jg.jfcolname jfcolname ";		// ����
	sqlStr = sqlStr+",dbbzb_jg.jfcolid jfcolid ";			// �б���
	sqlStr = sqlStr+",dbbzb_cx_tj.jfoperation jfoperation ";// �����ϵ
	sqlStr = sqlStr+",dbbzb_jg.jfcolstyle jfcolstyle ";		// ������
	sqlStr = sqlStr+",dbbzb_jg.jfcolfashion jfcolfashion ";	// �ദ��ʽ
	sqlStr = sqlStr+",dbbzb_jg.jfcolmeans jfcolmeans ";		// �д�����
	sqlStr = sqlStr+",dbbzb_jg.jfcolvest jfcolvest ";		// �������0�����⣻1����ͷ��2�����壬3����β��
	
	sqlStr = sqlStr+" from dbbzb_cx_tj,dbbzb_jg ";
	sqlStr = sqlStr+" where dbbzb_cx_tj.jfdbbzb_cx_id='"+dbbzb_cx_jfid+"' ";
	sqlStr = sqlStr+" and dbbzb_cx_tj.jfdbbzb_jg_id=dbbzb_jg.jfid ";
	sqlStr = sqlStr+" order by to_number(dbbzb_cx_tj.jfid) ";
	
%>
<%-- import header --%>
<jsp:include page="/header_nologo.jsp" flush="true">
	<jsp:param name="title" value="�ɼ����ݲ�ѯ" />
</jsp:include>
<style>
#tbdata{
text-align: center;
}

</style>
<div class="mod">
	<div class="mod-bd">
		<table id="tbdata" class="w">
		    <colgroup>
		    <col width="50px;"/>
		    <col width="100px;"/>
		    <col width="100px;"/>
		    <col width="100px;"/>
		    <col width="100px;"/>
		    <col width="100px;"/>
		    <col width="100px;"/>
		    </colgroup>
			<thead>
			<tr style="">
				<th><div class="cell-wrap" style="color: black;">���</div></th>
			<%
				// ----����ͷ----
				QueryConnection qcbt = new QueryConnection();
	            Statement stmtbt = qcbt.con.createStatement();
				sqlStr="select 'RWSJ' jfcolid,'Ҫ���������' jfcolname,'0' jfcolvest,'1' jfcolstyle,'1' jfcolfashion,'' jfcolmeans from dual";
                sqlStr +=" union all";
				sqlStr +=" select dbbzb_jg.jfcolid jfcolid,dbbzb_jg.jfcolname jfcolname,dbbzb_jg.jfcolvest jfcolvest,dbbzb_jg.jfcolstyle jfcolstyle,dbbzb_jg.jfcolfashion jfcolfashion,dbbzb_jg.jfcolmeans jfcolmeans ";
				sqlStr = sqlStr+" from dbbzb_cx_sc,dbbzb_jg ";
				sqlStr = sqlStr+" where dbbzb_cx_sc.jfdbbzb_jg_id=dbbzb_jg.jfid and dbbzb_cx_sc.jfdbbzb_cx_id='"+dbbzb_cx_jfid+"' ";
				sqlStr +="order by jfcolid";
				selectStr = "select ";
				htmlStr = "";
				String colName = "";
				int colNumber = 0;
				ResultSet rsbt = stmtbt.executeQuery(sqlStr);
				while (rsbt.next()) {
					colNumber = colNumber + 1;
					if ("2".equals(rsbt.getString("jfcolvest"))) { // 2:����body
						colName = bodyTable + "." + rsbt.getString("jfcolid");
					} else {
						colName = headTable + "." + rsbt.getString("jfcolid");
					}
					if ("1".equals(rsbt.getString("jfcolstyle"))) { // �ֶ����ͣ�date
						colName = "to_char("+colName+",'yyyy-mm-dd')";
					}
					if (!"".equals(rsbt.getString("jfcolmeans")) && rsbt.getString("jfcolmeans") != null) {
					    if(rsbt.getString("jfcolmeans").toUpperCase().equals("DCDD"))
					    {
					    colName = "f_get_mc('BBSSXZ',"+colName+")";
					    }
					    else
					    {
						colName = "f_get_mc('"+rsbt.getString("jfcolmeans").toUpperCase() +"',"+colName+")";
					    }
					}
					selectStr = selectStr + colName + " ,";
					htmlStr = htmlStr+"<th><div class=\"cell-wrap\" style=\"color: black;\">"+rsbt.getString("jfcolname")+"</div></th>";
				}
				selectStr = selectStr + "rownum ";
				out.print(htmlStr);
				// ----����ͷ end----
			%>
			</tr>
			</thead>
			<%
			// ----������----
			QueryConnection qcbo = new QueryConnection();
	        Statement stmtbo = qcbo.con.createStatement();
			fromStr = " from "+headTable+","+bodyTable;
			String _where = Function.f_dbb_query(request,dbbzb_jfid);
			if ("exp".equals(p)) { // append condition when export
				whereStr = " where "+headTable+".zt='1' and "+headTable+".jfid="+bodyTable+".jfdyid " + wh;
			} else {
				whereStr = " where "+headTable+".zt='1' and "+headTable+".jfid="+bodyTable+".jfdyid "+ _where;
			}
			sqlStr = "select dbbzb_jg.jfcolid jfcolid,dbbzb_jg.jfcolvest jfcolvest,dbbzb_cx_px.jfdownup jfdownup";
			sqlStr = sqlStr+" from dbbzb_cx_px,dbbzb_jg ";
			sqlStr = sqlStr+" where dbbzb_cx_px.jfdbbzb_jg_id=dbbzb_jg.jfid and dbbzb_cx_px.jfdbbzb_cx_id='"+dbbzb_cx_jfid+"' ";
			sqlStr = sqlStr+" order by dbbzb_cx_px.jfid ";
			orderStr = " order by  ";
			ResultSet rsbo = stmtbo.executeQuery(sqlStr);
			while (rsbo.next()) {
				if ("2".equals(rsbo.getString("jfcolvest"))) { // 2:����body
					colName = bodyTable + "." + rsbo.getString("jfcolid");
				} else {
					colName = headTable + "." + rsbo.getString("jfcolid");
				}
				if ("down".equals(rsbo.getString("jfdownup"))) {
					colName = colName + " desc";
				}
				orderStr = orderStr + colName + ",";
			}
			stmtbo.close();
			rsbo.close();
			orderStr = orderStr + "1";
			sqlStr ="SELECT * FROM (SELECT a.*, ROWNUM rn FROM ("+selectStr + fromStr + whereStr + orderStr+") a WHERE ROWNUM <="+downpage+")WHERE rn >="+uppage;//��������sql
			
			htmlStr = "";
			QueryConnection qcboo = new QueryConnection();
	        Statement stmtboo = qcboo.con.createStatement();
			ResultSet rsboo = stmtboo.executeQuery(sqlStr);
			int rowNumber = 0;
			while (rsboo.next()) {
				rowNumber++;
				htmlStr += "<tr><td><div class=\"cell-wrap\">" + rowNumber + "</div></td>";
				for (int i=0; i<colNumber; i++){
					String colValue = rsboo.getString(i+1);
					if(colValue!=null){
						if(colValue.length()>=2 && ".".equals(colValue.substring(1,2))){
						if(colValue.substring(0,1).equals("."))
						{
							colValue = "0" + colValue;
						}
						}else if ("0".equals(colValue)){
							colValue = "";
						}else if(".".equals(colValue.substring(0,1)))
						{
						   colValue = "0" + colValue;
						}
					} else {
						colValue = "";
					}
					htmlStr += "<td><div class=\"cell-wrap\">" + colValue + "</div></td>";
				}
				htmlStr += "</tr>";
			}
			stmtboo.close();
			rsboo.close();
			out.print(htmlStr);
			// ----������ end----
			//�����������
			sqlStr="SELECT COUNT(*) "+ fromStr + whereStr + orderStr;
			QueryConnection qcsum = new QueryConnection();
	        Statement stmtsum = qcsum.con.createStatement();
	        ResultSet rssum = stmtsum.executeQuery(sqlStr);
	        String sumStr="";
	        int sumboo=0;
	        int zonghe=0;
	        if(rssum.next())
	        {
	        sumStr=rssum.getString(1);
	        }
	        sumboo=Integer.parseInt(sumStr);
	        zonghe=Integer.parseInt(sumStr);
			//�������ҳ��
			if(sumboo%ys==0)
			{
			sumboo=sumboo/ys;
			}
			else
			{
			sumboo=sumboo/ys+1;
			}
			//��ǰҳ��
			int nowpage=1;
			if(indownpage%ys==0)
			{
			nowpage=indownpage/ys;
			}
			else
			{
			nowpage=indownpage/ys+1;
			}
			%>
		</table>
	<%
	if (p == null || !"exp".equals(p)) {
	%>
	<table class="w">
		<tr>
			<td class="tc pys">
				<input class="btn" type="button" value="EXCEL����" onclick="f_exp()">
				</span>��ҳ��<span><%=sumboo %></span>
				</span>|��ǰҳ��<span><%=nowpage %></span>
			    <a href="/insect/sjcx/sjcx_update.jsp?dbbzb_cx_jfid=<%=dbbzb_cx_jfid %>">��ҳ</a>
			    <%
			    if(inuppage-ys>=1)
			    {
			    %>
			    <a href="/insect/sjcx/sjcx_update.jsp?dbbzb_cx_jfid=<%=dbbzb_cx_jfid %>&uppage=<%=inuppage-ys-inpyl %>&downpage=<%=indownpage-ys %>">��һҳ</a>
			    <%
			    }
			    else
			    {
			    %>
			    <a href="/insect/sjcx/sjcx_update.jsp?dbbzb_cx_jfid=<%=dbbzb_cx_jfid %>&uppage=<%=inuppage %>&downpage=<%=indownpage %>">��һҳ</a>
			    <%
			    }
			    %>
			    <!-- ---------------- -->
			     <%
			    if(indownpage+ys<=zonghe)
			    {
			    %>
			    <a href="/insect/sjcx/sjcx_update.jsp?dbbzb_cx_jfid=<%=dbbzb_cx_jfid %>&uppage=<%=inuppage+ys %>&downpage=<%=indownpage+ys %>">��һҳ</a>
			    <%
			    }
			    else
			    {
			    %>
			    <a href="/insect/sjcx/sjcx_update.jsp?dbbzb_cx_jfid=<%=dbbzb_cx_jfid %>&uppage=<%=inuppage %>&downpage=<%=indownpage %>">��һҳ</a>
			    <%
			    }
			    %>
			    <%if(zonghe!=0)
			    {
			    %>
			    <a href="/insect/sjcx/sjcx_update.jsp?dbbzb_cx_jfid=<%=dbbzb_cx_jfid %>&uppage=<%=(sumboo-1)*ys%>&downpage=<%=zonghe %>&pyl=<%=zonghe-(sumboo-1)*ys+1%>">βҳ</a>
			    <%
			    }
			    else
			    {
			    %>
			    <a href="/insect/sjcx/sjcx_update.jsp?dbbzb_cx_jfid=<%=dbbzb_cx_jfid %>&uppage=<%=0%>&downpage=<%=1 %>">βҳ</a>
			    <%
			    }
			    %>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		function f_exp(){
			window.location = "/insect/sjcx/sjcx_update.jsp?p=exp&dbbzb_cx_jfid=<%=dbbzb_cx_jfid %>&wh=<%=_where %>&col=<%=colNumber+1%>";
		}
	</script>
	<%
	}
	rs.close();
	stmt.close();
	qc.close();
	if ("exp".equals(p)) {
		response.getWriter().write("<script>window.close();</script>");
	}
%>
	</div>
</div>

<%@include file="/footer_nocopy.jsp"%>
