package mt.view.html.update;
import mt.controller.base.ContainUpdateSql;
public class DetailSheet extends MasterSheet {
  protected String getSql(ContainUpdateSql cus){
        return cus.detail1Sql;
  }

}
