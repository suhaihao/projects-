package mt.view.html;

/**
 * <p>Tittle:税收征管，标签</p>
 *
 * <p>Description:
 *    弹出提示信息并根据页面中f_refreshOpener()的内容进行操作
 *    successMes 初始为“成功”，当session中得到的 MessageRedirect 的值等于
 *    successMes 中的值时窗口关闭
 * </p>
 *
 * @version 1.0
 */

import mt.tools.CustString;
import mt.view.BaseTag;

public class MessageDialogRedirect extends BaseTag
{
  private String successMes = "成功";
  public void setSuccessMes(String mes)
  {
    this.successMes = mes;
  }
  public String front()
  {
    String tempfront = "";
    String message = "";

    message = new CustString().nullToString( (String)this.pageContext.getSession().getAttribute("MessageRedirect") );
    if (!message.trim().equals(""))
    {
      tempfront = "<script language=javascript> \n";
      tempfront += "   f_refreshOpener() \n";
      tempfront += "   alert(\"" + message + "\") \n";
      if ( message.equals(successMes) )
      {
        tempfront += "window.close()\n";
      }
      tempfront += "</script> \n";
    }
    this.pageContext.getSession().removeAttribute("MessageRedirect");

    return tempfront;
  }
}
