package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW11;

public interface DFW11Mapper {
	/**
	 * ��ȡ��Ӧ���ϴ���ҳ״̬Ϊ�ύ������
	 * @param map
	 * @return
	 */
	public List<DFW11> SelectByPageAll(Map<String, Object> map);
	/**
	 * ��ȡ��Ӧ���ϵ�����
	 * @param map
	 * @return
	 */
	public int GetCount(Map<String,Object> map);
	/**
	 * ����ID��ȡΨһ����
	 * @param JFID
	 * @return
	 */
	public DFW11 SelectByJfid(String JFID);
	/**
	 * ��ȡΨһID
	 */
	public String getJFID();
	/**
	 * ����һ������
	 */
	public void insertDFW11(DFW11 dFW11);
	/**
	 * ����IDɾ������
	 * @param JFID
	 */
	public void delete(String JFID);
	/**
	 * ��������
	 */
	public void update(DFW11 dFW11);
	/**
	 * ȡ���ύ
	 */
	public void updateZT(String JFID);
}
