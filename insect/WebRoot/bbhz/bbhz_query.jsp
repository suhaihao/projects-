<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="com.jf.util.Function"%>
<%-- import header --%>
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="采集数据统计" />
</jsp:include>
<%
	String dbbzb_tj_jfid = (String)request.getAttribute("dbbzb_tj_jfid");
	String dbbzb_jfid = "", jftabname = "",headTable = "", bodyTable = "";
	User user = (User) session.getAttribute("user");
	String bmbm=user.getBmbm();
	String sqlStr = "select dbbzb.jfid dbbzb_jfid,dbbzb.jftabname jftabname  ";
	sqlStr = sqlStr+" from dtjbb,dbbzb ";
	sqlStr = sqlStr+" where dtjbb.jfid='"+dbbzb_tj_jfid+"' ";
	sqlStr = sqlStr+" and dtjbb.jfdbbzb_id=dbbzb.jfid ";
	
	QueryConnection qc = new QueryConnection();
	Statement stmt = qc.con.createStatement();
	ResultSet rs = stmt.executeQuery(sqlStr);
	if (rs.next()) {
		dbbzb_jfid = rs.getString("dbbzb_jfid");
		jftabname = rs.getString("jftabname");
	}
	
	String vallageOption = "<option value=''></option>";
	sqlStr = "select jfregcode,jfregname from dsys06 where (jfdsys05_code like '"
			+user.getBmbm()+"%' or  '"+user.getBmbm()+"'='10')  and jfstate='1' and length(jfregcode) > 2  ORDER BY nlssort(jfregname, 'NLS_SORT=SCHINESE_PINYIN_M')";
	rs = stmt.executeQuery(sqlStr);
	while (rs.next()) {
		
		vallageOption = vallageOption+"<option value='"+rs.getString("jfregcode")+"'>"+rs.getString("jfregname")+"</option>";
	}
	
	String cityOption = "<option value=''></option>";
	sqlStr = "select jfdeptcode,jfdeptname from dsys05 where jfstate='1' order by jfdeptcode ";
	rs = stmt.executeQuery(sqlStr);
	while (rs.next()) {
		if(rs.getString("jfdeptcode").equals(bmbm))
		{
		cityOption = cityOption+"<option value='"+rs.getString("jfdeptcode")+"' selected='selected'>"+rs.getString("jfdeptname")+"</option>";
		}
		else
		{
		cityOption = cityOption+"<option value='"+rs.getString("jfdeptcode")+"'>"+rs.getString("jfdeptname")+"</option>";
		}
	}
	
	sqlStr = "select dbbzb_jg.jfcolname jfcolname ";		// 列名
	sqlStr = sqlStr+",dbbzb_jg.jfcolid jfcolid ";			// 列编码
	sqlStr = sqlStr+",dtjbb_tj.jfoperation jfoperation ";	// 运算关系
	sqlStr = sqlStr+",dbbzb_jg.jfcolstyle jfcolstyle ";		// 列类型
	sqlStr = sqlStr+",dbbzb_jg.jfcolfashion jfcolfashion ";	// 类处理方式
	sqlStr = sqlStr+",dbbzb_jg.jfcolmeans jfcolmeans ";		// 列处理方法
	sqlStr = sqlStr+",dbbzb_jg.jfcolvest jfcolvest ";		// 类归属（0：标题；1：表头；2：表体，3：表尾）
	
	sqlStr = sqlStr+" from dtjbb_tj,dbbzb_jg ";
	sqlStr = sqlStr+" where dtjbb_tj.jfdbbzb_tj_id='"+dbbzb_tj_jfid+"' ";
	sqlStr = sqlStr+" and dtjbb_tj.jfdbbzb_jg_id=dbbzb_jg.jfid ";
	sqlStr = sqlStr+" order by to_number(dtjbb_tj.jfid) ";
	
