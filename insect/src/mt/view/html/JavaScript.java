package mt.view.html;
import mt.view.*;
/**
 * <p>Title:javascript”Ôæ‰±Í«© </p>
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
public class JavaScript extends BaseBodyTag{
  public String front(){
      String tempfront="<script language=\"javascript\""+" ";
      tempfront+=this.getAllAttribute();
      tempfront+=">";
      return tempfront;
 }
   public String back(){
      return "</script>";
   }
 private String src;
 public void setSrc(String src){
   this.src=src;
 }

 protected String src(){
   return "src=\""+src+"\"" ;
 }

 protected String getAllAttribute(){
    String tempStr=" ";
    tempStr +=src()+" ";
    tempStr += this.other();
 return tempStr;
}

}
