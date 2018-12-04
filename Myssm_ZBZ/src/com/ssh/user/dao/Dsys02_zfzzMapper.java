package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.Dsys02_zfzz;

/**
 * 表单的处理接口
 */
public interface Dsys02_zfzzMapper {
	/**
	 * 查询全部表单信息
	 */
	public List<Dsys02_zfzz> SelectByBmMenu(int Dsys03id);
	/**
	 * 角色权限获取菜单
	 */
	public List<Dsys02_zfzz> SelectAllByQXMenu();
	/**
	 *  获取全部菜单
	 */
	public List<Dsys02_zfzz> SelectAllMenu();
}
 
