package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW02;

public interface DFW02Mapper {
	/**
	 * ������Ҫ�������͵ļ���
	 */
	public List<DFW02> SelectByTXRQList();
	/**
	 * �ֻ���ȡ���������������
	 */
	public int getCountLL(Map<String,Object> map);
	/**
	 * �ֻ���ȡƽ���������
	 */
	public List<DFW02> SelectByLLList(Map<String,Object> map);
	/**
	 * �ֻ�����ID��ȡΨһ����
	 */
	public DFW02 SelectByJFID(String JFID);
	/**
	 * �ֻ������ύ�ӿ�
	 */
	public String p_gd_pj(Map<String,Object> map);
}
