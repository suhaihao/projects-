package mt.view.html;

import javax.servlet.jsp.tagext.TagSupport;
import java.io.*;
import mt.project.*;
public class HtmlHead extends TagSupport {
  public int doStartTag() {
  try {
//    pageContext.getOut().print("aaa");
//    System.out.print("aaaa");
    if ( validateUser()==true){
         ((javax.servlet.http.HttpServletResponse)this.pageContext.getResponse()).sendRedirect("/struts/login.jsp");
    }
  }
  catch (IOException ex) {
  }
   return SKIP_BODY;
 }

 private boolean validateUser(){
    VerifyUser vu=new VerifyUser((javax.servlet.http.HttpServletRequest)this.pageContext.getRequest(),(javax.servlet.http.HttpServletResponse)this.pageContext.getResponse());
    return vu.isNavigate();
  }
}
