package com.jf.util;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
public class LisTimer implements ServletContextListener  {
	 //���� 
	 public static final long TIME =1200000;   
	 //�ӳ�
	 public static final long NO_DELAY = 0;   
	 private Timer timer;   
	 public void contextInitialized(ServletContextEvent event) {   
	  timer = new Timer("��ʱ���Ͷ���",true);   
	  timer.schedule(new BackDuanXin(),NO_DELAY,TIME);   
	 }   
	 public void contextDestroyed(ServletContextEvent event) {   
	  timer.cancel(); // ��ʱ������   
	 } 
}
