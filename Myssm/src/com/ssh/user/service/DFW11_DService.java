package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.DFW11_D;

public interface DFW11_DService {
	/**
	 * 根据主表DFW11_JFID获取对应数据集合
	 */
	public List<DFW11_D> SelectByFatherID(String DFW11_JFID);
}
