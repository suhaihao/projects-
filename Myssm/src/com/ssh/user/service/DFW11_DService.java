package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.DFW11_D;

public interface DFW11_DService {
	/**
	 * ��������DFW11_JFID��ȡ��Ӧ���ݼ���
	 */
	public List<DFW11_D> SelectByFatherID(String DFW11_JFID);
}
