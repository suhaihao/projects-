package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ02;

public interface DDJ02Mapper {
	/**
	 * ����ҳ��ѯ��Ӧר����֯�µ�ũ��
	 */
	public List<DDJ02> SelectByZZPage(Map<String, Object> map);

	/**
	 * ��ȡ��Ӧר����֯�µ�ũ��������
	 */
	public int getCount(String ddj01_jfid);
	/**
	 * ��ȡ��Ӧר����֯�µ�ũ��������
	 */
	public int getCountByTj(String ddj01_jfid,String MC);
	/**
	 * ��ѯר����֯�����ũ���Ƿ����
	 */
	public DDJ02 SelectByzz(String ddj01_jfid,String yhm);
	/**
	 * ��ѯYHM�Ƿ���ڲ������ĸ���֯
	 */
	public List<DDJ02> selectByYHM(String yhm);
	/**
	 * �鿴�����֯���Ƿ������ũ����Ϣ
	 */
	public List<DDJ02> SelectByBDZZ(String ddj01_jfid,String yhm);
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
	public List<DDJ02> selectByID(String id);
	/**
	 * ������Ϣ����
	 */
	public void upddj02(DDJ02 dDJ02);
	/**
	 * ����������Ϣ
	 */
	public void uppasword(DDJ02 dDJ02);
	/**
	 * �ж��û�����������û�������
	 */
	public DDJ02 SelectByYHMOne(String YHM);
	/**
	 * ����token�Լ���½ʱ��
	 */
	public void uoToken(DDJ02 dDJ02);
	/**
	 * ��ȡȫ������
	 */
	public List<DDJ02> SelectAllSize(Map<String, Object> map);
	/**
	 * ��ȡ��Ӧ���ϵ�����
	 */
	public int GetCount(Map<String, Object> map);
//----------------------------------------------------------------------------
	/**
	 * ���Ҳ�ѯͳ�Ƶ��������
	 * @param map
	 * @return
	 */
	public List<DDJ02> SelectTJ(Map<String,Object> map);
	public List<DDJ02> SelectTJ2(Map<String,Object> map);
	public List<DDJ02> SelectTJ3(Map<String,Object> map);
	/**
	 * �ϼ�����
	 */
	public DDJ02 SelectHj(Map<String, Object> map);
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
