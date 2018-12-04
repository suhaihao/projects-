package mt.view.html.view;
import mt.view.*;
import mt.view.html.*;
import java.sql.SQLException;
/**
 * <p>Title:</p>
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
public class VanchorUpdate extends VanchorFree{

  public String href(){
       return "href=\"" + (new mt.tools.CustString()).nullToString(href) + "?ACT_TYPE=QUERYSINGLE&"+super.name+"="+getValue()+"\";\n";
  }

}
