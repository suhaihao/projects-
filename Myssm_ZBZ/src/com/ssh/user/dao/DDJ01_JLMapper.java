package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ01_JL;
import com.ssh.user.model.DDJ01_PJ;

public interface DDJ01_JLMapper {
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
	public List<DDJ01_JL> SelectByDDJ01_JFID(Map<String,Object> map);
	/**
	 * ����һ����������
	 * @param dDJ01_PJ
	 */
	public void insert(DDJ01_JL dDJ01_JL);
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
	public DDJ01_JL SelectById(String JFID);
	/**
	 * ����ID��������
	 * @param dDJ01_PJ
	 */
	public void update(DDJ01_JL dDJ01_JL);
	/**
	 * ����IDɾ������
	 * @param JFID
	 */
	public void delete(String JFID);
}
