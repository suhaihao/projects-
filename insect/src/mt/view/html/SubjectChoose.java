package mt.view.html;

import mt.view.BaseTag;
import java.sql.ResultSet;
import mt.database.extend.QueryConnection;
import mt.database.JavaDataObject;
import mt.database.extend.JdbcQueryConnection;

public class SubjectChoose extends BaseTag {
  public String connectmode="0";
  public String getConnectmode(){
      return this.connectmode;
  }

 public void setConnectmode(String connectmode){
      this.connectmode=connectmode;
 }

  public String front() {
     QueryConnection qc =null;

     switch(connectmode.charAt(0)){
       case '1':
         qc=new QueryConnection("1","0");
         break;
       case '3':
         qc=new JdbcQueryConnection();
         break;
       default:
         qc=new QueryConnection();
     }


     JavaDataObject jdo = new JavaDataObject(qc);
     String strContent="";
     try {
       jdo.executeQuery(sql);
       ResultSet res = jdo.rs;
       while (res.next()) {
          strContent+=jdo.rs.getString(1)+"\n";
         }
     }
     catch (Exception sqlx) {
       sqlx.printStackTrace();
     }finally{
       qc.close();
       jdo.close();
     }
     return strContent;
  }

 protected String sql;
 public String getSql(){
      return sql;
 }

 public void setSql(String sql) {
   this.sql = sql;
 }
}
