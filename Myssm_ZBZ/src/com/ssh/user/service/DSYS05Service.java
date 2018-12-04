package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.DSYS05;

public interface DSYS05Service {
	/**
	 * 查询全部集合
	 * @return
	 */
	public List<DSYS05> SelectAllBM();
	/**
	 * 根据BM查询为唯一集合
	 */
	public DSYS05 SelectByBM(String BMBM);
	/**
	 * 根据父类部门查询相关数据
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
	 */
	public void upInfo(DSYS05 dSYS05);
}
