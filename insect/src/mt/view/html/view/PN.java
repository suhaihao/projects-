package mt.view.html.view;
import mt.view.*;
import mt.view.html.*;
/**
 * <p>Title:��ҳ��ǩ</p>
 *
 * <p>Description: </p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: </p>
 *
 * @author not attributable
 * @version 1.0
 */
public class PN
    extends BaseTag {
  public String front() {
    String tempfront = "";
    tempfront += getMessage();
    return tempfront;
  }

  private String getMessage() {
    String returnMessage = "";
    String forward = "";
    String temp = "";
    String disabledtemp = "";
    try {
      javax.servlet.http.HttpServletRequest hrq = (javax.servlet.http.HttpServletRequest)this.pageContext.getRequest();
      String lb = hrq.getParameter("lb");
      PageCollection pc = (PageCollection)this.pageContext.getRequest().
          getAttribute(((javax.servlet.http.HttpServletRequest)this.pageContext.getRequest()).getServletPath()+"_pc");
        if ( pc.pagecount ==0 ) { pc.pagecount=1; }
      javax.servlet.http.HttpSession session = this.pageContext.getSession();
      session.setAttribute(( (javax.servlet.http.HttpServletRequest)this.
                         pageContext.getRequest()).getServletPath() +
                       "_curpage", Integer.toString(pc.currentpage));
      returnMessage += "\n";
      returnMessage += "<div style='text-align:right'><nobr>";
      returnMessage += "�ܼ�:&nbsp;" + pc.rowcount + "����¼&nbsp;&nbsp";
      returnMessage += "<label id='pagecursum' name='pagecursum'>" + pc.currentpage + "/" + pc.pagecount + "</label>ҳ&nbsp;&nbsp";

      temp = "&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"?lb=" + lb + "&ACT_TYPE=DIVPAGE&CURPAGE=" +
          pc.currentpage;
      disabledtemp = "&nbsp;&nbsp;&nbsp;&nbsp;<a disabled ";
      returnMessage += temp + "&PAGE=FIRST\">��ҳ</a>";
      if (pc.currentpage != 1) {
        returnMessage += temp + "&PAGE=UP\">��һҳ</a>";
      }
      else {
        returnMessage += disabledtemp + ">��һҳ</a>";
      }

      if (pc.currentpage != pc.pagecount ) {
        returnMessage += temp + "&PAGE=DOWN\">��һҳ</a>";
      }
      else {
        returnMessage += disabledtemp + ">��һҳ</a>";
      }

      if (pc.currentpage != pc.pagecount) {
        returnMessage += temp + "&PAGE=LAST\">ĩҳ</a>";
      }   else {
        returnMessage += disabledtemp + ">ĩҳ</a>";
      }
      returnMessage += "&nbsp;&nbsp;&nbsp;&nbsp;ת";
      returnMessage +=
          "<input style='width:40px' type=page_div onkeydown=\"return page_div_onkeydown(this)\">ҳ";
      returnMessage += "</nobr></div>";
      returnMessage += "<script language=javascript>\n";
      returnMessage += " function  page_div_onkeydown(obj){\n";
      returnMessage += " var thisvalue=obj.value;";
      returnMessage += " if (longint(thisvalue)==false) { return } \n";
      returnMessage += "  if (event.keyCode==13 && thisvalue.length > 0 ) { ";
      returnMessage +=
          "  window.document.location =\"?lb=" + lb + "&ACT_TYPE=DIVPAGE&CURPAGE=" +
          pc.currentpage;
      returnMessage += "&PAGETO=\"+obj.value;";
      returnMessage += " } ";
      returnMessage += "} \n";
      returnMessage += "</script>\n";
      returnMessage += "\n";
    }catch (Exception e){
      new mt.tools.customException(e,this.toString());
    }
    return returnMessage;

  }
}
