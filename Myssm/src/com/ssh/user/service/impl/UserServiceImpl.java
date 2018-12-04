package com.ssh.user.service.impl;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.UserMapper;
import com.ssh.user.model.User;
import com.ssh.user.service.UserService;
import com.ssh.user.util.Page;


/**
 *  用户管理类 
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;

	@Override
	public User SelectByName(String name) {
		return userMapper.SelectByName(name);
	}

	@Override
	public List<User> SelectAllUser(Page page,String DDJ01_JFID) {
		synchronized (this) {
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("max",page.getMax());
			map.put("min",page.getMin());
			map.put("DDJ01_JFID",DDJ01_JFID);
		return userMapper.SelectAllUser(map);
		}
	}

	@Override
	@Transactional
	public void addUser(User user) {
		userMapper.addUser(user);
	}

	@Override
	public User SelectById(String id) {
		return userMapper.SelectById(id);
	}

	@Override
	@Transactional
	public void UpUser(User user) {
		userMapper.UpUser(user);
	}

	@Override
	@Transactional
	public void delUser(String id) {
		userMapper.delUser(id);
	}

	@Override
	public int getAllUserSize(String DDJ01_JFID) {
		return userMapper.getAllUserSize(DDJ01_JFID);
	}

	@Override
	@Transactional
	public void uppasword(User user) {
		userMapper.uppasword(user);
	}

	@Override
	public List<User> SelectByName(Page page, String name,String DDJ01_JFID) {
		synchronized (this) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("max",page.getMax());
		map.put("min",page.getMin());
		map.put("name","%"+name+"%");
		map.put("DDJ01_JFID",DDJ01_JFID);
		return userMapper.SelectByNameAll(map);
		}
	}

	@Override
	public int getAllUserSizeByTJ(String JFNAME,String DDJ01_JFID) {
		return userMapper.getAllUserSizeByTj(JFNAME,DDJ01_JFID);
	}

	@Override
	public List<User> SelectAllList(Map<String, Object> map) {
		return userMapper.SelectAllList(map);
	}

	@Override
	public int getCountAllSize(Map<String, Object> map) {
		return userMapper.getCountAllSize(map);
	}

	@Override
	public User SelectByZFZZ(String DDJ01_JFID) {
		return userMapper.SelectByZFZZ(DDJ01_JFID);
	}

	@Override
	public List<User> SelectByLBZZ(Map<String, Object> map) {
		return userMapper.SelectByLBZZ(map);
	}

	@Override
	public int getCountByzz(Map<String, Object> map) {
		return userMapper.getCountByzz(map);
	}

	@Override
	public String SelectByQx(Map<String,String> map) {
		return userMapper.SelectByQx(map);
	}

	@Override
	public void UpUserphone(User user) {
		userMapper.UpUserphone(user);
	}

	
	

}
