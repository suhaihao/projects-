package mt.view.html.view;

import java.sql.*;
import mt.view.*;
import mt.view.html.*;

/**
 * <p>Title:能够装载表数据的标签</p>
 *
 * <p>Description: </p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: </p>
 *
 * @author not attributable
 * @version 1.0
 */
public class Vinput
    extends Input {


  public String value() {
    String returnValue = "";
    if (!new mt.tools.CustString().nullToString(getCheckedValue()).trim().
        equals("")) {

      switch  (getInitvalue().length()){
      case 0:
        if (new mt.tools.CustString().nullToString(getCheckedValue()).trim().
            equals(getValue())) {
          returnValue = " checked ";
          returnValue += "value=\"" + getValue() + "\"";
        }
        break;
      default:
        returnValue = new mt.tools.CustString().nullToString(getCheckedValue()).
            trim().equals(getInitvalue()) ? " checked " : "";
        returnValue += " value=\"" + getInitvalue() + "\"";
       break;
      }
    }
    else {
       returnValue += "value=\"" + getValue() + "\"";
    }
    return returnValue;
  }

  protected String othername;

  protected String getValue() {
    DataValue dv = new DataValue();
    String tempName = "";

    if (new mt.tools.CustString().nullToString(this.getOthername()).trim().
        equals("")) {
      tempName = this.name();
    }
    else {
      tempName = this.othername;
    }
    return dv.getValueBySheet(tempName, this);
  }

  protected String getCheckedValue() {
    DataValue dv = new DataValue();

    if (new mt.tools.CustString().nullToString(this.getCheckname()).trim().
        equals("")) {
      return "";
    }
    else {
      return dv.getValueBySheet(this.getCheckname(), this);
    }
  }

  protected String initvalue;

  public void setInitvalue(String initvalue) {
    this.initvalue = initvalue;
  }

  public String getInitvalue() {
    return new mt.tools.CustString().nullToString(this.initvalue);
  }

  public void setOthername(String othername) {
    this.othername = othername;
  }

  public String getOthername() {
    return this.othername;
  }



}
