var gll_row
var gll_row_table
// var gdictionary_jf = new ActiveXObject("Scripting.Dictionary");
 function reset_click(){
	 window.close();
 }
 function MM_startTimeout(){
 }
function fdiv_query()
{  div_query.style.visibility="visible"  }
function trim(ls_1) {
     var ls_0
     do {
          ls_0= ls_1.substring(0,1)
          ls_1=(ls_0==" "?"":ls_0)+ls_1.substring(1)
        }
    while ( ls_1.substring(0,1) ==" ")
    return ls_1
}
function trim_h(ls_1) {
     var ls_0
     do {
          ls_0= ls_1.substring(0,1)
          ls_1=(ls_0=="_"?"":ls_0)+ls_1.substring(1)
        }
    while ( ls_1.substring(0,1) =="_")
    return ls_1
}

function f_init(obj,cs){		// 用于update取数
        var arr,ll_pos,arr_elem_name,arr_elem_seq,ii
        var gitem,gkey
        var single_item

	if (cs!=0 ) {
	  for (i=0;i < gll_row;i++){   add(zg,zg_body)  }
	}
	gitem = (new VBArray(gdictionary_jf.Items())).toArray();
        gkey = (new VBArray(gdictionary_jf.Keys())).toArray();
         for (i in gkey) {
                 ll_pos=gkey[i].indexOf("[")

                 if (ll_pos >=0) {
                     arr_elem_name=gkey[i].substr(0,ll_pos)
                     arr_elem_seq=gkey[i].substr(ll_pos)
                 } else
                 { arr_elem_name=gkey[i]
                   arr_elem_seq=""           }
                  if ( eval(obj.name+".elements('"+arr_elem_name+"')"+arr_elem_seq)+""=="null") { continue; }
                  if ( eval(obj.name+".elements('"+arr_elem_name+"')"+arr_elem_seq+".length")+""!="undefined" ){ // 处理radio
                    if ( eval(obj.name+".elements('"+arr_elem_name+"')"+arr_elem_seq+"(0).type")=="radio" || eval(obj.name+".elements('"+arr_elem_name+"')"+arr_elem_seq+"(0).type")=="checkbox" ) {

                    	 arr=eval(obj.name+".elements('"+gkey[i]+"').length")
                         for (ii=0;ii < arr ; ii++)
                         { if (eval(obj.name+".elements('"+gkey[i]+"')("+ii+").value")==gitem[i] ) {
                              eval(obj.name+".elements('"+gkey[i]+"')("+ii+").checked=true")        }
                         }  }
                     else if (eval(obj.name+".elements('"+arr_elem_name+"')"+arr_elem_seq+".type")=="select-multiple" ) {
                      	    var selectobj=eval(obj.name+".elements('"+arr_elem_name+"')"+arr_elem_seq)

                      	    for ( ii=0;ii < selectobj.length; ii++)
                            {  selectobj.options[ii].selected=false
                              single_item=gitem[i].split(",")
                      	    for ( var i_single=0; i_single <single_item.length;i_single++) {
                      	       var single_multi=single_item[i_single]
                               if ( trim(single_multi)==trim(selectobj.options[ii].value) && trim(selectobj.options[ii].value) !="" ) {
                                    selectobj.options[ii].selected=true 	                                           }
                                 }
                            }
                      	}
                    else { eval(obj.name+".elements('"+arr_elem_name+"')"+arr_elem_seq+".value='"+gitem[i]+"'" )  }    // 处理select
                 } else{
                     var obj1
                     eval("obj1="+obj.name+".elements(\""+arr_elem_name+"\")"+arr_elem_seq)

                      if ( eval(obj.name+".elements('"+arr_elem_name+"')"+arr_elem_seq+".type")=="radio" || eval(obj.name+".elements('"+arr_elem_name+"')"+arr_elem_seq+".type")=="checkbox" ) {

                        if ( gitem[i]=="1" ) { obj1.checked=true }
                      }
                      else {
                         obj1.value=gitem[i]
                         }
                     // eval(obj.name+".elements(\""+arr_elem_name+"\")"+arr_elem_seq+".value=\""+gitem[i]+"\""
						// )
                    }
        }
        gdictionary_jf.RemoveAll()
	gll_row=0
	}


function list_action(s_value){ // 仿照struts forwrd
	var spath,spath1,spath2,sreg
        spath=window.location+"?"
        spath1= spath.substring(0,spath.indexOf("?") )
        if (s_value=="1") {      // list页面转insert页面
           srg=/_list.asp/g
           spath2=spath1.replace(srg,"_insert.asp")
                        }
        else if (s_value=="2") { // insert页面转list页面
           srg=/_insert.asp/g
           spath2=spath1.replace(srg,"_list.asp")
        }
        else if (s_value=="3") { // update页面转list页面
           srg=/_update.asp/g
           spath2=spath1.replace(srg,"_list.asp")
           spath2=spath2+"?csbz=1"
        } else if (s_value=="4") { // update页面转insert页面
           srg=/_update.asp/g
           spath2=spath1.replace(srg,"_insert.asp")
           spath2=spath2+"?csbz=1"
        }
        window.location=spath2
}
function update_action(obj,s_value){  // 传递提交路径
	obj.form.action=s_value
	obj.form.submit()
	}
function f_delete(obj){  // 用于提交
    obj.form.submit()
}
function f_confirm(var_str)    // 用于提示
{   if ( window.confirm(var_str) ==1) { return true  }
   else { return false  }
	}

function td_c(obj){   // 用于表格对象事件
        // obj.style.backgroundColor ="red"
         var asd= obj.parentElement.parentElement
         var color
         gll_row_table=asd.rowIndex
         // cellIndex
         var asd0= obj.parentElement.parentElement.parentElement
         var ll_1 =asd.cells.length
         var ll_2 =asd0.rows.length
         var ll_0=0,ll_22=0
         for (ll_00=0;ll_00< ll_2;ll_00++){
              // alert(asd0.rows[ll_00].cells(0))
              if (asd0.rows[ll_00].cells(0)+""=="null"){ continue;}
                // if (
				// eval(obj.name+".elements('"+arr_elem_name+"')"+arr_elem_seq)+""=="null")
				// { continue; }
              color=asd0.rows[ll_00].cells(0).childNodes[0].style.backgroundColor;
              if (color+"" =="lightsteelblue"){
              	  for (ll_0=0;ll_0<ll_1;ll_0++){
              	    if (asd0.rows[ll_00].cells(ll_0).childNodes[0].tagName=="LABEL"
              	        ||asd0.rows[ll_00].cells(ll_0).childNodes[0].type=="checkbox"
              	        ||asd0.rows[ll_00].cells(ll_0).childNodes[0].type=="radio" ) {
              	    	for (ll_22=0; ll_22 < asd0.rows[ll_00].cells(ll_0).childNodes.length;ll_22++){
              	        asd0.rows[ll_00].cells(ll_0).childNodes[ll_22].style.backgroundColor="#E7EADD"   }


                    } else {
                        for (ll_22=0; ll_22 < asd0.rows[ll_00].cells(ll_0).childNodes.length;ll_22++){
                            asd0.rows[ll_00].cells(ll_0).childNodes[ll_22].style.backgroundColor="#D4E7F2"
                        }
                    }
                	for (ll_22=0; ll_22 < asd0.rows[ll_00].cells(ll_0).childNodes.length;ll_22++){
                        asd0.rows[ll_00].cells(ll_0).childNodes[ll_22].style.fontWeight= "normal"
                    }
                  }
              }
         }
         for (ll_0=0;ll_0<ll_1;ll_0++)
         {    // t20r.children
            for (ll_22=0; ll_22 < asd.cells(ll_0).childNodes.length;ll_22++){
              asd.cells(ll_0).childNodes[ll_22].style.backgroundColor="lightsteelblue"
              asd.cells(ll_0).childNodes[ll_22].style.fontWeight= "bold"        }

         }

                    }


function td_cc(obj){   // 用于表格事件
        var asd= obj.parentElement
         var color
         var row_table=asd.rowIndex
         // cellIndex
         var asd0= obj.parentElement.parentElement
         var ll_1 =asd.cells.length
         var ll_2 =asd0.rows.length

         var ll_0=0,ll_22=0
         for (ll_00=0;ll_00< ll_2;ll_00++){
              if (asd0.rows[ll_00].cells(0)+""=="null"){ continue;}
              color=asd0.rows[ll_00].cells(0).style.backgroundColor;
         // if ( color+""=="lightsteelblue") {
              	  for (ll_0=0;ll_0<ll_1;ll_0++){
                            asd0.rows[ll_00].cells(ll_0).style.backgroundColor="#FFFFFF"
                            asd0.rows[ll_00].cells(ll_0).style.fontWeight= "normal"
                    }
           // }
         }
         for (ll_0=0;ll_0<ll_1;ll_0++)
         {  // alert("d")
              asd.cells(ll_0).style.backgroundColor="lightsteelblue"
              asd.cells(ll_0).style.fontWeight= "bold"
         }
                    }

function td_cc_bak(obj){   // 用于表格事件
        var asd= obj.parentElement
         var color
         var row_table=asd.rowIndex
         // cellIndex
         var asd0= obj.parentElement.parentElement
         var ll_1 =asd.cells.length
         var ll_2 =asd0.rows.length

         var ll_0=0,ll_22=0
         for (ll_00=0;ll_00< ll_2;ll_00++){
              if (asd0.rows[ll_00].cells(0)+""=="null"){ continue;}
              color=asd0.rows[ll_00].cells(0).style.backgroundColor;
              if ( color+""=="lightsteelblue") {
              	  for (ll_0=0;ll_0<ll_1;ll_0++){
                            asd0.rows[ll_00].cells(ll_0).style.backgroundColor="#B1D5F9"
                            asd0.rows[ll_00].cells(ll_0).style.fontWeight= "normal"
                    }
                                               }
         }
         for (ll_0=0;ll_0<ll_1;ll_0++)
         {  // alert("d")
              asd.cells(ll_0).style.backgroundColor="lightsteelblue"
              asd.cells(ll_0).style.fontWeight= "bold"
         }
                    }



function  f_location(cs,obj){
         var ctr= obj.parentElement
         var color
         var ll_1 =ctr.cells.length
         var ll_0=0,ll_22=0

         for (ll_0=0;ll_0<ll_1;ll_0++){
              ctr.cells(ll_0).style.color="white"
              ctr.cells(ll_0).style.fontWeight= "normal"
         }

           iframe0.document.location="menu.asp?cs="+cs
           iframe1.document.location="/public/blank.htm"
           obj.style.color="yellow"
           obj.style.fontWeight= "bold"


}


function mouseout(cs)  {
// cs.style.backgroundColor ="#B1D5F9"
  cs.style.fontWeight= "normal"
}
function mouseover(cs){
  // cs.style.backgroundColor ="#e5f3fd"
   cs.style.fontWeight= "bold"
}

