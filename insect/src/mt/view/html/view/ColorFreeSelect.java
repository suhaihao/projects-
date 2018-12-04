package mt.view.html.view;

import mt.view.html.FreeSelect;
import mt.view.html.DataValue;
import mt.database.extend.QueryConnection;
import mt.database.JavaDataObject;
public class ColorFreeSelect extends FreeSelect {
  private String color1;
  private String color2;
  private String event;
  public String front() {
    String tempfront = "";
    tempfront += "<select" + " ";
    tempfront += super.getAllAttribute() + " ";
    tempfront += color1() + " ";
    tempfront += color2() + " ";
    tempfront += defaultValue() + " ";
    tempfront += event() + " ";
    tempfront += " >\n";
    tempfront += getDataTable();
    return tempfront;
  }

  public void setColor1(String color1) {
    this.color1 = color1;
  }

  public void setColor2(String color2) {
    this.color2 = color2;
  }

  public void setEvent(String event) {
    if(event==null||event.trim().equals("null")||event.trim().equals(""))event="onChange";
    this.event = event;
  }

  private String color1(){
    if(color1==null||color1.trim().equals(""))color1="#000000";
    return " color1='" + color1 + "'";
  }
  private String color2(){
    if(color2==null||color2.trim().equals(""))color2="#000000";
    return " color2='" + color2 + "'";
  }
  private String defaultValue(){
    return " defaultValue=\"" + value() + "\" ";
  }
  public String event(){
    if(event==null||event.trim().equals("null")||event.trim().equals(""))event="onChange";
    return event+"=\"changeColor(this)\"";
  }
  protected String getDataTable() {
    DataValue dv = new DataValue();
    this.defaultValue = value();
    String strData = "";
    String sql = "";
    QueryConnection qc=null;
    boolean state = false;
    JavaDataObject jdo = null;
    try {
      if (dataMember.trim().length() > 0) {
        qc = new QueryConnection();
        jdo = new JavaDataObject(qc);
        sql = " select " + getSelect() + " from " + dataMember + getWhere() +
            getSort();
        jdo.executeQuery(sql.trim());
        while (jdo.rs.next()) {
          if (defaultValue.equals(jdo.rs.getString(1))) {
            state = true;
            strData += "<option selected value='" + jdo.rs.getString(1) + "'>" +
                jdo.rs.getString(2) + "</option>";
          }
          else {
            strData += "<option value='" + jdo.rs.getString(1) + "'>" +
                jdo.rs.getString(2) + "</option>";
          }
        }
        if (state == true) {
          strData += "<option value=\"\"></option>";
        }else{
          strData += "<option selected value=\"\"></option>";
        }
      }
    }
    catch (Exception e) {
      new mt.tools.customException(e, this.toString());
    }
    finally {
      jdo.close();
      qc.close();
    }
    return strData;

  }

}
