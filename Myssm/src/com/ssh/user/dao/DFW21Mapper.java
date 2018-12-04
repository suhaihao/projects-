package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW21;
import com.ssh.user.model.DFW21_FJ;
import com.ssh.user.model.DFW21_JSR;

public interface DFW21Mapper {
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
	public List<DFW21> SelectAll(Map<String, Object> map);
	/**
	 * û�з�ҳ
	 * @param map
	 * @return
	 */
	public List<DFW21> SelectAllCX(String DDJ01_JFID);

	/**
	 * ��ȡ����ID
	 * 
	 * @return
	 */
	public String getJFID();

	/**
	 * ����һ������
	 * 
	 * @param dFW21
	 */
	public void insert(DFW21 dFW21);
	/**
	 * ����ID��ȡΨһ����
	 * @param JFID
	 * @return
	 */
	public DFW21 SelectByID(String JFID);
	/**
	 * ��������
	 * @param dFW21
	 */
	public void update(DFW21 dFW21);
	/**
	 * ����ID��ȡΨһ����
	 * @param JFID
	 * @return
	 */
	public void del(String JFID);
	// -----------------------------------------------------------------
	/**
	 * ���������
	 * 
	 * @param dFW21_JSR
	 */
	public void insert_jsr(DFW21_JSR dFW21_JSR);
	/**
	 * ���ݸ���ID��ѯ����
	 */
	public List<DFW21_JSR> SelectByDFW21_JFID_JSR(Map<String,Object> map);
	/**
	 * ���ݸ���IDɾ������
	 * @param DFW21_JFID
	 */
	public void del_jsr_f(String DFW21_JFID);
	/**
	 * ����Ϊ�Ѷ�
	 * @param dFW21_JSR
	 */
	public void upjsr(DFW21_JSR dFW21_JSR);
	// -----------------------------------------------------------------
	/**
	 * ���븽��
	 * 
	 * @param dFW21_FJ
	 */
	public void insert_fj(DFW21_FJ dFW21_FJ);
	/**
	 * ���ݸ���ID��ѯ����
	 */
	public List<DFW21_FJ> SelectByDFW21_JFID_FJ(Map<String,Object> map);
	/**
	 * ��������IDɾ��һ������
	 * @param JFID
	 */
	public void del_fj(String JFID);
	/**
	 * ���ݸ���IDɾ������
	 * @param DFW21_JFID
	 */
	public void del_fj_f(String DFW21_JFID);
}
