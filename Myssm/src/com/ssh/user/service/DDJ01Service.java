package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ01_D;
import com.ssh.user.util.Page;

public interface DDJ01Service {
	/**
	 * 根据用户的ddj01——jfid查询对应专访组织获取集合
	 */
	public List<DDJ01> selectByUserid(Page page, String ddj01id);

	/**
	 * 获取对应当前用户的集合的数量
	 */
	public int getSizeByUser(String jfid);

	/**
	 * 根据用户id获取对应的信息
	 */
	public List<DDJ01> SelectByDD01ID(String ddj01id);

	/**
	 * 更新对应数据
	 */
	public void updd01Byid(DDJ01 dDJ01);

	/**
	 * 插入从表数据
	 */
	public void insdd_d(DDJ01_D dDJ01_D);

	/**
	 * 获取对应服务服务集合
	 */
	public List<DDJ01_D> SelectByDDID(String dd01jfid);

	/**
	 * 根据dd01_jfid删除全部服务
	 */
	public void delAllfw(String dd01jfid);

	/**
	 * 根据id获取唯一返回值
	 */
	public DDJ01 SelectByID(String ddj01id);
	/**
	 * 获取全部集合
	 */
	public List<DDJ01> SelectAlllSize();
//----------------------------------------------------------------------------
	/**
	 * 手机接口查询类获取对应集合
	 */
	public List<DDJ01> PhoneSelectByPage(Map<String,Object> map);
	/**
	 * 获取手机集合对应的数量
	 */
	public int PhoneGetCount(Map<String,Object> map);
	/**
	 * 根据JFID 获取全部数据
	 */
	public DDJ01 SelectBYJFID(String JFID);
	/**
	 * 获取对应集合的数量
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * 获取对应专访组织集合
	 */
	public List<DDJ01> SelectAllZFZZ(Map<String,Object> map);
}
