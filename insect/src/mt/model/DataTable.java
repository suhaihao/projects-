package mt.model;
import java.util.*;
/**
 * <p>Title:װ�����ݵ�����</p>
 *
 * <p>Description:��Ҫ������Form���ύ�������ݰ�����С�ֵ��ArrayList��ʽװ��</p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: </p>
 *
 * @author not attributable
 * @version 1.0
 */
public class DataTable {
  public ArrayList col;
  public ArrayList val;
  public DataTable(){
        col=new ArrayList();
        val=new ArrayList();
  }

  public int length(){
    return col.toArray().length;
  }

}
