package mt.view.html.update;
import mt.controller.base.ContainUpdateSql;
public class FreeDetailSheet extends MasterSheet {
  protected String getSql(ContainUpdateSql cus){
//    System.out.println("aaa");
//    System.out.println(detailindex);
    if ( detailindex.equals("1")){
      //System.out.println(cus.detail1Sql);
        return cus.detail1Sql;
    } else if ( detailindex.equals("2")){
        return cus.detail2Sql;
    } else if ( detailindex.equals("3")){
        return cus.detail3Sql;
    } else {
      return cus.detail1Sql;
    }
  }


private String detailindex;
public void setDetailindex(String detailindex) {
    this.detailindex = detailindex;
   }
}
