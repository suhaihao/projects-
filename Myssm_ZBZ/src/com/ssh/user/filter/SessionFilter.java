package com.ssh.user.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.ssh.user.model.User;

public class SessionFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
        HttpServletResponse response = (HttpServletResponse) arg1;
        HttpSession session = request.getSession();
        Subject currentUser = SecurityUtils.getSubject();
        String url=request.getRequestURI();
        //判断session是否过期
        if ((User)session.getAttribute("user")==null) {
        	if(!request.getRequestURI().equals("/Myssm/")&&!request.getRequestURI().equals("/Myssm/login.jsp"))
        	{
        	request.getSession().getServletContext()
			.setAttribute("msg", "3");
            currentUser.logout();
            //跳转至登录页面
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        	}
        	else
        	{
        		//request.getSession().getServletContext().removeAttribute("msg");
        		currentUser.logout();
        		arg2.doFilter(request, response);
        	}
        } else {
            arg2.doFilter(request, response);
        }
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
