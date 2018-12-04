package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.DFW11_D;

public interface DFW11_DMapper {
	/**
	 * 根据父类ID获取对应集合
	 * @param DFW11_JFID
	 * @return
	 */
	public List<DFW11_D> SelectByFatherID(String DFW11_JFID);
}
