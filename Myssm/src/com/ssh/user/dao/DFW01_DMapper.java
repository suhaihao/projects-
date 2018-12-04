package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW01_D;

public interface DFW01_DMapper {
	/**
	 * 插入一条数据
	 */
	public void insAdd(DFW01_D dFW01_D);
	/**
	 * 根据DFW01_JFID获取对应集合
	 */
	public List<DFW01_D> SelectByID(String DFW01_JFID);
	/**
	 * 根据ID获取唯一集合
	 */
	public List<DFW01_D> SelectByJFID(String JFID);
	/**
	 * 根据DFW01_JFID
	 */
	public void delByDFW01ID(String DFW01_JFID);
	/**
	 * 更新地块信息
	 */
	public void upDKXX(DFW01_D dFW01_D);
	/**
	 * 根据ID删除一条数据
	 */
	public void delDK(String JFID);
	/**
	 * 地块完工调用过程
	 */
	public String p_gddk_wg(Map<String,Object> map);
	/**
	 * 作废地块
	 */
	public String P_gddk_zf(Map<String,Object> map);
	/**
	 * 根据地块ID获取对应数据
	 */
	public List<DFW01_D> SelectByDDJ02_D_JFID(Map<String,Object> map);
	/**
     * 根据地块ID状态为4获取集合
     */
    public List<DFW01_D> SelectByDDJ02_D_JFIDZT(Map<String,Object> map);
	/**
	 * 查找对应地块的集合防治集合
	 */
	public List<DFW01_D> SelectAllList(Map<String, Object> map);
	/**
     * 获取对应集合数量
     */
    public int getCount(Map<String,Object> map);
    /**
     * 查找状态为2的
     */
    public List<DFW01_D> SelectByZT2();
//----------------------------------------------------------------------------\
    /**
     * 手机接口地块查询
     * @param map
     * @return
     */
    public List<DFW01_D> SelectByYHList(Map<String, Object> map);
    /**
     * 获得全部的用户地块数量
     * @param map
     * @return
     */
    public int getCountByYHSize(Map<String, Object> map);
}