function f_delete_row(obj){
var row= obj.parentElement.parentElement;
var table =obj.parentElement.parentElement.parentElement.parentElement;
var tbody = row.parentElement;
if ( f_confirm("确认需要删除吗") ){
     try
    {
	   table.deleteRow(row.rowIndex);
       f_adjust_seq(tbody);
    }
    catch (err){}

   }
else{
	   obj.checked=false;
}

}
function f_adjust_seq(tbody){
	    if (tbody.rows[0].cells(0).childNodes[0].tagName=="LABEL") {
           for (i=0;i < tbody.rows.length ;i++){
					 tbody.rows[i].cells(0).childNodes[0].innerHTML= i + 1
                                             }
		}
}


function delTr(table,tbody)
    {   // table：表名

        if ( gll_row_table =="" || gll_row_table+""=="undefined" ){
            alert("请选择当前行！")
                          }
        else {

           if (tbody.rows[0].cells(0).childNodes[0].tagName=="LABEL") {
           table.deleteRow(gll_row_table)
           for (i=0;i < tbody.rows.length ;i++){
                 if (tbody.rows.length<=1){ label_xh.innerHTML=1  }
                 else { label_xh(i).innerHTML= i + 1 }
                                             }
                                        }
            else {
             table.deleteRow(gll_row_table)
           }
           gll_row_table=""
             }
    }
function strlen(str)
{ var i;
  var len;
  len = 0;
  for (i=0;i<str.length;i++)
  { if (str.charCodeAt(i)>255) len+=2; else len++; }
  return len;
}

/* 检测字符串是否为空 */
function isnull(str)
{ var i;
  for (i=0;i<str.length;i++)
  {  if (str.charAt(i)!=' ') return false; }
  return true;
}

function toN(str)
{ var i;

  if (str==null || trim(str)=="")
  {
     return "0";
  }

  var re = /,/g;
   str= str.replace(re, "");
  if ( isNaN(str) ){
    return 0;
  }

  return str;
}

/* 检测字符串是否全为数字 */
function longint(str)
{
  // var number_chars = "1234567890";
  // var i;
  // for (i=0;i<str.length;i++)
  // { if (number_chars.indexOf(str.charAt(i))==-1) return false; }
  // return true;
  var reg= /^-?[1-9]*[0-9]+$/
  if (reg.test(str)) {
      return true
  }else {
     return false
  }
  return true
}

function dec(str)
{
  var reg= /^-?[0-9]*[0-9]+[.]?[0-9]*$/
  if (reg.test(str)) {
      return true
  }else {
     return false
  }
  return true
}

function char(str){
  var reg= /^([A-Z]|[a-z])+[0-9]*[_]*([A-Z]|[a-z]|[0-9])*$/
  if (reg.test(str)) {
      return true
  }else {
     return false
  }
  return true
}
function date(theStr){
             if (theStr=="" || theStr==null) {return true; }
             var the1st=theStr.indexOf("-");
             var the2nd=theStr.lastIndexOf("-");
             if (the1st==the2nd){return false;}
             else {
                   var y=theStr.substring(0,the1st);
                   var m=theStr.substring(the1st+1,the2nd);
                   var d=theStr.substring(the2nd+1,theStr.length);
                   if (isNaN(d) ) { return false; }
                   var maxDays=31;
                   if (isNaN(m)==true||isNaN(d)==true||isNaN(y)==true){ return false; }
                   else if (y.length < 4||y.length > 4 ) { return false ;}
                   else if (m.length > 2 ) { return false ;}
                   else if (d.length > 2 ) { return false ;}
                   else if (!isBetween(parseFloat(m),1,12)){ return false; }
                   else if (m==4||m==9||m==11||m==6){ maxDays=30;}
                   else if(m==2){
                        if (y % 4 > 0) maxDays=28;
                        else if (y% 100==0 && y % 400 > 0) maxDays=28;
                        else maxDays=29; }
                   if (isBetween(parseFloat(d),1,maxDays) ==false) { return false;}
                   else {return true; }
                    }
                   return true
}

 function isBetween (val,lo,hi ){
         if(parseInt(val) <parseInt(lo) ||parseInt(val) >parseInt(hi) ) {return false }
         else {return true }
         return true                           }
/* 校验textarea的长度 */
function f_textarea(input){
	var var_valuye=input.value
	// alert(input.maxlength)
	// alert(var_valuye.length)
	if (parseInt(input.maxlength) < parseInt(var_valuye.length)  )
	{    alert("["+input.chname+"]数据长度不能超过["+input.maxlength+"];当前长度["+var_valuye.length+"]" )
		  return false
		}
}

/* 检测指定文本框输入是否合法 */
function verifyInput(input)
{
var i;
if ( input.tagName=="TEXTAREA" ){
      if (f_textarea(input)==false){
      	  return false;
      	}
    }
if (input.getAttribute('nullable')=="no"&&isnull(input.value))
{
  alert("["+input.getAttribute('chname')+"]不能为空");
  input.focus();
  return false;
}
else if (input.value.length==0) {

}
else
{ // 数据类型校验

  switch(input.datatype)
  {
    case "longint":
     if (longint(input.value)==false)
     { alert("["+input.chname+"]值应该全为数字");
       return false
     }
     break;
    case "dec":
     if (dec(input.value)==false)
     { alert("["+input.chname+"]值应该全为数字");
       return false
     }
     break;
    case "char":
      if (char(input.value)==false)
     { alert("["+input.chname+"]值应该全为字符");
       return false
     }
     break;
    case "date":
     if (date(input.value)==false)
     { alert("["+input.chname+"]值应该为日期类型");
       return false
     }
    break;
   default:
     break;
  }
}
  return true
}

/*
 * 检测指定FORM表单所有应被检测的元素 （那些具有自定义属性的元素）是否合法，此函数用于表单的onsubmit事件
 */
function verifyAll(myform)
{
  var i;
  for (i=0;i<myform.elements.length;i++)
  {
    // if (myform.elements[i].value=="保存"){ alert("d") }
    // alert(myform.elements[i].value)
    if (myform.elements[i].chname+""=="undefined") continue;
    if (verifyInput(myform.elements[i])==false)
    {
       myform.elements[i].focus();
       return false;
    }
   }
  return true;
}

function xxts_s(obj){
 if (document.getElementById("div_xx") ==null) {
   ad_box=document.createElement("<div id=div_xx name=div_xx></div>");
   document.body.appendChild(ad_box);
 }
x = (document.layers) ? obj.pageX : document.body.scrollLeft+event.clientX
y = (document.layers) ? obj.pageY : document.body.scrollTop+event.clientY
ls_1=" <div name=div_xx id=div_xx> "
if ( obj.selectedIndex==-1 ) return
ls_2= obj.value +":"+obj.options[obj.selectedIndex].text
if (ls_2.length < 1) { div_xx.style.visibility="hidden"
                       return
}
ls_1=ls_1+" <table border=0 bordercolor='#000000' bordercolordark='#fa8072' cellpadding=0 cellspacing=0 style='font-size:14px; BACKGROUND-COLOR:#99cccc; position:absolute;left:"+x+";top:"+y+"' cellpadding=0 style='filter: Alpha(Opacity=50);Z-INDEX:600;' width="+ls_2.length+"> "
ls_1=ls_1+"<tr><td style='COLOR:#191970;height:24px;font-size: 10pt;'>"+ls_2+"</td><td> </td></tr> "
ls_1=ls_1+" </table> "
ls_1=ls_1+"</div>"

div_xx.outerHTML=ls_1
}

function xxts(obj){
 if (document.getElementById("div_xx") ==null) {
   ad_box=document.createElement("<div id=div_xx name=div_xx></div>");
   document.body.appendChild(ad_box);
 }
x = (document.layers) ? obj.pageX : document.body.scrollLeft+event.clientX
y = (document.layers) ? obj.pageY : document.body.scrollTop+event.clientY
ls_1=" <div name=div_xx id=div_xx> "
ls_2= obj.value
if (ls_2.length < 1) { div_xx.style.visibility="hidden"
                       return
}
ls_1=ls_1+" <table border=0 bordercolor='#000000' bordercolordark='#fa8072' cellpadding=0 cellspacing=0 style='font-size:14px; BACKGROUND-COLOR:#99cccc; position:absolute;left:"+x+";top:"+y+"' cellpadding=0 style='filter: Alpha(Opacity=50);Z-INDEX:600;' width="+ls_2.length+"px> "
ls_1=ls_1+"<tr><td style='COLOR:#191970;height:24px;font-size: 10pt;'>"+ls_2+"</td><td> </td></tr> "
ls_1=ls_1+" </table> "
ls_1=ls_1+"</div>"
div_xx.outerHTML=ls_1
}

function xx_out(){ div_xx.style.visibility="hidden" ;
}

