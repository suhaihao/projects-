package mt.view.html.update;
import mt.view.html.*;
import mt.view.html.view.*;

public class Uselect extends Vselect {

 protected String getValue() {
   DataValue dv=new DataValue();
   return dv.getValueByMasterSheet(this.name(),this);
   }
}
