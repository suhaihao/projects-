package mt.database.extend;

public class QueryExecuteConnection
    extends ExecuteConnection {
  public QueryExecuteConnection(){
    super(QUERY_JDBC_CONNECT_MODE,AUTO_COMMIT);
  }
}
