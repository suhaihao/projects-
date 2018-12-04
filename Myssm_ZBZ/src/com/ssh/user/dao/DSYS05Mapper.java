package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.DSYS05;

public interface DSYS05Mapper {
	/**
	 * 查询不是末级的集合
	 * @param BMJC
	 * @param BMBM
	 * @return
	 */
	public List<DSYS05> SelectAllBM();
	/**
	 * 根据BM查询为唯一集合
	 */
	public DSYS05 SelectByBM(String BMBM);
	/**
	 * 根据父类BM查询相关数据
	 */
	public List<DSYS05> SelectByFather(String BMBM,String BMJC);
	/**
	 * 根据ID查询父集合
	 */
	public DSYS05 SelectByJFID(int JFID);
	/**
	 * 插入一条数据
	 */
	public void instInfo(DSYS05 dSYS05);
	/**
	 * 修改一条数据
	 * @param dSYS05
	 */
	public void upInfo(DSYS05 dSYS05);
}
