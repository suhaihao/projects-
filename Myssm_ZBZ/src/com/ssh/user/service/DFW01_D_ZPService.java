package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.DFW01_D_ZP;

public interface DFW01_D_ZPService {
	/**
	 * 获取对应地块的集合
	 */
	public List<DFW01_D_ZP> SelectBYDK(String DFW01_D_JFID);
	/**
	 * 根据ID删除对应照片
	 */
	public void delZP(String JFID);
}
