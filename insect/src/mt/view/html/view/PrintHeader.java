package mt.view.html.view;
import mt.view.BaseBodyTag;
public class PrintHeader extends BaseBodyTag {
  public int startPage;
  public int curPage;
  public int endPage;
  public int doStartTag() {
     super.printStart();
     startPage=Integer.parseInt(this.pageContext.getRequest().getParameter("startPage"));
     endPage=Integer.parseInt(this.pageContext.getRequest().getParameter("endPage"));
     curPage=startPage;
     if (curPage <= endPage ) {

       return EVAL_BODY_INCLUDE;
     }
   return SKIP_BODY;
 }
 public int doAfterBody(){
     if (curPage < endPage)  {
          ++curPage;
          return EVAL_BODY_AGAIN;
        }
    return SKIP_BODY;
 }
}
