package mt.view.html.view;

import mt.view.html.FreeSelect;
import mt.view.html.DataValue;

public class Vselect extends FreeSelect {

  protected String getDataTable() {
      this.defaultValue = getValue();
     return super.getDataTable();
}

protected String getValue() {
 DataValue dv=new DataValue();
 return dv.getValueBySheet(this.name(),this);

 }

}
