package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW21;
import com.ssh.user.model.DFW22;
import com.ssh.user.model.DFW22_CKWJ;
import com.ssh.user.model.DFW22_FJ;
import com.ssh.user.model.DFW22_JSR;

public interface DFW22Service {
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
	public List<DFW22> SelectAll(Map<String,Object> map);
	/**
	 * 没有分页
	 * @param map
	 * @return
	 */
	public List<DFW22> SelectAllCX(String DDJ01_JFID);
	/**
	 * 获取最新ID
	 * @return
	 */
	public String getJFID();
	/**
	 * 插入一条数据
	 * @param dFW22
	 */
	public void insert(DFW22 dFW22);
	/**
	 * 根据ID获取唯一数据
	 * @param JFID
	 * @return
	 */
	public DFW22 SelectByID(String JFID);
	/**
	 * 更新数据
	 * @param dFW22
	 */
	public void update(DFW22 dFW22);
	/**
	 * 根据ID获取唯一数据
	 * @param JFID
	 * @return
	 */
	public void del(String JFID);
//-----------------------------------------------------------------
	/**
	 * 插入接收人
	 * @param dFW22_JSR
	 */
	public void insert_jsr(DFW22_JSR dFW22_JSR);
	/**
	 * 根据父表ID查询集合
	 */
	public List<DFW22_JSR> SelectByDFW22_JFID_JSR(Map<String,Object> map);
	/**
	 * 根据父类ID删除数据
	 * @param DFW22_JFID
	 */
	public void del_jsr_f(String DFW22_JFID);
	/**
	 * 更新为已读
	 * @param dFW22_JSR
	 */
	public void upjsr(DFW22_JSR dFW22_JSR);
//-----------------------------------------------------------------
	/**
	 * 插入附件
	 * @param dFW22_FJ
	 */
	public void insert_fj(DFW22_FJ dFW22_FJ);
	/**
	 * 根据父表ID查询集合
	 */
	public List<DFW22_FJ> SelectByDFW22_JFID_FJ(Map<String,Object> map);
	/**
	 * 附件根据ID删除一条数据
	 * @param JFID
	 */
	public void del_fj(String JFID);
	/**
	 * 根据父类ID删除数据
	 * @param DFW22_JFID
	 */
	public void del_fj_f(String DFW22_JFID);
//----------------------------------------------------------------------
	/**
	 * 插入参考文件
	 * @param dFW22_FJ
	 */
	public void insert_ckwj(DFW22_CKWJ dFW22_CKWJ);
	/**
	 * 根据父表ID查询集合
	 */
	public List<DFW22_CKWJ> SelectByDFW22_JFID_CKWJ(Map<String,Object> map);
	/**
	 * 根据父类ID删除数据
	 * @param DFW22_JFID
	 */
	public void del_ckwj_f(String DFW22_JFID);
}
