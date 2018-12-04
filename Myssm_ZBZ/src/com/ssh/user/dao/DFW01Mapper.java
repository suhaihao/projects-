package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW01;
import com.ssh.user.model.FWTJ;

public interface DFW01Mapper {
	/**
	 * 根据专访组织查询获取对应集合带分页信息
	 */
	public List<DFW01> selectByPage(Map<String, Object> map);
	/**
	 * 获取集合总数
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * 插入一条数据
	 */
	public void inDFW01(DFW01 dFW01);
	/**
	 * 获取唯一id
	 */
	public String getID();
	/**
	 * 根据id查询对应信息
	 */
	public DFW01 SelectByID(String JFID);
	/**
	 * 更新主表数据
	 */
	public void updfw01(DFW01 dFW01);
	/**
	 * 更新金钱
	 */
	public void UPJE(DFW01 dFW01);
	/**
	 * 提交调用过程
	 */
	public String p_gd_pd(Map<String, Object> map);
	/**
	 * 删除主表信息根据ID
	 */
	public void delByID(String JFID);
//----------------------------------------------------------------------------
	/**
	 * 根据专访组织查询获取对应集合带分页信息ZT不是派单的
	 */
	public List<DFW01> selectByPageZT(Map<String, Object> map);
	/**
	 * 获取集合总数ZT
	 */
	public int getCountZT(Map<String,Object> map);
	/**
	 * 派单主表完成调用过程
	 * @param map
	 * @return
	 */
	public String P_gd_wg(Map<String,Object> map);
//----------------------------------------------------------------------------
	/**
	 * 根据专访组织查询获取对应集合带分页信息ZT不是派单的
	 */
	public List<DFW01> selectByPageZT4(Map<String, Object> map);
	/**
	 * 获取集合总数ZT
	 */
	public int getCountZT4(Map<String,Object> map);
//----------------------------------------------------------------------------
	/**
	 * 查询zt=2的集合
	 */
	public List<DFW01> SelectByZt();
	/**
	 * 调用过程
	 */
	public String p_gddk_begin(Map<String, Object> map);
//----------------------------------------------------------------------------
	/**
	 * 统计服务
	 */
	public List<FWTJ> TJSJ(Map<String, Object> map);
	/**
	 * 统计服务
	 */
	public FWTJ TJSJHJ(Map<String, Object> map);
	/**
	 * 统计点击
	 * @param map
	 * @return
	 */
	public List<DFW01> TJSJclick(Map<String,Object> map);
	/**
	 * 获取点击统计的数量
	 * @param map
	 * @return
	 */
	public int getcounTJSJclick(Map<String, Object> map);
//--------------------------------------------------------------------------
	/**
	 * 根据ID获取唯一服务数据
	 * @param jfid
	 * @return
	 */
	public DFW01 SelectByJFID(Map<String, Object> map);
	/**
	 * 根据传入的日期和用户id获取对应集合
	 * @param wcrq
	 * @param yhid
	 * @return
	 */
	public List<DFW01> SelectByRqYh(String wcrq, String yhid);
}
