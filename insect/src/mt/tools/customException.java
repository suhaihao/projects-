package mt.tools;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;

/**
 * <p>Title: 异常数据格式输出</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2007 北京际峰天翔信息技术有限公司</p>
 *
 * <p>Company: 北京际峰天翔信息技术有限公司</p>
 *
 * @author not attributable
 * @version 2.0
 */
public class customException {

  public customException(IOException ioexception,String className)  {
//     System.out.println(className+"->" +ioexception.toString()) ;
//     System.out.println(ioexception.getLocalizedMessage());
//     System.out.println(ioexception.getMessage());

//     System.err.println(className+"->" +ioexception.toString());
//     System.err.println(ioexception.getLocalizedMessage());
//     System.err.println(ioexception.getMessage());
     ioexception.printStackTrace() ;
  }

  public customException(ClassNotFoundException classNotFoundException,String className) {

//     System.out.println(className+"->" +classNotFoundException.toString()) ;
//     System.out.println(classNotFoundException.getLocalizedMessage());
//     System.out.println(classNotFoundException.getMessage());

//     System.err.println(className+"->" +classNotFoundException.toString()) ;
//     System.err.println(classNotFoundException.getLocalizedMessage());
//     System.err.println(classNotFoundException.getMessage());
     classNotFoundException.printStackTrace() ;
  }

  public customException(SQLException sqlException,String className) {

//     System.out.println(className+"->" +sqlException.toString()) ;
//     System.out.println(sqlException.getSQLState());
//     System.out.println(sqlException.getMessage());

//     System.err.println(sqlException.toString()) ;
//     System.err.println(sqlException.getSQLState());
//     System.err.println(sqlException.getMessage());
     sqlException.printStackTrace() ;
  }

  public customException(ArithmeticException arithmeticException,String className) {

//     System.out.println(className+"->" +arithmeticException.toString()) ;
//     System.out.println(arithmeticException.getLocalizedMessage());
//     System.out.println(arithmeticException.getMessage());

//     System.err.println(className+"->" +arithmeticException.toString()) ;
//     System.err.println(arithmeticException.getLocalizedMessage());
//     System.err.println(arithmeticException.getMessage());
     arithmeticException.printStackTrace() ;
  }

  public customException(JspException jspException,String className){
//    System.out.println(className+"->" +jspException.toString()) ;
//    System.out.println(jspException.getLocalizedMessage());
//    System.out.println(jspException.getMessage());

//    System.err.println(className+"->" +jspException.toString()) ;
//    System.err.println(jspException.getLocalizedMessage());
//    System.err.println(jspException.getMessage());
    jspException.printStackTrace() ;

  }

  public customException(Exception exception,String className) {

//    System.out.println(className+"->" +exception.toString()) ;
//    System.out.println(exception.getLocalizedMessage());
//    System.out.println(exception.getMessage());

//    System.err.println(className+"->" +exception.toString()) ;
//    System.err.println(exception.getLocalizedMessage());
//    System.err.println(exception.getMessage());
    exception.printStackTrace() ;
 }
}
