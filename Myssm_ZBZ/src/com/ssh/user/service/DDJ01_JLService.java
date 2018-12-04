package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ01_JL;
import com.ssh.user.model.DDJ01_PJ;

public interface DDJ01_JLService {
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
	public List<DDJ01_JL> SelectByDDJ01_JFID(Map<String,Object> map);
	/**
	 * 插入一条评级数据
	 * @param dDJ01_PJ
	 */
	public void insert(DDJ01_JL dDJ01_JL);
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
	public DDJ01_JL SelectById(String JFID);
	/**
	 * 根据ID更新数据
	 * @param dDJ01_PJ
	 */
	public void update(DDJ01_JL dDJ01_JL);
	/**
	 * 根据ID删除数据
	 * @param JFID
	 */
	public void delete(String JFID);
}
