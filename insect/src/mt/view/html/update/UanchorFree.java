package mt.view.html.update;


import mt.view.html.view.*;
import mt.view.html.DataValue;

public class UanchorFree extends VanchorFree {

protected String getValue() {
 DataValue dv=new DataValue();
 return dv.getValueByMasterSheet(this.name(),this);
}
}
