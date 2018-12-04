package mt.view;


import javax.servlet.jsp.tagext.*;

import java.io.IOException;

public class BaseBodyTag
    extends BodyTagSupport {

  protected String name;
  public void setName(String name) {
    this.name = name;
  }

  protected String other;
  public void setOther(String other) {
    this.other = other;
  }

  public String id() {
    return "id=\"" + (new mt.tools.CustString()).nullToString(getId()) + "\"";
  }

  public String name() {
    return "name=\"" + (new mt.tools.CustString()).nullToString(name) + "\"";
  }

  public String other() {
    return "" + (new mt.tools.CustString()).nullToString(other) + "";
  }

  public int doStartTag() {
    printStart();
    return EVAL_BODY_INCLUDE;
  }
  public String getName(){
       return name;
  }

  public int doAfterBody() {
    return SKIP_BODY;
  }

  public int doEndTag() {
    printEnd();
    return EVAL_PAGE;
  }

  public void printStart() {
    print(front());
  }

  public void printEnd() {
    print(back());
  }

  public String front() {
    return "";
  }

  public String back() {
    return "";
  }

  public void print(String str) {
    try {
      pageContext.getOut().print(str);
    }
    catch (IOException e) {
      new mt.tools.customException(e, this.toString());
    }
  }

  protected String getAllAttribute(){
  String tempStr=" ";
  tempStr +=id()+" ";
  tempStr +=name()+" ";
  tempStr +=this.other();
  return tempStr;
}

}
