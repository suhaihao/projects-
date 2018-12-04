/**
 * <p>Title:��DataObject�����ṹ����Form�ύ������</p>
 * <p>Description:��DataObject�����ṹ����Form�ύ�����ݣ��Ͳ���
 * </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

package mt.controller;
//jdk��
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mt.model.DataObject;
import mt.model.DataTable;
import mt.tools.CustString;

public class FormData {
//�������ж���
  public HttpServletRequest request;
  public DataObject dataObject;
//�������췽�����õ�request����
  public FormData(HttpServletRequest httpServletRequest,
                  HttpServletResponse httpServletResponse) {
    request = httpServletRequest;
//�������ݣ�ֻ�ǿ�ܣ�����Ҫ��
//    receiveData();
  }
//����������ݣ������������ݣ�ֻ�Ƿ������ݣ��ӿͻ��˰����ݴ��룬������֮�������ݴ������
//�õ��ͻ��˴�������ű�
  private void receiveData() {
//���忴getTables����
    getTables();
    for (int i = 0; i < dataObject.tableName.toArray().length; i++) { //���м��ű�
      String tempTable;
      tempTable = (String) (dataObject.tableName.toArray())[i]; //�õ�ĳһ�ű�
      Enumeration enum1 = request.getParameterNames();

      DataTable[] dataTable = new DataTable[Integer.parseInt( (String) (
          dataObject.tableRows.toArray())[i])]; //�˱��ж��ټ�¼

      for (int i3 = 0;
           i3 < Integer.parseInt( (String) (dataObject.tableRows.toArray())[i]);
           i3++) {
        dataTable[i3] = new DataTable();
      }

      while (enum1.hasMoreElements()) {
        Object htmlObject = null;
        htmlObject = enum1.nextElement(); //�ֶζ���
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
//�������м��ű�ÿ�ű����ж�������¼
  private void getTables() {
//�õ�������������ֵ
    Enumeration enum1 = request.getParameterNames();
    dataObject = new DataObject();
//�ж���䣬���Ƿ��м�¼
    while (enum1.hasMoreElements()) {
      Object htmlObject = null;
//ѭ�������Ƿ���Ҫ�����������Ǿ�������Ķ�����
      htmlObject = enum1.nextElement();
      String[] colName;
//����õ���ֵ��û���ַ���:�����ͱ�ʾ���ǺϷ����ݣ���Ҫ�߳�
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
//�ж��������Ƿ����һ�ű�ı�����colName[0]����������������ߣ�������������������в���
//�ж��Ѿ��������Ѿ����������¼���ڣ������κδ���
      if (cs.initstr(tempArray, colName[0]) == true) {
//��������
        continue;
//���ݲ�Ҫ���Ǹ�����jsp�д����ֵ���жϣ����������������N�����ʾ�����ϵ����ݣ�����ȡ
      } else if (colName[3].equals("N")) {
          continue;
        }
//�ж��������Ƿ����һ�ű�ı�����colName[0]����������������ߣ�������������������в���
      else {
//ȷ�����±�Ҫ����Ϣ���ӵ�������
        dataObject.tableName.add(colName[0]);
        String[] getElementsData;
//�õ������ֶε�ֵ
        getElementsData = request.getParameterValues(htmlObject.toString());
//�жϴ����ֵ���Ƿ����ϲ�Ϊһ����¼�����ΪS��ϲ�,���򲻺ϲ�����ͬ������¼��
        if (colName[3].equals("S")) {
//���ӱ�Ĵ洢�ռ䣬Ϊ��һ��װ��������׼���������S�������ǵ�����¼�ռ�
          dataObject.tableRows.add( (new String()).valueOf(1));
        }
        else {
//���ӱ�Ĵ洢�ռ䣬Ϊ��һ��װ��������׼���������Ƕ�����¼�ռ�
          dataObject.tableRows.add( (new String()).valueOf(getElementsData.
              length));
        }
      }
    }
  }
}