var date_start,date_end,g_object
var disble_ground=new Image;
// var a1=new Image;
// var a2=new Image;
// a1.src="/a1.gif";
// a2.src="/a2.gif";
disble_ground.src="bg.gif";
// mode :时间变换的类型0-年 1-月 2-直接选择月
function change_date(temp,mode)
{var t_month,t_year
    if (mode){
        if(mode==1)
        t_month=parseInt(cele_date_month.value,10)+parseInt(temp,10);
        else
        t_month=parseInt(temp)
        if (t_month<cele_date_month.options(0).text) {
            cele_date_month.value=cele_date_month.options(cele_date_month.length-1).text;
            change_date(parseInt(cele_date_year.value,10)-1,0);
            }
        else{
            if (t_month>cele_date_month.options(cele_date_month.length-1).text){
                cele_date_month.value=cele_date_month.options(0).text;
                change_date(parseInt(cele_date_year.value,10)+1,0);
                }
            else
                {cele_date_month.value=t_month;
                 set_cele_date(cele_date_year.value,cele_date_month.value);
                }
        }
    }
    else{
        t_year=parseInt(temp,10);
        if (t_year<cele_date_year.options(0).text) {
            cele_date_year.value=cele_date_year.options(0).text;
            set_cele_date(cele_date_year.value,1);
            }
        else{
            if (parseInt(t_year,10)>parseInt(cele_date_year.options(cele_date_year.length-1).text,10)){
                cele_date_year.value=cele_date_year.options(cele_date_year.length-1).text;
                set_cele_date(cele_date_year.value,12);
                }
            else
                {cele_date_year.value=t_year;
                 set_cele_date(cele_date_year.value,cele_date_month.value);
                }
        }
    }
}
// 初始化日历
function init(d_start,d_end){
     var temp_str;
     var i=0
     var j=0
     date_start=new Date(1940,1,1)
     date_end=new Date(2044,8,1)
     // 必须要有内容（奇怪）
     // document.writeln("<div name=\"cele_date\" id=\"cele_date\"
		// style=\"display:none\" style=\"LEFT: 69px; POSITION: absolute; TOP:
		// 159px\" onClick=\"event.cancelBubble=true;\" >&nbsp; </div>");

     if (document.getElementById("cele_date") ==null) {
         ad_box=document.createElement("<div name=\"cele_date\" id=\"cele_date\"  style=\"display:none\" style=\"LEFT: 69px; POSITION: absolute; TOP: 159px\" onClick=\"event.cancelBubble=true;\" >&nbsp;</div>");
         document.body.appendChild(ad_box);
      }
     window.cele_date.innerHTML="";
     temp_str="<table bgColor=#E7E7E7 width=230px bordercolor=silver style='BORDER-RIGHT: #696969 2px solid; BORDER-TOP: indigo 0px solid; BORDER-LEFT: ";
     temp_str+="#696969 2px solid; BORDER-BOTTOM: #696969 2px solid' cellSpacing=1 cellPadding=0 border=0 language=\"javascript\"><tr>";
     temp_str+="<td><input type=button style=\"border:0;BACKGROUND-COLOR:#E7E7E7\" id=s_a1 name=s_a1 value=\"<<\" language=\"javascript\" onclick=\"change_date(-1,1)\" >";// 左面的箭头
     temp_str+="</td>"// 年
     temp_str+="<td style='font-size:10pt;text-align:cetnter' colspan=3><select name=\"cele_date_year\" id=\"cele_date_year\" style=\"width:75px \" language=\"javascript\" onchange=\"change_date(this.value,0)\">"
     for (i=1940;i<=2024;i++)     {
     temp_str+="<OPTION value=\""+i.toString()+"\">"+i.toString()+"</OPTION>";
     }
     temp_str+="</select>&nbsp;";
     temp_str+="</td>"// 月
     temp_str+="<td style='font-size:10pt' colspan=2><select name=\"cele_date_month\" id=\"cele_date_month\" style=\"width:55px \" language=\"javascript\" onchange=\"change_date(this.value,2)\" >"
     for (i=1;i<=12;i++)
     { temp_str+="<OPTION value=\""+i.toString()+"\">"+i.toString()+"</OPTION>"; }
       temp_str+="</select></td>";
       temp_str+=""// 右箭头
       temp_str+="<TD style='font-size:10pt;text-align:cetnter'><input type=button name=s_a2 style=\"border:0;BACKGROUND-COLOR:#E7E7E7\" value=\">>\" language=\"javascript\" onclick=\"change_date(1,1)\" >";
       temp_str+="</td></tr><tr style=\"BACKGROUND-COLOR:silver\"><td style='font-size:10pt;color:black;text-align:center'><b>"
       temp_str+="日</b></font></td><td style='font-size:10pt;color:black;text-align:center'><b>";
       temp_str+="一</b></font></td><td style='font-size:10pt;color:black;text-align:center'><b>";
       temp_str+="二</b></font></td><td style='font-size:10pt;color:black;text-align:center'><b>";
       temp_str+="三</b></FONT></td><td style='font-size:10pt;color:black;text-align:center'><b>";
       temp_str+="四</b></FONT></td><td style='font-size:10pt;color:black;text-align:center'><b>";
       temp_str+="五</b></FONT></td><td style='font-size:10pt;color:black;text-align:center'><b>";
       temp_str+="六</b></font></td></tr>";
     for (i=1 ;i<=6 ;i++)
     {  temp_str+="<tr>";
        for(j=1;j<=7;j++){
            temp_str+="<td name=\"c"+i+"_"+j+"\"id=\"c"+i+"_"+j+"\" style=\"CURSOR: hand;font-size:10pt;text-align:center\"  language=\"javascript\" onclick=\"td_click(this)\">&nbsp;</td>"
                         }
            temp_str+="</tr> "
     }
     temp_str+="</td></tr></table>";
     temp_str+="<iframe src=\"javascript:false\"  style=\"position:absolute; visibility:inherit; top:0px; left:0px; width:230px; height:150px; z-index:-1; filter='progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)';\"></iframe> "

     window.cele_date.innerHTML=temp_str;
     // document.all("s_a1").src=a1.src
     // document.all("s_a2").src=a2.src
       }
function set_cele_date(year,month)
{  var i,j,p,k
   var nd=new Date(year,month-1,1);
   zhj_d = new Date();
   event.cancelBubble=true;
   cele_date_year.value=year;
   cele_date_month.value=month;
   k=nd.getDay()-1
   for (i=1;i<=6;i++)
      for(j=1;j<=7;j++)
      { eval("c"+i+"_"+j+".innerHTML=\"\"");
        eval("c"+i+"_"+j+".bgColor=\"#F7FBFF\"");
        eval("c"+i+"_"+j+".style.cursor=\"hand\"");
       }
   while(month-1==nd.getMonth())
    { j=(nd.getDay() +1);
      p=parseInt((nd.getDate()+k) / 7)+1;
      eval("c"+p+"_"+j+".innerHTML="+"\""+nd.getDate()+"\"");
      if (nd.getDate()== zhj_d.getDate()  ) {
         eval("c"+p+"_"+j+".bgColor=\"#8fbc8b\"");
      }
      if (nd>date_end || nd<date_start)
      {  eval("c"+p+"_"+j+".style.backgroundImage.src=disble_ground.src");
         eval("c"+p+"_"+j+".bgColor=\"blue\"");
         eval("c"+p+"_"+j+".style.cursor=\"text\"");    }
         nd=new Date(nd.valueOf() + 86400000)
      }
}
// s_object：点击的对象；d_start-d_end有效的时间区段；需要存放值的控件；
function getAbsPosition(obj, offsetObj){
	var _offsetObj=(offsetObj)?offsetObj:document.body;
	var x,y
	x=obj.offsetLeft;
	y=obj.offsetTop;
	var tmpObj=obj.offsetParent;

	while ((tmpObj!=_offsetObj) && tmpObj){
		x+=tmpObj.offsetLeft+tmpObj.clientLeft-tmpObj.scrollLeft;
		y+=tmpObj.offsetTop+tmpObj.clientTop-tmpObj.scrollTop;
		tmpObj=tmpObj.offsetParent;
	}
	return ([x, y]);
}

function show_cele_date(eP,d_start,d_end,t_object)
{
   var s,cur_d
   var eT = eP.offsetTop;
   var eH = eP.offsetHeight;
   if (document.getElementById("cele_date") ==null) {  init("1901-01-01","2050-12-31")  ;   }
   var dH = window.cele_date.style.pixelHeight;
   var sT = document.body.scrollTop;
   event.cancelBubble=true;
   // window.cele_date.style.left = eP.offsetLeft;
   var pos=getAbsPosition(eP, document.body);
   var _posLeft=pos[0]+1;
   var _posTop=pos[1]+eP.offsetHeight+1;
   // _width=CalendarTable.offsetWidth;
   // _height=CalendarTable.offsetHeight;
   // var document_width=document.body.clientWidth + document.body.scrollLeft;
   // var document_height=document.body.clientHeight + document.body.scrollTop;
   // if (_posLeft+new_width>document_width && document_width>new_width)
	// _posLeft=document_width - new_width;
   // if (_posTop+new_height>document_height && pos[1]>new_height)
	// _posTop=pos[1]- new_height-1;
   // style.posLeft=_posLeft;
   // style.posTop=_posTop;
   window.cele_date.style.posLeft=_posLeft;
   window.cele_date.style.posTop=_posTop;
   // style.posTop=_posTop;
   // if(eT-dH >= sT && eT+eH+dH > document.body.clientHeight+sT)
   // window.cele_date.style.top = eT-dH;
   // else
   // window.cele_date.style.top = eT+eH;
   s=d_start.split("-")
   date_start=new Date(s[0],s[1]-1,s[2])
   s=d_end.split("-")
   date_end=new Date(s[0],s[1]-1,s[2])
   g_object=t_object
   cur_d=new Date()
   set_cele_date(cur_d.getYear(),cur_d.getMonth()+1);
   window.cele_date.style.display="block";
 }

function td_click(t_object)
{  var t_d
   if (parseInt(t_object.innerHTML,10)>=1 && parseInt(t_object.innerHTML,10)<=31 )
{  t_d=new Date(cele_date_year.value,cele_date_month.value-1,t_object.innerHTML)

if (t_d<=date_end && t_d>=date_start)
{ g_object.value=cele_date_year.value+"-"+cele_date_month.value+"-"+t_object.innerHTML
  window.cele_date.style.display="none";}
    }
}
function table_dbclick()
{ window.cele_date.style.display="none";
}
function h_cele_date()
{  window.cele_date.style.display="none";   }

function initcal(){
     var attrib
     for (i=0;i < window.document.forms.length;i++)
     {
        obj=window.document.forms[i]
        for (ii=0;ii < obj.elements.length;ii++){
               if (obj.elements[ii].datatype+""=="undefined")
                 {  continue;  }
               else if(obj.elements[ii].datatype=="date"){
                 attrib= obj.elements[ii].outerHTML
                 xx=""
                 // attrib= attrib.substr(0,attrib.indexOf(">") ) +"
					// onclick=\"cal_show(this)\" style=\"BORDER-BOTTOM:
					// 0px;BORDER-TOP: 0px;BORDER-LEFT: 0px;BORDER-RIGHT:
					// 0px;\">"
                // attrib= attrib.substr(0,attrib.length - 1 ) +"
				// ondblclick=\"cal_show(this)\" >"
				attrib= attrib.substr(0,attrib.length - 1  ) +" ondblclick=\"setday(this,this)\" >"

                 // xx=xx+"<table border=0 id=cal_table
					// style='width:"+obj.elements[ii].style.width+";height:" +
					// obj.elements[ii].style.height + ";BORDER-RIGHT: black 1px
					// solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black
					// 1px solid; BORDER-BOTTOM: black 1px solid' border='0'
					// cellpadding=0 cellspacing=0> "
                 // xx=xx+"<table border=0 id=cal_table
					// style='width:"+obj.elements[ii].style.width+";height:" +
					// obj.elements[ii].style.height + ";BORDER-BOTTOM: black
					// 1px solid' border='0' cellpadding=0 cellspacing=0> "
                 // xx=xx+"<tr id=tr11>"
                 // xx=xx+" <td>"+attrib+"</td>"
                 // xx=xx+" <td style=\"text-align:right;width:15px\"><input
					// type=button onclick=\"cal_button_click(this)\" name='cal'
					// id='cal' value='\uFFFD\uFFFD'
					// style='width:15px;font-size:6pt;height:"+obj.elements[ii].style.height+"'></td>"
                 // xx=xx+"</tr>"
                 // xx=xx+"</table>"
                 obj.elements[ii].outerHTML=attrib
               }
        }
     }
}
function cal_button_click(obj){
   var obj1= obj.parentElement.parentElement
       obj1.firstChild.childNodes[0].click()
}
// parentElement.parentElement.parentElement
function cal_show(obj){
   if (document.getElementById("cele_date") ==null) {
       show_cele_date(obj,'1940-12-12','2024-12-12',obj)
                                                     }
   else {
      if (window.cele_date.style.display=="none"){
            show_cele_date(obj,'1940-12-12','2024-12-12',obj)
        }
      else
      {
          window.cele_date.style.display="none"    }
    }
}
var menuskin = "skin1"; // skin0, or skin1
var display_url = 0; // Show URLs in status bar?
function showmenuie5() {
var rightedge = document.body.clientWidth-event.clientX;
var bottomedge = document.body.clientHeight-event.clientY;
if (rightedge < ie5menu.offsetWidth)
ie5menu.style.left = document.body.scrollLeft + event.clientX - ie5menu.offsetWidth;
else
ie5menu.style.left = document.body.scrollLeft+event.clientX;
if (bottomedge < ie5menu.offsetHeight)
ie5menu.style.top = document.body.scrollTop + event.clientY -ie5menu.offsetHeight;
else
ie5menu.style.top = document.body.scrollTop + event.clientY;
ie5menu.style.visibility = "visible";
return false;
}
function hidemenuie5() {
ie5menu.style.visibility = "hidden";
}
function highlightie5() {
if (event.srcElement.className == "menuitems") {
event.srcElement.style.backgroundColor = "highlight";
event.srcElement.style.color = "white";
if (display_url)
window.status = event.srcElement.url;
}
}
function lowlightie5() {
if (event.srcElement.className == "menuitems") {
event.srcElement.style.backgroundColor = "";
event.srcElement.style.color = "black";
window.status = "";
}
}
function jumptoie5() {
if (event.srcElement.className == "menuitems") {
if (event.srcElement.getAttribute("target") != null)
window.open(event.srcElement.url, event.srcElement.getAttribute("target"));
else
window.location = event.srcElement.url;
}
}
function qsort(R)
   { // R（l..n)是待排序的文件，采用自下向上扫描，对R做冒泡排序
     var i,j,t,R;
     var exchange; // 交换标志
     var n=R.length
     for (i=0;i< n;i++){
       if ( isNaN(parseFloat(R[i])) ) { 	}
        else { R[i]=parseFloat(R[i]) }
     }
     for(i=0;i< n;i++){ // 最多做n-1趟排序
       for(j=n-1;j> i;j--) // 对当前无序区R[i..n]自下向上扫描
        if(R[j]<R[j -1 ]){// 交换记录
         t=R[j];
         R[j]=R[j-1]
         R[j-1]=t
         }
     }
     return R
    }

