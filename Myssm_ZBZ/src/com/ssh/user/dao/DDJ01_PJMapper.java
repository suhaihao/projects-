package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ01_PJ;

public interface DDJ01_PJMapper {
	/**
	 * 根据查询条件获取对应集合的数量
	 * @param map
	 * @return
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * 根据专访组织查询对应集合
	 * @param map
	 * @return
	 */
	public List<DDJ01_PJ> SelectByDDJ01_JFID(Map<String,Object> map);
	/**
	 * 插入一条评级数据
	 * @param dDJ01_PJ
	 */
	public void insert(DDJ01_PJ dDJ01_PJ);
	/**
	 * 获取对应JFID
	 * @return
	 */
	public String getJFID();
	/**
	 * 根据ID获取唯一数据
	 * @param JFID
	 * @return
	 */
	public DDJ01_PJ SelectById(String JFID);
	/**
	 * 根据ID更新数据
	 * @param dDJ01_PJ
	 */
	public void update(DDJ01_PJ dDJ01_PJ);
	/**
	 * 根据ID删除数据
	 * @param JFID
	 */
	public void delete(String JFID);
}
