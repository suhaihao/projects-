package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.User;
import com.ssh.user.util.Page;




/**
 * 用户管理
 * @author Ljh
 *
 */

public interface UserService {

	/**
	 * 根据用户名查询用户
	 */
	public User SelectByName(String name);
	/**
	 * 获取全部用户用户
	 */
	public List<User> SelectAllUser(Page page,String DDJ01_JFID);
	/**
	 * 插入用户
	 */
	public void addUser(User user);
	/**
	 * 根据id查找用户
	 */
	public User SelectById(String id);
	/**
	 * 更新用户信息
	 */
	public void UpUser(User user);
	/**
	 * 手机更新用户信息
	 */
	public void UpUserphone(User user);
	/**
	 * 根据ID删除用户
	 */
	public void delUser(String id);
	/**
	 * 获取用户的全部集合数量
	 */
	public int getAllUserSize(String DDJ01_JFID);
	/**
	 * 获取条件的集合数量
	 */
	public int getAllUserSizeByTJ(String JFNAME,String DDJ01_JFID);
	/**
	 * 修改用户密码
	 */
	public void uppasword(User user);
	/**
	 * 根据名字模糊查询带分页
	 */
	public List<User> SelectByName(Page page,String name,String DDJ01_JFID);
	/**
	 * 获取全部集合传入一个map
	 */
	public List<User> SelectAllList(Map<String,Object> map);
	/**
	 * 获取对应集合数量传入一个map
	 */
	public int getCountAllSize(Map<String,Object> map);
	/**
	 * 夜晚更新查询数据
	 */
	public User SelectByZFZZ(String DDJ01_JFID);
//---------------------------------------------------------------------------
	/**
	 * 根据专访组织和类别获取对应集合
	 */
	public List<User> SelectByLBZZ(Map<String,Object> map);
	/**
	 * 上方法对应集合数量
	 */
	public int getCountByzz(Map<String,Object> map);
//---------------------------------------------------------------------------
	/**
	 * 登陆权限判断
	 */
	public String SelectByQx(Map<String,String> map);
	
}
 