function col_sort(obj){
  var ll_00,ll_0
  var ll_row= zg_body.rows.length
  if  (ll_row < 1 ) return

  var ll_col= zg_body.childNodes[0].cells.length
  var cur_cell=obj.cellIndex
  var ll_xx,ls_sp_char,arry
  var new_arr_xh=new Array()
  var new_arr_value=new Array()
  var num_state="0"
  var row_start

  // ls_sp_char=" "
      for(ll_0=0;ll_0 < ll_col;ll_0++){  eval(" var arr"+ll_0+" = new Array("+ll_row+")")   }
      for (ll_0=0;ll_0<ll_col;ll_0++){  // 装数据
         for (ll_00=0;ll_00< ll_row;ll_00++){
            if (zg_body.rows[ll_00].cells(ll_0).childNodes[0].tagName=="LABEL"){ }
            else{
              if ( ll_0==cur_cell  ) {
              	 row_start=10000+ll_00
              	 eval("arr"+ll_0+"["+ll_00+"]='"+zg_body.rows[ll_00].cells(ll_0).childNodes[0].value+row_start+"'")
              	if (isNaN(zg_body.rows[ll_00].cells(ll_0).childNodes[0].value+row_start)==true) num_state="1"
              	 }
              else { eval("arr"+ll_0+"["+ll_00+"]='"+zg_body.rows[ll_00].cells(ll_0).childNodes[0].value+"'")
        }
                }
                                            }
          }
    // 排序
    // alert(num_state)
     if (num_state=="1") { eval("arry=arr"+cur_cell+".sort()")  }
     else { eval("arry=qsort(arr"+cur_cell+")")     	}

     for (var i=0;i <arry.length;i++)
      {
         var ll_xx_s
         ll_xx_s=arry[i]
         ll_xx_s=ll_xx_s.toString()

         new_arr_value[i]=ll_xx_s.substring(0,ll_xx_s.length -5)
         new_arr_xh[i]=ll_xx_s.substring(ll_xx_s.length -5,ll_xx_s.length)
      }

      for (ll_0=0;ll_0<ll_col;ll_0++){  // 发数据
         for (ll_00=0;ll_00< ll_row;ll_00++){
            if (zg_body.rows[ll_00].cells(ll_0).childNodes[0].tagName=="LABEL"){}
            else{
               var xh= parseInt(new_arr_xh[ll_00]) - 10000
              // alert(xh)
               if (ll_0==cur_cell) {
               	   if (zg_body.rows[ll_00].cells(ll_0).childNodes[0].tagName=="SELECT" && new_arr_value[ll_00]=="" ){
               	       zg_body.rows[ll_00].cells(ll_0).childNodes[0].selectedIndex =0
               	   }
               	else {
               	    zg_body.rows[ll_00].cells(ll_0).childNodes[0].value=new_arr_value[ll_00];
               	     }
               } else {
               	  if ( eval("zg_body.rows["+ll_00+"].cells("+ll_0+").childNodes[0].tagName")=="SELECT"
               	     && eval("arr"+ll_0+"["+xh+"]") =="")
               	     {  eval("zg_body.rows["+ll_00+"].cells("+ll_0+").childNodes[0].selectedIndex=0");
               	     	}
               	    else {
                           eval("zg_body.rows["+ll_00+"].cells("+ll_0+").childNodes[0].value=arr"+ll_0+"["+xh+"]") ;
                         }

                  }
                }

                                            }
     }
}
function dataFormat(lf_1){
 	   var lf_2
 	   lf_2= Math.round(parseFloat(lf_1) *100)
 	   if (!isFinite(lf_2)){ return ""  }
           if (isNaN(lf_2)){ return ""  }
 	   return lf_2 / 100
 	                  }

function open_pub_win(cs){
	var new_win
	if  (cs==1){ // 病虫害
	   new_win=	window.open ("/public/worm_choose.asp", "newwindow", "height=350, width=250,left=300,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no")

		}
         if (cs==2){ // 农作物
            new_win=window.open ("/public/plant_choose.asp", "newwindow", "height=350, width=250,left=300,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no")

         	}
	 new_win.focus()
	}
function elm_onkeydown(obj) {
    if (event.keyCode ==46 ){

        if (obj.selectedIndex==-1) {
         alert("请选择需要删除的数据!")
          return                       }
         for (var i= obj.length - 1; i >=0 ; i--){
             if (obj.options[i].selected ) obj.remove(i)
                                                 }
                        }
}

function xxts_v(text_value){
  window.defaultStatus ="->"+text_value;
}

function xxts_h(){
  window.defaultStatus ="";
}
function div_query_hidden(){
  div_query.style.visibility='hidden'
	}
function sjcj_tj(){

  if (zg_body !=null ){
  	if (zg_body.rows.length < 1) { alert("没有记录,无法保存!")
  	   return false
  	 }
  	}
}
function f_sz(){
  var html_xx
  if (document.getElementById("div_sz") ==null) {
     ad_box=document.createElement("<div id=div_sz name=div_sz></div>");
     document.body.appendChild(ad_box);
   }
   x = (document.layers) ? obj.pageX : document.body.scrollLeft+event.clientX
   y = (document.layers) ? obj.pageY : document.body.scrollTop+event.clientY
   div_sz.style.visibility='visible'
   html_xx="<div style='BORDER: #35726c 4px solid; font-size:14px; BACKGROUND-COLOR:#E7EADD; position:absolute;left:"+parseInt(x -100) +";top:"+parseInt(y - 300) +"'>"
   html_xx=html_xx+"<table><tr><td>"
   html_xx=html_xx+"<align center>请录入需要上载的文件</align>"
   html_xx=html_xx+"</td></tr>"
   html_xx=html_xx+"<tr><td>"
   html_xx=html_xx+" <input type=file name=file_sz id=file_sz> "
   html_xx=html_xx+"</td></tr>"
   html_xx=html_xx+"<tr><td align=center>"
   html_xx=html_xx+"<input type=button value='确认' onclick='f_szdata()'>&nbsp;&nbsp;<input type=button value='取消' onclick=\"javascript:div_sz.style.visibility='hidden'\">"
   html_xx=html_xx+"</td></tr>"
   html_xx=html_xx+"</table>"
   html_xx=html_xx+"</div>"
   div_sz.innerHTML=html_xx
}
function f_szdata(){
   window.onerror=function (err) {
   if (err.indexOf('utomation')!=-1){
        alert('命令已经被用户禁止,请将IE中对ActiveX控件设置为启用!');
        return true
  } else  { return false }
   }

  var oXL = new ActiveXObject("Excel.Application");
  var oWB = oXL.Workbooks.Open(file_sz.value)

  var oSheet = oWB.Worksheets(1);
  var table,hang,lie;

  table = zg_body;
  if (table==null) return
  lie = table.rows(0).cells.length;

  var i=0;

  while (oSheet.Cells(i+1,1).value !=null){

     hang = table.rows.length;
      f1.button1.click()


     for (j=0;j <lie;j++) {
     	 var celldata=oSheet.Cells(i+1,j+1).value
     	 if (celldata+""=="undefined")celldata="";
         if (table.rows(i).cells(j).innerText!="") {
         	table.rows(hang).cells(j).innerText =  celldata
         	 }
          else { table.rows(hang).cells(j).childNodes[0].value = celldata
           }
                          }
      i=i+1;

                        }

oXL.Visible = false;
div_sz.style.visibility='hidden'
oWB.Close();
oWB=null
oXL.quit()
oXL=null;
}
function zs( ls_1,s_2){
   var i,li_1=0,li_2
   if (ls_1=="" || ls_1==null){return }
   for(i=0;i< ls_1.length;i++)
   {
       li_2=ls_1.indexOf(s_2,li_2+1)
       if( li_2==-1 ){ break }
       li_1=li_1+1
   }
    return li_1
        }

function qs(ls_1,i_1,s_2){
  var i,li_1=0,li_2,ls_2
  if (ls_1==""|| ls_1==null){return }
  for(i=0;i< ls_1.length;i++)
  {
       li_2=ls_1.indexOf(s_2,li_2+1)
       if( li_2==-1 ){break}
       if (i_1==li_1){
           ls_2=ls_1.substring(0,li_2)
                        }
       li_1=li_1+1
   }
   i=ls_2.lastIndexOf(s_2)
   return ls_2.substring(i+1)
                        }
function win_open(){
    var new_win=window.open("/firm_tj.asp","newwin","height=300,width=400,left=250,top=200,status=yes,toolbar=no,menubar=no,location=no")
    new_win.focus()
}
function win_open1(cs){

    var new_win=window.open("/person_tj.asp?firm_id="+cs,"newwin","height=300,width=400,left=250,top=200,status=yes,toolbar=no,menubar=no,location=no")
    new_win.focus()
}

// ==================================================== 参数设定部分
// =======================================================
var bMoveable=true;		// 设置日历是否可以拖动
var _VersionInfo="Version:2.0"	// 版本信息

