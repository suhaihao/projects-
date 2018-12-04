package mt.view.html;
import mt.view.*;

public class VbodyObject  extends BaseBodyTag {

 public String value(){
       return getValue();
  }

protected String getValue() {
  DataValue dv=new DataValue();
 return dv.getValueBySheet(this.name(),this);
}


}
