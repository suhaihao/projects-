package mt.database.extend;

public class JdbcQueryConnection extends QueryConnection {
  public JdbcQueryConnection() {
    super(QUERY_JDBC_CONNECT_MODE, NO_AUTO_COMMIT);
  }
}
