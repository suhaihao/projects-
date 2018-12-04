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
	 * 根据用户名查询用户ZFZZ表里的
	 */
	public User SelectByName_zfzz(String name);
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
	 * 根据id查找用户zfzz
	 */
	public User SelectByIdZFZZ(String id);
	/**
	 * 更新用户信息
	 */
	public void UpUser(User user);
	/**
	 * 根据ID删除用户
	 */
	public void delUser(String id);
	/**
	 * 获取用户的全部集合数量
	 */
	public int getAllUserSize();
	/**
	 * 获取集合数量根据条件
	 */
	public int getAllUserSizeByTj(String JFNAME);
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
	public String SelectByQx(int JFID);
	/**
	 * 插入组织插入一条专访组织信息
	 * @param user
	 */
	public void insertZFZZ(User user);
	/**
	 * 根据专访组织ID删除用户
	 * @param DDJ01_JFID
	 */
	public void deleteByZFZZ(String DDJ01_JFID);
	/**
	 * 根据专防组织ID查询人员为99的
	 * @param DDJ01_JFID
	 * @return
	 */
	public  User SelectByZFZZBy99(String DDJ01_JFID);
}
 
