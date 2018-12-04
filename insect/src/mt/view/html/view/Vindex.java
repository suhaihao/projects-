package mt.view.html.view;
import mt.view.*;
import mt.view.html.*;

/**
 * <p>Title:œ‘ æ–Ú∫≈±Í«©</p>
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

public class Vindex extends BaseTag  {
  public String front(){
      String tempfront="";
      tempfront+="<label"+" " ;
      tempfront+=super.getAllAttribute()+" ";
      tempfront+=">";
      tempfront+=value();
      tempfront+="</label>";
      return tempfront;
 }
   protected String value;
   public void setValue(String value) {
     this.value = value;
   }


   public String value(){
         return getValue();
    }


  public String getValue() {
      String row="";
      Sheet sheet=null;
      try {
        sheet = (Sheet) getParent();
        row = String.valueOf(sheet.pjdo.getRow());
      }catch(Exception e){
        sheet.pjdo.close();
      }
      return row;
  }
}
