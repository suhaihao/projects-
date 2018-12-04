package mt.view.html.view;

public class ColorInput extends Vinput{

 public String front(){
     String tempfront="";
     tempfront+="<input"+" " ;
     tempfront+=type()+" ";
     tempfront+=super.getAllAttribute()+" ";
     tempfront+=value()+" ";
     tempfront+=defaultValue();
     tempfront+=color1();
     tempfront+=color2();
     tempfront+=event();
     tempfront+=chname();
     tempfront+=nullable();
     tempfront+=datatype();
     tempfront+=">";
     return tempfront;
}

  private String value;
  public void setValue(String value) {
    this.value = value;
  }
  private String type;
  public void setType(String type) {
    this.type = type;
  }

  protected String checkname;
  private String color1;
  private String color2;
  private String event;
  private String chname;
  private String nullable;
  private String datatype;
  public void setCheckname(String checkname) {
        this.checkname = checkname;
  }

  public void setColor1(String color1) {
    this.color1 = color1;
  }

  public void setColor2(String color2) {
    this.color2 = color2;
  }

  public void setEvent(String event) {
    if(event==null||event.trim().equals("null")||event.trim().equals(""))event="onKeyUp";
    this.event = event;
  }

  public void setChname(String chname) {
    this.chname = chname;
  }

  public void setNullable(String nullable) {
    this.nullable = nullable;
  }

  public void setDatatype(String datatype) {
    this.datatype = datatype;
  }

  public String getCheckname(){
      return (new mt.tools.CustString()).nullToString(checkname);
 }


  public String type(){
      return "type=\"text\" ";
 }
 public String getType(){
     return (new mt.tools.CustString()).nullToString(type);
 }

  //  public String value(){
//     return " value=\"" + (new mt.tools.CustString()).nullToString(value) + "\" ";
//  }
  public String defaultValue(){
    return "defaultValue=\"" + getValue() + "\" ";
  }
  public String color1(){
    return "color1=\"" + color1 + "\" ";
  }
  public String color2(){
    return "color2=\"" + color2 + "\" ";
  }
  public String color(){
    return "color=\"" + color1 + "\" ";
  }
  public String chname(){
    return "chname=\"" + chname + "\" ";
  }
  public String nullable(){
    return "nullable=\"" + nullable + "\" ";
  }
  public String datatype(){
    return "datatype=\"" + datatype + "\" ";
  }
  public String event(){
    if(event==null||event.trim().equals("null")||event.trim().equals(""))event="onKeyUp";
    return event+"=\"changeColor(this)\"";
  }
}
