package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.DFW01_D_ZP;

public interface DFW01_D_ZPService {
	/**
	 * ��ȡ��Ӧ�ؿ�ļ���
	 */
	public List<DFW01_D_ZP> SelectBYDK(String DFW01_D_JFID);
	/**
	 * ����IDɾ����Ӧ��Ƭ
	 */
	public void delZP(String JFID);
}
