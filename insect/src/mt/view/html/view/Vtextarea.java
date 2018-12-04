package mt.view.html.view;

public class Vtextarea
    extends Textarea {
  public String front() {
    String tempfront = "";
    tempfront += "<textarea" + " ";
    tempfront += super.getAllAttribute() + " ";
    tempfront += chname() + " ";
    tempfront += nullable() + " ";
    tempfront += datatype();
    tempfront += maxlength();
    tempfront += ">";
    tempfront += getValue();
    return tempfront;
  }
}
