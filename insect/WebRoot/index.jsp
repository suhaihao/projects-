<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<%
	session.removeAttribute("C");
%>
<%-- import header --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="����ֲ�ﱣ��վ" />
</jsp:include>


<%
	String bmbm = ((User) session.getAttribute("user")).getBmbm();
	//String bmmc = ((User) session.getAttribute("user")).getBmmc();
	//String jfuserrid=((User) session.getAttribute("user")).getUserid();
	//String username=((User) session.getAttribute("user")).getUsername();
	request.setAttribute("BMBM", bmbm);
	//��������
    String sql="select jfdeptcode,jfdeptname,jfdeptprop from dsys05 where jfdeptprop=1 and jfstate=1 order by jfremark asc";
    String sqljd="";
    QueryConnection qc = new QueryConnection();
    QueryConnection qcjd = new QueryConnection();
    String jsonStr="[";
    try {
	 Statement stmt = qc.con.createStatement();
	 Statement stmtjd = qcjd.con.createStatement();
	 ResultSet rs = stmt.executeQuery(sql);
	 while(rs.next())
	 {
	     sqljd="SELECT JFDEPTCODE,JFDEPTNAME FROM DSYS05 WHERE JFDEPTCODE LIKE '"+rs.getString("jfdeptcode")+"%' AND JFDEPTCODE<>"+rs.getString("jfdeptcode");
	     ResultSet rsjd = stmtjd.executeQuery(sqljd);
		 jsonStr+="{id:"+rs.getString("jfdeptcode")+",name:\""+rs.getString("jfdeptname")+"\"},";
		    while(rsjd.next())
		    {
		    	jsonStr+="{id:"+rsjd.getString("jfdeptcode")+",pId:"+rs.getString("jfdeptcode")+",name:\""+rsjd.getString("jfdeptname")+"\"},";
		    }
    	 rsjd.close();
	 }
	 stmtjd.close();
	 rs.close();
	 stmt.close();
	} catch(Exception e) {
   	e.printStackTrace();
    }
    jsonStr=jsonStr.substring(0, jsonStr.length()-1);
    jsonStr+="]";
%>
<!-- start content -->
<style>
 table td{
  border-bottom: 1px solid #D0D0D0;
  }
.cur-select {
 margin-top:5px;
 border:1px solid #cccccc;  
 display: inline;  
 width: 150px;
}
.div_xc
{
margin-top:5px;
float: left;
margin-left: 10px;
}
.div_xc_t
{
margin-top:5px;
float: left;
margin-left: 5px;
}
</style>

