package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.Dsys03;

public interface Dsys03Mapper {
	/**
	 * 获得全部集合
	 */
	public List<Dsys03> SelectAllList();
	/**
	 * 
	 */
	public int SelectByBm(String bm);
}
