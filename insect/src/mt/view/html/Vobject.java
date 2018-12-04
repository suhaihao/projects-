package mt.view.html;
import mt.view.*;
public class Vobject extends BaseTag {

  public String value(){
        return getValue();
   }

 protected String getValue() {
     DataValue dv=new DataValue();
    return dv.getValueBySheet(this.name(),this);
 }
}
