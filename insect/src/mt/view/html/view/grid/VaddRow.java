package mt.view.html.view.grid;

import javax.servlet.jsp.tagext.BodyTagSupport;

public class VaddRow extends BodyTagSupport {

  public int doAfterBody() {


     return SKIP_BODY;
  }

  public java.util.ArrayList tdlist=new java.util.ArrayList();

}
