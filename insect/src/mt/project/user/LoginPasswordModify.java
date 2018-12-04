package mt.project.user;

import javax.servlet.http.HttpServletRequest;
import mt.controller.InitAction;
import mt.controller.base.ServletObject;

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
public class LoginPasswordModify extends InitAction {

  protected void actionQuery(ServletObject servletObject) {
    String kl = servletObject.httpServletRequest.getParameter("kl");
    String ykl = servletObject.httpServletRequest.getParameter("ykl");
    javax.servlet.http.HttpSession session = servletObject.httpServletRequest.getSession(true);
    String userId = ( (mt.project.share.User) session.getAttribute("user")).userId;
    servletObject.dc.pjdo.pageQuery("select jfid from dsys01 where jfid='" + userId +
                      "' and kl='" + ykl + "'");
    if (servletObject.dc.pjdo.getRowCount() > 0) {
      try {
        servletObject.dc.pjdo.execute(" update dsys01 set kl='" + kl + "' where jfid='" +
                        userId + "' ");
        servletObject.dc.pjdo.dbConn.commit();
        servletObject.httpServletResponse.getOutputStream().print(
            "<script language='javascript'>");
        servletObject.httpServletResponse.getOutputStream().println("alert('Sucess!');");
        servletObject.httpServletResponse.getOutputStream().println("window.close();");
        servletObject.httpServletResponse.getOutputStream().print("</script>");
      }
      catch (Exception e) {
        servletObject.dc.ec.rollback();
        try {
          servletObject.httpServletResponse.getOutputStream().print(
              "<script language='javascript'>");
          servletObject.httpServletResponse.getOutputStream().println("alert('Failure!');");
          servletObject.httpServletResponse.getOutputStream().println("history.back(-1); ");
          servletObject.httpServletResponse.getOutputStream().print("</script>");
          //httpServletResponse.sendRedirect("/struts/user/changepassword1.jsp");
        }
        catch (Exception e1) {
          e1.printStackTrace();
        }
      }
    }else{
      try {
          servletObject.httpServletResponse.getOutputStream().print(
              "<script language='javascript'>");
          servletObject.httpServletResponse.getOutputStream().println("alert('Failure!');");
          servletObject.httpServletResponse.getOutputStream().println("history.back(-1); ");
          servletObject.httpServletResponse.getOutputStream().print("</script>");
          //httpServletResponse.sendRedirect("/struts/user/changepassword1.jsp");
        }
        catch (Exception e1) {
          e1.printStackTrace();
        }
    }
  }
}
