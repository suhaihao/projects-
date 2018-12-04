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
	public List<Integer> SelectByBm(String bm);
	/**
	 * 插入角色
	 */
	public void insertJS(Dsys03 dsys03);
	/**
	 * 根据ID查询对应信息
	 * @param JFID
	 * @return
	 */
	public Dsys03 SelectByJfid(int JFID);
	/**
	 * 更新信息
	 * @param dsys03
	 */
	public void upInfo(Dsys03 dsys03);
}
