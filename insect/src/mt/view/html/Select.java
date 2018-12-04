package mt.view.html;

/**
 * <p>Title:SELECT ±Í«©</p>
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
import mt.view.*;
import mt.model.*;
import mt.tools.*;
import mt.database.*;
import mt.database.extend.*;

public class Select
    extends VbodyObject {
  public String front() {
    String tempfront = "";
    tempfront += "<select" + " ";
    tempfront += super.getAllAttribute() + " ";
    tempfront += chname() + " ";
    tempfront += nullable() + " ";
    tempfront += datatype();
    tempfront += ">";
    tempfront += getDataTable();
    return tempfront;
  }

  protected String dataMember = "";
  public void setDatamember(String dataMember) {
    this.dataMember = (new mt.tools.CustString()).nullToString(dataMember);
  }

  protected String defaultValue = "";
  public void setDefaultvalue(String defaultValue) {
    this.defaultValue = (new mt.tools.CustString()).nullToString(defaultValue);
  }
  public String getDefaultvalue() {
      return (new mt.tools.CustString()).nullToString(defaultValue);
  }


  protected String sort = "";
  public void setSort(String sort) {
    this.sort = (new mt.tools.CustString()).nullToString(sort);
  }

  protected String chname;
  public void setChname(String chname) {
    this.chname = chname;
  }

  public String getChname() {
    return chname;
  }

  public String chname() {
    return "chname=\"" + (new mt.tools.CustString()).nullToString(chname) +
        "\"";
  }

  public String connectmode="0";
   public String getConnectmode(){
       return this.connectmode;
   }

  public void setConnectmode(String connectmode){
       this.connectmode=connectmode;
  }


  protected String nullable;
  public void setNullable(String nullable) {
    this.nullable = nullable;
  }

  public String getNullable() {
    return nullable;
  }

  public String nullable() {
    return "nullable=\"" + (new mt.tools.CustString()).nullToString(nullable) + "\"";
  }

  protected String datatype;
  public void setDatatype(String datatype) {
    this.datatype = datatype;
  }

  public String getDatatype() {
    return datatype;
  }


  public String datatype() {
    return "datatype=\"" + (new mt.tools.CustString()).nullToString(datatype) +
        "\"";
  }

  public String getSort() {
    String sortReturn;
    sortReturn = (new mt.tools.CustString()).nullToString(this.sort);
    sortReturn = sortReturn.trim().length() > 0 ? " order by " + sortReturn :
        " ";
    return sortReturn;
  }

  protected String getDataTable() {
    String strData = "";
    String sql = "";
    boolean state = false;
    QueryConnection qc=null;
    JavaDataObject jdo=null;
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
        sql = " select bm,hzmc from dsys11 where bmlb='" + dataMember + "'  " +
            getSort();
        jdo.executeQuery(sql);
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
        }
        else {
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

  public String back() {
    return "</select>";
  }

}
