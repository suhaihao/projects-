package mt.view.html;

import mt.tools.CustString;
import mt.view.BaseTag;
/*
 对应标签 successclose
 当返回的提示信息与给定的信息相同时 关闭当前窗口
 */

public class SuccessAndClose extends BaseTag
{
  private String successMes = "成功";
  public void setSuccessMes(String mes){
    this.successMes = mes;
  }
  public String front() {
    String tempfront = "";
    String message = "";

    message = new CustString().nullToString(
       (String)this.pageContext.getRequest().getAttribute("Message"));
    if (!message.trim().equals("")) {
      tempfront = "<script language=javascript> \n";
      tempfront += "   alert(\"" + message + "\") \n";
      if(message.equals(successMes)){
        tempfront += "window.close()\n";
      }
      tempfront += "</script> \n";
    }
   this.pageContext.getRequest().removeAttribute("Message");

    return tempfront;
  }

}
