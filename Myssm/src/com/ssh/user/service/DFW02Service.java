package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW02;

public interface DFW02Service {
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
	 * �ֻ�����ID��ȡΨһ������
	 */
	public DFW02 SelectByJFID(String JIFD);
	/**
	 * �ֻ����۽ӿ��ύ
	 */
	public String p_gd_pj(Map<String,Object> map);
}
