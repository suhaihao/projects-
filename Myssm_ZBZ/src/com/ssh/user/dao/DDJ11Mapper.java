package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ11;
import com.ssh.user.util.Page;

public interface DDJ11Mapper {
	/**
	 * 获取全部集合带分页
	 * 
	 */
	public List<DDJ11> selectByAlllist(Map<String,Object> map);
	/**
	 * 获取集合的总个数
	 */
	public int getCount(String ddj01_jfid);
	/**
	 * 获取集合的总个数
	 */
	public int getCountByTJ(String ddj01_jfid,String MC,String FL);
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
	public List<DDJ11> selectListByflname(Map<String,Object> map);
	/**
	 * 根据名称获取唯一对象
	 */
	public DDJ11 selectByMc(String mc,String ddj01_jfid);
	/**
	 * 根据id获取一条数据
	 */
	public List<DDJ11> selectByid(String id);
	/**
	 * 排除id查看名称是否重复
	 */
	public DDJ11 selectByMcID(String id,String mc,String ddj01_jfid);
	/**
	 * 更新对应数据
	 */
	public void updysj(DDJ11 dDJ11);
	/**
	 * 取消提交修改字段
	 */
	public String qxup(Map<String,Object> map);
	/**
	 * 查找农药状态为提交的集合数量
	 */
	public int getCountByZTTJ(String ddj01_jfid);
	/**
	 * 带条件查询提交集合数量
	 */
	public int getCountBYTJZT(String ddj01_jfid,String MC,String FL);
	/**
	 * 根据条件查询获取集合状态为提交的
	 */
	public List<DDJ11> selectByFlandNameBYZT(Map<String, Object> map);
	/**
	 * 查询不带条件状态为提交的集合
	 */
	public List<DDJ11> selectAlllistBYZT(Map<String, Object> map);
	/**
	 * 查找非农药状态为提交的集合数量
	 */
	public int getCountByQTZTTJ(String ddj01_jfid);
	/**
	 * 非农药带条件查询提交集合数量
	 */
	public int getCountBYQTTJZT(String ddj01_jfid,String MC,String FL);
	/**
	 * 非农药根据条件查询获取集合状态为提交的
	 */
	public List<DDJ11> selectByQTFlandNameBYZT(Map<String, Object> map);
	/**
	 * 非农药查询不带条件状态为提交的集合
	 */
	public List<DDJ11> selectAlllistBYQTZT(Map<String, Object> map);
	/**
	 * 根据条件获取对应集合
	 */
	public List<DDJ11> selectAll(Map<String,Object> map);
	/**
	 * 根据条件获取对应集合数量
	 */
	public int getCountAll(Map<String,Object> map);
}
