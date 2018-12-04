package mt.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ActionSz
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

  public final String FILEHEAD = "Content-Disposition: form-data; name=\"";
  public final String fieldend = "-----------------------------";

  public final String FILENAME = "filename=\"";
  public final String enterRow = "\r\n"; //回车换行
// public int formSize=0;
  HttpServletRequest request1;
  javax.servlet.ServletInputStream sim = null;
  public void dataProcess(ActionMapping actionMapping, ActionForm actionForm,
                          HttpServletRequest httpServletRequest,
                          HttpServletResponse httpServletResponse) {

      mt.tools.FileUpload fu = new mt.tools.FileUpload(httpServletRequest);
      fu.savefile();
      fu.getFileName("file1");
      fu.getFileName("file3");

  }

  public void readStream(javax.servlet.ServletInputStream sim1) {
    byte[] buffer = new byte[1024];
    String curString = "";

    try {
      while (sim.read(buffer) != -1) { //分析普通列
        curString = new String(buffer, "ISO8859_1");
//        System.out.println("ssss");
      }
      sim.close();
    }
    catch (IOException e) {
        e.printStackTrace();
    }

  }

}
