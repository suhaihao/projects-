/*
 * 计算关系，自动计算
 */
function f_jsgs(obj) {
	var single_value;
	var end_value;
	if ($(obj).parents("tbody").attr("id") != "zg_body") return;
	for (var ll_gs=0; ll_gs < jsgs.length; ll_gs++) {
		var single_jsgs = jsgs[ll_gs]; // jsgs[ll_gs] 为jsgs[N01+N02]
		$(obj).parents("tr").children().each(function(){
			var _inp = $(this).children("input").first();
			var _id = _inp.attr("id");
			if (_id != "" && single_jsgs.indexOf(_id) >= 0) { // 如果检索到为自动计算的项
				single_value = _inp.val(); // 获取jsgs[N01+N02]中N01,N02的值，即对应表单元素的value值
				if (isNaN(single_value)) {
					_inp.val("");
					single_value = 0;
				}
				if (single_value == "") single_value = "0";
				var re = new RegExp(_id,"g"); // 匹配所有
				// 前 N01+N02  N5+N6+N7
				single_jsgs=single_jsgs.replace(re,single_value); // 把所有的single_name替换为single_value
				// 后     0+1      1+2+2
			}
		});
		end_value = eval(single_jsgs);
		if (end_value == Infinity) end_value = 0;
		if (isNaN(end_value) == true) end_value = 0;
		if (end_value == 0) end_value = 0;
		if ($("#zg_body tr").length == 1) {
			var _hj = $("form").find("input[id='"+gsjg[ll_gs]+"']");
			if (obj.id == _hj.attr("id")) return; // 如果为合计项，跳过不计算
			_hj.val(dataFormat(end_value));
		} else {
			var _index = $(obj).parents("tr").index();
			var _hj = $("form").find("input[id='"+gsjg[ll_gs]+"']").eq(_index);
			if (obj.id == _hj.attr("id")) return; // 如果为合计项，跳过不计算
			_hj.val(dataFormat(end_value));
		}
	}
}
/*
 * 校验关系
 */
function f_jygx() {
	var single_value;
	var end_value;
	var zg_body = $("#zg_body")[0];
	for (var ll_gs=0; ll_gs<jygx.length; ll_gs++) {
		var single_jygx = jygx[ll_gs];
		for(var ii_col=0;ii_col< $(zg_body).children("tr").first().children("td").length;ii_col++){
			var _inp = $("#zg_body tr").eq(ll_gs).children("td").eq(ii_col).children("input").first();
			var _id = _inp.attr("id");
			if (_id != "" && single_jygx.indexOf(_id) >= 0) {
				single_value = _inp.val();
				if (isNaN(single_value)) {
					_inp.val("");
					single_value = 0;
				}
				if (single_value=="") single_value = "0";
				var re = new RegExp(_id, "g");
				single_jygx = single_jygx.replace(re, single_value);
			}
		}
		end_value = eval(single_jygx);
		if (end_value == false) {
			alert(jyts[ll_gs]);
			return;
		}
	}
}
function dataFormat(lf_1){
	var lf_2;
	lf_2 = Math.round(parseFloat(lf_1) * 100);
	if (!isFinite(lf_2)){ return ""; }
	if (isNaN(lf_2)){ return ""; }
	return lf_2 / 100;
}
function focusTR(obj) {
	$(obj).siblings().each(function(){
		$(this).children("td").css("backgroundColor", "#F4F4F4");
		$(this).attr("isselected", "false");
	});
	$(obj).children("td").css("backgroundColor", "lightblue");
	$(obj).attr("isselected", "true");
}
function add_row(){
	var _tr = $("tr[isselected='true']");
	if (!_tr.is("tr")) {
		_tr =$("#zg_body").children("tr").first();
	}
	var newTr = _tr.clone();
	newTr.children("td").css("backgroundColor", "#F4F4F4");
	newTr.attr("isselected", "false");
	$("#zg_body").append(newTr);
}
function del_row(){
	if ($("#zg_body tr").length == 1) {
		alert("只有一行，不可以再删了^_^");
		return;
	}
	var _tr = $("tr[isselected='true']");
	if (!_tr.is("tr")) {
		alert("请选择要删除的行^_^");
		return;
	}
	_tr.remove();
}
