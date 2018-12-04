package mt.view.html.view;
import mt.view.*;
import mt.view.html.*;
import java.sql.*;
/**
 * <p>Title:≥¨º∂¡¥Ω”±Í«©</p>
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
public class Vanchor extends Vobject {
  public String front(){
     String tempfront="";
     tempfront+="<a "+" " ;
     tempfront+=super.getAllAttribute()+" ";
     tempfront+=href();
     tempfront+=">";
     tempfront+=value();
     tempfront+="</a>";
     return tempfront;
}
   protected String href;
   public void setHref(String href) {
     this.href = href;
   }

   public String href(){
       return "href=\"" + (new mt.tools.CustString()).nullToString(href) + "\"";
  }



}
