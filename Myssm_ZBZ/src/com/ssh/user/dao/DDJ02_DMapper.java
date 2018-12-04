package com.ssh.user.dao;


import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ02_D;

public interface DDJ02_DMapper {
	/**
	 * 插入条地块信息
	 */
	public void insedk(DDJ02_D dDJ02_D);
	/**
	 * 根据ddj02_jfid查询出相关集合
	 */
	public List<DDJ02_D> selectByddj02_jfid(String ddj02_jfid);
	/**
	 * 根据id获取需要更新的信息
	 */
	public DDJ02_D SelectByID(String id);
	/**
	 * 更新地块信息记录
	 */
	public void updkxx(DDJ02_D dDJ02_D);
	/**
	 * 根据id 删除一条数据
	 */
	public void delById(String id);
	/**
	 * 获取对应农户下面的地块集合带分页
	 */
	public List<DDJ02_D> SelectBYDDJ02_JFIDPage(Map<String,Object> map);
	/**
	 * 获取对应农户下地块集合的数量
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * 获取对应组织下的
	 * @param DDJ01_JFID
	 * @return
	 */
	public List<DDJ02_D> SelectAllNhDk(Map<String,Object> map);
	/**
	 * 获取对应组织下农户地块数量
	 * @param map
	 * @return
	 */
	public int GetAllNhDkCount(Map<String,Object> map);
}
