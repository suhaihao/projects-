package mt.view.html.update;
import mt.view.html.view.*;
import mt.view.html.DataValue;
public class Uanchor  extends Vanchor {
  protected String getValue() {
     DataValue dv=new DataValue();
    return dv.getValueByMasterSheet(this.name(),this);
 }

}
