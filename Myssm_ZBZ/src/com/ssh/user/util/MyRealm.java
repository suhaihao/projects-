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
		//ת�ɰ�user����
		UsernamePasswordToken uptoker=(UsernamePasswordToken) token;
		//��ȡ��Ӧ���û���
		String username=uptoker.getUsername();
		//��ȡ�û���Ϣ
		User user=userService.SelectByName(username);
		//�û���
		Object obname=user.getJFUSERID();
		//����
		Object obpass=user.getJFPASSWORD();
		//�û��������׳��쳣
		
		if(user==null)
		{
			throw new UnknownAccountException("�û�������");
		}
		//�����û��������AuthenticationInfo ���󲢷���
	    //principal����֤��ʵ����Ϣ
		//credentials������
		//realmName:��ǰrealm�����name���ø����getname��������
		SimpleAuthenticationInfo info=new SimpleAuthenticationInfo(obname, obpass, getName());
		Subject currentUser=SecurityUtils.getSubject();
		Session session=currentUser.getSession();
		session.setAttribute("user",user);
		return info;
	}
}
