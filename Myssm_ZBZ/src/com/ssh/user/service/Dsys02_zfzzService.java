package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.Dsys02_zfzz;

public interface Dsys02_zfzzService {
	/**
	 * 查询全部菜单
	 */
	public List<Dsys02_zfzz> SelectByBmMenu(int Dsys03id);
	/**
	 * 角色权限获取对应菜单
	 */
	public List<Dsys02_zfzz> SelectAllQXMenu();
	/**
	 * 获取全部的菜单
	 */
	public List<Dsys02_zfzz> SelectAllMenu();
	
}
