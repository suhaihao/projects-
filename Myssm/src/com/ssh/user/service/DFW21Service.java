package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW21;
import com.ssh.user.model.DFW21_FJ;
import com.ssh.user.model.DFW21_JSR;

public interface DFW21Service {
	/**
	 * 根据条件获取对应集合数量
	 * @return
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * 根据条件获取全部集合数量
	 * @param map
	 * @return
	 */
	public List<DFW21> SelectAll(Map<String,Object> map);
	/**
	 * 没有分页
	 * @param map
	 * @return
	 */
	public List<DFW21> SelectAllCX(String DDJ01_JFID);
	/**
	 * 获取最新ID
	 * @return
	 */
	public String getJFID();
	/**
	 * 插入一条数据
	 * @param dFW21
	 */
	public void insert(DFW21 dFW21);
	/**
	 * 根据ID获取唯一数据
	 * @param JFID
	 * @return
	 */
	public DFW21 SelectByID(String JFID);
	/**
	 * 更新数据
	 * @param dFW21
	 */
	public void update(DFW21 dFW21);
	/**
	 * 根据ID获取唯一数据
	 * @param JFID
	 * @return
	 */
	public void del(String JFID);
//-----------------------------------------------------------------
	/**
	 * 插入接收人
	 * @param dFW21_JSR
	 */
	public void insert_jsr(DFW21_JSR dFW21_JSR);
	/**
	 * 根据父表ID查询集合
	 */
	public List<DFW21_JSR> SelectByDFW21_JFID_JSR(Map<String,Object> map);
	/**
	 * 根据父类ID删除数据
	 * @param DFW21_JFID
	 */
	public void del_jsr_f(String DFW21_JFID);
	/**
	 * 更新为已读
	 * @param dFW21_JSR
	 */
	public void upjsr(DFW21_JSR dFW21_JSR);
//-----------------------------------------------------------------
	/**
	 * 插入附件
	 * @param dFW21_FJ
	 */
	public void insert_fj(DFW21_FJ dFW21_FJ);
	/**
	 * 根据父表ID查询集合
	 */
	public List<DFW21_FJ> SelectByDFW21_JFID_FJ(Map<String,Object> map);
	/**
	 * 附件根据ID删除一条数据
	 * @param JFID
	 */
	public void del_fj(String JFID);
	/**
	 * 根据父类ID删除数据
	 * @param DFW21_JFID
	 */
	public void del_fj_f(String DFW21_JFID);
}
