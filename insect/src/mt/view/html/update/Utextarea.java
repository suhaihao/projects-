package mt.view.html.update;

import mt.view.html.view.*;
import mt.view.html.DataValue;

public class Utextarea
    extends Vtextarea {

  protected String getValue() {
    DataValue dv=new DataValue();
    return dv.getValueByMasterSheet(this.name(),this);
   }
}
