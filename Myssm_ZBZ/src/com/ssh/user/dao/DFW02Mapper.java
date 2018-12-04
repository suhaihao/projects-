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
	/**
	 * ��ȡ ʱ��  ��֯ �û� �ڵ�����
	 */
	public List<DFW02> SelectByTimeDddj01Dddj02(Map<String,Object> map);
	/**
	 * ��ȡ ʱ�� ��֯ �û� �����µļ���
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * ����Ч��ͳ�Ʋ�ѯ1
	 */
	public List<DFW02> SelectFWXGTJ1(Map<String,String> map);
	/**
	 * ����Ч��ͳ�Ʋ�ѯ2
	 */
	public List<DFW02> SelectFWXGTJ2(Map<String,String> map);
	/**
	 * ����Ч��ͳ�Ʋ�ѯ3
	 */
	public List<DFW02> SelectFWXGTJ3(Map<String,String> map);
	/**
	 * ����Ч��ͳ�ƺϼ�
	 */
	public DFW02 SelectFWXGTJHJ(Map<String,String> map);
}
