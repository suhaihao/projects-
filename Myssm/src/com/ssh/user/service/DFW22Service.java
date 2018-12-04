package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW21;
import com.ssh.user.model.DFW22;
import com.ssh.user.model.DFW22_CKWJ;
import com.ssh.user.model.DFW22_FJ;
import com.ssh.user.model.DFW22_JSR;

public interface DFW22Service {
	/**
	 * ����������ȡ��Ӧ��������
	 * @return
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * ����������ȡȫ����������
	 * @param map
	 * @return
	 */
	public List<DFW22> SelectAll(Map<String,Object> map);
	/**
	 * û�з�ҳ
	 * @param map
	 * @return
	 */
	public List<DFW22> SelectAllCX(String DDJ01_JFID);
	/**
	 * ��ȡ����ID
	 * @return
	 */
	public String getJFID();
	/**
	 * ����һ������
	 * @param dFW22
	 */
	public void insert(DFW22 dFW22);
	/**
	 * ����ID��ȡΨһ����
	 * @param JFID
	 * @return
	 */
	public DFW22 SelectByID(String JFID);
	/**
	 * ��������
	 * @param dFW22
	 */
	public void update(DFW22 dFW22);
	/**
	 * ����ID��ȡΨһ����
	 * @param JFID
	 * @return
	 */
	public void del(String JFID);
//-----------------------------------------------------------------
	/**
	 * ���������
	 * @param dFW22_JSR
	 */
	public void insert_jsr(DFW22_JSR dFW22_JSR);
	/**
	 * ���ݸ���ID��ѯ����
	 */
	public List<DFW22_JSR> SelectByDFW22_JFID_JSR(Map<String,Object> map);
	/**
	 * ���ݸ���IDɾ������
	 * @param DFW22_JFID
	 */
	public void del_jsr_f(String DFW22_JFID);
	/**
	 * ����Ϊ�Ѷ�
	 * @param dFW22_JSR
	 */
	public void upjsr(DFW22_JSR dFW22_JSR);
//-----------------------------------------------------------------
	/**
	 * ���븽��
	 * @param dFW22_FJ
	 */
	public void insert_fj(DFW22_FJ dFW22_FJ);
	/**
	 * ���ݸ���ID��ѯ����
	 */
	public List<DFW22_FJ> SelectByDFW22_JFID_FJ(Map<String,Object> map);
	/**
	 * ��������IDɾ��һ������
	 * @param JFID
	 */
	public void del_fj(String JFID);
	/**
	 * ���ݸ���IDɾ������
	 * @param DFW22_JFID
	 */
	public void del_fj_f(String DFW22_JFID);
//----------------------------------------------------------------------
	/**
	 * ����ο��ļ�
	 * @param dFW22_FJ
	 */
	public void insert_ckwj(DFW22_CKWJ dFW22_CKWJ);
	/**
	 * ���ݸ���ID��ѯ����
	 */
	public List<DFW22_CKWJ> SelectByDFW22_JFID_CKWJ(Map<String,Object> map);
	/**
	 * ���ݸ���IDɾ������
	 * @param DFW22_JFID
	 */
	public void del_ckwj_f(String DFW22_JFID);
}
