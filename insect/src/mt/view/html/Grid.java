package mt.view.html;
/**
 * <p>Title: Íø¸ñ±êÇ©</p>
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
import mt.view.*;
import mt.model.*;
import mt.database.*;
public class Grid
    extends BaseBodyTag {
  public DataChannel dc;
  public Pjdo pjdo;


  public int doStartTag() {
    super.printStart();
    dc=(DataChannel)this.pageContext.getRequest().getAttribute("dc");
    pjdo=dc.pjdo;

      if (pjdo.getRow() > 0 ){
        return EVAL_BODY_INCLUDE;
      }
      return SKIP_BODY;
  }

  public String front() {
   return "<tbody id=tbodyData name=tbodyData>";
 }

 public String back() {
   return "</tbody>";
 }


public int doAfterBody(){
      if (pjdo.next())  {
           return EVAL_BODY_AGAIN; }
         pjdo.close();
         dc.ec.close();
         return SKIP_BODY;
  }
}
