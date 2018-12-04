package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW23;
import com.ssh.user.model.DFW23_FJ;

public interface DFW23Mapper {
	/**
	 * 根据条件获取对应集合数量
	 * 
	 * @return
	 */
	public int getCount(Map<String, Object> map);

	/**
	 * 根据条件获取全部集合数量
	 * 
	 * @param map
	 * @return
	 */
	public List<DFW23> SelectAll(Map<String, Object> map);
	/**
	 * 获取最新ID
	 * 
	 * @return
	 */
	public String getJFID();

	/**
	 * 插入一条数据
	 * 
	 * @param dFW23
	 */
	public void insert(DFW23 dFW23);

	/**
	 * 根据ID获取唯一数据
	 * 
	 * @param JFID
	 * @return
	 */
	public DFW23 SelectByID(String JFID);

	/**
	 * 更新数据
	 * 
	 * @param dFW23
	 */
	public void update(DFW23 dFW23);

	/**
	 * 根据ID获取唯一数据
	 * 
	 * @param JFID
	 * @return
	 */
	public void del(String JFID);

	// -----------------------------------------------------------------
	/**
	 * 插入附件
	 * 
	 * @param dFW23_FJ
	 */
	public void insert_fj(DFW23_FJ dFW23_FJ);

	/**
	 * 根据父表ID查询集合
	 */
	public List<DFW23_FJ> SelectByDFW23_JFID_FJ(Map<String, Object> map);

	/**
	 * 附件根据ID删除一条数据
	 * 
	 * @param JFID
	 */
	public void del_fj(String JFID);

	/**
	 * 根据父类ID删除数据
	 * 
	 * @param DFW23_JFID
	 */
	public void del_fj_f(String DFW23_JFID);
}