// ==================================================== WEB 页面显示部分
// =====================================================
var strFrame;		// 存放日历层的HTML代码
document.writeln('<iframe id=meizzDateLayer Author=wayx frameborder=0 style="position: absolute; width: 144; height: 211; z-index: 9998; display: none"></iframe>');
strFrame='<style>';
strFrame+='INPUT.button{BORDER-RIGHT: #799AE1 1px solid;BORDER-TOP: #799AE1 1px solid;BORDER-LEFT: #799AE1 1px solid; BORDER-BOTTOM: #799AE1 1px solid;';
strFrame+='BORDER-BOTTOM: #799AE1 1px solid;BACKGROUND-COLOR: #EBF0FA;font-family:宋体;}';
strFrame+='TD{FONT-SIZE: 9pt;font-family:宋体;}';
strFrame+='</style>';
strFrame+='<scr' + 'ipt>';
strFrame+='var datelayerx,datelayery;	/*存放日历控件的鼠标位置*/';
strFrame+='var bDrag;	/*标记是否开始拖动*/';
strFrame+='function document.onmousemove()	/*在鼠标移动事件中，如果开始拖动日历，则移动日历*/';
strFrame+='{if(bDrag && window.event.button==1)';
strFrame+='	{var DateLayer=parent.document.all.meizzDateLayer.style;';
strFrame+='		DateLayer.posLeft += window.event.clientX-datelayerx;/*由于每次移动以后鼠标位置都恢复为初始的位置，因此写法与div中不同*/';
strFrame+='		DateLayer.posTop += window.event.clientY-datelayery;}}';
strFrame+='function DragStart()		/*开始日历拖动*/';
strFrame+='{var DateLayer=parent.document.all.meizzDateLayer.style;';
strFrame+='	datelayerx=window.event.clientX;';
strFrame+='	datelayery=window.event.clientY;';
strFrame+='	bDrag=true;}';
strFrame+='function DragEnd(){		/*结束日历拖动*/';
strFrame+='	bDrag=false;}';
strFrame+='</scr' + 'ipt>';
strFrame+='<div style="z-index:9999;position: absolute; left:0; top:0;" onselectstart="return false"><span id=tmpSelectYearLayer Author=wayx style="z-index: 9999;position: absolute;top: 3; left: 19;display: none"></span>';
strFrame+='<span id=tmpSelectMonthLayer Author=wayx style="z-index: 9999;position: absolute;top: 3; left: 78;display: none"></span>';
strFrame+='<table border=1 cellspacing=0 cellpadding=0 width=142 height=160 bordercolor=#799AE1 bgcolor=#799AE1 Author="wayx">';
strFrame+='  <tr Author="wayx"><td width=142 height=23 Author="wayx" bgcolor=#FFFFFF><table border=0 cellspacing=1 cellpadding=0 width=140 Author="wayx" height=23>';
strFrame+='      <tr align=center Author="wayx"><td width=16 align=center bgcolor=#799AE1 style="font-size:12px;cursor: hand;color: #ffffff" ';
strFrame+='        onclick="parent.meizzPrevM()" title="向前翻 1 月" Author=meizz><b Author=meizz>&lt;</b>';
strFrame+='        </td><td width=60 align=center style="font-size:12px;cursor:default" Author=meizz ';
strFrame+='onmouseover="style.backgroundColor=\'#799AE1\'" onmouseout="style.backgroundColor=\'white\'" ';
strFrame+='onclick="parent.tmpSelectYearInnerHTML(this.innerText.substring(0,4))" title="点击这里选择年份"><span Author=meizz id=meizzYearHead></span></td>';
strFrame+='<td width=48 align=center style="font-size:12px;cursor:default" Author=meizz onmouseover="style.backgroundColor=\'#799AE1\'" ';
strFrame+=' onmouseout="style.backgroundColor=\'white\'" onclick="parent.tmpSelectMonthInnerHTML(this.innerText.length==3?this.innerText.substring(0,1):this.innerText.substring(0,2))"';
strFrame+='        title="点击这里选择月份"><span id=meizzMonthHead Author=meizz></span></td>';
strFrame+='        <td width=16 bgcolor=#799AE1 align=center style="font-size:12px;cursor: hand;color: #ffffff" ';
strFrame+='         onclick="parent.meizzNextM()" title="向后翻 1 月" Author=meizz><b Author=meizz>&gt;</b></td></tr>';
strFrame+='    </table></td></tr>';
strFrame+='  <tr Author="wayx"><td width=142 height=18 Author="wayx">';
strFrame+='<table border=0 cellspacing=1 cellpadding=0 ' + (bMoveable? 'onmousedown="DragStart()" onmouseup="DragEnd()"':'');
strFrame+=' Bgcolor=#ffffff width=140 height=20 Author="wayx" style="cursor:' + (bMoveable ? 'move':'default') + '">';
strFrame+='<tr bgcolor="#799AE1" Author="wayx" align=center valign=bottom><td style="font-size:12px;color:#FFFFFF" Author=meizz>日</td>';
strFrame+='<td style="font-size:12px;color:#FFFFFF" Author=meizz>一</td><td style="font-size:12px;color:#FFFFFF" Author=meizz>二</td>';
strFrame+='<td style="font-size:12px;color:#FFFFFF" Author=meizz>三</td><td style="font-size:12px;color:#FFFFFF" Author=meizz>四</td>';
strFrame+='<td style="font-size:12px;color:#FFFFFF" Author=meizz>五</td><td style="font-size:12px;color:#FFFFFF" Author=meizz>六</td></tr>';
strFrame+='</table></td></tr><!-- Author:F.R.Huang(meizz) http://www.meizz.com/ mail: meizz@hzcnc.com 2002-10-8 -->';
strFrame+='  <tr Author="wayx"><td width=142 height=120 Author="wayx">';
strFrame+='    <table border=0 cellspacing=1 cellpadding=0 bgcolor=#799AE1 width=140 height=20 Author="wayx">';
var n=0; for (j=0;j<5;j++){ strFrame+= ' <tr align=center Author="wayx" bgcolor=#EBF0FA>'; for (i=0;i<7;i++){
strFrame+='<td width=20 height=20 id=meizzDay'+n+' style="font-size:12px" Author=meizz onclick=parent.meizzDayClick(this.innerText,0)></td>';n++;}
strFrame+='</tr>';}
strFrame+='      <tr align=center Author="wayx" bgcolor=#EBF0FA>';
for (i=35;i<40;i++)strFrame+='<td width=20 height=20 id=meizzDay'+i+' style="font-size:12px" Author=wayx onclick="parent.meizzDayClick(this.innerText,0)"></td>';
strFrame+='        <td colspan=2 align=center Author=meizz><span onclick="parent.meizzToday()" style="font-family:Verdana;font-size:12px;cursor: hand" title="当前日期">Today</span></td></tr>';
strFrame+='    </table></td></tr><tr Author="wayx"><td Author="wayx">';
strFrame+='        <table border=0 cellspacing=1 cellpadding=0 width=100% Author="wayx" bgcolor=#FFFFFF>';
strFrame+='          <tr Author="wayx"><td Author=meizz align=left><input Author=meizz type=button class=button value="<<" title="向前翻 1 年" onclick="parent.meizzPrevY()" ';
strFrame+='             onfocus="this.blur()" style="font-size: 12px; height: 20px">&nbsp;<input Author=meizz class=button title="向前翻 1 月" type=button ';
strFrame+='             value="<" onclick="parent.meizzPrevM()" onfocus="this.blur()" style="font-size: 8pt; height: 20px"></td><td ';
strFrame+='             Author=meizz align=center><span onclick="parent.clear()" style="font-family:宋体;font-size:12px;cursor: hand" title="清除选择"><u>清空</u></span>';
strFrame+='				<span onclick=parent.closeLayer() style="font-size:12px;cursor: hand" Author=meizz title="关闭日历框"><u>关闭</u></span></td><td ';
strFrame+='             Author=meizz align=right><input Author=meizz type=button class=button value=">" onclick="parent.meizzNextM()" ';
strFrame+='             onfocus="this.blur()" title="向后翻 1 月" class=button style="font-size: 12px; height: 20px">&nbsp;<input ';
strFrame+='             Author=meizz type=button class=button value=">>" title="向后翻 1 年" onclick="parent.meizzNextY()"';
strFrame+='             onfocus="this.blur()" style="font-size: 12px; height: 20px"></td>';
strFrame+='</tr></table></td></tr></table></div>';
window.frames.meizzDateLayer.document.writeln(strFrame);
window.frames.meizzDateLayer.document.close();		// 解决ie进度条不结束的问题

// ==================================================== WEB 页面显示部分
// ======================================================
var outObject;
var outButton;		// 点击的按钮
var outDate="";		// 存放对象的日期
var odatelayer=window.frames.meizzDateLayer.document.all;		// 存放日历对象
function setday(tt,obj) // 主调函数
{
	if (arguments.length >  2){alert("对不起！传入本控件的参数太多！");return;}
	if (arguments.length == 0){alert("对不起！您没有传回本控件任何参数！");return;}
	var dads  = document.all.meizzDateLayer.style;
	var th = tt;
	var ttop  = tt.offsetTop;     // TT控件的定位点高
	var thei  = tt.clientHeight;  // TT控件本身的高
	var tleft = tt.offsetLeft;    // TT控件的定位点宽
	var ttyp  = tt.type;          // TT控件的类型
	while (tt = tt.offsetParent){ttop+=tt.offsetTop;
	tleft+=tt.offsetLeft;
	}
	dads.top  = (ttyp=="image")? ttop+thei : ttop+thei+6;
	dads.left = tleft;
	outObject = (arguments.length == 1) ? th : obj;
	outButton = (arguments.length == 1) ? null : th;	// 设定外部点击的按钮

	// 根据当前输入框的日期显示日历的年月
	var reg = /^(\d+)-(\d{1,2})-(\d{1,2})$/;
	var r = outObject.value.match(reg);
	if(r!=null){
		r[2]=r[2]-1;
		var d= new Date(r[1], r[2],r[3]);
		if(d.getFullYear()==r[1] && d.getMonth()==r[2] && d.getDate()==r[3]){
			outDate=d;		// 保存外部传入的日期
		}
		else outDate="";
			meizzSetDay(r[1],r[2]+1);
	}
	else{
		outDate="";
		meizzSetDay(new Date().getFullYear(), new Date().getMonth() + 1);
	}
	dads.display = '';

	event.returnValue=false;
}

var MonHead = new Array(12);    		   // 定义阳历中每个月的最大天数
    MonHead[0] = 31; MonHead[1] = 28; MonHead[2] = 31; MonHead[3] = 30; MonHead[4]  = 31; MonHead[5]  = 30;
    MonHead[6] = 31; MonHead[7] = 31; MonHead[8] = 30; MonHead[9] = 31; MonHead[10] = 30; MonHead[11] = 31;

var meizzTheYear=new Date().getFullYear(); // 定义年的变量的初始值
var meizzTheMonth=new Date().getMonth()+1; // 定义月的变量的初始值
var meizzWDay=new Array(40);               // 定义写日期的数组

document.onclick=function() // 任意点击时关闭该控件 //ie6的情况可以由下面的切换焦点处理代替
{
  with(window.event)
  {
	  if (srcElement.getAttribute("datatype")==null
	  &&srcElement != outObject
	  && srcElement != outButton &&
        srcElement.type != "button"

	  )
    closeLayer();
  }
}

document.onclick=function()		// 按Esc键关闭，切换焦点关闭
  {
    if (window.event.keyCode==27){
		if(outObject)outObject.blur();
		closeLayer();
	}
	else if(document.activeElement)
		if(document.activeElement.getAttribute("Author")==null &&
		document.activeElement != outObject &&
		document.activeElement != outButton &&
        document.activeElement.type != "button"
			)
		{
			closeLayer();
		}
  }

function meizzWriteHead(yy,mm)  // 往 head 中写入当前的年与月
  {
	odatelayer.meizzYearHead.innerText  = yy + " 年";
    odatelayer.meizzMonthHead.innerText = mm + " 月";
  }

