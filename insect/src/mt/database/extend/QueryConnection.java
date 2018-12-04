package mt.database.extend;
public  class QueryConnection extends LoginConnection  {
  public  QueryConnection() {
     super();
  }
  public  QueryConnection(String connectMode,String autoMode) {
     super(connectMode,autoMode);
  }

}
