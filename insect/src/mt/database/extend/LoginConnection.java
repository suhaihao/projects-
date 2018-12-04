package mt.database.extend;
import mt.database.DbConnection;
public class LoginConnection extends DbConnection  {
  public  LoginConnection() {//default is AUTO_COMMIT;
   super(JDBC_CONNECT_MODE,AUTO_COMMIT);
 //  super(DATASOURCE_CONNECT_MODE,AUTO_COMMIT);
  }
  public  LoginConnection(String connectMode,String autoMode) {
    //commitMode is throuth paramter
    super(connectMode,autoMode);
  }
}
