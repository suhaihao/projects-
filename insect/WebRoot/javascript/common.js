/**
 * common js
 * 
 */
//ʱ��ռ䷽��
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
// ������һ�к�������
function f_adjust_seq(tbody) {
	var $tds = $(tbody).children().children();
	$tds.has("label").each(function(index){
		$(this).find("label").html(index+1);
	});
}
// ɾ������һ��
function f_delete_row(obj) {
	if (window.confirm("ȷ����Ҫɾ����")) {
		var $row = $(obj).parents("tr");
		var $tbody = $row.parents("tbody");
		$row.remove();
		f_adjust_seq($tbody);
	} else {
		$(obj).attr("checked", false);
	}
}
// ɾ��һ�е���ʾ����������ͳһ��ʾ��Ϣ
function f_confirm() {
	if (window.confirm("ȷ����Ҫɾ����")) {
		return true;
	}
	return false;
}
// �����ʱ��ѡ�񣨹������ã�
function f_tbsjxz(qx,nd,zbid) {
	if (!qx) { qx = "bmbm"; } // ����
	if (!nd) { nd = "nd"; } // ���
	if (!zbid) { zbid = "dbbzb_id"; } // ����
	qx = $("#" + qx).val();
	nd = $("#" + nd).val();
	zbid = $("#" + zbid).val();
	window.open("/insect/tbsjxz.do?ACT_TYPE=QUERY&bmbm=" + qx + "&nd=" + nd + "&dbbzb_id=" 
			+ zbid, "tbsjxz", "width=750px,height=550px,top=140px,left=350px,scroolbar=yes");
}
// ����ѡ�񣨹������ã�
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
