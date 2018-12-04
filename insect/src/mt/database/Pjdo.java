package mt.database;

import java.sql.*;

/**
 * <p>Title:数据库分页对项 </p>
 *
 * <p>Description: 主要用来为Sheet对象提供数据以及分页的参数</p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: </p>
 *
 * @author not attributable
 * @version 1.0
 */
public class Pjdo
    extends JavaDataObject {
  public Pjdo() {
    try {
      jbInit();
    }
    catch (Exception ex) {
      ex.printStackTrace();
    }
  }

  private int rowcount;
  private int intadd = 1;
  public Pjdo(DbConnection dbc) {
    super(dbc);
  }

  public int getCurrentPage() {
    return (getRow() == 0 ? this.getRowCount() : this.getRow() - 1) /
        this.getPageSize() + 1;
  }

  public int pageQuery(String sql) {
    rowcount=this.UPDATEFAILURE;
    super.executeQuery(sql);
    try {
      this.rs.last();
      rowcount = rs.getRow();
      rs.first();
    }
    catch (SQLException e) {
      new mt.tools.customException(e, this.toString());
    }
    return rowcount;
  }

  public int getRowCount() {
    return rowcount;
  }


  public void move(int position) {
    try {
    	if( (position+1==0) && (rs.getRow()==0)){
    		return;
    	}else{
        rs.absolute(position + 1);
    	}
    }
    catch (SQLException e) {
      new mt.tools.customException(e, this.toString());
    }
  }

  private int pagecount;
  public int getPageCount() {
    return rowcount / pagesize + (rowcount % pagesize == 0 ? 0 : 1);
  }

  private int pagesize;
  public void setPageSize(int pagesize) { //多少行为一页
    this.pagesize = pagesize;
  }

  public int getPageSize() {
    if (pagesize == 0) {
      return this.getRowCount();
    }
    return this.pagesize;
  }

  public long getCurrentRowInPage() {
    return intadd;
  }

  public boolean isFirst() {
    boolean bool = false;
    try {
      bool = rs.isFirst();
    }
    catch (SQLException e) {
      new mt.tools.customException(e, this.toString());
      bool = false;
    }
    return bool;
  }

  public boolean isLast() {
    boolean bool = false;
    try {
      bool = rs.isLast();
    }
    catch (SQLException e) {
      new mt.tools.customException(e, this.toString());
      bool = false;
    }
    return bool;
  }

  public boolean next() {
    try {
      if (intadd < this.getPageSize()) {
        intadd = intadd + 1;

        return rs.next();
      }
      return false;
    }
    catch (SQLException e) {
      new mt.tools.customException(e, this.toString());
      return false;
    }
  }

  private void jbInit() throws Exception {
  }

}
