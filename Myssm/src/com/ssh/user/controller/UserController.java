package com.ssh.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ssh.user.model.Dsys02_zfzz;
import com.ssh.user.model.User;
import com.ssh.user.service.Dsys02_zfzzService;
import com.ssh.user.service.UserService;
import com.ssh.user.util.EHCache;
import com.ssh.user.util.MD5YZJM;

/**
 * 用户登陆控制层
 */
@Controller
@Scope("prototype")
@RequestMapping("/shiro")
public class UserController {
	private MD5YZJM md5 = new MD5YZJM();

	/**
	 * 后台登陆接口
	 * 
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String yzm = request.getParameter("yzm");
		String codeValidate = (String) request.getSession().getAttribute(
				"codeValidate");
		if(yzm==null)
		{
			User user=(User) request.getSession().getAttribute("user");
			if(user==null)
			{
				return "login";
			}
			else
			{
				return "redirect:/go/index.do";
			}
		}
		Subject currentUser = SecurityUtils.getSubject();
		if (!currentUser.isAuthenticated()) {
			// 封装用户
			UsernamePasswordToken token = new UsernamePasswordToken(
					request.getParameter("username"), md5.md5Password(request
							.getParameter("password")));
			token.setRememberMe(true);
			try {
				currentUser.login(token);
				if (currentUser.isAuthenticated()) {
					if (yzm.equals(codeValidate)) {
						return "redirect:/go/index.do";
					} else {
						// 2代表验证码
						request.getSession().getServletContext()
								.setAttribute("msg", "2");
						return "redirect:/shiro/logout.do";
					}
				}
			} catch (AuthenticationException e) {
				// 1代表用户名密码错误
				request.setAttribute("msg", "1");
				return "login";
			}
		} else {
			User user = (User) request.getSession().getAttribute("user");
			if (user != null) {
				String name = user.getJFUSERID();
				String pasword = user.getJFPASSWORD();
				if (name.equals(request.getParameter("username"))
						&& pasword.equals(md5.md5Password(request
								.getParameter("password")))) {
					if (yzm.equals(codeValidate)) {
						return "redirect:/go/index.do";
					} else {
						// 2代表验证码
						request.getSession().getServletContext()
								.setAttribute("msg", "2");
						return "redirect:/shiro/logout.do";
					}
				} else {
					// 1代表用户名错误
					request.getSession().getServletContext()
							.setAttribute("msg", "1");
					return "redirect:/shiro/logout.do";
				}
			}
			else
			{
					// 3登陆超时
					request.getSession().getServletContext()
					.setAttribute("msg", "3");
					return "redirect:/shiro/logout.do";
			}
		}
		return "login";
	}

}
