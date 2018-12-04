package com.ssh.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.TreeMapper;
import com.ssh.user.model.Tree_bj;
import com.ssh.user.model.Tree_hb;
import com.ssh.user.model.Tree_tj;
import com.ssh.user.service.TreeService;

@Service("treeService")
public class TreeServiceImpl implements TreeService {
	@Autowired
	private TreeMapper treeMapper;
	/**
	 * 获取北京相关集合
	 */
	public List<Tree_bj> seleByBJAllList() {
		return treeMapper.seleByBJAllList();
	}
	@Override
	public List<Tree_tj> seleByTJAllList() {
		return treeMapper.seleByTJAllList();
	}
	@Override
	public List<Tree_hb> seleByHBAllList() {
		return treeMapper.seleByHBAllList();
	}
}
