package mt.view.html.view;

import mt.view.html.VbodyObject;
import javax.servlet.jsp.tagext.BodyContent;

public class Textarea extends VbodyObject{
  public String front() {
    String tempfront = "";
    tempfront += "<textarea" + " ";
    tempfront += super.getAllAttribute() + " ";
    tempfront += chname() + " ";
    tempfront += nullable() + " ";
    tempfront += datatype();
    tempfront += maxlength();
    tempfront += ">";
    return tempfront;
  }

  protected String chname;
  protected String maxlength;
  public void setChname(String chname) {
    this.chname = chname;
  }

  public String getChname() {
    return chname;
  }

  public String chname() {
    return (new mt.tools.CustString()).nullToString(chname).equals("")?"":"chname=\"" + (new mt.tools.CustString()).nullToString(chname) +
        "\"";
  }

  protected String nullable;
  public void setNullable(String nullable) {
    this.nullable = nullable;
  }

  public String getNullable() {
    return nullable;
  }

  public String nullable() {
    return (new mt.tools.CustString()).nullToString(nullable).equals("")?"":"nullable=\"" + (new mt.tools.CustString()).nullToString(nullable) + "\"";
  }

  protected String datatype;
  public void setDatatype(String datatype) {
    this.datatype = datatype;
  }

  public void setMaxlength(String maxlength) {
    this.maxlength = maxlength;
  }

  public String getDatatype() {
    return datatype;
  }

  public String getMaxlength() {
    return maxlength;
  }

  public String datatype() {
    return (new mt.tools.CustString()).nullToString(datatype).equals("")?"":"datatype=\"" + (new mt.tools.CustString()).nullToString(datatype) +
        "\"";
  }

  public String maxlength() {
    return " maxlength='"+maxlength+"' ";
  }

  public String back() {
    return "</textarea>";
  }
}
