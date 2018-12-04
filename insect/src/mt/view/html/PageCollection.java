package mt.view.html;
/**
 * <p>Title:∑÷“≥ºØ∫œ</p>
 *
 * <p>Description: </p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: </p>
 *
 * @author not attributable
 * @version 1.0
 */
public class PageCollection {
  public int rowcount;
  public int pagecount;
  public int currentpage;
  public int currentrow;
  public int currentrowinpage;
  public int pagesize;
  public PageCollection(int row,int page,int currow,int curpage) {
      this.rowcount =row;
      this.pagecount=page;
      this.currentrow=currow;
      this.currentpage=curpage;
  }

}
