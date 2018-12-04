package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW23;
import com.ssh.user.model.DFW23_FJ;

public interface DFW23Mapper {
	/**
	 * ����������ȡ��Ӧ��������
	 * 
	 * @return
	 */
	public int getCount(Map<String, Object> map);

	/**
	 * ����������ȡȫ����������
	 * 
	 * @param map
	 * @return
	 */
	public List<DFW23> SelectAll(Map<String, Object> map);
	/**
	 * ��ȡ����ID
	 * 
	 * @return
	 */
	public String getJFID();

	/**
	 * ����һ������
	 * 
	 * @param dFW23
	 */
	public void insert(DFW23 dFW23);

	/**
	 * ����ID��ȡΨһ����
	 * 
	 * @param JFID
	 * @return
	 */
	public DFW23 SelectByID(String JFID);

	/**
	 * ��������
	 * 
	 * @param dFW23
	 */
	public void update(DFW23 dFW23);

	/**
	 * ����ID��ȡΨһ����
	 * 
	 * @param JFID
	 * @return
	 */
	public void del(String JFID);

	// -----------------------------------------------------------------
	/**
	 * ���븽��
	 * 
	 * @param dFW23_FJ
	 */
	public void insert_fj(DFW23_FJ dFW23_FJ);

	/**
	 * ���ݸ���ID��ѯ����
	 */
	public List<DFW23_FJ> SelectByDFW23_JFID_FJ(Map<String, Object> map);

	/**
	 * ��������IDɾ��һ������
	 * 
	 * @param JFID
	 */
	public void del_fj(String JFID);

	/**
	 * ���ݸ���IDɾ������
	 * 
	 * @param DFW23_JFID
	 */
	public void del_fj_f(String DFW23_JFID);
}
