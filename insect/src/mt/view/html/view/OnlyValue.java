package mt.view.html.view;

import mt.view.html.Vobject;

public class OnlyValue
    extends Vobject {

  public String front() {
    return value();
  }
  public String value() {
    return (new mt.tools.CustString()).nullToHtml(getValue());
  }
}
