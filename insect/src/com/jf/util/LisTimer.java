package com.jf.util;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
public class LisTimer implements ServletContextListener  {
	 //毫秒 
	 public static final long TIME =1200000;   
	 //延迟
	 public static final long NO_DELAY = 0;   
	 private Timer timer;   
	 public void contextInitialized(ServletContextEvent event) {   
	  timer = new Timer("定时发送短信",true);   
	  timer.schedule(new BackDuanXin(),NO_DELAY,TIME);   
	 }   
	 public void contextDestroyed(ServletContextEvent event) {   
	  timer.cancel(); // 定时器销毁   
	 } 
}
