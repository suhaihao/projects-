package mt.view.html.view;

public class VfreeSelect_max
    extends Vselect {

  protected String opttext;
  public void setOpttext(String opttext) {
    this.opttext = (new mt.tools.CustString()).nullToString(opttext);
  }

  protected String optmax;
  public void setOptmax(String optmax) {
    this.optmax=(new mt.tools.CustString()).nullToString(optmax);
  }

  protected String optvalue;
  public void setOptvalue(String optvalue) {
    this.optvalue = optvalue;
  }

  protected String getDataTable() {
    if (!getValue().trim().equals("")) {
      this.defaultValue = getValue();
    }
    else {
      this.defaultValue = getDefaultvalue();
    }
    String strData = "";
    String sql = "";
    boolean state = false;

    String listname[] = this.opttext.split(":");
    String listvalue[] = this.optvalue.split(":");
    for (int i = 0; i < listname.length; i++) {
      if (Integer.parseInt(listvalue[i]) <= Integer.parseInt(optmax)) { //取大于等于optmax的option
        if (defaultValue.equals(listvalue[i])) {
          state = true;
          strData += "<option selected qxvalue='" + listvalue[i] + "' value='" + listvalue[i] + "'>" +
              listname[i] + "</option>";
        }
        else {
          strData += "<option qxvalue='" + listvalue[i] + "' value='" + listvalue[i] + "'>" +
              listname[i] + "</option>";
        }
      }
    }

    return strData;
  }

}
