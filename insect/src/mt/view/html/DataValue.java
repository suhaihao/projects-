package mt.view.html;

import java.sql.SQLException;
import mt.view.html.view.Sheet;
import javax.servlet.jsp.tagext.Tag;
import mt.view.html.update.MasterSheet;

public class DataValue {

  public String getValueBySheet(String columnName,Tag object) {
  Sheet sheet=null;
  try {
    sheet = (Sheet) object.getParent();
  }catch(Exception e) {
    sheet = (Sheet) object.getParent().getParent();
  }
 if (sheet.pjdo.getRow() < 1) { return "";    }
 mt.tools.CustString cs = new mt.tools.CustString();
  try {
    if ( cs.splitColumn(columnName, 2).toUpperCase().equals("STR")) {
     return  cs.nullToString(sheet.pjdo.rs.getString(cs.splitColumn(columnName,1)));
    }
    if ( cs.splitColumn(columnName, 2).toUpperCase().equals("LON")) {
      return  cs.nullToString(sheet.pjdo.rs.getLong(cs.splitColumn(columnName,1)) );
      }
      if ( cs.splitColumn(columnName, 2).toUpperCase().equals("DOU")) {
        return  cs.nullToString(sheet.pjdo.rs.getDouble(cs.splitColumn(columnName,1)) );
       }
       if ( cs.splitColumn(columnName, 2).toUpperCase().equals("DAT")) {
        return  cs.nullToString(sheet.pjdo.rs.getDate(cs.splitColumn(columnName,1)) );
   }
      return "no type";
  }catch(SQLException e){
       sheet.pjdo.close();
       new mt.tools.customException(e,this.toString());
       return "";
  }
}

public String getValueByMasterSheet(String columnName,Tag object) {
  MasterSheet msheet = null;
  try {
   msheet = (MasterSheet) object.getParent();
 }catch(Exception e) {
   msheet = (MasterSheet) object.getParent().getParent();
 }

if ( msheet.jdo.getRow() < 1 ) { return "";    }
mt.tools.CustString cs = new mt.tools.CustString();
 try {
   if ( cs.splitColumn(columnName, 2).toUpperCase().equals("STR")) {
    return  cs.nullToString(msheet.jdo.rs.getString(cs.splitColumn(columnName,1)));
   }
   if ( cs.splitColumn(columnName, 2).toUpperCase().equals("LON")) {
     return  cs.nullToString(msheet.jdo.rs.getLong(cs.splitColumn(columnName,1)) );
     }
     if ( cs.splitColumn(columnName, 2).toUpperCase().equals("DOU")) {
       return  cs.nullToString(msheet.jdo.rs.getDouble(cs.splitColumn(columnName,1)) );
      }
      if ( cs.splitColumn(columnName, 2).toUpperCase().equals("DAT")) {
       return  cs.nullToString(msheet.jdo.rs.getDate(cs.splitColumn(columnName,1)) );
  }
     return "";

  }catch(SQLException e){
        msheet.jdo.close();
      new mt.tools.customException(e,this.toString());
      return "";
   }
}



}
