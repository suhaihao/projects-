package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.User;
import com.ssh.user.util.Page;



/**
 * userDAO
 * @author 
 * @date   
 */
public interface UserMapper {
	/**
	 * 根据姓名查找用户
	 */
	public User SelectByName(String name);
	/**
	 * 获得全部用户
	 */
	public List<User> SelectAllUser(Map<String,Object> map);
	/**
	 * 添加用户
	 */
	public void addUser(User user);
	/**
	 * 根据ID查找用户信息
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
	 * 获取集合数量根据条件
	 */
	public int getAllUserSizeByTj(String JFNAME,String DDJ01_JFID);
	/**
	 * 更新用户信息
	 */
	public void uppasword(User user);
	/**
	 * 根据名字获取用户集合
	 */
	public List<User> SelectByNameAll(Map<String,Object> map);
	/**
	 * 获取对应集合传入一个map
	 */
	public List<User> SelectAllList(Map<String,Object> map);
	/**
	 * 获取集合的数量传入一个map
	 * @param map
	 * @return
	 */
	public int getCountAllSize(Map<String,Object> map);
	/**
	 * 夜晚更新查询数据
	 */
	public User SelectByZFZZ(String DDJ01_JFID);
//--------------------------------------------------------------------------
	/**
	 * 手机端根据类别专访组织获取对应集合
	 * @param map
	 * @return
	 */
	public List<User> SelectByLBZZ(Map<String, Object> map);
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
 
