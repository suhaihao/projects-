package com.jf.bchyj.login;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

import mt.controller.InitAction;
import mt.controller.base.ServletObject;

public class HqyzmAction extends InitAction {
	public static Random random = new Random();
	private static final int w=80;
	private static final int h=34;
	protected void actionQuery(ServletObject so) {
		// TODO Auto-generated method stub
        //在内存中创建一副图片
        try {
        BufferedImage img = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        //在图片上画一个矩形当背景
        Graphics g = img.getGraphics();
       // g.setColor(new Color(r(50,250),r(50,250),r(50,250)));
        g.fillRect(0, 0, w, h);
        String str = "123456789";
        String sjs="";
        for(int i=0;i<4;i++){
            g.setColor(new Color(r(50,180),r(50,180),r(50,180)));
            g.setFont(new Font("黑体",Font.PLAIN,18));
            char c = str.charAt(r(0,str.length()));
            sjs=sjs+c;
            g.drawString(String.valueOf(c),20*i,25);
        }
        //画随机线
//        for(int i=0;i<25;i++){
//            g.setColor(new Color(r(50,180),r(50,180),r(50,180)));
//            g.drawLine(r(0,w), r(0,h),r(0,w), r(0,h));
//        }
        //把内存中创建的图像输出到页面中
        so.httpServletRequest.getSession().setAttribute("sjs",sjs);
        so.httpServletResponse.setContentType("image/jpeg");
        so.httpServletResponse.setDateHeader("expries", -1);
        so.httpServletResponse.setHeader("Cache-Control", "no-cache");
        so.httpServletResponse.setHeader("Pragma", "no-cache");
		ImageIO.write(img, "png", so.httpServletResponse.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
    public static int r(int min,int max){
	        int num=0;
	        num=random.nextInt(max-min)+min;
	        return num;
    }
}
