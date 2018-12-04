package mt.database;

import mt.tools.*;
import mt.database.*;
import mt.database.extend.*;
import java.sql.SQLException;
import java.util.Vector;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;


public class analyseTable {
  public String tableName;
  public JavaDataObject jdo;
  public DbConnection dbc;
  public int TRANSLACTION_STATE;
  public analyseTable(String tableName) {
    this.tableName = tableName;
    getConnection();
    TRANSLACTION_STATE = 0;
  }

  public analyseTable(DbConnection dbc, String tableName) {
    this.dbc = dbc;
    this.tableName = tableName;
    TRANSLACTION_STATE = 1;
  }

  private void getConnection() {
    dbc = new QueryConnection();
  }

  public String getValue(String sql) {
    String returnValue = "";
    try {
      jdo = new JavaDataObject(dbc);
      jdo.executeQuery(sql);
      if (jdo.rs.next()) {
        returnValue = jdo.rs.getString(1);
      }
    }
    catch (SQLException ex) {
      new customException(ex, this.toString());
    }
    finally {
      jdo.close();
      if (TRANSLACTION_STATE == 0) {
        dbc.close();
      }
    }
    return returnValue;
  }


  public Vector getValueVector(String sql) {
   Vector resultData = new Vector();
   try {
     jdo = new JavaDataObject(dbc);
     jdo.executeQuery(sql);
     ResultSetMetaData rsmd = jdo.rs.getMetaData();
     int numCols= rsmd.getColumnCount();
     while (jdo.rs.next()) {
       Vector singleRecord = new Vector();
        for (int i = 1; i <= numCols; i++) {
          singleRecord.add(jdo.rs.getString(i));
        }
        resultData.add(singleRecord);
     }
   }catch (SQLException ex) {
     new customException(ex, this.toString());
   }
   finally {
     jdo.close();
     if (TRANSLACTION_STATE == 0) {
       dbc.close();
     }
   }
   return resultData;
 }

 public ArrayList getValueArray(String sql) {
    ArrayList resultData = new ArrayList();
    try {
      jdo = new JavaDataObject(dbc);
      jdo.executeQuery(sql);
      ResultSetMetaData rsmd = jdo.rs.getMetaData();
      int numCols= rsmd.getColumnCount();
      while (jdo.rs.next()) {
        ArrayList singleRecord = new ArrayList();
         for (int i = 1; i <= numCols; i++) {
           singleRecord.add(jdo.rs.getString(i));
         }
         resultData.add(singleRecord);
      }
    }catch (SQLException ex) {
      new customException(ex, this.toString());
    }
    finally {
      jdo.close();
      if (TRANSLACTION_STATE == 0) {
        dbc.close();
      }
    }
    return resultData;
 }

  public String getSequence() {
    String sql = "";
    sql = " select S_" + tableName + ".nextval from dual ";
    return getValue(sql);
  }

  public String getMaxId() {
    String sql = "";
    sql = " select nvl(max(to_number(jfid)),0) + 1  from " + tableName;
    return getValue(sql);
  }

  public void close() {
    jdo.close();
    dbc.close();
  }

  public String getNetworkErrorCode(String bmlb,String bm){
    String sql=" select hzmc from dsys11 where bmlb='SYJYH_"+bmlb+"' and bm ='"+bm+"' ";
    return getValue(sql);
  }

  public String getDateTime(String format) {
    //String dateTime="";
    String sql = "";
    sql = " select to_char(sysdate,'" + format + "')  from " + tableName;
    return getValue(sql);
  }

  public Vector analyseInitUpdateData(String cs){
      String[] dataValue = cs.split("---");
      ArrayList outValue = new ArrayList();
      Vector resultData = new Vector();
      boolean state=false;
      try {
        jdo = new JavaDataObject(dbc);
        jdo.cs = jdo.dbConn.con.prepareCall("{call " + dataValue[0] + "}");
        String[] inValue = dataValue[1].split(";",600);
        for (int i = 0; i < inValue.length; i++) {
          String[] singleValue = (String[]) inValue[i].split(":",600);
          if (singleValue[0].trim().toUpperCase().equals("IN") ||
              singleValue[0].trim().toUpperCase().equals("INOUT")) {
            String setValue = new mt.tools.CustString().nullToString(singleValue[
                2]);
            switch (singleValue[1].charAt(0)) {
              case 'S':
                jdo.cs.setString(i + 1,setValue);
                break;
              case 'D':
                jdo.cs.setDate(i + 1, java.sql.Date.valueOf(setValue));
                break;
              case 'F':
                jdo.cs.setDouble(i + 1, Double.parseDouble(setValue));
                break;
              case 'I':
                jdo.cs.setInt(i + 1, Integer.parseInt(setValue));
                break;
            }
          }
          if (singleValue[0].trim().toUpperCase().equals("OUT") ||
              singleValue[0].trim().toUpperCase().equals("INOUT")) {
            outValue.add( (i + 1) + ":" + singleValue[1]);
            switch (singleValue[1].charAt(0)) {
              case 'S':
                jdo.cs.registerOutParameter(i + 1, java.sql.Types.VARCHAR);
                break;
              case 'D':
                jdo.cs.registerOutParameter(i + 1, java.sql.Types.DATE);
                break;
              case 'F':
                jdo.cs.registerOutParameter(i + 1, java.sql.Types.DOUBLE);
                break;
              case 'I':
                jdo.cs.registerOutParameter(i + 1, java.sql.Types.INTEGER);
                break;
            }
          }
        }
        jdo.cs.execute();
        String[] outGetValue = new String[1];
        outGetValue = (String[]) outValue.toArray(outGetValue);
        for (int i = 0; i < outGetValue.length; i++) {
          String[] outSingleType = (String[]) outGetValue[i].split(":",600);
          char switchWord = outSingleType[1].charAt(0);
          int outIndex = Integer.parseInt(outSingleType[0]);
          switch (switchWord) {
            case 'S':
              if  (outIndex==1){
                if ( jdo.cs.getString(outIndex).equals("0") ){
                    state=true;
                } else{
                    state=false;
                }
              }
              resultData.add(jdo.cs.getString(outIndex));
              break;
            case 'D':
              resultData.add(jdo.cs.getDate(outIndex).toString());
              break;
            case 'F':
              if (jdo.cs.getBigDecimal(outIndex) == null) {
                resultData.add("0");
              }
              else {
                resultData.add(jdo.cs.getBigDecimal(outIndex).toString());
              }
              break;
            case 'I':
              resultData.add(jdo.cs.getString(outIndex));
              break;
          }
        }
        if (state==false){dbc.rollback(); }
      }
      catch (SQLException ex) {

        dbc.rollback();
        ex.printStackTrace();
      }finally{
         if (TRANSLACTION_STATE == 0) {  dbc.close();  }
      }
      return  resultData;
  }

