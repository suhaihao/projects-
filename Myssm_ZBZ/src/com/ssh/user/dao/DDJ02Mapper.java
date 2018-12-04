package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ02;

public interface DDJ02Mapper {
	/**
	 * 带分页查询对应专访组织下的农户
	 */
	public List<DDJ02> SelectByZZPage(Map<String, Object> map);

	/**
	 * 获取对应专访组织下的农户的数量
	 */
	public int getCount();
	/**
	 * 获取对应专访组织下的农户的数量
	 */
	public int getCountByTj(String MC);
	/**
	 * 查询专访组织下面的农户是否存在
	 */
	public DDJ02 SelectByzz(String ddj01_jfid,String yhm);
	/**
	 * 查询YHM是否存在不论在哪个组织
	 */
	public List<DDJ02> selectByYHM(String yhm);
	/**
	 * 查看别的组织下是否有这个农户信息
	 */
	public List<DDJ02> SelectByBDZZ(String ddj01_jfid,String yhm);
	/**
	 * 插入一条数据
	 */
	public void insddj02(DDJ02 dDJ02);
	/**
	 * 获取唯一id
	 */
	public String getID();
	/**
	 * 根据id获取唯一数据
	 */
	public List<DDJ02> selectByID(String id);
	/**
	 * 更新信息界面
	 */
	public void upddj02(DDJ02 dDJ02);
	/**
	 * 更新密码信息
	 */
	public void uppasword(DDJ02 dDJ02);
	/**
	 * 判断用户名密码根据用户名查找
	 */
	public DDJ02 SelectByYHMOne(String YHM);
	/**
	 * 更新token以及登陆时间
	 */
	public void uoToken(DDJ02 dDJ02);
	/**
	 * 获取全部集合
	 */
	public List<DDJ02> SelectAllSize(Map<String, Object> map);
	/**
	 * 获取相应集合的数量
	 */
	public int GetCount(Map<String, Object> map);
	/**
	 * 无条件获取对应数据集合
	 */
	public List<DDJ02> SelectAll(Map<String,Object> map);
	/**
	 * 获取全部集合数量
	 */
	public int getCountSelectAll(Map<String,Object> map);
//----------------------------------------------------------------------------
	/**
	 * 查找查询统计的相关数据
	 * @param map
	 * @return
	 */
	public List<DDJ02> SelectTJ(Map<String,Object> map);
	public List<DDJ02> SelectTJ2(Map<String,Object> map);
	public List<DDJ02> SelectTJ3(Map<String,Object> map);
	public List<DDJ02> SelectTJ4(Map<String,Object> map);
	/**
	 * 合计数据
	 */
	public DDJ02 SelectHj(Map<String, Object> map);
	/**
	 * 手机选择用户发送信息
	 */
	public List<DDJ02> SelectAllSizeBySJ(Map<String,Object> map);
	/**
	 * 手机用户数量
	 */
	public int getCountBySJ();
}
