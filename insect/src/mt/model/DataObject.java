package mt.model;
import java.util.*;
/**
 * <p>Title:����ͨ�� </p>
 *
 * <p>Description: ��Ҫ����������õ����ݼ���controller��Ҫ���Լ��ṩ��JDO�������������ݲ�Ĵ���</p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: </p>
 *
 * @author not attributable
 * @version 1.0
 */

public class DataObject {
  public ArrayList tableName;
  public Hashtable tableDataColl;
  public ArrayList tableRows;

  public DataObject(){
         tableName=new ArrayList();
         tableRows=new ArrayList();
         tableDataColl=new Hashtable();
  }

  public int length(){
      return tableName.toArray().length;
  }
}
