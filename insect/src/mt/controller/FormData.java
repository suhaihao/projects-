/**
 * <p>Title:按DataObject容器结构分析Form提交的数据</p>
 * <p>Description:按DataObject容器结构分析Form提交的数据，低层类
 * </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

package mt.controller;
//jdk包
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mt.model.DataObject;
import mt.model.DataTable;
import mt.tools.CustString;

public class FormData {
//声明公有对象
  public HttpServletRequest request;
  public DataObject dataObject;
//声明构造方法，得到request对象
  public FormData(HttpServletRequest httpServletRequest,
                  HttpServletResponse httpServletResponse) {
    request = httpServletRequest;
//分析数据，只是框架（很重要）
//    receiveData();
  }
//具体分析数据，不做数据数据，只是分析数据（从客户端把数据传入，分析好之后传入数据处理对象）
//得到客户端传入多少张表
  private void receiveData() {
//具体看getTables方法
    getTables();
    for (int i = 0; i < dataObject.tableName.toArray().length; i++) { //共有几张表
      String tempTable;
      tempTable = (String) (dataObject.tableName.toArray())[i]; //得到某一张表
      Enumeration enum1 = request.getParameterNames();

      DataTable[] dataTable = new DataTable[Integer.parseInt( (String) (
          dataObject.tableRows.toArray())[i])]; //此表有多少记录

      for (int i3 = 0;
           i3 < Integer.parseInt( (String) (dataObject.tableRows.toArray())[i]);
           i3++) {
        dataTable[i3] = new DataTable();
      }

      while (enum1.hasMoreElements()) {
        Object htmlObject = null;
        htmlObject = enum1.nextElement(); //字段对象
        String[] colName;

        colName = htmlObject.toString().split(":");
        if (colName.length <= 1) {
          continue;
        }
        if (!colName[0].equals(tempTable)) {
          continue;
        }

        String[] getElementsData;
        getElementsData = request.getParameterValues(htmlObject.toString());
        if (colName[3].equals("S")) { //
          String wholeString = "";
          for (int i1 = 0; i1 < getElementsData.length; i1++) {
            if (i1 == 0) {
              wholeString = convertQuote(getElementsData[i1]);
            }
            else {
              wholeString += "," + convertQuote(getElementsData[i1]);
            }
          }

          dataTable[0].col.add(htmlObject.toString());
          dataTable[0].val.add(wholeString);
        }
        else if (colName[3].equals("N")) {
          continue;
        }
        else {
          for (int i1 = 0; i1 < getElementsData.length; i1++) {
            dataTable[i1].col.add(htmlObject.toString());
            dataTable[i1].val.add(convertQuote(getElementsData[i1]));
          }
        }
      }
      dataObject.tableDataColl.put(tempTable, dataTable);
    }
  }

  private String convertQuote(String str) {
    return new mt.tools.CustString().convertquote(str);
  }
//分析出有几张表，每张表里有多少条记录
  private void getTables() {
//得到传过来的所有值
    Enumeration enum1 = request.getParameterNames();
    dataObject = new DataObject();
//判断语句，看是否有记录
    while (enum1.hasMoreElements()) {
      Object htmlObject = null;
//循环。看是否需要继续滚动（是具体滚动的动作）
      htmlObject = enum1.nextElement();
      String[] colName;
//如果得到的值中没有字符“:”，就表示不是合法数据，就要踢出
      colName = htmlObject.toString().split(":");
      if (colName.length <= 1) {
        continue;
      }
      CustString cs = new CustString();
      String[] tempArray = new String[1];

      if (dataObject.tableName.isEmpty()) {}
      else {
        tempArray = (String[]) dataObject.tableName.toArray(tempArray);
      }
//判断数组中是否包含一张表的表名（colName[0]）如果包含，继续走，如果不包含，在数组中插入
//判断已经数组中已经有这条表记录存在，不做任何处理
      if (cs.initstr(tempArray, colName[0]) == true) {
//不做处理
        continue;
//数据不要，是根据在jsp中传入的值来判断，如果第三个参数是N，则表示是作废的数据，不提取
      } else if (colName[3].equals("N")) {
          continue;
        }
//判断数组中是否包含一张表的表名（colName[0]）如果包含，继续走，如果不包含，在数组中插入
      else {
//确定是新表，要把信息增加到数组里
        dataObject.tableName.add(colName[0]);
        String[] getElementsData;
//得到数据字段的值
        getElementsData = request.getParameterValues(htmlObject.toString());
//判断传入的值中是否必须合并为一条记录，如果为S则合并,否则不合并（视同多条记录）
        if (colName[3].equals("S")) {
//增加表的存储空间，为下一步装载数据做准备，如果是S，开的是单条记录空间
          dataObject.tableRows.add( (new String()).valueOf(1));
        }
        else {
//增加表的存储空间，为下一步装载数据做准备，开的是多条记录空间
          dataObject.tableRows.add( (new String()).valueOf(getElementsData.
              length));
        }
      }
    }
  }
}
