package mt.view.html.view;

import mt.database.extend.*;
import mt.database.*;
import mt.view.BaseBodyTag;
import mt.controller.base.ContainDivPage;

public class InitSheet extends BaseBodyTag {

   public QueryConnection qc;
   public Pjdo pjdo;
   protected int  pagesize;

   public void setPagesize(int pagesize){
       this.pagesize=pagesize;
  }

  public String connectmode="0";
  public String getConnectmode(){
      return this.connectmode;
  }
  public void setConnectmode(String connectmode){
      this.connectmode=connectmode;
  }


  protected String child;
  public void setChild(String child){
      this.child =child;
  }

  public String getChild(){
       return this.child;
  }

  protected String getPath(){
   String currentPath="";
   String returnPath="";
   currentPath=((javax.servlet.http.
          HttpServletRequest)this.pageContext.getRequest()).getServletPath();
   if (!new mt.tools.CustString().nullToString(getChild()).equals("") ) {
       returnPath = currentPath + "_sql"+getChild();
   }
   else {
     returnPath = currentPath + "_sql";
   }
//   System.out.println(returnPath);
  return returnPath;
}

protected String datasource;
 public void setDatasource(String datasource){
     this.datasource=datasource;
  }

protected javax.servlet.http.HttpSession session;
 protected void initdivPage() throws Exception{
    String sql="";
    if (new mt.tools.CustString().nullToString( this.datasource).equals("") ){
      ContainDivPage cdp = null;
      Object sessionObject=session.getAttribute(this.getPath());
      if (sessionObject==null) throw new Exception("SESSION TIMEOUT OR REMOVE!");
      cdp = (ContainDivPage)sessionObject;
      if (cdp==null){
        sql="";
      }else {
         sql=cdp.sqlWhole;
      }
    }else {
      sql=this.datasource;
    }

   if ( connectmode.equals("1") ){//jdbc连接模式,autocommit方式
      qc=new QueryConnection("1","0");
   } else if ( connectmode.equals("3") ){
     qc=new JdbcQueryConnection();
   }else {
       qc=new QueryConnection();

   }
    pjdo= new Pjdo(qc);
    pjdo.pageQuery(sql);
    /**********************************************/
    if(pagesize==0){
    	pagesize=(session.getAttribute("gs_userxsjlhs")==null?0:Integer.parseInt((session.getAttribute("gs_userxsjlhs")).toString()));
    }
    /**********************************************/
    pjdo.setPageSize(this.pagesize);
 }

 public String front() {
   return "";
 }

 public String back() {
   return "";
 }
}
