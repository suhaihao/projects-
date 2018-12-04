package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.DFW01_D;
import com.ssh.user.model.DFW01_D_ZP;

public interface DFW01_D_ZPMapper {
	/**
	 * 获取对应地块照片集合
	 */
	public List<DFW01_D_ZP> SelectByDK(String DFW01_D_JFID);
	/**
	 * 根据JFID删除对应照片
	 */
	public void delZP(String JFID);
	/**
	 * 根据父类ID删除全部数据
	 * @param DFW01_D_JFID
	 */
	public void deleteByDFW01_D_JFID(String DFW01_D_JFID);
	/**
	 * 插入一条数据
	 * @param dFW01_D_ZP
	 */
	public void insert(DFW01_D_ZP dFW01_D_ZP);
}
