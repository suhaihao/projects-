package mt.database;

import java.sql.*;

/**
 * <p>Title: 数据处理对象jdo</p>
 * <p>Description: 数据库层的数据的增、删、改操作的初始执行者,用于被其他类继承</p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
public class JavaDataObject {
  public Statement stmt;
  public PreparedStatement ps = null;
  public ResultSet rs = null;
  public DbConnection dbConn;
  public CallableStatement cs;
  public int rowFetchSize=0;
  public final int UPDATESUCESS=0;
  public final int UPDATEFAILURE=-1;

  public JavaDataObject() {

  }

  public JavaDataObject(DbConnection dbc) {
    this.dbConn = dbc;
  }

//  public void executeQuery(String sql) {
//    try {
//       ps=dbConn.con.prepareStatement(sql);
//       rs = ps.executeQuery();
//
//    }
//    catch (SQLException e1) {
//      dbConn.rollClose();
//      new mt.tools.customException(e1, this.toString());
//    }
//  }

  public void executeQuery(String sql) {
    try {
     // ResultSet.TYPE_SCROLL_INSENSITIVE
    //  stmt = dbConn.con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
    //                                    ResultSet.CONCUR_UPDATABLE);

    stmt = dbConn.con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                        ResultSet.CONCUR_READ_ONLY);
    stmt.setFetchSize(rowFetchSize);

    rs = stmt.executeQuery(sql);
    }
    catch (SQLException e1) {
      dbConn.rollClose();
      new mt.tools.customException(e1, this.toString());
    }
  }



  public void setValue() {

  }

  public int getRow() {
    try {
      return rs.getRow();
    }
    catch (SQLException e) {
      new mt.tools.customException(e, this.toString());
      return 0;
    }
  }

  public void executeBinary(String sql) {
    try {
      ps = dbConn.con.prepareStatement(sql);
      setValue();
      ps.executeUpdate();
      ps.close();
    }
    catch (SQLException e1) {
      dbConn.rollClose();
      new mt.tools.customException(e1, this.toString());
    }

  }

  public int execute(String sql) {
    int deleteRow = this.UPDATEFAILURE;
    try {
      stmt = dbConn.con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                        ResultSet.CONCUR_UPDATABLE);
   //   stmt.setQueryTimeout(0);
      deleteRow = stmt.executeUpdate(sql);
   }
    catch (SQLException e2) {
      e2.printStackTrace();
      dbConn.rollClose();
    }catch(Exception e3){
      e3.printStackTrace();
      dbConn.rollClose();
    }
    return deleteRow;
  }

  public void executeUpdate(String sql) {
    try {
      ps = dbConn.con.prepareStatement(sql);
    }
    catch (SQLException sqlException) {
      dbConn.rollClose();
      sqlException.printStackTrace();
    }
  }

  public void close() {
    try {
      if (rs != null) {
        this.rs.close();
      }
      if (ps != null) {
        this.ps.close();
      }
      if (stmt != null) {
        this.stmt.close();
      }
    }
    catch (SQLException e) {
      dbConn.rollClose();
      new mt.tools.customException(e, this.toString());
    }
  }
}
