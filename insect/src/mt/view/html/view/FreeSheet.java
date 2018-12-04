package mt.view.html.view;
import mt.view.*;
import mt.model.*;
import mt.tools.*;
import mt.database.extend.*;
import mt.database.*;
import java.sql.*;
import mt.controller.base.ContainDivPage;


public class FreeSheet extends Sheet {

  protected void initdivPage(){
     String sql="";
     ContainDivPage cdp=null;
     cdp=(ContainDivPage)session.getAttribute(((javax.servlet.http.HttpServletRequest)this.pageContext.getRequest()).getServletPath()+"_sql");
     qc=new QueryConnection();
     pjdo= new Pjdo(qc);
     sql=  ( new mt.tools.CustString() ).joinUseAnd(cdp.sqlselect,this.where);
     if  (! new mt.tools.CustString().nullToString(cdp.sqlsort).trim().equals("") ){
        sql+=" order by "+ cdp.sqlsort ;
     }


     pjdo.pageQuery(sql);
     pjdo.setPageSize(this.pagesize);
  }

  protected String where;
  public void setWhere(String where){
      this.where=where;
  }

}
