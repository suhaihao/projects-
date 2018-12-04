package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.Dsys01_dsys03;

public interface DSYS01_DSYS03Service {
	/**
	 * 插入对应数据
	 */
	public void insertJS(Dsys01_dsys03 dsys01_dsys03);
	/**
	 * 根据ID删除全部数据
	 */
	public void delAll(int JFID);
	/**
	 * 查询相关集合
	 */
	public List<Dsys01_dsys03> SelectByJS(String JFID);
}