<div id="content">
	<div style="width: 100%">
		<div style="text-align: right">
		&nbsp;
		</div>
	</div>
	<div class="layout grid-s5m0e0">
		<div class="layout-main">
			<div class="layout-wrap">
              	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">
							��ǰ����
						</h3>
					</div>
					<div class="mod-bd">
						<div style="height:556px;overflow:hidden;">
						<!-- 11.25�¸Ķ� -->
						<div style="text-align: left;margin-left:5px; height: 50px;">
						<%
						User users=(User)request.getSession().getAttribute("user");
						if(users.getBmbm().substring(0, 1).equals("1"))
						{
						%>
						<div class="div_xc" style="margin-top: 10px;">
						�������أ�
	                    <input id="selectDevType"  name="qxmc" class="device_select" onclick="showDevTypeTree()" readonly="readonly" style="width: 150px;">  
                        <input id="qx" type="hidden" name="qx" class="selectDevTypeid">  
                        <div id="devTreeContent" class="menuContent" style="display: none; position: absolute; border: 1px #CCC solid; background-color: #F0F6E4;">
                        <button onclick="qxqb()">ȫ��</button><button onclick="xzfj()">����</button><button onclick="xzjd()">����</button><button onclick="hideDeviceTypeMenu()">X</button>
                        <br>
                        <input type="text" id="key" value="" class="" style="width: 150px;margin-top: 5px;margin-bottom: 5px;">
                        <ul id="deviceTypeTree" class="ztree" style="margin-top:0;">
                        </ul>  
                        </div> 
						</div>
						<%
						}
						%>
						<div class="div_xc_t">
						�������
						<select id="par" class="cur-select" style="width: 100px" onchange="xzson(this)"></select>
						</div>
						<div class="div_xc">
						�������ƣ�
						<select id="son" class="cur-select"><option value='0'>��ѡ��</option></select>
						</div>
						<div class="div_xc">
						<input type="submit" value="��ѯ" class="btn" onclick="cxsj()"/>
						</div>
						</div>
						<!-- 11.25 -->
					    <iframe src="/insect/Dqgz.jsp" id="result" name="result" style="width:100%;border:0px;height: 100%"scrolling="no" ></iframe>
						</div>
						<div class="more tr">
							<a href="javascript:void(0);" onclick="more('3')">���ࡷ</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- menu -->
		<div class="layout-sub">
			<div class="layout-wrap">
				<%@include file="/menu.jsp"%>
			</div>
		</div>
		<div class="layout-extra">
			<div class="layout-wrap">
			    <div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">
							֪ͨ����
						</h3>
					</div>
					<div class="mod-bd">
						<div style="height:220px;overflow:hidden;">
						<table class="w">
							<colgroup>
								<col />
								<col style="width:94px" />
							</colgroup>
							<thead>
							
								<tr>
									<td>
										<div class="cell-wrap">
											����
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											��������
										</div>
									</td>
								</tr>
							</thead>
							<tbody>
							<mt:sheet pagesize="5" datasource="SELECT JFID,BT,TO_CHAR(FBRQ,'YYYY-MM-DD') FBRQ,DECODE(SIGN(SYSDATE-FBRQ-3),1,'none','inline') ISNEW FROM DTZGG WHERE ZT='1' ORDER BY FBRQ DESC">
								<tr>
									<td>
										<div class="cell-wrap">
											<a target="_blank" href="index/xxll_detail.jsp?id=<mt:vlabel name="d:jfid:str:s"/>"><mt:vlabel name="d:bt:str:s"/></a><span class="new" style="display:<mt:vlabel name="d:isnew:str:s"/>">NEW</span>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:fbrq:str:s"/>
										</div>
									</td>
								</tr>
							</mt:sheet>
							</tbody>
						</table>
						</div>
						<div class="more tr">
							<a href="javascript:void(0);" onclick="more('1')">���ࡷ</a>
						</div>
					</div>
				</div>
				<!-- ������ʾ -->
				<div class="mod">
					<div class="mod-hd" >
						<h3 class="mod-tit">
					        <%
					        if(bmbm.equals("10"))
					        {
					        %>
					                     Ԥ����ʾ
					        <%
					        }
					        else
					        {
					        %>
							������ʾ
					        <%
					        }
					        %>	
						</h3>
					</div>
					<div class="mod-bd" >
						<div style="height:220px;overflow:hidden;">
						    <%
					        if(bmbm.equals("10"))
					        {
					        %>
					       <table class="w">
							<colgroup>
								<col />
								<col style="width:94px" />
							</colgroup>
							<thead>
								<tr>
									<td>
										<div class="cell-wrap">
											��������
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											¼������
										</div>
									</td>
								</tr>
							</thead>
							<tbody>
							<mt:sheet pagesize="5" datasource="SELECT YJNR,YJJB,to_char(LRRQ,'yyyy-mm-dd') LRRQ,JFID_HEAD,JFID_BODY,TNAME FROM DBBZB_YJ where ROWNUM<=10 order by LRRQ desc">
								<tr>
									<td>
										<div class="cell-wrap">
											<a href="/insect/index_map.jsp?YJJB=<mt:vlabel name="DBBZB_YJ:YJJB:str:s"/>&JFID_HEAD=<mt:vlabel name="DBBZB_YJ:JFID_HEAD:str:s"/>&JFID_BODY=<mt:vlabel name="DBBZB_YJ:JFID_BODY:str:s"/>&TNAME=<mt:vlabel name="DBBZB_YJ:TNAME:str:s"/>&LRRQ=<mt:vlabel name="DBBZB_YJ:LRRQ:str:s"/>&YJNR=<mt:vlabel name="DBBZB_YJ:YJNR:str:s"/>" target="_blank"><font color="red"><mt:vlabel name="DBBZB_YJ:YJNR:str:s"/></font></a>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<font color="red"><mt:vlabel name="DBBZB_YJ:LRRQ:str:s"/></font>
										</div>
									</td>
								</tr>
							</mt:sheet>
							</tbody>
						</table>
					        <%
					        }
					        else
					        {
					        %>
							<table class="w">
							<colgroup>
								<col />
								<col style="width:94px" />
							</colgroup>
							<thead>
								<tr>
									<td>
										<div class="cell-wrap">
											��������
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											��ʼ�����
										</div>
									</td>
								</tr>
							</thead>
							<tbody>
							<mt:sheet pagesize="5" datasource="SELECT F_GET_MC('BBMC',DBBZB_ID) BBMC,TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD') KSTBRQ FROM DBBZB_RW WHERE ND=TO_CHAR(SYSDATE,'YYYY') AND BBZT<='1' AND TO_CHAR(TBRQ-KSTBTS,'YYYY-MM-DD')>TO_CHAR(SYSDATE,'YYYY-MM-DD') AND TO_CHAR(TBRQ-KSTSTS,'YYYY-MM-DD')<=TO_CHAR(SYSDATE,'YYYY-MM-DD') AND BMBM='${BMBM}' ORDER BY KSTBRQ">
								<tr>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:bbmc:str:s"/>
										</div>
									</td>
									<td>
										<div class="cell-wrap">
											<mt:vlabel name="d:kstbrq:str:s"/>
										</div>
									</td>
								</tr>
							</mt:sheet>
							</tbody>
						</table>
					        <%
					        }
					        %>	
						</div>
						<div class="more tr">
						    <%
					        if(bmbm.equals("10"))
					        {
					        %>
					        <a href="javascript:void(0);" onclick="more('4')">���ࡷ</a>
					        <%
					        }
					        else
					        {
					        %>
							<a href="javascript:void(0);" onclick="more('2')">���ࡷ</a>
					        <%
					        }
					        %>	
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end content -->
<script type="text/javascript">
//��begin
var deviceTypeSetting = {  
    view: {  
        dblClickExpand: false,  
        fontCss: getFontCss
    },
    check: {
        enable: true,
		chkboxType: { "Y": "", "N": "" }
    },
    data: {
        simpleData: {  
            enable: true  
        }  
    },  
    callback: {  
    	onCheck: deviceTypeOnClick,
    }  
};  

		var deviceTypeNodes =<%=jsonStr%>;
		function deviceTypeOnClick(e, treeId, treeNode) {
			if($("#qx").val()==""&&$("#selectDevType").val()!="")
			{
				$("#selectDevType").val("");
			}
			if(treeNode.checked)
			{
			$("#selectDevType").val($("#selectDevType").val()+treeNode.name+",");
			$("#qx").val($("#qx").val()+treeNode.id+",");
			}
			else
			{
				var selectDevTypes = $("#selectDevType").val();
				var selectDevTypesz = selectDevTypes.split(treeNode.name);
				if (selectDevTypesz[0] == "") {
					selectDevTypes = selectDevTypesz[1].substring(1, selectDevTypesz[1].length);
				} else {
					selectDevTypes = selectDevTypesz[0] + selectDevTypesz[1].substring(1, selectDevTypesz[1].length);
				}
				$("#selectDevType").val(selectDevTypes);
				var qxs = $("#qx").val();
				var qxsz = qxs.split(treeNode.id);
				if (qxsz[0] == "") {
					qxs = qxsz[1].substring(1, qxsz[1].length);
				} else {
					qxs = qxsz[0] + qxsz[1].substring(1, qxsz[1].length);
				}
				$("#qx").val(qxs);
			}
		}
		/* 
		 * ��ʼ���豸���� 
		 *  
		 */  
		function initDeviceType(){  
		            $.fn.zTree.init($("#deviceTypeTree"), deviceTypeSetting, deviceTypeNodes);  
		}  
		/* 
		 * չʾ�豸����SelectTree 
		 */  
		var nodelist;
		var key;
		function showDevTypeTree(){  
		            $.fn.zTree.init($("#deviceTypeTree"), deviceTypeSetting, deviceTypeNodes);  
		            var deptObj = $("#selectDevType");  
		            var deptOffset = $("#selectDevType").offset();  
		            $("#devTreeContent").css({left:deptOffset.left + "px", top:deptOffset.top + deptObj.outerHeight() + "px"}).slideDown("fast");  
		            $('#deviceTypeTree').css({width:deptObj.outerWidth() - 12 + "px"});  
		            var zTree = $.fn.zTree.getZTreeObj("deviceTypeTree");  
		            var node = zTree.getNodeByParam("id", $('.selectDevTypeid').val(), null)  
		            zTree.selectNode(node);
		            key =$("#key");
		            key.bind("keyup", searchNode);
		}  
		/* 
		 * �����豸����Tree 
		 */  
		function hideDeviceTypeMenu() {
		    $("#devTreeContent").fadeOut("fast");
		    key.unbind();
		}
		/*
		 *ȡ����ʾȫ��
		 */
		 function qxqb()
		 {
			 var zTree = $.fn.zTree.getZTreeObj("deviceTypeTree");
			 zTree.checkAllNodes(false);
			 hideDeviceTypeMenu();
			 $("#selectDevType").val("ȫ��");
			 $("#qx").val("");
		 }
		/*
		 *ѡ������
		 */
		 function xzfj()
		 {
			 $("#selectDevType").val("");
			 $("#qx").val("");
			 var treeObj = $.fn.zTree.getZTreeObj("deviceTypeTree");
			 var nodes = treeObj.getNodes();
			 for(var i=0;i<nodes.length;i++){
			 $("#selectDevType").val($("#selectDevType").val()+nodes[i].name+",");
			 $("#qx").val($("#qx").val()+nodes[i].id+",");
			 treeObj.checkNode(nodes[i], true, true);
			 }
		 }
		/*
		 *ѡ�����
		 */
		 function xzjd()
		 {
			 $("#selectDevType").val("");
			 $("#qx").val("");
			 var treeObj = $.fn.zTree.getZTreeObj("deviceTypeTree");
			 var nodes = treeObj.getNodes();
			 for(var i=0;i<nodes.length;i++){
			 var childrens=nodes[i].children;
			    if(typeof(childrens)!="undefined"){ 
			    	 for(var j=0;j<childrens.length;j++){
			    		 $("#selectDevType").val($("#selectDevType").val()+childrens[j].name+",");
						 $("#qx").val($("#qx").val()+childrens[j].id+",");
			    		 treeObj.checkNode(childrens[j], true, true);
			    	 }
				} 
			 }
		 }
		/*
		 *��ѯ�ڵ�
		 */
		 function searchNode()
		 {
			        var zTree = $.fn.zTree.getZTreeObj("deviceTypeTree");
					var value =$("#key").val();
					if(value!="")
					{
					var keyType = "name";
					nodeList = zTree.getNodesByParamFuzzy(keyType, value);
				    updateNodes(true);
					}
					else
					{
						updateNodes(false);
						nodeList = zTree.getNodesByFilter(filter);
					}
		 }
		 function updateNodes(highlight) {
				var zTree = $.fn.zTree.getZTreeObj("deviceTypeTree");
				for( var i=0, l=nodeList.length; i<l; i++) {
					nodeList[i].highlight = highlight;
					zTree.updateNode(nodeList[i]);
				}
		}
		function getFontCss(treeId, treeNode) {
				return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
		}
		function filter(node) {
				return !node.isParent && node.isFirstNode;
		}
		function focusKey(e) {
			if (key.hasClass("empty")) {
				key.removeClass("empty");
			}
		}
		function blurKey(e) {
			if (key.get(0).value === "") {
				key.addClass("empty");
			}
		}
