package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ02;

public interface DDJ02Service {
	/**
	 * ����ҳ��ѯ��Ӧ��ר����֯�µ�ũ��
	 */
	public List<DDJ02> selectByZzPage(Map<String, Object> map);

	/**
	 * ��ȡ��Ӧר����֯��ũ��������
	 */
	public int getCount(String ddj01_jfid);

	/**
	 * ��ȡ��Ӧר����֯��ũ����������������
	 */
	public int getCountByTj(String ddj01_jfid, String MC);

	/**
	 * ��ѯ��Ӧר����֯����û�����ũ��
	 */
	public DDJ02 selectbyZZ(String ddj01_jfid, String yhm);

	/**
	 * ��ѯũ�����Ƿ���ڲ����ĸ���֯
	 */
	public List<DDJ02> selecByYHM(String yhm);

	/**
	 * ��ѯ�����֯�Ƿ������ũ��
	 */
	public List<DDJ02> selectByBDZZ(String ddj01_jfid, String yhm);

	/**
	 * ����һ������
	 */
	public void insddj02(DDJ02 dDJ02);

	/**
	 * ��ȡΨһid
	 */
	public String getID();

	/**
	 * ����id��ȡΨһ����
	 */
	public List<DDJ02> SelectByID(String id);

	/**
	 * ����ũ����Ϣ
	 */
	public void upnhxx(DDJ02 dDJ02);

	/**
	 * �����û�����
	 */
	public void uppassword(DDJ02 dDJ02);

	/**
	 * �жϵ�½�˻������Ƿ���ȷ
	 */
	public DDJ02 SelectByYHMOne(String YHM);

	/**
	 * �����û�����Լ���½ʱ��
	 */
	public void upToken(DDJ02 dDJ02);
	/**
	 * ��ѯ��ȫ���û�����
	 */
	public List<DDJ02> SelectAllSize(Map<String,Object> map);
	/**
	 * ��ȡ��Ӧ��������
	 */
	public int GetCount(Map<String,Object> map);
//------------------------------------------------------------------------
	/**
	 * �û�ͳ��
	 */
	public List<DDJ02> SelectTJ(Map<String,Object> map);
	public List<DDJ02> SelectTJ2(Map<String,Object> map);
	public List<DDJ02> SelectTJ3(Map<String,Object> map);
	/**
	 * �û��ϼ�
	 */
	public DDJ02 SelectHj(Map<String,Object> map);
//--------------------------------------------------------------------------
	/**
	 * �ֻ�ѡ���û�������Ϣ
	 */
	public List<DDJ02> SelectAllSizeBySJ(Map<String,Object> map);
	/**
	 * �ֻ��û�����
	 */
	public int getCountBySJ();
	/**
	 * �ֻ������Լ���Ϣ
	 */
	public void upusermsg(DDJ02 dDJ02);
}
