/**
 * common js
 * 
 */
//时间空间方法
function changeiput(obj)
{
if(obj.value.length==4){
obj.value=obj.value+"-"
}
if(obj.value.length==7)
{
if(obj.value.substring(obj.value.length-2,obj.value.length)>12)
{
obj.value=obj.value.substring(0,obj.value.length-2)+"0"+obj.value.substring(obj.value.length-2,obj.value.length-1);
}
obj.value=obj.value+"-"
}
if(obj.value.length==10)
{
if(obj.value.substring(obj.value.length-2,obj.value.length)>31)
{
obj.value=obj.value.substring(0,obj.value.length-2)+"0"+obj.value.substring(obj.value.length-2,obj.value.length-1);
}
}
if(obj.value.length>10)
{
obj.value=obj.value.substring(0,obj.value.length-1);
}
}
// 表格添加一行后调整序号
function f_adjust_seq(tbody) {
	var $tds = $(tbody).children().children();
	$tds.has("label").each(function(index){
		$(this).find("label").html(index+1);
	});
}
// 删除表格的一行
function f_delete_row(obj) {
	if (window.confirm("确认需要删除吗？")) {
		var $row = $(obj).parents("tr");
		var $tbody = $row.parents("tbody");
		$row.remove();
		f_adjust_seq($tbody);
	} else {
		$(obj).attr("checked", false);
	}
}
// 删除一行的提示方法，便于统一提示信息
function f_confirm() {
	if (window.confirm("确认需要删除吗？")) {
		return true;
	}
	return false;
}
// 报表填报时间选择（公共调用）
function f_tbsjxz(qx,nd,zbid) {
	if (!qx) { qx = "bmbm"; } // 区县
	if (!nd) { nd = "nd"; } // 年度
	if (!zbid) { zbid = "dbbzb_id"; } // 报表
	qx = $("#" + qx).val();
	nd = $("#" + nd).val();
	zbid = $("#" + zbid).val();
	window.open("/insect/tbsjxz.do?ACT_TYPE=QUERY&bmbm=" + qx + "&nd=" + nd + "&dbbzb_id=" 
			+ zbid, "tbsjxz", "width=750px,height=550px,top=140px,left=350px,scroolbar=yes");
}
// 报表选择（公共调用）
function f_bbxz() {
	window.open("/insect/common/bbxz/bbxz.jsp","bbxz","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=600, height=500");
	/*var bb = window.showModalDialog("/insect/common/bbxz/bbxz.jsp", window, "dialogWidth=600px;dialogHeight=500px;status=no;scrollbars=no");
	if (bb == undefined) {
		bb = window.returnValue;
	}
	if (bb) {
		$("#dbbzb_id").val(bb.split(",")[0]);
		$("#bbmc").val(bb.split(",")[1]);
	}
	bb = null;*/
}
