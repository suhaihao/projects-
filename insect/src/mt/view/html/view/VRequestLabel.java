package mt.view.html.view;

import mt.view.BaseTag;
import mt.tools.CustString;
public class VRequestLabel extends BaseTag {
  public String front(){
      String tempfront="";
      tempfront+="<label "+" " ;
      tempfront+=super.getAllAttribute()+">";
      tempfront+=new CustString().nullToString((String)this.pageContext.getRequest().getAttribute(getName()));
      tempfront+="</label>";
      this.pageContext.getRequest().removeAttribute(getName());
      return tempfront;
  }
  }
