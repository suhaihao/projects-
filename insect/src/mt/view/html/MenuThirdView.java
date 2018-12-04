package mt.view.html;

import java.sql.ResultSet;
import mt.database.extend.QueryConnection;
import mt.database.JavaDataObject;
import mt.project.share.*;
import mt.view.BaseTag;
public class MenuThirdView extends BaseTag {
  public static final String PATHPICTURE="/struts/images/";


  public String front() {

   QueryConnection qc = new QueryConnection();
   JavaDataObject jdo = new JavaDataObject(qc);
   String strContent="";
   try {
     int i=0;
     jdo.executeQuery(getSql());
     ResultSet res = jdo.rs;
     strContent ="<table border='0'>";
     while (res.next()) {
//          System.out.println(i);

          if (i %2==0){
            strContent += "<tr><td align=center>";
          }else{
            strContent += "<td align=center>";
          }

           strContent+="<a target='blank' href=\"/struts/"+res.getString("item_path")+"\">";
           strContent+="<img src=\"images/"+res.getString("item_pic_name")+"\" border='0' >";
           strContent+="</a>\n";
           strContent+="<br>";
           strContent+=res.getString("item_name");
           strContent+="<br><br>";
           if (i %2==0){
             strContent += "</td>";
           }else{
              strContent += "</td></tr>";
           }
           i=i+1;
     }
       strContent +="</table>";
     res.close();
   }
   catch (Exception sqlx) {
     sqlx.printStackTrace();
   }finally{
     qc.close();
     jdo.close();
   }
   return strContent;
  }
  private String getSql(){
//      String this. app_name

      String app_name=this.pageContext.getRequest().getParameter("app_name");
      String menu1_id=this.pageContext.getRequest().getParameter("menu1_id");
      String menu2_id=this.pageContext.getRequest().getParameter("menu2_id");

      javax.servlet.http.HttpSession session = this.pageContext.getSession();
      User user=(User)session.getAttribute("user");
       String strSQL =" select dsys02.item_pic_name,dsys02.item_path,dsys02.item_name "+
              "  from dsys01,dsys02,dsys03,dsys01_dsys03,dsys02_dsys03 \n "+
              " where dsys01.jfid = dsys01_dsys03.dsys01_jfid \n"+
              "   and dsys03.jfid = dsys01_dsys03.dsys03_jfid \n"+
              "   and dsys02.jfid = dsys02_dsys03.dsys02_jfid \n"+
              "   and dsys03.jfid = dsys02_dsys03.dsys03_jfid \n"+
              "   and dsys01.zydm='"+user.loginId+"' \n"+
              "   and dsys01.kl='"+user.userPassword+"' \n"+
              "   and nvl(dsys02_dsys03.qx,'0') <>'0' "+
              "   and dsys02.app_name='"+app_name+"'"+
              "   and dsys02.menu1_id='"+menu1_id+"'"+
              "   and dsys02.menu2_id='"+menu2_id+"'"+
              " and nvl(sf_noshow,'0') <> '1' "+
              "   and dsys02.item_id <> '0' "+
              " order by menu1_id,menu2_id,item_id";
//          System.out.println(strSQL);
      return strSQL;
  }
}
