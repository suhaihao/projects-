package mt.controller.base;

/**
 * <p>Title: 记录当前分页参数的容器</p>
 * <p>Description: 用于传递参数
 * </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
public class ContainDivPage implements java.io.Serializable {
	private static final long serialVersionUID = 4162423086881652350L;
public String sqlselect;
  public String sqlsort;
  public String sqlWhole;
  public int curpage;
  public ContainDivPage() {
  }

  public void setSqlselect(String sqlselect) {
    this.sqlselect = sqlselect;
  }

  public String getSqlselect() {
    return this.sqlselect;
  }

  public void setSqlsort(String sqlsort) {
    this.sqlsort = sqlsort;
  }

  public String getSqlsort() {
    return this.sqlsort;
  }

  public void setSqlwhole(String sqlWhole) {
    this.sqlWhole = sqlWhole;
  }

  public String getSqlwhole() {
    return this.sqlWhole;
  }

  public void setCurpage(int curpage) {
    this.curpage = curpage;
  }

  public int getCurpage() {
    return this.curpage;
  }
}
