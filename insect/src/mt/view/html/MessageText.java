package mt.view.html;

import mt.view.BaseTag;
import mt.tools.CustString;
public class MessageText extends BaseTag {

  public String front(){
      String tempfront="";
      tempfront+="<label "+" " ;
      tempfront+=super.getAllAttribute()+">";
      tempfront+=new CustString().nullToString((String)this.pageContext.getRequest().getAttribute("Err"));
      tempfront+="</label>";
      this.pageContext.getRequest().removeAttribute("Err");
      return tempfront;
  }

}
