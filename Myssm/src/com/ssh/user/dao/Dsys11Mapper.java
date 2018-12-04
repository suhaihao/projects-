package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.DDJ03;
import com.ssh.user.model.Dsys11;

public interface Dsys11Mapper {
	/**
	 * 根据类型查询返回对象
	 */
	public Dsys11 SeleBybm(String bmlb, String bm);
	/**
	 * 根据类别查出对应的集合
	 */
	public List<Dsys11> SelectAllList(String bmlb);
	/**
	 * 获取服务相关集合
	 */
	public List<Dsys11> SelectAllFW();
	/**
	 * 获得防治措施分类
	 */
	public List<Dsys11> SelectAllfzcsfl();
	/**
	 * 获取单价集合
	 */
	public List<Dsys11> SelectAllDj();
	/**
	 * 根据bm查询一个单位
	 */
	public Dsys11 SelectByBmDw(String bm);
	/**
	 * 获取DDJ03的全部集合
	 */
	public List<DDJ03> SelectAllST();
}
