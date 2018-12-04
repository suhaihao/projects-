package mt.view.html.view;

import mt.view.*;
import mt.view.html.*;

public class RequestInput
    extends Input {

  public String value() {
    String tempName = "";
    if (new mt.tools.CustString().nullToString(this.getOthername()).trim().
        equals("")) {
      tempName = this.name;
    }
    else {
      tempName = this.othername;
    }


   if ( (new mt.tools.CustString()).nullToString(this.pageContext.getRequest().
                                                  getParameter(tempName)).
        equals("")) {
     return "value=\"" + this.pageContext.getRequest().getAttribute(tempName) +
        "\"";
    }else {

    return "value=\"" + this.pageContext.getRequest().getParameter(tempName) +
        "\"";
    }
  }


  protected String othername;
  public void setOthername(String othername) {
    this.othername = othername;
  }

  public String getOthername() {
    return this.othername;
  }

}