function tmpSelectYearInnerHTML(strYear) // 年份的下拉框
{
  if (strYear.match(/\D/)!=null){alert("年份输入参数不是数字！");return;}
  var m = (strYear) ? strYear : new Date().getFullYear();
  if (m < 1000 || m > 9999) {alert("年份值不在 1000 到 9999 之间！");return;}
  var n = m - 10;
  if (n < 1000) n = 1000;
  if (n + 26 > 9999) n = 9974;
  var s = "<select Author=meizz name=tmpSelectYear style='font-size: 12px' "
     s += "onblur='document.all.tmpSelectYearLayer.style.display=\"none\"' "
     s += "onchange='document.all.tmpSelectYearLayer.style.display=\"none\";"
     s += "parent.meizzTheYear = this.value; parent.meizzSetDay(parent.meizzTheYear,parent.meizzTheMonth)'>\r\n";
  var selectInnerHTML = s;
  for (var i = n; i < n + 26; i++)
  {
    if (i == m)
       {selectInnerHTML += "<option Author=wayx value='" + i + "' selected>" + i + "年" + "</option>\r\n";}
    else {selectInnerHTML += "<option Author=wayx value='" + i + "'>" + i + "年" + "</option>\r\n";}
  }
  selectInnerHTML += "</select>";
  odatelayer.tmpSelectYearLayer.style.display="";
  odatelayer.tmpSelectYearLayer.innerHTML = selectInnerHTML;
  odatelayer.tmpSelectYear.focus();
}

function tmpSelectMonthInnerHTML(strMonth) // 月份的下拉框
{
  if (strMonth.match(/\D/)!=null){alert("月份输入参数不是数字！");return;}
  var m = (strMonth) ? strMonth : new Date().getMonth() + 1;
  var s = "<select Author=meizz name=tmpSelectMonth style='font-size: 12px' "
     s += "onblur='document.all.tmpSelectMonthLayer.style.display=\"none\"' "
     s += "onchange='document.all.tmpSelectMonthLayer.style.display=\"none\";"
     s += "parent.meizzTheMonth = this.value; parent.meizzSetDay(parent.meizzTheYear,parent.meizzTheMonth)'>\r\n";
  var selectInnerHTML = s;
  for (var i = 1; i < 13; i++)
  {
    if (i == m)
       {selectInnerHTML += "<option Author=wayx value='"+i+"' selected>"+i+"月"+"</option>\r\n";}
    else {selectInnerHTML += "<option Author=wayx value='"+i+"'>"+i+"月"+"</option>\r\n";}
  }
  selectInnerHTML += "</select>";
  odatelayer.tmpSelectMonthLayer.style.display="";
  odatelayer.tmpSelectMonthLayer.innerHTML = selectInnerHTML;
  odatelayer.tmpSelectMonth.focus();
}

function closeLayer()               // 这个层的关闭
  {
    document.all.meizzDateLayer.style.display="none";
  }
function IsPinYear(year)            // 判断是否闰平年
  {
    if (0==year%4&&((year%100!=0)||(year%400==0))) return true;else return false;
  }

function GetMonthCount(year,month)  // 闰年二月为29天
  {
    var c=MonHead[month-1];if((month==2)&&IsPinYear(year)) c++;return c;
  }
function GetDOW(day,month,year)     // 求某天的星期几
  {
    var dt=new Date(year,month-1,day).getDay()/7; return dt;
  }

function meizzPrevY()  // 往前翻 Year
  {
    if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear--;}
    else{alert("年份超出范围（1000-9999）！");}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzNextY()  // 往后翻 Year
  {
    if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear++;}
    else{alert("年份超出范围（1000-9999）！");}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzToday()  // Today Button
  {
	var today;
    meizzTheYear = new Date().getFullYear();
    meizzTheMonth = new Date().getMonth()+1;
    today=new Date().getDate();
    // meizzSetDay(meizzTheYear,meizzTheMonth);
    if(outObject){
	    if ( meizzTheMonth < 10){meizzTheMonth = "0" + meizzTheMonth;}
        if ( today < 10){today = "0" + today;}
		outObject.value=meizzTheYear + "-" + meizzTheMonth + "-" + today;
    }
    closeLayer();
  }
