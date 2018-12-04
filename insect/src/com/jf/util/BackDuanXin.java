package com.jf.util;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.TimerTask;

import mt.database.extend.QueryConnection;


public class BackDuanXin extends TimerTask{

    private static boolean isRunning = false;    
    @Override
    public void run() {    
               if (!isRunning) {    
                           isRunning = true;
                           QueryConnection qc = new QueryConnection();
                           QueryConnection qcdx = new QueryConnection();
                           QueryConnection qcup = new QueryConnection();
                           String sql="select cszt from DSYS04 t where cssx=1 and cszt=1 and csLB='SMS'";
                           try {
                   		   Statement stmt = qc.con.createStatement();
                   		   ResultSet rs = stmt.executeQuery(sql);
                   		   if(rs.next())
                   		   { 
                   			   //判断是否需要推送
                   			   if(rs.getString(1).equals("1"))
                   			   {
                   				sql="select yjnr,yjjb,to_char(lrrq,'yyyy-mm-dd') lrrq,f_get_mc('DEPT',bmbm) bmbm,jfid from DBBZB_YJ where sf_fs=1";
                   			    Statement stmtdx = qcdx.con.createStatement();
                     		    ResultSet rsdx = stmtdx.executeQuery(sql);
                     		    String msg="";
                     		    while(rsdx.next())
                     		    {
                     		    	 msg=BackFDXUtil.getRequest2("13681174418",rsdx.getString(4),rsdx.getString(1),rsdx.getString(2),rsdx.getString(3));
                     		    	if(msg!=null&&msg.equals("sun"))
                     		    	{
                     		    		Statement stmtup = qcup.con.createStatement();
                     		    		sql="update DBBZB_YJ set sf_fs=0 where jfid ="+rsdx.getString(5);
                     		    		stmtup.executeUpdate(sql);
                     		    		qcup.commit();
                     		    		stmtup.close();
                     		    	}
                     		    }
                     		    if(msg!=null)
                     		    {
                     		    Statement stmtup = qcup.con.createStatement();
                     		    sql="update DSYS04 set cszt=0 where cslb='SMS'";
            		    		stmtup.executeUpdate(sql);
            		    		qcup.commit();
            		    		qcup.close();
                     		    rsdx.close();
                     		    stmtdx.close();
                     		    qcdx.close();
                     		    }
                   			   }
                   		   }
                   		   rs.close();
                   		   stmt.close();
                   		   qc.close();
                       	   } catch (Exception e) {
						 	e.printStackTrace();
						   }
                           isRunning = false;    
                 } else {
                	 System.out.println("正在执行");
                 }    
    } 

}
