<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%@page import="mt.database.extend.QueryConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<%response.setHeader("X-UA-Compatible","IE=EmulateIE11");%>
<%-- import header --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="/header.jsp" flush="true">
	<jsp:param name="title" value="�����" />
</jsp:include>

<!-- start content -->
<div id="content">
	<jsp:include page="/breadcrumb.jsp" flush="true"/>
	<%
		String bmbm = ((User) session.getAttribute("user")).getBmbm();
	
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
    <div class="layout grid-s5m0">
        <div class="layout-main">
            <div class="layout-wrap">
            	<div class="mod">
					<div class="mod-hd">
						<h3 class="mod-tit">���溦�����</h3>
					</div>
					<div class="mod-bd">
		                <form name="f1" method="post" action="/insect/sjtb.do?ACT_TYPE=QUERY" target="result">
							<table class="w">
								<tr>
									<td style="width: 20%;">
									<div class="div_xc_t" style="text-align: left;">
						                                    �������
						            <select id="par" class="cur-select" style="width: 120px" onchange="xzson(this)"></select>
						            </div>
									</td>
									<td  style="width: 30%;">
									<div class="div_xc" style="text-align: left;">
						                                    �������ƣ�
						            <select id="son" name="bbmc" class="cur-select"><option value=''>��ѡ��</option></select>
						            </div>
									</td>
									<%
									User users=(User)request.getSession().getAttribute("user");
									if(users.getBmbm().substring(0, 1).equals("1"))
									{
									%>
									<td  style="text-align:left;width: 20%;">
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
									</td>
									<%
									}
									%>
									<%
									if(!bmbm.equals("10"))
									{
									%>
									<td style="text-align: left;width: 20%;">
									<select name="zt">
									<option value="0">δ�</option>
									<option value="1">���δ�ϱ�</option>
									<option value="3">�����</option>
									<option value="2">���ϱ�</option>
									</select>
									</td>
									<%
									}
									 %>
									<%
									if(bmbm.equals("10"))
									{
									%>
									<td style="width: 5%;">
									<select name="zt" style="display: none;">
								      <option selected="selected" value="2">���ϱ�</option>
									</select>
									</td>
									<%
									}
									 %>
								
									<td style="text-align: left;">
										<input type="submit" value="��ѯ" class="btn" />
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<script type="text/javascript">
					function iFrameHeight() {
						var ifm= document.getElementById("result");
						var subWeb = document.frames ? document.frames["result"].document : ifm.contentDocument;
						if(ifm != null && subWeb != null) {
							ifm.height = subWeb.body.scrollHeight;
						}
					}
				</script>
				<iframe id="result" name="result" style="width:100%;border:0px;" scrolling="no" onload="iFrameHeight()" src="/insect/sjtb.do?ACT_TYPE=QUERY"></iframe>
        	</div>
    	</div>
		<!-- menu -->
		<div class="layout-sub">
			<div class="layout-wrap">
				<%@include file="/menu.jsp"%>
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
              $jqsel.append("<option value=''>��ѡ��</option>");
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
              $jqsel.append("<option value=''>��ѡ��</option>");
              $.each(data,function(key,city){
              $jqsel.append("<option value="+city+">"+key+"</option>"); 
              }) 
            }
       });
}
</script>
<!-- end content -->
<%@include file="/footer.jsp"%>