%>
<!-- start content -->
<style>
.w td
{
text-align:right;
width: 200px;
}
.enniu{
text-align: center;
}
.bt{
text-align: center;
}
.tbl
{
padding-top: 5px;
padding-bottom: 5px;
width: 100%;
color: black;
text-align: right;
}
.tbl tr{
height: 50px;
}
</style>
<div id="content">
	<!-- navigation -->
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
                <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">采集数据统计</h3>
					</div>
					<div class="mod-bd">
					<div class="mod-bd-tj">
					<form name="f1" action="bbhz/bbhz_update.jsp" method="post" target="result">
						<input type="hidden" name="dbbzb_tj_jfid" value="<%=dbbzb_tj_jfid%>">
						<table class="tbl">
							<tr><td colspan="12" class="bt"><div class="cell-wrap" style="font-size:20px;font-weight:bold"><%=jftabname%></div></td></tr>
							<%
								String labelName = "",jfcolname = "",jfcolid = "",jfoperation = "",jfcolstyle = "",jfcolmeans = "",htmlStr = "",jfcolvest = "",jfcolfashion = "";
								rs = stmt.executeQuery(sqlStr);
								int i=0;
								boolean hh=false;
								htmlStr = htmlStr+"<tr>";
								while (rs.next()) {
								        if(hh)
									    {
									    htmlStr+="<tr>";
									    hh=false;
									    }
									jfcolname    = rs.getString("jfcolname");	// 列名
									jfcolid      = rs.getString("jfcolid");		// 列编码
									jfoperation  = rs.getString("jfoperation");	// 运算关系
									jfcolstyle   = rs.getString("jfcolstyle");	// 列类型
									jfcolfashion = rs.getString("jfcolfashion");// 类处理方式
									jfcolmeans   = rs.getString("jfcolmeans");	// 列处理方法
									jfcolvest    = rs.getString("jfcolvest");	// 类归属（0：标题；1：表头；2：表体，3：表尾）
									labelName = jfcolvest+":"+jfcolid+":"+Function.f_state_return("dbbzb_cx_jfoperation",jfoperation)+":"+jfcolstyle;
								
									htmlStr = htmlStr+"<td>"+jfcolname+"("+Function.f_state_return("dbbzb_cx_jfoperation",jfoperation)+"):</td>";
									htmlStr = htmlStr+"<td style=\"text-align: left;\">";
									if (jfcolmeans==null || "".equals(jfcolmeans)){
										if ("1".equals(jfcolstyle)){
											if ("=".equals(Function.f_state_return("dbbzb_cx_jfoperation",jfoperation))){ // 等于号用年月日分开模式
												htmlStr = htmlStr+" <input type='text' name='"+labelName+":yyyy' chname='年' datatype=longint size='4' maxlength='4'>年 ";
					              			    htmlStr = htmlStr+" <input type='text' name='"+labelName+":mm'   chname='月' datatype=longint size='2' maxlength='2'>月 ";
											    htmlStr = htmlStr+" <input type='text' name='"+labelName+":dd'   chname='日' datatype=longint size='2' maxlength='2'>日 ";
											} else {
												htmlStr = htmlStr+" <input type='text' name='"+labelName+":yyyy-mm-dd' class=\"Wdate\" onFocus=\"WdatePicker({skin:'whyGreen',maxDate: '%y-%M-%d' })\" onkeyup=\"changeiput(this)\">";
											}
										} else {
											htmlStr = htmlStr+" <input type='text' name='"+labelName+"' ";
										}
									} else {
										htmlStr = htmlStr+" <select name='"+labelName+"'> ";
										if ("BBSSXZ".equals(jfcolmeans)){
											htmlStr = htmlStr+vallageOption;
										} else {
											if ("DEPT".equals(jfcolmeans)){
												htmlStr = htmlStr+cityOption;
											} else {
												if ("DLYH".equals(jfcolmeans)){ // 登陆用户
													htmlStr = htmlStr+Function.f_select_ts_return(qc.con,"jfid,jfname","dsys01","","jfname","");
												} else {
													htmlStr = htmlStr+Function.f_select_return(qc.con,jfcolmeans,"");
												}
											}
										}
										htmlStr = htmlStr+" </select> ";
									}
									htmlStr = htmlStr+"</td>";
										i++;
										if(i==6)
										{
										 htmlStr+="</tr>";
										 hh=true;
										 i=0;
										}
								}
									htmlStr = htmlStr+"</tr>";
								out.print(htmlStr);
							%>
							<tr>
							<td >数据统计方式：</td>
							<td colspan="11" style="text-align: left;">
							<%
								String strtjfs = "",str_wholetable = "",strcolumn = "";
								sqlStr = " select dbbzb_jg.jfcolname jfcolname ";		// 列名
								sqlStr = sqlStr+",dbbzb_jg.jfcolid jfcolid ";			// 列编码
								sqlStr = sqlStr+",f_get_mc('BMTJFS',dtjbb_fs.jfoperation) jfoperation ";	// 运算关系
								sqlStr = sqlStr+",dbbzb_jg.jfcolstyle jfcolstyle ";		// 列类型
								sqlStr = sqlStr+",dbbzb_jg.jfcolfashion jfcolfashion ";	// 类处理方式
								sqlStr = sqlStr+",dbbzb_jg.jfcolmeans jfcolmeans ";		// 列处理方法
								sqlStr = sqlStr+",dbbzb_jg.jfcolvest jfcolvest ";		// 类归属（0：标题；1：表头；2：表体，3：表尾）
								sqlStr = sqlStr+",dtjbb_fs.jfoperation ";
								
								sqlStr = sqlStr+" from dtjbb_fs,dbbzb_jg ";
								sqlStr = sqlStr+" where dtjbb_fs.jfdbbzb_tj_id='"+dbbzb_tj_jfid+"' ";
								sqlStr = sqlStr+" and dtjbb_fs.jfdbbzb_jg_id=dbbzb_jg.jfid ";
								
								headTable = "D"+dbbzb_jfid+"_head.";
					            bodyTable = "D"+dbbzb_jfid+"_body.";
					            rs = stmt.executeQuery(sqlStr);
					            int size=0;
								while (rs.next()) {
									if ("0".equals(rs.getString("jfcolvest")) || "3".equals(rs.getString("jfcolvest"))){
										str_wholetable=headTable;
									} else {
										str_wholetable=bodyTable;
									}
									if (rs.getString(8) != null && !"".equals(rs.getString(8))) {
										if ("01".equals(rs.getString(8))){ // 年
											strtjfs="to_char("+str_wholetable+rs.getString(2)+",'yyyy') ";
										} else if ("02".equals(rs.getString(8))){ // 年-月
											strtjfs="to_char("+str_wholetable+rs.getString(2)+",'yyyy-mm') ";
										} else if ("03".equals(rs.getString(8))){ // 年-季
											strtjfs="to_char("+str_wholetable+rs.getString(2)+",'yyyy-q') ";
										} else if ("04".equals(rs.getString(8))){ // 年-月-天
											strtjfs="to_char("+str_wholetable+rs.getString(2)+",'yyyy-mm-dd') ";
										} else if ("05".equals(rs.getString(8))){ // 年-月-旬
											strtjfs="to_char("+str_wholetable+rs.getString(2)+",'yyyy-mm') ";
											strtjfs=" year_xun(to_char("+str_wholetable+rs.getString(2)+",'yyyy-mm'),to_char("+str_wholetable+rs.getString(2)+",'dd') ) ";
										} else if ("06".equals(rs.getString(8))){ // 月
											strtjfs="to_char("+str_wholetable+rs.getString(2)+",'mm') ";
										} else if ("07".equals(rs.getString(8))){ // 季
											strtjfs="to_char("+str_wholetable+rs.getString(2)+",'q') ";
										} else if ("08".equals(rs.getString(8))){ // 年-月-周
											strtjfs="to_char("+str_wholetable+rs.getString(2)+",'yyyy-mm-W') ";
										}
										strcolumn= rs.getString(1)+"["+rs.getString(3) +"]";
									} else {
										strcolumn= rs.getString(1);
					                    //strtjfs=str_wholetable+rs.getString(2);
					                    if ("1".equals(rs.getString(4))) { // Date 
					                    	strtjfs = "to_char(" + str_wholetable+rs.getString(2) + ",'yyyy-mm-dd')";
										} else {
											strtjfs = str_wholetable+rs.getString(2);
										}
									}
									if (rs.getString("jfcolmeans") != null && !"".equals(rs.getString("jfcolmeans"))) {
									if(rs.getString("jfcolmeans").equals("DCDD"))
									{
										strtjfs =" f_get_mc('BBSSXZ',"+strtjfs+") ";
									}
									else
									{
										strtjfs =" f_get_mc('"+ rs.getString("jfcolmeans")+"',"+strtjfs+") ";
									}
									}
									if(size<3)
									{
									out.print(strcolumn+" <input type=checkbox tag=\""+strcolumn+"\" class=input2  name=tjfs value=\""+strtjfs+"|"+strcolumn+"\">&nbsp;&nbsp;&nbsp;&nbsp;<input  class='input2' name='tj' style='display: none' value=\""+strtjfs+"\"/>");
									size++;
									}
									else
									{
									out.print(strcolumn+" <input type=checkbox tag=\""+strcolumn+"\" class=input2  name=tjfs value=\""+strtjfs+"|"+strcolumn+"\">&nbsp;&nbsp;&nbsp;&nbsp;<input  class='input2' name='tj' style='display: none' value='"+str_wholetable+rs.getString(2)+"'/>");
									}
								}
								
								rs.close();
								stmt.close();
								qc.close();
							%>
								</td>
							</tr>
							<tr>
								<td class="enniu" colspan="12">
									<input class="btn" type="button" value="确认" onclick="query()">&nbsp;
									<input class="btn" type="button" value="关闭" onclick="javascript:window.opener=null;window.open('','_self');window.close();">
								</td>
							</tr>
						</table>
						<script type="text/javascript">
							function back(id,bb){
								window.location = "/insect/bbhz.do?ACT_TYPE=LIST&dbbzb_jfid=" + id + "&bbmc="+encodeURIComponent(encodeURIComponent(bb));
							}
							function query(){
								var tjfss = document.getElementsByName("tjfs");
								var nonechk = true;
								for(var i=0; i<tjfss.length; i++){
									if(tjfss[i].checked){
										nonechk = false;
										break;
									}
								}
								if(nonechk){
									alert("请选择数据统计方式");
								} else {
									document.forms[0].submit();
								}
							}
							function iFrameHeight() {
								var ifm= document.getElementById("result");
								var subWeb = document.frames ? document.frames["result"].document : ifm.contentDocument;
								if(ifm != null && subWeb != null) {
									ifm.height = subWeb.body.scrollHeight;
								}
							}
						</script>
					   </form>
					  </div>
					</div>
				</div>
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()"></iframe>
        	</div>
    	</div>
	</div>
</div>
<!-- end content -->
<%@include file="/footer.jsp"%>
