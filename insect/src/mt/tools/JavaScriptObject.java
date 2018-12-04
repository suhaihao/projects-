package mt.tools;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

/**
 * <p>Title: </p>
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
public class JavaScriptObject {
  final String ENCODE = "ISO8859_1";
  HttpServletResponse httpServletResponse;
  public JavaScriptObject(HttpServletResponse httpServletResponse) {
    this.httpServletResponse = httpServletResponse;
  }

  public void alert(String messageText) {
    String convertText;
    try {
      convertText = new String(messageText.getBytes("gb2312"), ENCODE);
      httpServletResponse.getWriter().print("<script language=javascript>");
      httpServletResponse.getWriter().print("alert(\"" + convertText + "\")\n");
      httpServletResponse.getWriter().print("window.history.back()");
      httpServletResponse.getWriter().print("</script>");
    }
    catch (UnsupportedEncodingException ex) {
    }
    catch (IOException ex) {
    }
  }

}
