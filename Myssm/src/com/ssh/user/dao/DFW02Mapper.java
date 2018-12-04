package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW02;

public interface DFW02Mapper {
	/**
	 * 查找需要提醒推送的集合
	 */
	public List<DFW02> SelectByTXRQList();
	/**
	 * 手机获取服务评价浏览数量
	 */
	public int getCountLL(Map<String,Object> map);
	/**
	 * 手机获取平价浏览集合
	 */
	public List<DFW02> SelectByLLList(Map<String,Object> map);
	/**
	 * 手机根据ID获取唯一数据
	 */
	public DFW02 SelectByJFID(String JFID);
	/**
	 * 手机评价提交接口
	 */
	public String p_gd_pj(Map<String,Object> map);
}
