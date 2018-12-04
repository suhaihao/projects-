package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW01_D;

public interface DFW01_DService {
	/**
	 * 插入一条信息
	 */
	public void insAdd(DFW01_D dFW01_D);
	/**
	 * 根据DFW01_JFID查询出对应集合
	 */
	public List<DFW01_D> SelectByID(String DFW01_JFID);
	/**
	 * 根据JFID获取唯一数据
	 */
	public List<DFW01_D> SelectByJFID(String JFID);
	/**
	 * 根据DFW01_JFID删除数据
	 */
	public void DelBYFW01ID(String DFW01_JFID);
	/**
	 * 更新数据地块信息
	 */
	public void upDkxx(DFW01_D dFW01_D);
	/**
	 * 删除对应地块根据JFID
	 */
	public void delDK(String JFID);
	/**
	 * 完成地块调过程
	 */
    public String p_gddk_wg(Map<String,Object> map);
    /**
     * 作废地块过程
     */
    public String P_gddk_zf(Map<String,Object> map);
    /**
     * 根据地块ID获取对应集合
     */
    public List<DFW01_D> SelectByDDJ02_D_JFID(Map<String,Object> map);
    /**
     * 查找地块的全部集合
     */
    public List<DFW01_D> SelectAllList(Map<String,Object> map);
    /**
     * 获取对应集合数量
     */
    public int getCount(Map<String,Object> map);
//----------------------------------------------------------------------------
    /**
     * 手机接口
     */
    public List<DFW01_D> SelectByYHList(Map<String,Object> map);
    /**
     * 对应数量
     */
    public int getCountByYHSize(Map<String,Object> map);
}
