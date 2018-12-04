package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ11;
import com.ssh.user.util.Page;

public interface DDJ11Service {
	/**
	 * 查询出来防治措施的分页全部集合
	 */
	public List<DDJ11> selectAlllist(Page page,String ddj01_jfid);

	/**
	 * 获取集合的总数
	 */
	public int getCount(String ddj01_jfid);
	/**
	 * 获取集合的总数
	 */
	public int getCountBYTJ(String ddj01_jfid,String MC,String FL);
	/**
	 * 插入一条数据
	 */
	public void inddj11(DDJ11 dDJ11);
	/**
	 * 获取唯一id
	 */
	public String getID();
	/**
	 * 根据id删除一条数据
	 */
	public void delddj11(String id);
	/**
	 * 根据条件查询获取集合
	 */
	public List<DDJ11> selectByFlandName(Page page,String mc,String fl,String ddj01_jfid);
	/**
	 * 根据名字获取一条数据
	 */
	public DDJ11 selectByMc(String MC,String ddj01_jfid);
	/**
	 * 根据id查找一条数据
	 */
	public List<DDJ11> selectByid(String id);
	/**
	 * 更新验证名字是否重复
	 */
	public DDJ11 selectByMcID(String id,String MC,String ddj01_jfid);
	/**
	 * 更新对应数据
	 */
	public void upsj(DDJ11 dDJ11);
	/**
	 * 取消更新字段
	 */
	public String qxup(DDJ11 dDJ11);
	/**
	 * 查找提交的集合
	 */
	public int getCountByZTTJ(String ddj01_jfid);
	/**
	 * 带条件查询提交个数
	 */
	public int getCountBYTJZT(String ddj01_jfid,String MC,String FL);
	/**
	 * 根据条件查询获取集合状态为提交的
	 */
	public List<DDJ11> selectByFlandNameBYZT(Page page,String mc,String fl,String ddj01_jfid);
	/**
	 * 不带条件查询状态为提交的集合
	 */
	public List<DDJ11> selectAlllistBYZT(Page page, String ddj01_jfid);
	/**
	 * 查找非农药提交的集合
	 */
	public int getCountByQTZTTJ(String ddj01_jfid);
	/**
	 * 非农药带条件查询提交个数
	 */
	public int getCountBYQTTJZT(String ddj01_jfid,String MC,String FL);
	/**
	 * 非农药根据条件查询获取集合状态为提交的
	 */
	public List<DDJ11> selectByQTFlandNameBYZT(Page page,String mc,String fl,String ddj01_jfid);
	/**
	 * 非农药不带条件查询状态为提交的集合
	 */
	public List<DDJ11> selectAlllistBYQTZT(Page page, String ddj01_jfid);
	/**
	 * 根据条件获取对应集合
	 */
	public List<DDJ11> selectAll(Map<String,Object> map);
	/**
	 * 根据条件获取对应集合数量
	 */
	public int getCountAll(Map<String,Object> map);
}
