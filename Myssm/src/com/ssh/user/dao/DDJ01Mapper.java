package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ01_D;

public interface DDJ01Mapper {
	/**
	 * �����û���ddj01_jfid��ȡ��Ӧ��ȫ������
	 */
	public List<DDJ01> SelectByUserId(Map<String, Object> map);

	/**
	 * ��ȡ�û���Ӧ�����ݼ���
	 */
	public int getALLByuser(String jfid);

	/**
	 * ��ȡ�û���ص�ר����֯
	 */
	public List<DDJ01> selectByDDJ01id(String ddj01id);

	/**
	 * ���¶�Ӧ����
	 */
	public void upByID(DDJ01 dDJ01);

	/**
	 * ����ӱ�
	 */
	public void ins_d(DDJ01_D dDJ01_D);

	/**
	 * ��ȡ��Ӧ���񼯺�
	 */
	public List<DDJ01_D> selectBydd01id(String ddj01id);

	/**
	 * ���ݴ���ddj01id ɾ�� ȫ������
	 */
	public void delAllfw(String ddj01id);

	/**
	 * ����id��ȡΨһ����
	 */
	public DDJ01 SelectByID(String ddj01id);
	/**
	 * ��ȡȫ������
	 */
	public List<DDJ01> SelectAlllSize();
//--------------------------------------------------------------------------
	/**
	 * �ֻ��ӿ��ҷ���
	 */
	public List<DDJ01> PhoneSelectByPage(Map<String, Object> map);
	/**
	 * ��ȡ��Ӧ�ֻ��ӿڼ��ϵ�����
	 */
	public int PhoneGetCount(Map<String, Object> map);
	/**
	 * ����JFID��ȡ��Ӧ����
	 */
	public DDJ01 SelectBYJFID(String JFID);
	/**
	 * ��ȡ��Ӧ�ļ�������
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * ��ȡ��Ӧר����֯���Ϸ�ҳ
	 */
	public List<DDJ01> SelectAllZFZZ(Map<String,Object> map);
}
