package mt.project;

import org.apache.struts.action.*;
import javax.servlet.http.*;
import mt.tools.*;
import javax.servlet.http.*;
import mt.controller.*;

public class FileAction
    extends InitAction {
  public String actForward;
  public FormData formData;
  public HttpServletRequest request;
  public ActionForward execute(ActionMapping actionMapping,
                               ActionForm actionForm,
                               HttpServletRequest httpServletRequest,
                               HttpServletResponse httpServletResponse) {
    request = httpServletRequest;
    return super.execute(actionMapping, actionForm, httpServletRequest,
                         httpServletResponse);
  }

  public void dataProcess(ActionMapping actionMapping, ActionForm actionForm,
                          HttpServletRequest httpServletRequest,
                          HttpServletResponse httpServletResponse) {

    mt.tools.FileUpload fu = new mt.tools.FileUpload(httpServletRequest);
    fu.savefile();
    fu.getFileName("file1");
    fu.getFileName("file3");
  }
}
