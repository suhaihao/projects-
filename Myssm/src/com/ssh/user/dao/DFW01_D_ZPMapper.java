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
	/**
	 * ���ݸ���IDɾ��ȫ������
	 * @param DFW01_D_JFID
	 */
	public void deleteByDFW01_D_JFID(String DFW01_D_JFID);
	/**
	 * ����һ������
	 * @param dFW01_D_ZP
	 */
	public void insert(DFW01_D_ZP dFW01_D_ZP);
}
