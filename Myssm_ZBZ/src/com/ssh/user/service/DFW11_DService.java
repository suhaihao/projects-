package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.DFW11_D;

public interface DFW11_DService {
	/**
	 * 根据主表DFW11_JFID获取对应数据集合
	 */
	public List<DFW11_D> SelectByFatherID(String DFW11_JFID);
	/**
	 * 插入一条数据
	 */
	public void insert(DFW11_D dFW11_D);
	/**
	 * 根据上级ID删除对应数据
	 * @param DFW11_JFID
	 */
	public void delete(String DFW11_JFID);
	/**
	 * 根据ID删除一条数据
	 * @param JFID
	 */
	public void deleteByJFID(String JFID);
}
