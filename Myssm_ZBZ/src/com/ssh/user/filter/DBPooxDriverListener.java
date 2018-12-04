package com.ssh.user.filter;

import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Set;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class DBPooxDriverListener implements ServletContextListener {
	private ServletContextEvent context=null;  
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		Enumeration<Driver> drivers = DriverManager.getDrivers();  
        while (drivers.hasMoreElements()) {  
            Driver driver = drivers.nextElement();  
            try {  
                DriverManager.deregisterDriver(driver);  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }
        destroyThreads();  
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		 context=this.context;  
	}
	/** 
     * 销毁未正常关闭的线程 
     */  
    private void destroyThreads(){    
          final Set<Thread> threads = Thread.getAllStackTraces().keySet();      
          for (Thread thread : threads) {                  
              if(thread.getName().equals("HouseKeeper")){    
                   synchronized (this) {      
                     try {      
                        thread.stop();      
                          return;    
                     } catch (Exception e) {  
                         e.printStackTrace();  
                     }      
                   }      
            }      
          }  
    } 

}
