package mt.controller.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mt.controller.FormData;
import mt.model.DataChannel;
import org.apache.struts.action.ActionMapping;
import java.util.*;

public class ServletObject {
  public HttpServletRequest httpServletRequest;
  public HttpServletResponse httpServletResponse;
  private javax.servlet.http.HttpSession session;
  public ActionMapping actionMapping;
  public String actForward;
  public FormData formData;
  public DataChannel dc;
  public Vector dataContainerVector;
  public ArrayList dataContainerArray;

  public void setActForward(String actForward){
      this.actForward=actForward;
  }
  public String getActForward(){
      return this.actForward;
  }

  public HttpSession getSession(){
    return this.httpServletRequest.getSession();
  }
}
