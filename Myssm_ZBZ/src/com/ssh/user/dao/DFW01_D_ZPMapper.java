package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.DFW01_D;
import com.ssh.user.model.DFW01_D_ZP;

public interface DFW01_D_ZPMapper {
	/**
	 * ��ȡ��Ӧ�ؿ���Ƭ����
	 */
	public List<DFW01_D_ZP> SelectByDK(String DFW01_D_JFID);
	/**
	 * ����JFIDɾ����Ӧ��Ƭ
	 */
	public void delZP(String JFID);
}
