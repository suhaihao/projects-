package mt.view.html.view;

import mt.view.html.*;
import mt.database.extend.QueryConnection;
import mt.database.JavaDataObject;

public class DefaultSelect
    extends FreeSelect {
  public void setDefaultvalue(String defaultValue) {
    DataValue dv = new DataValue();
    this.defaultValue = dv.getValueBySheet( (new mt.tools.CustString()).
                                           nullToString(defaultValue), this);
  }
}
