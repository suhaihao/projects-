package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.Tree_bj;
import com.ssh.user.model.Tree_hb;
import com.ssh.user.model.Tree_tj;

public interface TreeMapper {
	/**
	 * 获取北京的相关集合
	 */
	public List<Tree_bj> seleByBJAllList();
	/**
	 * 获取天津相关集合
	 * 
	 */
	public List<Tree_tj> seleByTJAllList();
	/**
	 * 获取河北相关集合
	 * 
	 */
	public List<Tree_hb> seleByHBAllList();
}
