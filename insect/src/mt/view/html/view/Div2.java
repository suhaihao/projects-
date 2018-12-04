package mt.view.html.view;


import mt.view.html.DataValue;
import mt.view.html.Vobject;

public class Div2
    extends Vobject {

  public String front() {
    String tempfront = "";
    tempfront += "<a " + " href='#' ";
    tempfront += super.getAllAttribute() + " ";
    tempfront += onclick();
    tempfront += ">";
    tempfront += "ÐÞ  ¸Ä";
    tempfront += "</a>";
    return tempfront;
  }

  private String onclick;
  public void setOnclick(String onclick) {
    this.onclick = onclick;
  }

  public String onclick() {
    if(onclick==null||onclick.equals(""))return"";
    String ret = "onclick=\"" + (new mt.tools.CustString()).nullToString(onclick);
    ret += paremeters() + "\"";
    return ret;
  }

  public String value() {
    return (new mt.tools.CustString()).nullToHtml(getValue());
  }

  private String paremeters;
  public void setParemeters(String paremeters) {
    this.paremeters = paremeters;
  }

  public String paremeters() {
   DataValue dv=new DataValue();
   String tempreturn = "(";
   String[] paremeters = this.paremeters.split(",");
   for(int i=0;i<paremeters.length;) {
     tempreturn+="'" + dv.getValueBySheet(paremeters[i],this) + "'";
     i++;
     if(i<paremeters.length) {
       tempreturn+=",";
     }
   }
   tempreturn+=")";
   return tempreturn;
  }

}
