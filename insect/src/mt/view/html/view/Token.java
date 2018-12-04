package mt.view.html.view;
import org.apache.struts.util.TokenProcessor;
import org.apache.struts.Globals;
import org.apache.struts.taglib.html.Constants;
import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.http.HttpServletRequest;
public class Token  extends TagSupport  {
  public HttpServletRequest request;
  public Token(HttpServletRequest request) {
     this.request=request;
  }

  public String getToken(){
    String token="";
    token=TokenProcessor.getInstance().generateToken(request);
    javax.servlet.http.HttpSession session= request.getSession();
    session.setAttribute(Globals.TRANSACTION_TOKEN_KEY,token);
    return token;
  }

  public String getTokenHtml(){
     String html="";
     html="<input type=\"hidden\" name=\""+Constants.TOKEN_KEY+"\"";
     html+=" value=\""+getToken()+"\">";
     return html;
   }
}
