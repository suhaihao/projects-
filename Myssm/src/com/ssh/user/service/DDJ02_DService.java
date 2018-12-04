package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ02_D;

public interface DDJ02_DService {
	/**
	 * 插入一条地块信息
	 */
	public void insDDXX(DDJ02_D dDJ02_D);
	/**
	 * 根据ddj02——jfid获取地块的集合
	 */
	public List<DDJ02_D> SelectByDDJ02_JFID(String ddj02_jfid);
	/**
	 * 根据id获取唯一信息
	 */
	public DDJ02_D SelectById(String id);
	/**
	 * 更新地块信息
	 */
	public void uodkxx(DDJ02_D dDJ02_D);
	/**
	 * 根据id删除一条信息
	 */
	public void delddj02_d(String id);
	/**
	 * 根据DDJ02_JFID获取对应农户下面的地块带分页
	 */
	public List<DDJ02_D> SelectBYDDJ02_JFIDPage(Map<String,Object> map);
	/**
	 * 获取对应农户下集合的数量
	 */
	public int getcount(Map<String,Object> map);
	/**
	 * 查询对应专访组织下所有农户的地块
	 */
	public List<DDJ02_D> SelectAllNhDk(Map<String,Object> map);
	/**
	 * 获取组织下农户地块的数量
	 * @param map
	 * @return
	 */
	public int GetAllNhDkCount(Map<String,Object> map);
}
