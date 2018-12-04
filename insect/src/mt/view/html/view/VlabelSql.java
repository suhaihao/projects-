package mt.view.html.view;

import mt.view.html.DataValue;
import mt.database.extend.QueryConnection;
import mt.database.JavaDataObject;

public class VlabelSql
    extends Vlabel {
   protected javax.servlet.http.HttpSession session;
  private String datasource;
  public void setDatasource(String datasource) {
    this.datasource = datasource;
  }

  public String getDatasource() {
    return this.datasource;
  }

  protected String getValue() {
    String lableName = "";
    String sql = "";
    QueryConnection qc = null;
    JavaDataObject jdo = null;
    String[] col = null;
    try {
      qc = new QueryConnection();
      jdo = new JavaDataObject(qc);
      sql = this.getDatasource();

      session=this.pageContext.getSession();

      if (!new mt.tools.CustString().nullToString(getWhereval()).equals("")) {

        col = getWherecol().split(":");
        sql += " and " + col[0] + " " + col[2];

        if (col[1].toUpperCase().equals("STR")) {
          sql += "'" + getWhereval() + "'";
        }
        if (col[1].toUpperCase().equals("LON")) {
          sql += " " + getWhereval() + " ";
        }
        if (col[1].toUpperCase().equals("DOU")) {
          sql += " " + getWhereval() + " ";
        }
        if (col[1].toUpperCase().equals("DAT")) {
          sql += "to_date('" + getWhereval() + "','yyyy-mm-dd hh:mi:ss')"; ;
        }
        session.setAttribute(this.name,sql);
      }
      else {
        String tempSql="";
          tempSql=(String)session.getAttribute(this.name);
          if (! new mt.tools.CustString().nullToString(tempSql).equals("")){
              sql=tempSql;
          }
      }

      jdo.executeQuery(sql);
      if (jdo.rs.next()) {
        lableName = jdo.rs.getString(1);
      }
    }
    catch (Exception e) {
      new mt.tools.customException(e, this.toString());
    }
    finally {
      jdo.close();
      qc.close();
    }
    return lableName;
  }

  protected String whereval;
  public void setWhereval(String whereval) {
    this.whereval = whereval;
  }

  public String getWhereval() {
    String returnVal = "";
    if (new mt.tools.CustString().nullToString(this.pageContext.getRequest().getParameter(this.whereval) )
       .trim().equals("")){

      returnVal = getSQlValue(this.whereval);
    }else {
    returnVal = this.pageContext.getRequest().getParameter(this.whereval);
  }
    return returnVal;
  }

  protected String getSQlValue(String colname) {
    DataValue dv=new DataValue();
   return dv.getValueBySheet(colname,this);
}


  protected String wherecol;
  public void setWherecol(String wherecol) {
    this.wherecol = wherecol;
  }

  public String getWherecol() {
    return this.wherecol;
  }

}
