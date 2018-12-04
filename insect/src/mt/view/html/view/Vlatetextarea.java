package mt.view.html.view;

public class Vlatetextarea  extends Textarea {
  public String front() {
    String tempfront = "";
    String value=(getValue().toString().replaceAll(" ","&nbsp;")).replaceAll("\r\n","<br>");
    tempfront+=value;
    return tempfront;
  }
}
