package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ03;
import com.ssh.user.model.Dsys10;
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

	// ---------------------------------------------------------------------------
	/**
	 * 查询dsys10全部数据带分页
	 * @param map
	 * @return
	 */
	public List<Dsys10> SelectDsys10(Map<String, Object> map);
	/**
	 * 获取dsys10全部集合数量
	 * @param map
	 * @return
	 */
	public int getDsys10Count(Map<String, Object> map);
	/**
	 * 查询Dsys11全部数据带分页
	 */
	public List<Dsys11> SelectDsys11(Map<String, Object> map);
	/**
	 * 获取dsys10全部集合数量
	 * @param map
	 * @return
	 */
	public int getDsys11Count(Map<String, Object> map);
	/**
	 * 查看编码是否重复
	 * @param BM
	 * @param BMLB
	 * @return
	 */
	public Dsys11 SelectByBM_BMLB(String BM,String BMLB);
	/**
	 * 插入dsys11
	 * @param dsys11
	 */
	public void insert(Dsys11 dsys11);
	/**
	 * 根据JFID查询唯一数据
	 * @param JFID
	 * @return
	 */
	public Dsys11 SelectByJFID(String JFID);
	/**
	 * 更新数据
	 * @param dsys11
	 */
	public void update(Dsys11 dsys11);
	/**
	 * 根据ID删除数据
	 * @param JFID
	 */
	public void delete(String JFID);
}
