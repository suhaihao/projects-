package mt.view.html.view;
import mt.view.*;
import org.apache.struts.util.TokenProcessor;
import org.apache.struts.Globals;
import org.apache.struts.taglib.html.Constants;
/**
 * <p>Title: Form±Í«©</p>
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
public class Form extends BaseBodyTag{

 public String front(){
     String tempfront="";
     tempfront+="<form"+" " ;
     tempfront+=super.getAllAttribute()+" ";
     tempfront+=method()+" ";
     tempfront+=action()+" ";
     tempfront+="onsubmit=\"return verifyAll(this)\"";
     tempfront+=">\n";
     tempfront+=new Token((javax.servlet.http.HttpServletRequest)this.pageContext.getRequest()).getTokenHtml();
     return tempfront;
}
  public String back(){
     return "</form>";
  }



  private String action;
  public void setAction(String action) {
    this.action = action;
  }
 public String action(){
       return "action=\"" + (new mt.tools.CustString()).nullToString(action) + "\"";
 }
 private String method;
  public void setMethod(String method) {
    this.method= method;
  }
 public String method(){
       return "method=\"" + (new mt.tools.CustString()).nullToString(method) + "\"";
 }

}
