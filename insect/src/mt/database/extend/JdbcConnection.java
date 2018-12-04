package mt.database.extend;

import mt.database.DbConnection;

public class JdbcConnection extends QueryConnection{
  public JdbcConnection() {
    super(JDBC_CONNECT_MODE, NO_AUTO_COMMIT);
  }
}
