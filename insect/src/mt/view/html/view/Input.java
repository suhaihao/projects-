package mt.view.html.view;
import mt.view.html.*;
import javax.servlet.http.HttpServletRequest;
/**
 * <p>Title:input ±Í«© </p>
 *
 * <p>Description: </p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: </p>
 *
 * @author not attributable
 * @version 1.0
 */
public class Input extends Vobject{
  public Input() {
    try {
      jbInit();
    } catch (Exception ex) {
      ex.printStackTrace();
    }
  }

  public String front(){
     String tempfront="";
     tempfront+="<input"+" " ;
     tempfront+=type()+" ";
     tempfront+=super.getAllAttribute()+" ";
     tempfront+=value();
     tempfront+=">";
     
     int l=getName().length();
     String name_n=getName().substring(0,l-6);
     HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
     request.setAttribute(name_n,getValue());

     return tempfront;
}

  private String value;
  public void setValue(String value) {
    this.value = value;
  }
  private String type;
  public void setType(String type) {
    this.type = type;
  }

  protected String checkname;
  public void setCheckname(String checkname) {
        this.checkname = checkname;
  }

  public String getCheckname(){
      return (new mt.tools.CustString()).nullToString(checkname);
 }


  public String type(){
      return "type=\"" + (new mt.tools.CustString()).nullToString(type) + "\"";
 }


 public String getType(){
     return (new mt.tools.CustString()).nullToString(type);
 }
  public String value(){
     return " value=\"" + (new mt.tools.CustString()).nullToString(value) + "\" ";
  }

  private void jbInit() throws Exception {
  }


}
