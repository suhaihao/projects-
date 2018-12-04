package mt.project.share;

import mt.database.extend.*;
import mt.database.*;
import java.sql.*;

public class RoleAuthority {
  public RoleAuthority() {
  }

  public String getAuthority(String path, String userId) {
    String menuAuthority = "";
    String sql = "";
    QueryConnection qc = null;
    JavaDataObject jdo = null;
    try {
      qc = new QueryConnection();
      jdo = new JavaDataObject(qc);
      sql = "  select max(qx) from dsys02_dsys03,dsys02 \n";
      sql += " where  dsys02_jfid= dsys02.jfid \n";
      sql += "   and  dsys03_jfid in ( \n";
      sql += "    select dsys03_jfid from dsys01_dsys03 where dsys01_jfid='" +
          userId + "' \n";
      sql += " ) and dsys02.item_path='" + (new mt.tools.CustString()).nullToString(path).substring(1) + "' \n";
      jdo.executeQuery(sql);
      if (jdo.rs.next()) {
        menuAuthority = jdo.rs.getString(1);
      }
    }
    catch (Exception e) {
      new mt.tools.customException(e, this.toString());
    }
    finally {
      jdo.close();
      qc.close();
    }
    if (menuAuthority==null ){ menuAuthority="1"; }
    if (menuAuthority.trim().equals("") ) { menuAuthority="1";  }
    return menuAuthority;
  }

}
