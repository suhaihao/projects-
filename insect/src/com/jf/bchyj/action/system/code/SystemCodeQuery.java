package com.jf.bchyj.action.system.code;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class SystemCodeQuery extends InitAction
{
  protected void actionQuery(ServletObject servletObject) {
	  String hzmc = servletObject.httpServletRequest.getParameter("hzmc");
  String sql = "";
  if(hzmc==null){hzmc="";}
  	if(hzmc.trim().length()>0){
  		sql ="SELECT JFID,jfsort,jfsortname FROM DSYS10 where jfsortname like '%"+hzmc+"%' ORDER BY jfsort";
  	}else{
    sql += "SELECT JFID,jfsort,jfsortname FROM DSYS10 ORDER BY jfsort";
  	}
    
    servletObject.setActForward("QUERY");
    ContainDivPage cdp = new ContainDivPage();
      cdp.sqlWhole = sql;
      cdp.sqlsort = " ";
      cdp.sqlselect = sql;
      servletObject.getSession().setAttribute(servletObject.actionMapping.findForward(switchForward(servletObject.getActForward())).
                           getPath() + "_sql", cdp);
  }
}