function meizzPrevM()  // 往前翻月份
  {
    if(meizzTheMonth>1){meizzTheMonth--}else{meizzTheYear--;meizzTheMonth=12;}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzNextM()  // 往后翻月份
  {
    if(meizzTheMonth==12){meizzTheYear++;meizzTheMonth=1}else{meizzTheMonth++}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }

function meizzSetDay(yy,mm)   // 主要的写程序**********
{
  meizzWriteHead(yy,mm);
  // 设置当前年月的公共变量为传入值
  meizzTheYear=yy;
  meizzTheMonth=mm;

  for (var i = 0; i < 40; i++){meizzWDay[i]=""};  // 将显示框的内容全部清空
  var day1 = 1,day2=1,firstday = new Date(yy,mm-1,1).getDay();  // 某月第一天的星期几
  for (i=0;i<firstday;i++)meizzWDay[i]=GetMonthCount(mm==1?yy-1:yy,mm==1?12:mm-1)-firstday+i+1	// 上个月的最后几天
  for (i = firstday; day1 < GetMonthCount(yy,mm)+1; i++){meizzWDay[i]=day1;day1++;}
  for (i=firstday+GetMonthCount(yy,mm);i<40;i++){meizzWDay[i]=day2;day2++}
  for (i = 0; i < 40; i++)
  { var da = eval("odatelayer.meizzDay"+i)     // 书写新的一个月的日期星期排列
    if (meizzWDay[i]!="")
      {
		// 初始化边框
		da.borderColorLight="#799AE1";
		da.borderColorDark="#FFFFFF";
		if(i<firstday)		// 上个月的部分
		{
			da.innerHTML="<b><font color=#AAAAAA>" + meizzWDay[i] + "</font></b>";
			da.title=(mm==1?12:mm-1) +"月" + meizzWDay[i] + "日";
			da.onclick=Function("meizzDayClick(this.innerText,-1)");
			if(!outDate)
				da.style.backgroundColor = ((mm==1?yy-1:yy) == new Date().getFullYear() &&
					(mm==1?12:mm-1) == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate()) ?
					 "#799AE1":"#EBF0FA";
			else
			{
				da.style.backgroundColor =((mm==1?yy-1:yy)==outDate.getFullYear() && (mm==1?12:mm-1)== outDate.getMonth() + 1 &&
				meizzWDay[i]==outDate.getDate())? "#ffffff" :
				(((mm==1?yy-1:yy) == new Date().getFullYear() && (mm==1?12:mm-1) == new Date().getMonth()+1 &&
				meizzWDay[i] == new Date().getDate()) ? "#799AE1":"#EBF0FA");
				// 将选中的日期显示为凹下去
				if((mm==1?yy-1:yy)==outDate.getFullYear() && (mm==1?12:mm-1)== outDate.getMonth() + 1 &&
				meizzWDay[i]==outDate.getDate())
				{
					da.borderColorLight="#FFFFFF";
					da.borderColorDark="#799AE1";
				}
			}
		}
		else if (i>=firstday+GetMonthCount(yy,mm))		// 下个月的部分
		{
			da.innerHTML="<b><font color=#AAAAAA>" + meizzWDay[i] + "</font></b>";
			da.title=(mm==12?1:mm+1) +"月" + meizzWDay[i] + "日";
			da.onclick=Function("meizzDayClick(this.innerText,1)");
			if(!outDate)
				da.style.backgroundColor = ((mm==12?yy+1:yy) == new Date().getFullYear() &&
					(mm==12?1:mm+1) == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate()) ?
					 "#799AE1":"#EBF0FA";
			else
			{
				da.style.backgroundColor =((mm==12?yy+1:yy)==outDate.getFullYear() && (mm==12?1:mm+1)== outDate.getMonth() + 1 &&
				meizzWDay[i]==outDate.getDate())? "#ffffff" :
				(((mm==12?yy+1:yy) == new Date().getFullYear() && (mm==12?1:mm+1) == new Date().getMonth()+1 &&
				meizzWDay[i] == new Date().getDate()) ? "#799AE1":"#EBF0FA");
				// 将选中的日期显示为凹下去
				if((mm==12?yy+1:yy)==outDate.getFullYear() && (mm==12?1:mm+1)== outDate.getMonth() + 1 &&
				meizzWDay[i]==outDate.getDate())
				{
					da.borderColorLight="#FFFFFF";
					da.borderColorDark="#799AE1";
				}
			}
		}
		else		// 本月的部分
		{
			da.innerHTML="" + meizzWDay[i] + "";
			da.title=mm +"月" + meizzWDay[i] + "日";
			da.onclick=Function("meizzDayClick(this.innerText,0)");		// 给td赋予onclick事件的处理
			// 如果是当前选择的日期，则显示亮蓝色的背景；如果是当前日期，则显示暗黄色背景
			if(!outDate)
				da.style.backgroundColor = (yy == new Date().getFullYear() && mm == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate())?
					"#FF0000":"#EBF0FA";
			else
			{
				da.style.backgroundColor =(yy==outDate.getFullYear() && mm== outDate.getMonth() + 1 && meizzWDay[i]==outDate.getDate())?
					"#799AE1":((yy == new Date().getFullYear() && mm == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate())?
					"#FF0000":"#EBF0FA");
				// 将选中的日期显示为凹下去
				if(yy==outDate.getFullYear() && mm== outDate.getMonth() + 1 && meizzWDay[i]==outDate.getDate())
				{
					da.borderColorLight="#FFFFFF";
					da.borderColorDark="#799AE1";
				}
			}
		}
        da.style.cursor="hand"
      }
    else{da.innerHTML="";da.style.backgroundColor="";da.style.cursor="default"}
  }
}

function meizzDayClick(n,ex)  // 点击显示框选取日期，主输入函数*************
{
  var yy=meizzTheYear;
  var mm = parseInt(meizzTheMonth)+ex;	// ex表示偏移量，用于选择上个月份和下个月份的日期
	// 判断月份，并进行对应的处理
	if(mm<1){
		yy--;
		mm=12+mm;
	}
	else if(mm>12){
		yy++;
		mm=mm-12;
	}

  if (mm < 10){mm = "0" + mm;}
  if (outObject)
  {
    if (!n) {// outObject.value="";
      return;}
    if ( n < 10){n = "0" + n;}
    outObject.value= yy + "-" + mm + "-" + n ; // 注：在这里你可以输出改成你想要的格式
    closeLayer();
  }
  else {closeLayer(); alert("您所要输出的控件对象并不存在！");}
}
function clear()               // 输入值的清空
  {
    document.all.meizzDateLayer.style.display="none";
	outObject.value="";
  }

function f_print(path){
  try{
    var rowsum=pagecursum.innerText
    var rowarray
    rowarray=rowsum.split("/")
  }catch(e){
    var rowarray=new Array("1","1");
  }
    f_print_excel(path+'?ACT_TYPE=PRINT',rowarray[0],rowarray[1])
 }
function f_print_excel(path,startPage,endPage){
    // alert("/ExcelPrint.jsp?startPage="+startPage+"&endPage="+endPage)
	// window.opener.document.location("/hnzx/ExcelPrint.jsp?startPage="+startPage+"&endPage="+endPage)
    window.open("/hnzx/ExcelPrint.jsp?startPage="+startPage+"&endPage="+endPage+"&path="+path,null,"width=300px,height=150px,left=300,top=200")
// ,path,"scrollbars=no;resizable=no;help=no;status=no;dialogTop=200;dialogLeft=300;dialogWidth=300px;dialogHeight=150px")
		// ,path,"scrollbars=no;resizable=no;help=no;status=no;dialogTop=200;dialogLeft=300;dialogWidth=300px;dialogHeight=150px")
}

function getnsr(condition){
  var windVal =  window.showModalDialog("/hnzx/jpublic/nsr/nsr_query.jsp",condition,"dialogWidth:746px;dialogHeight:680px;location:yes;status:no");
  return windVal;
}
function dateFormat(){
  var obj = dateFormat.arguments[0];
  kc = event.keyCode;
// if(obj.value.length>=10&&kc!=8&&kc!=46&&!obj.selected){
// event.returnValue=false;
// return;
// }
// obj.selected=false;
  if((kc>47&&kc<58)||(kc>95&&kc<106)||kc==8||kc==9||kc==13||kc==46){
  	if((obj.value.length==4||obj.value.length==7)&&event.keyCode!=8){
  	  temp = obj.value;
	  obj.value = temp + "-";
	  if(obj.value.split("-").length>3){
	  	obj.value="";
	  }
  	}
  }
  else{
  	event.returnValue=false;
  }
}
function checkDate(){
  var obj = checkDate.arguments[0];
  dateStr = obj.value;
  if(dateStr==null||dateStr=="")return true;
  if(dateStr.match( /\d{4}-(0|1)\d-(0|1|2|3)\d/)==null){
  	alert("错误的日期格式：" + dateStr);
	obj.select();
        obj.focus();
  }
}
function fillBsm(){
	var obj = fillBsm.arguments[0];
	var pbsm = fillBsm.arguments[1];
	var temp = obj.value;
        if(temp.length==0)return;
        if(temp.match(/\D/)!=null){
          alert("错误办税码：'"+temp+"'");
          obj.focus();
          obj.select();
          return;
        }
	if(temp.length<6){
		alert("办税码位数不足！");
		obj.focus();
		event.returnValue=false;
		return;
	}
	var len = temp.length;
	len = 10 - len;
	obj.value = pbsm.substr(0,len) + temp;
	if(obj.value.length>10){
		alert("办税码位数过长！");
		obj.focus();
		obj.select();
		return;
	}
	return true;
}
function backColor(obj){
  var inputs = document.getElementsByTagName("input");
  var max = inputs.length;
  for(i=0;i<max;i++){
    if(inputs[i].color1)
    inputs[i].style.color=inputs[i].color1;
  }
  inputs = document.all;
  max = inputs.length;
  for(i=0;i<max;i++){
    if(inputs[i].color1)
    inputs[i].style.color=inputs[i].color1;
  }
}
function changeColor(obj){
	if(obj.value==obj.defaultValue){
		obj.style.color=obj.color1;
	}
	else{
		obj.style.color=obj.color2;
	}
}
function changeInnerBGColor(obj,toColor){
	var innerhtmlstr = obj.innerHTML;
	i1 = innerhtmlstr.toLowerCase().indexOf("background-color",0);
	i2 = innerhtmlstr.indexOf("\"",i1);
        if(i1<0||i2<0)return;
	strb = innerhtmlstr.substring(0,i1);
	stre = innerhtmlstr.substring(i2)
	strm = "background-color:"+toColor;
        str = strb+strm+stre;
	obj.innerHTML=str;
}
function changeOuterBGColor(obj,toColor){
        var outerhtmlstr = obj.outerHTML;
	i1 = outerhtmlstr.toLowerCase().indexOf("background-color:",0);
	i2 = outerhtmlstr.indexOf("\"",i1);
        if(i1<0||i2<0)return;
	strb = outerhtmlstr.substring(0,i1);
	stre = outerhtmlstr.substring(i2)
	strm = "background-color:"+toColor;
        str = strb+strm+stre;
	obj.outerHTML=str;
}
function changeInputColor(obj){
  var color1="#099900";
  var color2="#ffffff";
  var inputs = documents.getElementsByTagName("input");
  var max = inputs.length;
  for(i=0;i<max;i++){
    outerhtmlstr = inputs[i].outHTML;
    if(inputs[i]==obj){
	i1 = outerhtmlstr.toLowerCase().indexOf("background-color:",0);
	i2 = outerhtmlstr.indexOf("\"",i1);
        if(i1<0||i2<0){
        }else{
          strb = outerhtmlstr.substring(0,i1);
          stre = outerhtmlstr.substring(i2)
          strm = "background-color:"+color1;
          str = strb+strm+stre;
          obj.outerHTML=str;
        }
    }else{
	i1 = outerhtmlstr.toLowerCase().indexOf("background-color:",0);
	i2 = outerhtmlstr.indexOf("\"",i1);
        if(i1<0||i2<0){
        }else{
          strb = outerhtmlstr.substring(0,i1);
          stre = outerhtmlstr.substring(i2)
          strm = "background-color:"+color1;
          str = strb+strm+stre;
          inputs[i].outerHTML=str;
        }
    }
  }
}
function replaceAll(text,replacement,target){
        if(text==null || text=="") return text;
        if(replacement==null || replacement=="") return text;
        if(target==null) target="";
        var returnString="";
        var index=text.indexOf(replacement);
        while(index!=-1){
                if(index!=0) returnString+=text.substring(0,index)+target;
                text=text.substring(index+replacement.length);
                index=text.indexOf(replacement);
        }
        if(text!="") returnString+=text;
        return returnString;
}

function FloatMenu() {
floater.style.pixelLeft = document.body.scrollLeft+10;
floater.style.pixelTop = document.body.scrollTop+document.body.offsetHeight - document.getElementById("floater").offsetHeight - 10; // Make
																																	// object
																																	// bounce
																																	// -
																																	// document.body.scrollWidth
}
function changeDivContentBack(){
  var obj = document.getElementById("floater");
  obj.innerHTML = "<b>这里显示数据完整信息</b><br>";
}
function changeDivContent(value){
  var obj = document.getElementById("floater");
  var valueStr = CovertCRLFToBR(value);
  obj.innerHTML = valueStr;
}
    function CovertCRLFToBR(s)
    {
     var i;
     var s2 = s;

     while(s2.indexOf("&#13;&#10;")>0)
     {
     i = s2.indexOf("&#13;&#10;");
     s2 = s2.substring(0, i) + "<br>"
     + s2.substring(i + 10, s2.length);
     }
     while(s2.indexOf("\n")>0)
     {
     i = s2.indexOf("\n");
     s2 = s2.substring(0, i) + "<br>"
     + s2.substring(i + 1, s2.length);
     }
     return s2;
    }
function closeWin(){
window.opener=null;
window.close();
}
function edit(){
  var obj = edit.arguments[0];
  var par = obj.value;
  obj.value=window.showModalDialog("/hnzx/jpublic/editwin.jsp",par,"dialogWidth:392px;dialogHeight:220px;help:no;status:no;scrollbar:no;");
}

function fucCheckNUM(NUM)
{
	var i,j,strTemp;
	strTemp="0123456789";
	if ( NUM.length== 0)
	return 0
	for (i=0;i<NUM.length;i++)
	{
		j=strTemp.indexOf(NUM.charAt(i));
		if (j==-1)
		{
			// 说明有字符不是数字
			return 0;
		}
	}
	// 说明是数字
	return 1;
}


function fucCheckMoney(NUM)
{
	var i,j,strTemp;
	strTemp="0123456789.";
	if ( NUM.length== 0)
	return 0
	for (i=0;i<NUM.length;i++)
	{
		j=strTemp.indexOf(NUM.charAt(i));
		if (j==-1)
		{
			// 说明有字符不是数字
			return 0;
		}
	}
	// 说明是数字
	return 1;
}
function f_sum_jdf(form){
	 try
    {
	  var arrayvalue=form.elements("dcw21_d:jfje:dou:M").length;
	  if (arrayvalue==null)
	  {
		  arrayvalue=1;
	  }
	  if (isNaN(arrayvalue))
	  {
        return
	  }
      var sumdf=0
      var sumjf=0
      if (arrayvalue==1)
      {
          form.elements("jfhj").value=form.elements("dcw21_d:jfje:dou:M").value
          form.elements("dfhj").value=form.elements("dcw21_d:dfje:dou:M").value
      }
      else {
       for (i=0;i < arrayvalue; i++)
       {
           sumdf+= parseFloat(toN(form.elements("dcw21_d:dfje:dou:M")[i].value) );
           sumjf+= parseFloat(toN(form.elements("dcw21_d:jfje:dou:M")[i].value) );
       }
          form.elements("jfhj").value=sumjf;
          form.elements("dfhj").value=sumdf;
      }
    }
    catch (err){
          form.elements("jfhj").value=""
          form.elements("dfhj").value=""

	}
}
function formatNumber(number,pattern)
	{
		var str			= number.toString();
		var strInt;
		var strFloat;
		var formatInt;
		var formatFloat;
		if(/\./g.test(pattern))
		{
			formatInt		= pattern.split('.')[0];
			formatFloat		= pattern.split('.')[1];
		}
		else
		{
			formatInt		= pattern;
			formatFloat		= null;
		}

		if(/\./g.test(str))
		{
			if(formatFloat!=null)
			{
				var tempFloat	= Math.round(parseFloat('0.'+str.split('.')[1])*Math.pow(10,formatFloat.length))/Math.pow(10,formatFloat.length);
				strInt		= (Math.floor(number)+Math.floor(tempFloat)).toString();
				strFloat	= /\./g.test(tempFloat.toString())?tempFloat.toString().split('.')[1]:'0';
			}
			else
			{
				strInt		= Math.round(number).toString();
				strFloat	= '0';
			}
		}
		else
		{
			strInt		= str;
			strFloat	= '0';
		}
		if(formatInt!=null)
		{
			var outputInt	= '';
			var zero		= formatInt.match(/0*$/)[0].length;
			var comma		= null;
			if(/,/g.test(formatInt))
			{
				comma		= formatInt.match(/,[^,]*/)[0].length-1;
			}
			var newReg		= new RegExp('(\\d{'+comma+'})','g');

			if(strInt.length<zero)
			{
				outputInt		= new Array(zero+1).join('0')+strInt;
				outputInt		= outputInt.substr(outputInt.length-zero,zero)
			}
			else
			{
				outputInt		= strInt;
			}

			var
			outputInt			= outputInt.substr(0,outputInt.length%comma)+outputInt.substring(outputInt.length%comma).replace(newReg,(comma!=null?',':'')+'$1')
			outputInt			= outputInt.replace(/^,/,'');

			strInt	= outputInt;
		}

		if(formatFloat!=null)
		{
			var outputFloat	= '';
			var zero		= formatFloat.match(/^0*/)[0].length;

			if(strFloat.length<zero)
			{
				outputFloat		= strFloat+new Array(zero+1).join('0');
				// outputFloat = outputFloat.substring(0,formatFloat.length);
				var outputFloat1	= outputFloat.substring(0,zero);
				var outputFloat2	= outputFloat.substring(zero,formatFloat.length);
				outputFloat		= outputFloat1+outputFloat2.replace(/0*$/,'');
			}
			else
			{
				outputFloat		= strFloat.substring(0,formatFloat.length);
			}

			strFloat	= outputFloat;
		}
		else
		{
			if(pattern!='' || (pattern=='' && strFloat=='0'))
			{
				strFloat	= '';
			}
		}

		return strInt+(strFloat==''?'':'.'+strFloat);
	}
  function f_cyzy(obj){
	var returnObject=window.showModalDialog("/hnzx/credence/zy_choose.jsp",null,"dialogWidth:150pt;dialogHeight:200pt;status:0;help:0");
	if (returnObject!=null)
	{
     obj.value=returnObject;
	}
  }

function f_mouseOver(obj)
{
  obj.style.backgroundColor='#EBF0FA';
}
function f_mouseOut(obj)
{
  obj.style.backgroundColor=(obj.sectionRowIndex%2==0)?'ffffff':'f0f0f0'
}

function returnRow(allString){
   var newString=allString.replace(/[R,(,)]/g,"");
   var newStringOne=newString.replace(/[-,*,\/]/g,"+");
   return newStringOne.split("+");
}

function FormatNumber(srcStr,nAfterDot){
　　var srcStr,nAfterDot;
　　var resultStr,nTen;
　　srcStr = ""+srcStr+"";
　　strLen = srcStr.length;
　　dotPos = srcStr.indexOf(".",0);
　　if (dotPos == -1){
　　　　resultStr = srcStr+".";
　　　　for (i=0;i<nAfterDot;i++){
　　　　　　resultStr = resultStr+"0";
　　　　}
　　　　return resultStr;
　　}
　　else{
　　　　if ((strLen - dotPos - 1) >= nAfterDot){
　　　　　　nAfter = dotPos + nAfterDot + 1;
　　　　　　nTen =1;
　　　　　　for(j=0;j<nAfterDot;j++){
　　　　　　　　nTen = nTen*10;
　　　　　　}
　　　　　　resultStr = Math.round(parseFloat(srcStr)*nTen)/nTen;
　　　　　　return resultStr;
　　　　}
　　　　else{
　　　　　　resultStr = srcStr;
　　　　　　for (i=0;i<(nAfterDot - strLen + dotPos + 1);i++){
　　　　　　　　resultStr = resultStr+"0";
　　　　　　}
　　　　　　return resultStr;
　　　　}
　　}
}

function document_onkeyup(){
	// alert(gsjg.length)
    var obj = event.srcElement;
    ls_name=obj.name
    var single_value;
    var single_name;
	var gsjg_cell_index=0;
	if (obj.tagName != 'INPUT' && obj.tagName != 'SELECT'  ) { return; }
           if (obj.name.indexOf("je") >=0)
           {   var tempValue=obj.value;
		       if (tempValue.indexOf(".") ==tempValue.lastIndexOf(".")){
			   }else{
                  obj.value=tempValue.replace(".","");
			   }
           }
    var li_count=jsgs.length;
	for (var i=0; i < li_count ;i++ )
 	{ var single_jsgs=jsgs[i];


      var row=obj.parentElement.parentElement;
	  var tbody=row.parentElement;
      var td_count=row.cells.length;
	  var ll_row=row.rowIndex;
      var re= /[R]{1}[0-9]+/;
     if (re.test(gsjg[i])){
         var endrow= gsjg[i].replace("R","");

         var retRow= returnRow(single_jsgs);

         for(var il=0;il< td_count;il++)
         {
           var colname1=row.cells(il).childNodes[0].name;
           var colrowvalue=0;
		    single_jsgs=jsgs[i];

           if ( colname1.indexOf("je") >=0 )
           {
              for(var i2=0;i2 < retRow.length;i2++){
                 var temprow=retRow[i2];
                 var rowValue1=0;
                 // var
					// rowValue1=tbody.rows[temprow].cells(il).childNodes[0].value;
                 for (var left_right_mobile=0; left_right_mobile < 2; left_right_mobile++)
                 {
                     var temp_mobile=0;
					 temp_mobile=parseInt(il) - parseInt(left_right_mobile);
					 try{
                     if (tbody.rows[temprow].cells(temp_mobile).childNodes[0].name==colname1)
                     {
                        rowValue1=tbody.rows[temprow].cells(temp_mobile).childNodes[0].value;
						// alert(rowValue1)
						break;
                     }

 					 temp_mobile=parseInt(il) + parseInt(left_right_mobile);
                     if (tbody.rows[temprow].cells(temp_mobile).childNodes[0].name==colname1)
                     {
                        rowValue1=tbody.rows[temprow].cells(temp_mobile).childNodes[0].value;
						break;
                     }
                    }catch(err){
					 }
                 }

				 if ( rowValue1=="" )rowValue1="0";
				 if ( isNaN(rowValue1) ) {
					  rowValue1=0;
                 }
				 single_jsgs=single_jsgs.replace(new RegExp("R"+temprow,"g"),rowValue1)
			  }

			  try{
                var nohj="";
				try{
                    nohj=tbody.rows[endrow].cells(il).childNodes[0].nohj;
				}catch(err){
                    nohj="";
				}
			  if (nohj=="1")
			  {


			  }else {

				  for (var i_col_qual=0;i_col_qual < 2 ; i_col_qual++ )
				  {
                     var rowspan_left= parseInt(il) - parseInt(i_col_qual); // 判断列是否错位
					   var childNodesName="";
                      try{
                          childNodesName=tbody.rows[endrow].cells(rowspan_left).childNodes[0].name;
					  }
					  catch(err){
                          childNodesName="";
					  }

					 if (  childNodesName==colname1)
					 {
                         var  end_value =eval(single_jsgs);
                         if ( end_value==Infinity ) end_value=0;
                         if ( isNaN(end_value)  ==true ) end_value=0;
                         tbody.rows[endrow].cells(rowspan_left).childNodes[0].value=FormatNumber(end_value,2);
						break;
					 }
				  }
              }
             }catch(err){
			 }
           }
         }

	 }else {

      for (var i1=0;i1<td_count;i1++)
      {
        if (gsjg[i]==row.cells(i1).childNodes[0].name)
        {
			gsjg_cell_index=i1;
        }

       if (single_jsgs.indexOf(row.cells(i1).childNodes[0].name) >=0)
       {
		    single_value=row.cells(i1).childNodes[0].value;

            if ( isNaN(single_value)  ) {
               // row.cells(i1).childNodes[0].value="";
                   single_value=0;
            }
			 single_name=row.cells(i1).childNodes[0].name;
             if ( single_value=="" )single_value="0";

             single_jsgs=single_jsgs.replace(new RegExp(single_name,"g"),single_value)
	    }
       }

      var  end_value =eval(single_jsgs);
      if ( end_value==Infinity ) end_value=0;
      if ( isNaN(end_value)  ==true ) end_value=0;
       if (row.cells(gsjg_cell_index).childNodes[0].name.indexOf("je") <0) {
               row.cells(gsjg_cell_index).childNodes[0].value=single_value;
			}else{
				      row.cells(gsjg_cell_index).childNodes[0].value=FormatNumber(end_value,2);
			}

 	}
 }
}
function addWaitImg(button,waitImgDiv)
{
  var top=button.offsetTop;
  var left=button.offsetLeft;
  while(button=button.offsetParent)
  {
    top+=button.offsetTop;
    left+=button.offsetLeft;
  }
  if(button==null)
 {}
  else
  {button.disabled = true;}  waitImgDiv.style.left = left;
  waitImgDiv.style.top  = top - 10;
  waitImgDiv.style.display="block";
}
// 当alertMasterSheet 查询不到数据而且noRecordAlert属性为1时调用该方法
function noRecordAlert()
{
   alert("查询无记录");
}

function document_onkeydown() {

  var obj = event.srcElement;
 // alert(obj)
  ll_row=obj.rowIndex
  ls_name=obj.name

  if (obj.tagName == 'INPUT' || obj.tagName == 'SELECT'  )   {
  	  if (event.keyCode == 38) { // Up
	 	 var i = obj.parentElement.parentElement.rowIndex - 1 - zg_head.rows.length;
		 if(i >= 0) obj.parentElement.parentElement.parentElement.rows[i].cells[obj.parentElement.cellIndex].childNodes[0].focus();
	                         }
	  if (event.keyCode == 40) { // Down
		 var i = obj.parentElement.parentElement.rowIndex + 1 - zg_head.rows.length;
		 if(i < obj.parentElement.parentElement.parentElement.rows.length) obj.parentElement.parentElement.parentElement.rows[i].cells[obj.parentElement.cellIndex].childNodes[0].focus();
	                           }
      if (event.keyCode ==36 ) // home
      {
		  return true ;
      }
	  if (event.keyCode==35) // end
	  {
          return true;
	  }

	  if (obj.tagName == 'INPUT'  ) {

           if (obj.name.indexOf("je") >=0)
           {
               if  ( ( 48 <= event.keyCode  &&  event.keyCode <=57  ) ||
				   event.keyCode==190 || event.keyCode==46 || event.keyCode==8 ||
				   ( 96 <= event.keyCode  &&  event.keyCode <=105  )
				   )
               {
                var ll_length=obj.value.length
                var li_1=obj.value.indexOf(".")
			     var s=document.selection.createRange();
                 s.setEndPoint("StartToStart",obj.createTextRange())


                if ( (li_1 >=0) && ( ll_length - li_1 -1 > 1) && (s.text.length >li_1) ){
					obj.value=obj.value.substr(0, obj.value.length -1);
                 }
               }else{
                   if (event.keyCode == 9 || event.keyCode==37|| event.keyCode==39) {
					   return true;
				   } else if (event.keyCode == 13 ){
					   event.keyCode = 9;
					    return true;
				   }
				   return false
			   }
           }
	  }
   }
}

function num_I(obj){
	var num = parseFloat(obj.value.replaceAll(",", ""));
	if (isNaN(num)) { obj.value = ""; }
	/*
	 * var val = obj.value; var cs = val.replace(/[^0-9]/g,''); obj.value = cs;
	 */
}
function num_D(obj){
	var num = parseFloat(obj.value.replaceAll(",", ""));
	if (isNaN(num)) { obj.value = ""; }
}
function f_blur(obj) {
	if (obj.value != "" && obj.value != "-") {
		obj.value = parseFloat(obj.value.replaceAll(",", "")).toFixed(2);
		f_fmt(obj);
	} else {
		obj.value = "";
	}
}
function f_blur_h(obj) {
	if (obj.innerHTML != "") {
		obj.innerHTML = parseFloat(obj.innerHTML.replaceAll(",", "")).toFixed(2);
		f_format(obj);
	}
}
function f_focus(obj) {
	if (obj.value != "") {
		obj.value = obj.value.replaceAll(",", "");
	}
}
function jysz()
{
	var is=0;
	 $("input").each(function(){
		 if(typeof($(this).attr("alertname"))!='undefined')
	     {
			 if($(this).attr("datatype")=='number')
			 {
			   if(isNaN($(this).val()))
			   {
				 alert($(this).attr("alertname"));
				 $(this).val("");
				 is=1;
			   }
			 }
	     }
	 });
	 if(is==0)
	 {
		 return true;
	 }
	 else
	 {
		 return false;
	 }
}
