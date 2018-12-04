package mt.model;
import java.util.*;
/**
 * <p>Title:装表数据的容器</p>
 *
 * <p>Description:主要用来将Form中提交来的数据按表的列、值以ArrayList格式装载</p>
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
