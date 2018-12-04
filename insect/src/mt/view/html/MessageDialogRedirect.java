package mt.view.html;

/**
 * <p>Tittle:˰�����ܣ���ǩ</p>
 *
 * <p>Description:
 *    ������ʾ��Ϣ������ҳ����f_refreshOpener()�����ݽ��в���
 *    successMes ��ʼΪ���ɹ�������session�еõ��� MessageRedirect ��ֵ����
 *    successMes �е�ֵʱ���ڹر�
 * </p>
 *
 * @version 1.0
 */

import mt.tools.CustString;
import mt.view.BaseTag;

public class MessageDialogRedirect extends BaseTag
{
  private String successMes = "�ɹ�";
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
