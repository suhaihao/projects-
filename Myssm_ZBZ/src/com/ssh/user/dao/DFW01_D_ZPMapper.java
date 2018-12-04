package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.DFW01_D;
import com.ssh.user.model.DFW01_D_ZP;

public interface DFW01_D_ZPMapper {
	/**
	 * 获取对应地块照片集合
	 */
	public List<DFW01_D_ZP> SelectByDK(String DFW01_D_JFID);
	/**
	 * 根据JFID删除对应照片
	 */
	public void delZP(String JFID);
}
