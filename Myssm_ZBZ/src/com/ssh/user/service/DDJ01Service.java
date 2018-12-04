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

	// ----------------------------------------------------------------------------
	/**
	 * 手机接口查询类获取对应集合
	 */
	public List<DDJ01> PhoneSelectByPage(Map<String, Object> map);

	/**
	 * 获取手机集合对应的数量
	 */
	public int PhoneGetCount(Map<String, Object> map);

	/**
	 * 根据JFID 获取全部数据
	 */
	public DDJ01 SelectBYJFID(String JFID);

	// ----------------------------------------------------------------------------
	/**
	 * 带分页查询全部集合
	 * @param map
	 * @return
	 */
	public List<DDJ01> SelectAll_ZBZ(Map<String, Object> map);
	/**
	 * 获取全部数据的数量
	 * @param map
	 * @return
	 */
	public int getCount(Map<String, Object> map);
	/**
	 * 获取专访组织的下一个ID
	 * @return
	 */
	public String getJFID();
	/**
	 * 插入一条信息
	 * @param dDJ01
	 */
	public void insertInfo(DDJ01 dDJ01);
	/**
	 * 修改管理员的密码
	 * @param JFUSERID
	 * @param JFPASSWORD
	 */
	public void updatePassword(String JFUSERID,String JFPASSWORD);
	/**
	 * 根据ID删除对应的专访组织
	 * @param JFID
	 */
	public void deleteZFZZ(String JFID);
	/**
	 * 获取对应专访组织集合
	 */
	public List<DDJ01> SelectAllZFZZ(Map<String,Object> map);
	/**
	 * 更新dsys01_zfzz
	 */
	public void upzfzz(String JFID,String JFUSERID);
	/**
	 * 获取已退出的集合
	 * @param map
	 * @return
	 */
	public List<DDJ01> SelectByZT(Map<String,Object> map);
	/**
	 * 获取退出集合数量
	 * @param map
	 * @return
	 */
	public int getCountByZT(Map<String,Object> map);
}