//��end
function cxsj()
{
var obj=document.getElementById("par");
var son=document.getElementById("son");
var index = obj.selectedIndex;
var opnvalue=obj.options[index].value;
var indexson = son.selectedIndex;
var opnvalson=son.options[indexson].value;
var qx=document.getElementById("qx");
if(qx!=null)
{
	qx=document.getElementById("qx").value;
}
var ifm=document.getElementById("result");
if(qx!=null)
{
ifm.src="/insect/Dqgz_cx.jsp?par="+opnvalue+"&son="+opnvalson+"&qx="+qx;
}
else
{
ifm.src="/insect/Dqgz_cx.jsp?par="+opnvalue+"&son="+opnvalson;
}
}
function xzson(obj)
{
var index = obj.selectedIndex;
var opnvalue=obj.options[index].value;
$.ajax({
            type:"post",
            url:"/insect/hqrwmc.do?ACT_TYPE=QUERY",
            data:{code:opnvalue},
            dataType:"json",        
            async: false,
            error:function(XMLResponse){
            },
            success:function(data){
              var sel=document.getElementById("son");
              var $jqsel=$(sel);
              $jqsel.empty();
              $jqsel.append("<option value='0'>��ѡ��</option>");
              $.each(data,function(key,city){
              $jqsel.append("<option value="+city+">"+key+"</option>"); 
              })  
            }
       });
}
window.onload=function()
{
 $.ajax({
            type:"post",
            url:"/insect/hqbblb.do?ACT_TYPE=QUERY",
            dataType:"json",        
            async: false,
            error:function(XMLResponse){
            },
            success:function(data){
              var sel=document.getElementById("par");
              var $jqsel=$(sel);
              $jqsel.empty();
              $jqsel.append("<option value='0'>��ѡ��</option>");
              $.each(data,function(key,city){
              $jqsel.append("<option value="+city+">"+key+"</option>"); 
              }) 
            }
       });
 initDeviceType();
}
function xgmm()
{
        var newps=document.getElementById("new").value
        var oldps=document.getElementById("old").value
        var newtwo=document.getElementById("newtwo").value
        var jfuserrid=document.getElementById("jfuserrid").value
        if(newps=="")
        {
        alert("������������")
        document.getElementById("new").value="";
        return false;
        }
        else if(oldps=="")
        {
        alert("�����������");
        document.getElementById("old").value="";
        return false;
        }
        else if(newtwo=="")
        {
        document.getElementById("newtwo").value="";
        alert("������ȷ������")
        return false;
        }
        else if(newtwo!=newps)
        {
         alert("�������벻һ��")
         document.getElementById("newtwo").value="";
         document.getElementById("new").value="";
         return false;
        }
		$.ajax({
		type:"post",
		url:"/insect/uppw.do?ACT_TYPE=uppw",
		data:{newps:newps,oldps:oldps,jfuserrid:jfuserrid},
		dataType:"text",
		async: false,
		error:function(XMLResponse){
		alert("ʧ��");
		},
		success:function(data){
		if(data=="SUCCESS")
		{
		 alert("�޸ĳɹ�������µ�½");
		 window.location="/insect/outlogin.do?ACT_TYPE=outlogin";
		}
		else
		{
		alert("�������벻��ȷ");
		}
		}
		});
}
function more(lb){
	if(lb == '1'){ // xxll
		window.open("/insect/xxll.do?ACT_TYPE=QUERY","more_xxll","");
	} else if(lb == '2'){ // gzts
		window.open("/insect/gzts.do?ACT_TYPE=QUERY","more_gzts","");
	} else if(lb == '3'){ // dqgz
		window.open("/insect/index/dqgz_list.jsp","more_dqgz","");
	} else if(lb == '4'){ // dqgz
		window.open("/insect/yjts.do?ACT_TYPE=QUERY","more_yjts","");
	}
}
function report(rwid,zbid,dyid,lb){
	if (dyid) {
		window.open("/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "&rwid=" + rwid + "&lb=" + lb + "&jfid=" + dyid,"report_update","");
	} else {
		window.open("/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "&rwid=" + rwid + "&lb=" + lb,"report_add","");
	}
}
</script>
<%@include file="footer.jsp"%>
