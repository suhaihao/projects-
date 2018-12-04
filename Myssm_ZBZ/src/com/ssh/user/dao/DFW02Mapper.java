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
	/**
	 * 获取 时间  组织 用户 内的评论
	 */
	public List<DFW02> SelectByTimeDddj01Dddj02(Map<String,Object> map);
	/**
	 * 获取 时间 组织 用户 条件下的集合
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * 服务效果统计查询1
	 */
	public List<DFW02> SelectFWXGTJ1(Map<String,String> map);
	/**
	 * 服务效果统计查询2
	 */
	public List<DFW02> SelectFWXGTJ2(Map<String,String> map);
	/**
	 * 服务效果统计查询3
	 */
	public List<DFW02> SelectFWXGTJ3(Map<String,String> map);
	/**
	 * 服务效果统计合计
	 */
	public DFW02 SelectFWXGTJHJ(Map<String,String> map);
}
