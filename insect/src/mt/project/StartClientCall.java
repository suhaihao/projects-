package mt.project;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
//import com.jf.taxbank.exchange.client.mainClientThread;

public class StartClientCall
    extends HttpServlet {
  private static final String CONTENT_TYPE = "text/html; charset=GBK";
  public void init() throws ServletException { }

  public void doGet(HttpServletRequest request, HttpServletResponse response) throws
    ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
   // mainClientThread cli = new mainClientThread();
   // cli.startThread();
    PrintWriter out = response.getWriter();
    out.println("服务启动成功！");
    out.close();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws
      ServletException, IOException {
    doGet(request, response);
  }


  public void destroy() {
  }

}
