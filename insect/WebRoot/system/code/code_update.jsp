<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt"%>
<script language="javascript" src="/insect/javascript/jy.js" type="text/javascript"></script>
<html>
  <head>
    <title>系统代码维护</title>
    <%@ page language="java" contentType="text/html;charset=gb2312" %>
  </head>
  <body bgcolor="#ffffff" onload="window_onload()">
  <TABLE class=tableBorder1 style="WIDTH: 100%" cellSpacing=0 cellPadding=3 align=center border=1>
    <TBODY>
        <TR>
          <TD class=bodytitle height=25>
            <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
                <TR vAlign=middle>

                  <TD background="/struts/images/report/art_tt_bg1.gif"><img width="20px" alt="" src="/hnzx/images/images/home.png" />&nbsp;您现在所在的位置 &gt;&gt; 系统管理 &gt;&gt; 系统代码维护</TD>
                </TR>
              </TBODY>
            </TABLE>
          </TD>
        </TR>

      </TBODY>
  </TABLE>
    <mt:form id="f1" name="f1" method="post" action="">
      <table class=tableBorder id="t1" cellSpacing=0 cellPadding=3 width="95%" align=center border=1 bordercolor="#F1F3F5">
        <TR>
          <TH colSpan=10>系统代码维护修改</TH>
        </TR>
        <tr>
          <td class="forumRowHighlight">序号</td>
          <td class="forumRowHighlight">编码</td>
          <td class="forumRowHighlight">汉字说明</td>
          <td class="forumRowHighlight">编码类别</td>
          <td class="forumRowHighlight">备注</td>
          <td class="forumRowHighlight">删除</td>
        </tr>
        <mt:sheet pagesize="10">
          <tr>
            <td width="5%" align="center">
              <mt:index other="style='width:5px;text-align:left'"/>
            </td>
            <td width="12%"><mt:vinput other="style='width:100%;BORDER-STYLE:none;BORDER-BOTTOM:black 1px inset;' chname='编码' nullable='no'" type="text" name="dsys11:jfcode:str:M"/></td>
            <td width="12%">
              <mt:vinput other="style='width:100%;BORDER-STYLE:none;BORDER-BOTTOM:black 1px inset;' chname='汉字说明' nullable='no'" type="text" name="dsys11:jfcodename:str:M"/>
              <mt:vinput type="hidden" name="dsys11:jfid:str:M"/>
            </td>
            <td width="12%"><mt:vinput other="style='width:100%;BORDER-STYLE:none;BORDER-BOTTOM:black 1px inset;' chname='标志1' " type="text" name="dsys11:jfsort:str:N"/></td>
            <td width="12%"><mt:vinput other="style='width:100%;BORDER-STYLE:none;BORDER-BOTTOM:black 1px inset;' chname='标志2' " type="text" name="dsys11:bz1:str:M"/></td>

            <td class=forumRow width="10%"><mt:vinputdelete type="checkbox" other="style='width:25px'"  name="dsys11:jfid:str:P"/></td>
          </tr>
        </mt:sheet>
        <tr>
          <td colspan=10 class=td11><mt:pagenavigate/></td>
        </tr>
        <mt:addcolumn name="ac1">
          <tr>
            <td align=center><label name='xh'></label></td>
            <td><input style="width:100%;BORDER-STYLE:none;BORDER-BOTTOM:black 1px inset;"  chname="编码" nullable="no" name="dsys11:jfcode:str:M" type="text" ></td>
            <td>
              <input style="width:100%;BORDER-STYLE:none;BORDER-BOTTOM:black 1px inset;" chname="汉字说明" nullable="no" name="dsys11:jfcodename:str:M" type="text">
              <input type="hidden" name="dsys11:jfid:str:M">
            </td>
            <td><input style="width:100%;BORDER-STYLE:none;BORDER-BOTTOM:black 1px inset;"  chname="标志1"  name="dsys11:jfsort:str:N" type="text" ></td>
            <td><input style="width:100%;BORDER-STYLE:none;BORDER-BOTTOM:black 1px inset;"  chname="标志2"  name="dsys11:bz1:str:M" type="text" ></td>
            <td align="center"><mt:deletebutton name="dsys11:jfid:str:P" other="style='border:0;width:25px'"/></td>
          </tr>
        </mt:addcolumn>
        <tr align="center">
          <td colspan=10>
            <mt:addbutton other=" class='button'" name="add" table="t1" tablebody="tbodyData" addobject="ac1" />
            <input type="button" name="save" value="保 存" class="button" onclick="return f_save()" />
            <input type="button" name="back" value="返 回" class="button" onclick="return f_back()" />
          </td>
        </tr>
      </table>
    </mt:form>
  </body>
</html>
<script language="javaScript" type="">
function window_onload()
{
  initcal()
}
function f_back()
{
  window.location="/insect/system/code/code_list.jsp";
}
function f_save()
{
  if (tbodyData.rows.length < 1)
  {
    alert("请单击增加按钮，增加数据记录!");
    return;
  }

  if (f1.onsubmit()==false){return false}//与nullable='no' 对应进行验证

  if ( f_confirm("确实需要保存数据吗?") ==false){ return false; }

  document.f1.save.disabled = true;
  document.f1.back.disabled = true;
  document.f1.add.disabled = true;

  document.f1.action ="/insect/systemCodeUpdate.do?ACT_TYPE=UPDATE";
  document.f1.method ="post";
  document.f1.submit();
}
function f_refreshOpener()
{}
function editWin(){
  var obj = editWin.arguments[0];
  var par = commute(obj.value,'#','\n');
  var ret = window.showModalDialog("/hnzx/jpublic/editwin.jsp",par,"dialogWidth:420px;dialogHeight:270px;help:no;status:no;");
  obj.value=commute(ret,'\n','#')
}
//替换特定字符
//n1字符串,n2要替换的字,n3替换的字
function commute(n1,n2,n3)
{
var a1,a2,a3=0,a0=''
a1=n1.length;
a2=n2.length;
for(x=0;x<=(a1-a2);x++)
{
if(n1.substr(x,a2)==n2)
 {
 a0+=n1.substring(a3,x);
 a0+=n3;
 x+=(a2-1);
 a3=x+1;
 }
}
if(a3<a1)a0+=n1.substring(a3,a1)
 {
 return a0;
 }
}
</script>
<mt:messageDialogRedirect successMes="!"/>
