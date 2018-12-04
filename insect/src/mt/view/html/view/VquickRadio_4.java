package mt.view.html.view;

import mt.view.html.*;

public class VquickRadio_4
    extends VquickRadio {
  private String paremeters;
  public void setParemeters(String paremeters) {
   this.paremeters = paremeters;
 }

  public String paremeters() {
    if (onSelect().equals("")) {
      return "";
    }
    DataValue dv = new DataValue();
    String tempreturn = "(";
    String[] paremeters = this.paremeters.split(",");
    for (int i = 0; i < 3; i++) {
      tempreturn += "'" + dv.getValueBySheet(paremeters[i], this) + "'";
      tempreturn += ",";
    }
    tempreturn += "'" + paremeters[3] + "'";
    tempreturn += ")";
    return tempreturn;
  }
}
