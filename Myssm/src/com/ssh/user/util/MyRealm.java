package com.ssh.user.util;


import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import com.ssh.user.model.User;
import com.ssh.user.service.UserService;
public class MyRealm extends AuthenticatingRealm{
	@Autowired
	private UserService userService;
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		//转成绑定user的类
		UsernamePasswordToken uptoker=(UsernamePasswordToken) token;
		//获取对应的用户名
		String username=uptoker.getUsername();
		//获取用户信息
		User user=userService.SelectByName(username);
		//用户名
		Object obname=user.getJFUSERID();
		//密码
		Object obpass=user.getJFPASSWORD();
		//用户不存在抛出异常
		
		if(user==null)
		{
			throw new UnknownAccountException("用户不存在");
		}
		//根据用户情况构建AuthenticationInfo 对象并返回
	    //principal：认证的实体信息
		//credentials：密码
		//realmName:当前realm对象的name调用父类的getname（）方法
		SimpleAuthenticationInfo info=new SimpleAuthenticationInfo(obname, obpass, getName());
		Subject currentUser=SecurityUtils.getSubject();
		Session session=currentUser.getSession();
		session.setAttribute("user",user);
		return info;
	}
}