 public ArrayList analyseAInitUpdateData(String cs,int commitState){
     ArrayList dataArray=analyseAInitUpdateData(cs);
    if (commitState==1){
        dbc.commit();
    }
     return  dataArray;
 }

  public ArrayList analyseAInitUpdateData(String cs){
      String[] dataValue = cs.split("---");
      ArrayList outValue = new ArrayList();
      ArrayList resultData = new ArrayList();
      boolean state=false;
      try {
        jdo = new JavaDataObject(dbc);
        jdo.cs = jdo.dbConn.con.prepareCall("{call " + dataValue[0] + "}");
        String[] inValue = dataValue[1].split(";",600);
        for (int i = 0; i < inValue.length; i++) {
          String[] singleValue = (String[]) inValue[i].split(":",600);
          if (singleValue[0].trim().toUpperCase().equals("IN") ||
              singleValue[0].trim().toUpperCase().equals("INOUT")) {
            String setValue = new mt.tools.CustString().nullToString(singleValue[
                2]);
            switch (singleValue[1].charAt(0)) {
              case 'S':
                jdo.cs.setString(i + 1,setValue);
                break;
              case 'D':
                jdo.cs.setDate(i + 1, java.sql.Date.valueOf(setValue));
                break;
              case 'F':
                jdo.cs.setDouble(i + 1, Double.parseDouble(setValue));
                break;
              case 'I':
                jdo.cs.setInt(i + 1, Integer.parseInt(setValue));
                break;
            }
          }
          if (singleValue[0].trim().toUpperCase().equals("OUT") ||
              singleValue[0].trim().toUpperCase().equals("INOUT")) {
            outValue.add( (i + 1) + ":" + singleValue[1]);
            switch (singleValue[1].charAt(0)) {
              case 'S':
                jdo.cs.registerOutParameter(i + 1, java.sql.Types.VARCHAR);
                break;
              case 'D':
                jdo.cs.registerOutParameter(i + 1, java.sql.Types.DATE);
                break;
              case 'F':
                jdo.cs.registerOutParameter(i + 1, java.sql.Types.DOUBLE);
                break;
              case 'I':
                jdo.cs.registerOutParameter(i + 1, java.sql.Types.INTEGER);
                break;
            }
          }
        }
        jdo.cs.execute();
        String[] outGetValue = new String[1];
        outGetValue = (String[]) outValue.toArray(outGetValue);
        for (int i = 0; i < outGetValue.length; i++) {
          String[] outSingleType = (String[]) outGetValue[i].split(":",600);
          char switchWord = outSingleType[1].charAt(0);
          int outIndex = Integer.parseInt(outSingleType[0]);
          switch (switchWord) {
            case 'S':
              if  (outIndex==1){
                if ( jdo.cs.getString(outIndex).equals("0") ){
                    state=true;
                } else{
                    state=false;
                }
              }
              resultData.add(jdo.cs.getString(outIndex));
              break;
            case 'D':
              resultData.add(jdo.cs.getDate(outIndex).toString());
              break;
            case 'F':
              if (jdo.cs.getBigDecimal(outIndex) == null) {
                resultData.add("0");
              }
              else {
                resultData.add(jdo.cs.getBigDecimal(outIndex).toString());
              }
              break;
            case 'I':
              resultData.add(jdo.cs.getString(outIndex));
              break;
          }
        }
        if (state==false){dbc.rollback(); }
      }
      catch (SQLException ex) {
        dbc.rollback();
        ex.printStackTrace();
      }finally{
         if (TRANSLACTION_STATE == 0) {  dbc.close();  }
      }
      return  resultData;
  }


}
