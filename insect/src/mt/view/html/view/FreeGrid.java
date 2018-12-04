package mt.view.html.view;

import mt.view.html.Vobject;
import mt.view.html.DataValue;
import javax.servlet.jsp.tagext.Tag;
import java.sql.SQLException;
import java.lang.Object;

public class FreeGrid  extends Vobject {
  public String front(){
    String tempfront = "";
    Sheet sheet = null;
    sheet = (Sheet)getParent();
    int columnType;
    String columnName;
    try {
    for (int i =0 ; i < sheet.pjdo.rs.getMetaData().getColumnCount(); i++){
      columnType = sheet.pjdo.rs.getMetaData().getColumnType(i + 1);
      tempfront+=" <td ";
      tempfront+=super.getAllAttribute()+">";
      tempfront+=getValue(i+1,columnType);
      tempfront+="</td>";
    } }catch(Exception e){
       sheet.pjdo.close();
    }
    return tempfront;
  }

public String getValue(int columnIndex,int dataType ) {
      String returnValue="";
      Sheet sheet = null;
      try {
        sheet = (Sheet) getParent();
      }
      catch (Exception e) {
        sheet = (Sheet)getParent().getParent();
      }
      if (sheet.pjdo.getRow() < 1) {
        return "";
      }

     mt.tools.CustString cs = new mt.tools.CustString();
    try {
      switch(dataType){
        case java.sql.Types.INTEGER:
        case java.sql.Types.NUMERIC:
        case java.sql.Types.SMALLINT:
        case java.sql.Types.TINYINT:
        case java.sql.Types.BIGINT:
          returnValue= cs.nullToString(sheet.pjdo.rs.getLong(columnIndex));
          break;
        case java.sql.Types.DOUBLE:
        case java.sql.Types.FLOAT:
        case java.sql.Types.DECIMAL:
          returnValue= cs.nullToString(sheet.pjdo.rs.getDouble(columnIndex));
          break;
        case java.sql.Types.CHAR:
        case java.sql.Types.LONGVARCHAR:
        case java.sql.Types.VARCHAR:
          returnValue= cs.nullToString(sheet.pjdo.rs.getString(columnIndex));
          break;
        case java.sql.Types.DATE:
        case java.sql.Types.TIME:
        case java.sql.Types.TIMESTAMP:
          returnValue= cs.nullToString(sheet.pjdo.rs.getDate(columnIndex));
          break;
      }
        return returnValue;
    }catch(SQLException e){
         sheet.pjdo.close();
         new mt.tools.customException(e,this.toString());
         return "";
    }
}

}
