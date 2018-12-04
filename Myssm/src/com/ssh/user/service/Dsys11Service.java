package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.DDJ03;
import com.ssh.user.model.Dsys11;

public interface Dsys11Service {
	/**
	 * 根据编码类别获取对应信息
	 * 
	 */
	public Dsys11 SeleBybm(String bmlb, String bm);

	/**
	 * 根据类别查出对应集合
	 */
	public List<Dsys11> SelecetAllBM(String bmlb);

	/**
	 * 获取服务集合
	 */
	public List<Dsys11> selectAllFw();

	/**
	 * 获取防治措施分类集合
	 */
	public List<Dsys11> selectAllfzcsfl();

	/**
	 * 查询单价集合
	 */
	public List<Dsys11> selectAllDj();

	/**
	 * 根据bm查询一个单位
	 */
	public Dsys11 seletBbmDw(String bm);
	/**
	 * 查询视图中的项目
	 */
	public List<DDJ03> SelectAllST();
}
