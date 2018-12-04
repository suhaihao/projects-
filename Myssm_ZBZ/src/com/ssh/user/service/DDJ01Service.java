package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ01_D;
import com.ssh.user.util.Page;

public interface DDJ01Service {
	/**
	 * �����û���ddj01����jfid��ѯ��Ӧר����֯��ȡ����
	 */
	public List<DDJ01> selectByUserid(Page page, String ddj01id);

	/**
	 * ��ȡ��Ӧ��ǰ�û��ļ��ϵ�����
	 */
	public int getSizeByUser(String jfid);

	/**
	 * �����û�id��ȡ��Ӧ����Ϣ
	 */
	public List<DDJ01> SelectByDD01ID(String ddj01id);

	/**
	 * ���¶�Ӧ����
	 */
	public void updd01Byid(DDJ01 dDJ01);

	/**
	 * ����ӱ�����
	 */
	public void insdd_d(DDJ01_D dDJ01_D);

	/**
	 * ��ȡ��Ӧ������񼯺�
	 */
	public List<DDJ01_D> SelectByDDID(String dd01jfid);

	/**
	 * ����dd01_jfidɾ��ȫ������
	 */
	public void delAllfw(String dd01jfid);

	/**
	 * ����id��ȡΨһ����ֵ
	 */
	public DDJ01 SelectByID(String ddj01id);

	/**
	 * ��ȡȫ������
	 */
	public List<DDJ01> SelectAlllSize();

	// ----------------------------------------------------------------------------
	/**
	 * �ֻ��ӿڲ�ѯ���ȡ��Ӧ����
	 */
	public List<DDJ01> PhoneSelectByPage(Map<String, Object> map);

	/**
	 * ��ȡ�ֻ����϶�Ӧ������
	 */
	public int PhoneGetCount(Map<String, Object> map);

	/**
	 * ����JFID ��ȡȫ������
	 */
	public DDJ01 SelectBYJFID(String JFID);

	// ----------------------------------------------------------------------------
	/**
	 * ����ҳ��ѯȫ������
	 * @param map
	 * @return
	 */
	public List<DDJ01> SelectAll_ZBZ(Map<String, Object> map);
	/**
	 * ��ȡȫ�����ݵ�����
	 * @param map
	 * @return
	 */
	public int getCount(Map<String, Object> map);
	/**
	 * ��ȡר����֯����һ��ID
	 * @return
	 */
	public String getJFID();
	/**
	 * ����һ����Ϣ
	 * @param dDJ01
	 */
	public void insertInfo(DDJ01 dDJ01);
	/**
	 * �޸Ĺ���Ա������
	 * @param JFUSERID
	 * @param JFPASSWORD
	 */
	public void updatePassword(String JFUSERID,String JFPASSWORD);
	/**
	 * ����IDɾ����Ӧ��ר����֯
	 * @param JFID
	 */
	public void deleteZFZZ(String JFID);
	/**
	 * ��ȡ��Ӧר����֯����
	 */
	public List<DDJ01> SelectAllZFZZ(Map<String,Object> map);
	/**
	 * ����dsys01_zfzz
	 */
	public void upzfzz(String JFID,String JFUSERID);
	/**
	 * ��ȡ���˳��ļ���
	 * @param map
	 * @return
	 */
	public List<DDJ01> SelectByZT(Map<String,Object> map);
	/**
	 * ��ȡ�˳���������
	 * @param map
	 * @return
	 */
	public int getCountByZT(Map<String,Object> map);
}
