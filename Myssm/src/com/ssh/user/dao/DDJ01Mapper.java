package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ01_D;

public interface DDJ01Mapper {
	/**
	 * 根据用户的ddj01_jfid获取对应的全部集合
	 */
	public List<DDJ01> SelectByUserId(Map<String, Object> map);

	/**
	 * 获取用户对应的数据集合
	 */
	public int getALLByuser(String jfid);

	/**
	 * 获取用户相关的专访组织
	 */
	public List<DDJ01> selectByDDJ01id(String ddj01id);

	/**
	 * 更新对应数据
	 */
	public void upByID(DDJ01 dDJ01);

	/**
	 * 插入从表
	 */
	public void ins_d(DDJ01_D dDJ01_D);

	/**
	 * 获取对应服务集合
	 */
	public List<DDJ01_D> selectBydd01id(String ddj01id);

	/**
	 * 根据传入ddj01id 删除 全部服务
	 */
	public void delAllfw(String ddj01id);

	/**
	 * 根据id获取唯一数据
	 */
	public DDJ01 SelectByID(String ddj01id);
	/**
	 * 获取全部集合
	 */
	public List<DDJ01> SelectAlllSize();
//--------------------------------------------------------------------------
	/**
	 * 手机接口找服务
	 */
	public List<DDJ01> PhoneSelectByPage(Map<String, Object> map);
	/**
	 * 获取对应手机接口集合的数量
	 */
	public int PhoneGetCount(Map<String, Object> map);
	/**
	 * 根据JFID获取对应数据
	 */
	public DDJ01 SelectBYJFID(String JFID);
	/**
	 * 获取对应的集合数量
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * 获取对应专访组织集合分页
	 */
	public List<DDJ01> SelectAllZFZZ(Map<String,Object> map);
}
