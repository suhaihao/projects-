package com.ssh.user.dao;


import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ02_D;

public interface DDJ02_DMapper {
	/**
	 * �������ؿ���Ϣ
	 */
	public void insedk(DDJ02_D dDJ02_D);
	/**
	 * ����ddj02_jfid��ѯ����ؼ���
	 */
	public List<DDJ02_D> selectByddj02_jfid(String ddj02_jfid);
	/**
	 * ����id��ȡ��Ҫ���µ���Ϣ
	 */
	public DDJ02_D SelectByID(String id);
	/**
	 * ���µؿ���Ϣ��¼
	 */
	public void updkxx(DDJ02_D dDJ02_D);
	/**
	 * ����id ɾ��һ������
	 */
	public void delById(String id);
	/**
	 * ��ȡ��Ӧũ������ĵؿ鼯�ϴ���ҳ
	 */
	public List<DDJ02_D> SelectBYDDJ02_JFIDPage(Map<String,Object> map);
	/**
	 * ��ȡ��Ӧũ���µؿ鼯�ϵ�����
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * ��ȡ��Ӧ��֯�µ�
	 * @param DDJ01_JFID
	 * @return
	 */
	public List<DDJ02_D> SelectAllNhDk(Map<String,Object> map);
	/**
	 * ��ȡ��Ӧ��֯��ũ���ؿ�����
	 * @param map
	 * @return
	 */
	public int GetAllNhDkCount(Map<String,Object> map);
}
