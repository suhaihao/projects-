package com.jf.bchyj.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import com.jf.bchyj.bean.User;
import com.jf.util.MD5YZJM;

import mt.controller.InitAction;
import mt.controller.base.ServletObject;
import mt.database.extend.LoginConnection;
import mt.database.extend.QueryConnection;

/**
 * 登录的后台处理类
 *
 */
public class LoginAction extends InitAction {
	private MD5YZJM md5=new MD5YZJM();
	protected void actionQuery(ServletObject so) {
		String username = so.httpServletRequest.getParameter("username");
		String password = so.httpServletRequest.getParameter("password");
		String yzm = so.httpServletRequest.getParameter("yzm");
		String old=(String)so.httpServletRequest.getSession().getAttribute("sjs");
		PrintWriter out = null;
		try {
			out = so.httpServletResponse.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		HttpSession session = so.getSession();
		LoginConnection lc = new LoginConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			sql = "SELECT JFID,JFNAME,JFDSYS05_CODE,JFDSYS20_ID,JFUSERID,JFPASSWORD,F_GET_MC('DEPT',JFDSYS05_CODE) BMMC FROM DSYS01 WHERE JFSTATE='1' AND JFUSERID=? AND JFPASSWORD=?";
			pstmt = lc.con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, md5.md5Password(password));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				//3.15修改
				QueryConnection qc = new QueryConnection();
				Statement stem=qc.con.createStatement();
				ResultSet rss=stem.executeQuery("select xz,cun,JFDEPTPROP from DSYS05 where jfdeptcode="+rs.getString("jfdsys05_code"));
				String xz="";
				String cun="";;
				String jfdeptprop="";
				if(rss.next())
				{
					xz=rss.getString(1);
					cun=rss.getString(2);
					jfdeptprop=rss.getString(3);
				}
				User user = new User();
				user.setUserjfid(rs.getString("jfid"));
				user.setUserid(rs.getString("jfuserid"));
				user.setUsername(rs.getString("jfname"));
				user.setBmbm(rs.getString("jfdsys05_code"));
				user.setBmmc(rs.getString("bmmc"));
				user.setRoleid(rs.getString("jfdsys20_id"));
				user.setPassword(rs.getString("JFPASSWORD"));
				user.setXz(xz);
				user.setCun(cun);
				user.setJfdeptprop(jfdeptprop);
				session.setAttribute("user", user);
				if(yzm.trim().equals(old))
				{
					out.write("SUCCESS"); // 登录成功
				}
				else
				{
					out.write("YZMERR");//验证码不正确
				}
			} else {
				out.write("NAMERR"); // 登录失败，返回用户名或密码错误
			}
			return;
		} catch (Exception e) {
			e.printStackTrace();
			out.write("SYSERR"); // 登录失败，返回系统错误
			return;
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				lc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	protected void other(ServletObject so) {
		String fwd=so.getActForward();
		if(fwd.equals("outlogin"))
		{
			so.getSession().removeAttribute("user");
			so.setActForward("out");
		}
		else if(fwd.equals("uppw"))
		{    
			String sql="";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String newps=so.httpServletRequest.getParameter("newps");
			String oldps=so.httpServletRequest.getParameter("oldps");
			String jfuserrid=so.httpServletRequest.getParameter("jfuserrid");
			LoginConnection lc = new LoginConnection();
			sql = "SELECT JFID FROM DSYS01 WHERE JFSTATE='1' AND JFUSERID=? AND JFPASSWORD=?";
			try {
			pstmt = lc.con.prepareStatement(sql);
			pstmt.setString(1, jfuserrid);
			pstmt.setString(2, md5.md5Password(oldps));
			rs = pstmt.executeQuery();
			rs.next();
			if(rs.getRow()==1)
			{
				String jfid=rs.getString(1);
				sql="update DSYS01 set JFPASSWORD='"+md5.md5Password(newps)+"' where jfid='"+jfid+"'";
				QueryConnection qc = new QueryConnection();
			    Statement  stmt = qc.con.createStatement();
			    if(stmt.executeUpdate(sql)>=1)
			    {
			    	qc.con.commit();
			    }
			    so.httpServletResponse.getWriter().print("SUCCESS");
			}
			else
			{
				so.httpServletResponse.getWriter().print("NO");
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

}
