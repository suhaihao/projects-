package mt.model;
import java.util.*;
/**
 * <p>Title:数据通道 </p>
 *
 * <p>Description: 主要用来将整理好的数据集按controller的要求以及提供给JDO或其子孙做数据层的处理</p>
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
