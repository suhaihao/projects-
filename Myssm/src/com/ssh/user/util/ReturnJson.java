package com.ssh.user.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ReturnJson {
	public void printStr(HttpServletResponse response,String str)
	{
		try {
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
