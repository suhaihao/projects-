package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ02_D;

public interface DDJ02_DService {
	/**
	 * ����һ���ؿ���Ϣ
	 */
	public void insDDXX(DDJ02_D dDJ02_D);
	/**
	 * ����ddj02����jfid��ȡ�ؿ�ļ���
	 */
	public List<DDJ02_D> SelectByDDJ02_JFID(String ddj02_jfid);
	/**
	 * ����id��ȡΨһ��Ϣ
	 */
	public DDJ02_D SelectById(String id);
	/**
	 * ���µؿ���Ϣ
	 */
	public void uodkxx(DDJ02_D dDJ02_D);
	/**
	 * ����idɾ��һ����Ϣ
	 */
	public void delddj02_d(String id);
	/**
	 * ����DDJ02_JFID��ȡ��Ӧũ������ĵؿ����ҳ
	 */
	public List<DDJ02_D> SelectBYDDJ02_JFIDPage(Map<String,Object> map);
	/**
	 * ��ȡ��Ӧũ���¼��ϵ�����
	 */
	public int getcount(Map<String,Object> map);
	/**
	 * ��ѯ��Ӧר����֯������ũ���ĵؿ�
	 */
	public List<DDJ02_D> SelectAllNhDk(Map<String,Object> map);
	/**
	 * ��ȡ��֯��ũ���ؿ������
	 * @param map
	 * @return
	 */
	public int GetAllNhDkCount(Map<String,Object> map);
}
