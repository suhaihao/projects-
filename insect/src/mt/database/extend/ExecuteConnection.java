package mt.database.extend;

public class ExecuteConnection
    extends LoginConnection {

  public ExecuteConnection() {
     super(JDBC_CONNECT_MODE, NO_AUTO_COMMIT);
    //  super(DATASOURCE_CONNECT_MODE,NO_AUTO_COMMIT);
  }
  public ExecuteConnection(String  connectMode,String commitMode) {
     super(connectMode, commitMode);
    //  super(DATASOURCE_CONNECT_MODE,NO_AUTO_COMMIT);
  }

}
