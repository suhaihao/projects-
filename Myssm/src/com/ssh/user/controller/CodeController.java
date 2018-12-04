package com.ssh.user.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Conditional;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Scope("prototype")
@RequestMapping(value = "/code")
public class CodeController {
    private int width = 90;//��֤����
    private int height = 40;//��֤��߶�
    private int codeCount = 4;//��֤�����
    private int lineCount = 19;//�����߸���

    char[] codeSequence = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
            'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
            'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

    /**
     * �����ȡ��֤��ķ���
     * @param time  timeΪʱ��,�����Ļ����Ա��������������֤��
     * @throws IOException
     */
    @RequestMapping(value = "/new.do")
    public void getCode(HttpServletRequest request,
                        HttpServletResponse response) throws IOException{
        //�����������
        Random r = new Random();
        //����洢��֤�����
        StringBuilder builderCode = new StringBuilder();
        //���廭��
        BufferedImage buffImg = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        //�õ�����
        Graphics g = buffImg.getGraphics();
        //1.������ɫ,���߿�
        g.setColor(Color.black);
        g.drawRect(0,0,width,height);
        //2.������ɫ,����ڲ�
        g.setColor(Color.white);
        g.fillRect(1,1,width-2,height-2);
        //3.���ø�����
        g.setColor(Color.gray);
        for (int i = 0; i < lineCount; i++) {
            g.drawLine(r.nextInt(width),r.nextInt(width),r.nextInt(width),r.nextInt(width));
        }
        //4.������֤��
        g.setColor(Color.blue);
        //4.1������֤������
        g.setFont(new Font("����",Font.BOLD|Font.ITALIC,15));
        for (int i = 0; i < codeCount; i++) {
            char c = codeSequence[r.nextInt(codeSequence.length)];
            builderCode.append(c);
            g.drawString(c+"",15*(i+1),15);
        }
        //5.�������Ļ
        ServletOutputStream sos = response.getOutputStream();
        ImageIO.write(buffImg,"png",sos);
        //6.���浽session��
        HttpSession session = request.getSession();
        session.setAttribute("codeValidate",builderCode.toString());
        //7.��ֹͼ�񻺴档
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires",-1);
        response.setContentType("image/jpeg");
        //8.�ر�sos
        sos.close();
    }
}