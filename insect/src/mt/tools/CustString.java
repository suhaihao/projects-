package mt.tools;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * <p>Title: 用于处理一般字符串</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
public class CustString {
  public CustString() {
  }

  public String StringConvert(String je){
    String returnValue="";
    java.math.BigDecimal bd=new java.math.BigDecimal(je);
    bd=bd.movePointRight(2);
    returnValue=bd.toString();
    return returnValue;
  }
//判断数组中是否包含了一个字符串，包含，返回true, 不包含，返回false
  public boolean initstr(String[] stringAll, String singleString) {
    boolean b1 = false;
    if (stringAll == null) {
      return false;
    }
    if (stringAll.length < 1) {
      b1 = false;
    }
    for (int i = 0; i < stringAll.length; i++) {
      if (stringAll[i] == null) {
        b1 = false;
      }
      else if (stringAll[i].trim().equals(singleString)) {
        b1 = true;
        break;
      }
    }
    return b1;
  }

  public String analyseSqlInsert(String sql, String value) {
    if (value==null){
        return sql;
    }
    if (sql.trim().length() < 1) {

      sql += stringToNull(value);

    }
    else {
      sql += "," +stringToNull(value);
    }
    return sql;
  }

  public String analyseSqlUpdate(String sql, String col, String value) {
    if (value==null){
        return sql;
    }

    if (sql.trim().length() < 1) {

      sql += col + " = " + stringToNull(value);

    }
    else {
      sql += "," + col + " = " + stringToNull(value);
    }
    return sql;
  }

  public String analyseSqlWhere(String sql, String col, String value,
                                String operationSymbol) {

    if (value==null || value.equals("")){ return sql; }
    //条件请注意：只用于海口地税
   if ( ( operationSymbol.trim().equals("<") || operationSymbol.trim().equals("<=")) &&
          value.toUpperCase().indexOf("TO_DATE") >=0   ){
          value =value +" + 1 ";
   }

    if (operationSymbol.trim().toUpperCase().equals("LIKE") ){
            value=" '%"+removequote(value)+"%' ";
    }


    if (operationSymbol.trim().toUpperCase().equals("LLIKE") ){
            value=" '"+removequote(value)+"%' ";
    }

    if (operationSymbol.trim().toUpperCase().equals("RLIKE") ){
            value=" '%"+removequote(value)+"' ";
    }

    if (operationSymbol.trim().toUpperCase().equals("LLIKE") || operationSymbol.trim().toUpperCase().equals("RLIKE") ){
        operationSymbol = " like ";
    }


    if (operationSymbol.trim().toUpperCase().equals("P") ){
            operationSymbol=" = ";
    }

    if (sql.trim().length() < 1) {
      sql += col +" "+operationSymbol+" " + value;
    }
    else {
      sql += " and " + col +" "+ operationSymbol +" " + value;
    }
    return sql;
  }

  public String joinUseAnd(String s1,String s2){
    if ( nullToString(s1).trim().equals("")  ){
        s1=nullToString(s2);
    } else {
       s1=s1 + " and " + nullToString(s2);
    }
    return s1;
  }

  public String nullToString(String str) {
    if (str == null) {
      return "";
    }
    else {
      return str;
    }
  }
  public String nullToString(Object obj) {
   if (obj == null) {
     return "";
   }
   else {
     return obj.toString();
   }
 }


  public String nullToHtml(String str) {
    if (str == null || str.trim().equals("") ) {
      return "";
    }
    else {
      return str;
    }
  }


  public String stringToNull(String str) {
  if (str == "") {
    return "null";
  }
  else {
    return str;
  }
}

  public String nullToString(long lon) {
    return Long.toString(lon);
  }

  public String nullToString(double dou) {
    return Double.toString(dou);
  }

  public String nullToString(java.util.Date dat) {
    if (dat==null) { return ""; }
    return dat.toString();
  }

  public String splitColumn(String column, int i) {
    String[] tempCol;
    if (column==null){ column=""; }
    tempCol = column.split(":");
    return tempCol[i];
  }
  public String removequote(String str){
    String temp="";
     if  (str.substring(0,1).equals("'")){
         temp=str.substring(1);
     }
     if  (temp.substring(temp.length() -1).equals("'")){
         temp=temp.substring(0,temp.length() -1);
     }

   return temp;
 }
 public String convertquote(String str){
      return str.replaceAll("'","''");
 }
 public static String asHTML(String text) {
    if (text == null) {
      return "";
    }
    StringBuffer results = null;
    char[] orig = null;
    int beg = 0, len = text.length();
    for (int i = 0; i < len; ++i) {
      char c = text.charAt(i);
      switch (c) {
        case 0:
        case '&':
        case '<':
        case '>':
        case '"':
          if (results == null) {
            orig = text.toCharArray();
            results = new StringBuffer(len + 10);
          }
          if (i > beg) {
            results.append(orig, beg, i - beg);
          }
          beg = i + 1;
          switch (c) {
            default: //  case  0:
              continue;
            case '&':
              results.append("&");
              break;
            case '<':
              results.append("<");
              break;
            case '>':
              results.append(">");
              break;
            case '"':
              results.append("“");
              break;
          }
          break;
      }
    }
    if (results == null) {
      return text;
    }
    results.append(orig, beg, len - beg);
    return results.toString();

  }
public boolean matchString(String singleString,String regEx){
    Pattern p=Pattern.compile(regEx);
    Matcher m=p.matcher(singleString);
    return m.find();
 }
 /**
  * MD5加密
  * @param plainText String
  * @return String
  */
 public static String Md5(String plainText) {
     MessageDigest md = null;
     try {
         md = MessageDigest.getInstance("MD5");
     } catch (NoSuchAlgorithmException ex) {
     }
     md.update(plainText.getBytes());
     byte b[] = md.digest();

     int i;

     StringBuffer buf = new StringBuffer("");
     for (int offset = 0; offset < b.length; offset++) {
         i = b[offset];
         if (i < 0) {
             i += 256;
         }
         if (i < 16) {
             buf.append("0");
         }
         buf.append(Integer.toHexString(i));
     }
     return buf.toString();
 }

}
