package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ02;

public interface DDJ02Service {
	/**
	 * 带分页查询对应的专访组织下的农户
	 */
	public List<DDJ02> selectByZzPage(Map<String, Object> map);

	/**
	 * 获取对应专访组织下农户的数量
	 */
	public int getCount();

	/**
	 * 获取对应专访组织下农户的数量根据条件
	 */
	public int getCountByTj(String MC);

	/**
	 * 查询对应专访组织下有没有这个农户
	 */
	public DDJ02 selectbyZZ(String ddj01_jfid, String yhm);

	/**
	 * 查询农户的是否存在不论哪个组织
	 */
	public List<DDJ02> selecByYHM(String yhm);

	/**
	 * 查询别的组织是否有这个农户
	 */
	public List<DDJ02> selectByBDZZ(String ddj01_jfid, String yhm);

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
	public List<DDJ02> SelectByID(String id);

	/**
	 * 更新农户信息
	 */
	public void upnhxx(DDJ02 dDJ02);

	/**
	 * 更新用户密码
	 */
	public void uppassword(DDJ02 dDJ02);

	/**
	 * 判断登陆账户密码是否正确
	 */
	public DDJ02 SelectByYHMOne(String YHM);

	/**
	 * 更新用户令白以及登陆时间
	 */
	public void upToken(DDJ02 dDJ02);
	/**
	 * 查询出全部用户集合
	 */
	public List<DDJ02> SelectAllSize(Map<String,Object> map);
	/**
	 * 获取相应集合数量
	 */
	public int GetCount(Map<String,Object> map);
	/**
	 * 无条件获取对应数据集合
	 */
	public List<DDJ02> SelectAll(Map<String,Object> map);
	/**
	 * 获取全部集合数量
	 */
	public int getCountSelectAll(Map<String,Object> map);
//------------------------------------------------------------------------
	/**
	 * 用户统计
	 */
	public List<DDJ02> SelectTJ(Map<String,Object> map);
	public List<DDJ02> SelectTJ2(Map<String,Object> map);
	public List<DDJ02> SelectTJ3(Map<String,Object> map);
	public List<DDJ02> SelectTJ4(Map<String,Object> map);
	/**
	 * 用户合计
	 */
	public DDJ02 SelectHj(Map<String,Object> map);
//--------------------------------------------------------------------------
	/**
	 * 手机选择用户发送信息
	 */
	public List<DDJ02> SelectAllSizeBySJ(Map<String,Object> map);
	/**
	 * 手机用户数量
	 */
	public int getCountBySJ();
}
