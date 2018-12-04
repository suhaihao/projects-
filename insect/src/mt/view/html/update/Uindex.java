package mt.view.html.update;

import mt.view.html.view.*;

public class Uindex extends Vindex{
  public String getValue() {
      String row="";
      MasterSheet sheet=null;
      try {
        sheet = (MasterSheet)getParent();
        row = String.valueOf(sheet.jdo.getRow());
      }catch(Exception e){
        sheet.jdo.close();
      }
      return row;
  }

}
