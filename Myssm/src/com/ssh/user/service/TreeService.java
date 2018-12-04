package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.Tree_bj;
import com.ssh.user.model.Tree_hb;
import com.ssh.user.model.Tree_tj;

public interface TreeService {
	/**
	* ��ȡ������ؼ���
	*/
	public List<Tree_bj> seleByBJAllList();
	/**
	 * ��ȡ����
	 */
	public List<Tree_tj> seleByTJAllList();
	/**
	 * ��ȡ�ӱ���ؼ���
	 */
	public List<Tree_hb> seleByHBAllList();
}
