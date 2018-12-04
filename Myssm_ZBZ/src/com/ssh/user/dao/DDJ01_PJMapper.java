package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ01_PJ;

public interface DDJ01_PJMapper {
	/**
	 * ���ݲ�ѯ������ȡ��Ӧ���ϵ�����
	 * @param map
	 * @return
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * ����ר����֯��ѯ��Ӧ����
	 * @param map
	 * @return
	 */
	public List<DDJ01_PJ> SelectByDDJ01_JFID(Map<String,Object> map);
	/**
	 * ����һ����������
	 * @param dDJ01_PJ
	 */
	public void insert(DDJ01_PJ dDJ01_PJ);
	/**
	 * ��ȡ��ӦJFID
	 * @return
	 */
	public String getJFID();
	/**
	 * ����ID��ȡΨһ����
	 * @param JFID
	 * @return
	 */
	public DDJ01_PJ SelectById(String JFID);
	/**
	 * ����ID��������
	 * @param dDJ01_PJ
	 */
	public void update(DDJ01_PJ dDJ01_PJ);
	/**
	 * ����IDɾ������
	 * @param JFID
	 */
	public void delete(String JFID);
}
