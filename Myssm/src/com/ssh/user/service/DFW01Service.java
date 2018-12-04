package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW01;
import com.ssh.user.model.DFW01_D_FZMX;
import com.ssh.user.model.FWTJ;

public interface DFW01Service {
	/**
	 * 根据根据专访组织获取对应集合带分页
	 */
	public List<DFW01> SelectByPage(Map<String, Object> map);
	/**
	 * 获取对应组织下的集合数量
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * 插入一条数据
	 */
	public void inDFW01(DFW01 dFW01);
	/**
	 * 查询唯一ID
	 */
	public String getID();
	/**
	 * 根据ID查询对应数据
	 */
	public DFW01 SelectByID(String JFID);
	/**
	 * 更新主表数据
	 */
	public void updfw01(DFW01 dFW01);
	/**
	 * 更新金额
	 */
	public void UPJE(DFW01 dFW01);
	/**
	 * 提交调用过程
	 */
	public String p_gd_pd(Map<String,Object> map);
	/**
	 * 根据JFID删除数据
	 */
	public void delzb(String JFID);
//-----------------------------------------------------------------------------
	/**
	 * 根据根据专访组织获取对应集合带分页ZT不是派单的
	 */
	public List<DFW01> SelectByPageZT(Map<String, Object> map);
	/**
	 * 获取对应组织下的集合数量ZT
	 */
	public int getCountZT(Map<String,Object> map);
	/**
	 * 派单主表完成调用过程
	 * @param map
	 * @return
	 */
	public String P_gd_wg(Map<String,Object> map);
//------------------------------------------------------
	/**
	 * 根据根据专访组织获取对应集合带分页
	 */
	public List<DFW01> SelectByPageZT4(Map<String, Object> map);
	/**
	 * 获取对应组织下的集合数量ZT
	 */
	public int getCountZT4(Map<String,Object> map);
//----------------------------------------------------------
	/**
	 * 凌晨12点执行的方法
	 */
	public  List<DFW01> SelectByZt2();
	/**
	 * 调用过程
	 */
	public String p_gddk_begin(Map<String,Object> map);
//--------------------------------------------------------------------
	/**
	 * 统计数据
	 */
	public List<FWTJ> TJSJ(Map<String,Object> map);
	/**
	 * 合计
	 */
	public FWTJ TJSJHJ(Map<String,Object> map);
	/**
	 * 统计服务点击统计查询
	 */
	public List<DFW01> TJSJclick(Map<String,Object> map);
	/**
	 * 获取集合数量
	 * @param map
	 * @return
	 */
	public int getcounTJSJclick(Map<String,Object> map);
//--------------------------------------------------------------------------
	/**
	 * 手机端根据id获取唯一服务数据
	 * @param jfid
	 * @return
	 */
	public DFW01 SelectByJFID(Map<String, Object> map);
	/**
	 * 根据完成日期 和用户ID获取对应集合
	 * @param wcrq
	 * @param yhid
	 * @return
	 */
	public List<DFW01> SelectByRqYh(String wcrq,String yhid);
	/**
	 * 手机获取状态为2的
	 */
	public List<DFW01> SelectBy_ZT_DDJ01_JFID(Map<String,Object> map);
	/**
	 * 获取状态为2对应组织下的集合数量
	 * @param map
	 * @return
	 */
	public int getBy_ZT_DDJ01_JFIDCount(Map<String,Object> map);
	/**
	 * 查询措施详情表统计
	 * @param DFW01_JFID
	 * @return
	 */
	public List<DFW01_D_FZMX> SelectDFW01_D_FZMX(String DFW01_JFID);
}
