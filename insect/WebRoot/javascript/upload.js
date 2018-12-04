var imgs = $$("imgs");
function AddPreview(){
	var file = document.createElement("input"),
		img = document.createElement("img"),
		ip = new ImagePreview( file, img, {
				maxWidth:	80,
				maxHeight:	50,
				action:		"",
				onErr:		function(){ alert("载入预览出错！"); ResetFile(file); },
				onCheck:	CheckPreview,
				onShow:		ShowPreview
			});
	file.type = "file"; file.name = "pic";
	file.onchange = function(){ ip.preview(); };
	$$("idPicFile").appendChild(file);
}

//检测程序
var exts = "jpg|gif|bmp|png", paths = "|";
function CheckPreview(){
	var value = this.file.value, check = true;
	if ( !value ) {
		check = false; alert("请先选择文件！");
	} else if ( !RegExp( "\.(?:" + exts + ")$$", "i" ).test(value) ) {
		check = false; alert("只能上传以下类型：" + exts);
	} else if ( paths.indexOf( "|" + value + "|" ) >= 0 ) {
		check = false; alert("已经有相同文件！");
	}
	check || ResetFile(this.file);
	return check;
}

//显示预览
function ShowPreview(){
	var	file = this.file, value = file.value, oThis = this;
	var li = document.createElement("li");
	var b = document.createElement("b");
	var a = document.createElement("a");
	b.title = value;
	a.href = "javascript:void(0)";
	a.title = "删除";
	a.className = "del";
	a.innerHTML = "X";
	a.onclick = function(){
		file.value = ""; file.outerHTML = file.outerHTML;
		oThis.dispose(); imgs.removeChild(li);
		paths = paths.replace(value, ""); return false;
	};

	b.appendChild(this.img);
	li.appendChild(b);
	li.appendChild(a);
	imgs.appendChild(li);

	paths += value + "|";
	AddPreview();
}

AddPreview();

function ResetFile(file){
	file.value = "";//ff chrome safari
	if ( file.value ) {
		if ( $$B.ie ) {//ie
			with(file.parentNode.insertBefore(document.createElement('form'), file)){
				appendChild(file); reset(); removeNode(false);
			}
		} else {//opera
			file.type = "text"; file.type = "file";
		}
	}
}

