<%@page language="java" contentType="text/html;charset=GBK"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%-- import header --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>����ֲ�ﱣ��վ</title>
	<link href="/insect/zTree-zTree_v3-7b4dfb8/css/demo.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="/insect/zTree-zTree_v3-7b4dfb8/css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
	<link href="/insect/assets/css/base.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/css/layout.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/css/com.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="/insect/assets/plug/jquery-ui-1.10.4 2/css/custom/jquery-ui-1.10.4.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<script src="/insect/zTree-zTree_v3-7b4dfb8/js/jquery-1.4.4.min.js" type="text/javascript"></script>
	<script src="/insect/assets/plug/jquery-ui-1.10.4 2/js/jquery-ui-1.10.4.js" type="text/javascript"></script>
	<script type="text/javascript" src="/insect/javascript/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="/insect/javascript/validate.min.js"></script>
	<script type="text/javascript" src="/insect/javascript/common.js"></script>
	<script src="/insect/zTree-zTree_v3-7b4dfb8/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="/insect/zTree-zTree_v3-7b4dfb8/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
</head>
<body>
<div id="container">
    <!-- start header -->
<div id="header" >
<video autoplay="autoplay" width="100%" loop="loop" height="20%">
            <source src="/insect/images/head.mp4" type="video/mp4" />
</video>
</div>
<%
String bmmc = ((User) session.getAttribute("user")).getBmmc();
String username=((User) session.getAttribute("user")).getUsername();
String jfuserrid=((User) session.getAttribute("user")).getUserid();

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
	<div style="position:absolute;left:72%;text-align: right">
		������λ��<%=bmmc %>	&nbsp;&nbsp;��¼�ˣ�<%=username%>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="uppassword()">�޸�����</a>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="zx(this)">ע��</a>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="clos()">�˳�</a>
   </div>
		<div id="upLayer" style="display:none;position:fixed;width:300px;left:40%;top:40%;border: #D8D8D8 4px solid;background: #F6F6F6;padding-top: 10px;padding-bottom: 10px;">
				<table style="text-align: center; width: 100%;border-collapse:separate; border-spacing:10px;"cellspacing="10">
					<tr>
						<td>
							<align center>
							<span>����������</span>
							</align>
						</td>
					</tr>
					<tr>
						<td>
					        <span>�ɵ����룺</span><input id="old" name="old" type="password" >
					        <br/>
					        <br/>
					        <span>�µ����룺</span><input id="new" name="new" type="password" >
					        <br/>
					        <br/>
					        <span>ȷ�����룺</span><input id="newtwo" name="new" type="password" >
					        <input id="jfuserrid" name="jfuserrid" type="hidden" value="<%=jfuserrid %>">
						</td>
					</tr>
					<tr>
						<td>
							<input style="width: 50px;background:#66ff66;border-color:#66ff66;" type="button" value="ȷ��" onclick="xgmm()">
							&nbsp;&nbsp;
							<input style="width: 50px;background:#66ff66;border-color:#66ff66;" type="button" value="ȡ��" onclick="uppassword()">
						</td>
					</tr>
				</table>
		</div>   
<script type="text/javascript">
function clos()
{
if(confirm("��ȷ���ر���"))
{
window.close();
}
}
function zx(obj)
{
if(confirm("��ȷ��ע����"))
{
obj.href="/insect/outlogin.do?ACT_TYPE=outlogin";
}
}
function uppassword()
{
(document.getElementById("upLayer").style.display=='none')?document.getElementById("upLayer").style.display="":document.getElementById("upLayer").style.display="none";
}

</script>
<!-- start content -->
<style>
.cur-select {
 margin-top:5px;
 border:1px solid #cccccc;  
 display: inline;  
 width: 250px;
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
<script type="text/javascript">
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
if(qx==null)
{
ifm.src="/insect/dqgz.do?ACT_TYPE=QUERY&par="+opnvalue+"&son="+opnvalson;
}
else
{
ifm.src="/insect/dqgz.do?ACT_TYPE=QUERY&par="+opnvalue+"&son="+opnvalson+"&qx="+qx;
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
}
</script>
<div id="content">
	<div class="breadcrumb"><ol><li class="home"> <a title="��ҳ" href="/insect/index.jsp">��ҳ</a></li><li> <span>��ǰ����</span></li></ol></div>
    <div class="layout grid-m0">
        <div class="layout-main">
            <div class="layout-wrap">
				<div class="mod">
					<div class="mod-bd">
					<!-- 11.25�Ķ� -->
						<!-- 11.25�¸Ķ� -->
						<div style="text-align: left;margin-left:5px;height: 50px">
						<%
						User user=(User)request.getSession().getAttribute("user");
						if(user.getBmbm().substring(0, 1).equals("1"))
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
						<select id="par" class="cur-select" style="width: 120px" onchange="xzson(this)"></select>
						</div>
						<div class="div_xc">
						�������ƣ�
						<select id="son" class="cur-select"><option value='0'>��ѡ��</option></select>
						</div>
						<div class="div_xc">
						<input type="submit" value="��ѯ" class="btn" onclick="cxsj()"/>
						</div>
						</div>
						<!-- ------------ -->
						<div style="height:1200px;">
						<iframe src="/insect/dqgz.do?ACT_TYPE=QUERY" id="result" name="result" style="width:100%;border:0px;height: 100%"scrolling="no" ></iframe>
						</div>
					</div>
				</div>
        	</div>
    	</div>
	</div>
</div>
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
</script>
<!-- end content -->
<%@include file="/footer.jsp"%>
