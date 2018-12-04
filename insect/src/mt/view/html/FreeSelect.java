package mt.view.html;

import mt.database.extend.*;
import mt.database.JavaDataObject;
import mt.database.*;

public class FreeSelect extends Select {
  protected String select;
  public void setSelect(String select) {
    this.select = select;
  }

  public String getSelect() {
    return (new mt.tools.CustString()).nullToString(select);
  }

  protected String flag;
  public void setFlag(String flag) {
    this.flag = flag;
  }

  public String getFlag() {
    return (new mt.tools.CustString()).nullToString(flag);
  }
  
  protected String addoptionFront;
  public void setAddoptionFront(String addoptionFront) {
    this.addoptionFront = addoptionFront;
  }

  public String getAddoptionFront() {
    return (new mt.tools.CustString()).nullToString(addoptionFront);
  }
  
  protected String addoptionBack;
  public void setAddoptionBack(String addoptionBack) {
    this.addoptionBack = addoptionBack;
  }

  public String getAddoptionBack() {
    return (new mt.tools.CustString()).nullToString(addoptionBack);
  }
  
  protected String where;
  public void setWhere(String where) {
    this.where = where;
  }

  public String getWhere() {
    String whereReturn;
    whereReturn = (new mt.tools.CustString()).nullToString(this.where);
    whereReturn = whereReturn.trim().length() > 0 ? " where " + whereReturn :" ";
    return whereReturn;
  }

  protected String getDataTable() {
    String strData = "";
    String sql = "";

    QueryConnection qc=null;

    boolean state = false;
    JavaDataObject jdo = null;
    try {
      if (dataMember.trim().length() > 0) {
        switch(connectmode.charAt(0)){
          case '1':
            qc=new QueryConnection("1","0");
            break;
          case '3':
            qc=new JdbcQueryConnection();
            break;
          default:
            qc=new QueryConnection();
        }
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
        if(!this.getFlag().equals("0")){
        if (state == true) {
          //strData += "<option value=\"\"></option>";
        }
        else {
         // strData += "<option selected value=\"\"></option>";
         }
        }
        if(!this.getAddoptionFront().equals("")){
          strData=this.getAddoptionFront()+strData;
        }
        if(!this.getAddoptionBack().equals("")){
          strData=strData+this.getAddoptionBack();
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