function changeType_yhsw() {
	var val = document.getElementById("wjlx").value;
	if (val == "01") {
		document.getElementById("tr_tp").style.display = "";
		document.getElementById("tr_tplx").style.display = "";
		document.getElementById("tr_other").style.display = "none";
	} else {
		document.getElementById("tr_tp").style.display = "none";
		document.getElementById("tr_tplx").style.display = "none";
		document.getElementById("tr_other").style.display = "";
	}
	document.getElementById("file").value = "";
	document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;
	//document.getElementById("imgs").innerHTML = "";
}
function changeType_yhsw_yhsw() {
	var val = document.getElementById("wjlx").value;
	if (val == "01") {
		document.getElementById("tr_tp").style.display = "";
		document.getElementById("tr_tplx").style.display = "none";
		document.getElementById("tr_other").style.display = "none";
	} else {
		document.getElementById("tr_tp").style.display = "none";
		document.getElementById("tr_tplx").style.display = "none";
		document.getElementById("tr_other").style.display = "";
	}
	document.getElementById("file").value = "";
	document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;
	//document.getElementById("imgs").innerHTML = "";
}
function init(jc) {
	document.getElementById("wjlx").selectedIndex = -1;
	if (jc && jc.toLowerCase() == "dzj06_fj") {
		document.getElementById("tr_lx").style.display = "";
	}
}
function subform_yhsw() {
	var val = document.getElementById("wjlx").value;
	if (val == "") {
		alert("请选择文件类型");
		return;
	} else {
		var file = document.getElementById("file");
		var ext = file.value.substr(file.value.lastIndexOf(".") + 1);
		var exts = "";
		if (val == "01") {
			if (document.getElementById("tplx").value == "") {
				alert("请选择图片类型");
				return;
			} else if (document.getElementById("imgs").innerHTML == "") {
				alert("请选择图片");
				return;
			}
		} else if (val == "02") {
			exts = "txt,pdf,doc,xls,ppt";
			if (file.value == "") {
				alert("请选择文件");
				return;
			} else if (exts.indexOf(ext) < 0) {
				alert("只能选择" + exts + "文件");
				file.value = "";
				file.outerHTML = file.outerHTML;
				return;
			}
		} else if (val == "03") {
			exts = "mp4,3gp,avi,rmvb,wmv";
			if (file.value == "") {
				alert("请选择文件");
				return;
			} else if (exts.indexOf(ext) < 0) {
				alert("只能选择" + exts + "文件");
				file.value = "";
				file.outerHTML = file.outerHTML;
				return;
			}
		} else if (val == "04") {
			exts = "mp3,wav,wma";
			if (file.value == "") {
				alert("请选择文件");
				return;
			} else if (exts.indexOf(ext) < 0) {
				alert("只能选择" + exts + "文件");
				file.value = "";
				file.outerHTML = file.outerHTML;
				return;
			}
		} else if (val == "99") {
			if (file.value == "") {
				alert("请选择文件");
				return;
			}
		}
	}
	document.forms[0].submit();
}
function changeType_jz() {
	var val = document.getElementById("wjlx").value;
	if (val == "01") {
		document.getElementById("tr_tp").style.display = "";
		document.getElementById("tr_other").style.display = "none";
	} else {
		document.getElementById("tr_tp").style.display = "none";
		document.getElementById("tr_other").style.display = "";
	}
	document.getElementById("file").value = "";
	document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;
	//document.getElementById("imgs").innerHTML = "";
}
function subform_jz() {
	var val = document.getElementById("wjlx").value;
	if (val == "") {
		alert("请选择文件类型");
		return;
	} else {
		var file = document.getElementById("file");
		var ext = file.value.substr(file.value.lastIndexOf(".") + 1);
		var exts = "";
		if (val == "01") {
			if(document.getElementById("imgs").innerHTML == "") {
				alert("请选择图片");
				return;
			}
		} else if (val == "02") {
			exts = "txt,pdf,doc,xls,ppt";
			if (file.value == "") {
				alert("请选择文件");
				return;
			} else if (exts.indexOf(ext) < 0) {
				alert("只能选择" + exts + "文件");
				file.value = "";
				file.outerHTML = file.outerHTML;
				return;
			}
		} else if (val == "03") {
			exts = "mp4,3gp,avi,rmvb,wmv";
			if (file.value == "") {
				alert("请选择文件");
			} else if (exts.indexOf(ext) < 0) {
				alert("只能选择" + exts + "文件");
				file.value = "";
				file.outerHTML = file.outerHTML;
				return;
			}
		} else if (val == "04") {
			exts = "mp3,wav,wma";
			if (file.value == "") {
				alert("请选择文件");
			} else if (exts.indexOf(ext) < 0) {
				alert("只能选择" + exts + "文件");
				file.value = "";
				file.outerHTML = file.outerHTML;
				return;
			}
		} else if (val == "99") {
			if (file.value == "") {
				alert("请选择文件");
				return;
			}
		}
	}
	document.forms[0].submit();
}
function subform_other(jc) {
	var val = document.getElementById("wjlx").value;
	if (val == "") {
		alert("请选择文件类型");
		return;
	} else {
		var file = document.getElementById("file");
		var ext = file.value.substr(file.value.lastIndexOf(".") + 1);
		var exts = "";
		if (jc.toLowerCase() == "dzj06_fj") {
			if (document.getElementById("qtlx").value == "") {
				alert("请选择类型");
				return;
			}
		}
		if (val == "01") {
			if (document.getElementById("imgs").innerHTML == "") {
				alert("请选择图片");
				return;
			}
		} else if (val == "02") {
			exts = "txt,pdf,doc,xls,ppt";
			if (file.value == "") {
				alert("请选择文件");
				return;
			} else if (exts.indexOf(ext) < 0) {
				alert("只能选择" + exts + "文件");
				file.value = "";
				file.outerHTML = file.outerHTML;
				return;
			}
		} else if (val == "03") {
			exts = "mp4,3gp,avi,rmvb,wmv";
			if (file.value == "") {
				alert("请选择文件");
				return;
			} else if (exts.indexOf(ext) < 0) {
				alert("只能选择" + exts + "文件");
				file.value = "";
				file.outerHTML = file.outerHTML;
				return;
			}
		} else if (val == "04") {
			exts = "mp3,wav,wma";
			if (file.value == "") {
				alert("请选择文件");
				return;
			} else if (exts.indexOf(ext) < 0) {
				alert("只能选择" + exts + "文件");
				file.value = "";
				file.outerHTML = file.outerHTML;
				return;
			}
		} else if (val == "99") {
			if (file.value == "") {
				alert("请选择文件");
				return;
			}
		}
	}
	document.forms[0].submit();
}