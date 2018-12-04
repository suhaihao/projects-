package mt.view.html.view;

import mt.view.html.DataValue;
import mt.view.*;
import mt.view.html.*;

public class VanchorFree extends BaseBodyTag {
  public String value(){
    return "value=\"" +getValue()+ "\"";
}


protected String getValue() {
 DataValue dv=new DataValue();
 return dv.getValueBySheet(this.name(),this);

}

 protected String href;
 public void setHref(String href) {
   this.href = href;
 }

protected String othername;
public void setOthername(String othername){
   this.othername=othername;
}

public String getName(){
  if  (!(new mt.tools.CustString()).nullToString(othername).trim().equals("") ){
      return  othername;
  } else {
      return  name;
  }
}

 public String href(){
      return "href=\"" + (new mt.tools.CustString()).nullToString(href) + "&"+getName()+"="+getValue()+"\";\n";
 }

 public int doStartTag() {
    printStart();
    return EVAL_BODY_INCLUDE;
  }


  public int doAfterBody() {
    return SKIP_BODY;
  }


public String front() {
    String tempfront="";
    tempfront+="<a "+" " ;
    tempfront+=super.getAllAttribute()+" ";
    tempfront+=href();
    tempfront+=">";
    return tempfront;
}

public String back() {
 return "</a>";
}



}
