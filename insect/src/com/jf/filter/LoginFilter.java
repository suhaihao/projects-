package com.jf.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {
	private final String LOGIN = "/insect/login.jsp?t=timeout";

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String path = req.getRequestURI();
		String loc = path.substring(path.lastIndexOf("/") + 1);
		//String ext = "login.do,login.jsp";
		if ("login.do".equals(loc) || "login.jsp".equals(loc)||"hqyzm.do".equals(loc)) { // 用户正在登陆，通过
			chain.doFilter(request, response);
			return;
		}
		if (session.getAttribute("user") == null) {
			resp.sendRedirect(LOGIN);
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig config) throws ServletException {
	}
	
}
