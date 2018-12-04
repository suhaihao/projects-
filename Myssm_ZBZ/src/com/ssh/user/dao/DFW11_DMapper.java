package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.DFW11_D;

public interface DFW11_DMapper {
	/**
	 * ���ݸ���ID��ȡ��Ӧ����
	 * @param DFW11_JFID
	 * @return
	 */
	public List<DFW11_D> SelectByFatherID(String DFW11_JFID);
	/**
	 * ����һ������
	 */
	public void insert(DFW11_D dFW11_D);
	/**
	 * �����ϼ�IDɾ����Ӧ����
	 * @param DFW11_JFID
	 */
	public void delete(String DFW11_JFID);
	/**
	 * ����IDɾ��һ������
	 * @param JFID
	 */
	public void deleteByJFID(String JFID);
}
