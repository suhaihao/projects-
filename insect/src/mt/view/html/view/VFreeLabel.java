package mt.view.html.view;

import mt.view.BaseTag;
import mt.tools.CustString;
public class VFreeLabel extends BaseTag {
  public String front(){
      String tempfront="";
      tempfront+=new CustString().nullToString((String)this.pageContext.getRequest().getAttribute(getName()));
//      this.pageContext.getRequest().removeAttribute(getName());
      return tempfront;
  }
  }
