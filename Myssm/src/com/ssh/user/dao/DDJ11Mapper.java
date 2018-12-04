package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ11;
import com.ssh.user.util.Page;

public interface DDJ11Mapper {
	/**
	 * ��ȡȫ�����ϴ���ҳ
	 * 
	 */
	public List<DDJ11> selectByAlllist(Map<String,Object> map);
	/**
	 * ��ȡ���ϵ��ܸ���
	 */
	public int getCount(String ddj01_jfid);
	/**
	 * ��ȡ���ϵ��ܸ���
	 */
	public int getCountByTJ(String ddj01_jfid,String MC,String FL);
	/**
	 * ����һ������
	 */
	public void inddj11(DDJ11 dDJ11);
	/**
	 * ��ȡΨһid
	 */
	public String getID();
	/**
	 * ����idɾ��һ������
	 */
	public void delddj11(String id);
	/**
	 * ����������ѯ��ȡ����
	 */
	public List<DDJ11> selectListByflname(Map<String,Object> map);
	/**
	 * �������ƻ�ȡΨһ����
	 */
	public DDJ11 selectByMc(String mc,String ddj01_jfid);
	/**
	 * ����id��ȡһ������
	 */
	public List<DDJ11> selectByid(String id);
	/**
	 * �ų�id�鿴�����Ƿ��ظ�
	 */
	public DDJ11 selectByMcID(String id,String mc,String ddj01_jfid);
	/**
	 * ���¶�Ӧ����
	 */
	public void updysj(DDJ11 dDJ11);
	/**
	 * ȡ���ύ�޸��ֶ�
	 */
	public String qxup(Map<String,Object> map);
	/**
	 * ����ũҩ״̬Ϊ�ύ�ļ�������
	 */
	public int getCountByZTTJ(String ddj01_jfid);
	/**
	 * ��������ѯ�ύ��������
	 */
	public int getCountBYTJZT(String ddj01_jfid,String MC,String FL);
	/**
	 * ����������ѯ��ȡ����״̬Ϊ�ύ��
	 */
	public List<DDJ11> selectByFlandNameBYZT(Map<String, Object> map);
	/**
	 * ��ѯ��������״̬Ϊ�ύ�ļ���
	 */
	public List<DDJ11> selectAlllistBYZT(Map<String, Object> map);
	/**
	 * ���ҷ�ũҩ״̬Ϊ�ύ�ļ�������
	 */
	public int getCountByQTZTTJ(String ddj01_jfid);
	/**
	 * ��ũҩ��������ѯ�ύ��������
	 */
	public int getCountBYQTTJZT(String ddj01_jfid,String MC,String FL);
	/**
	 * ��ũҩ����������ѯ��ȡ����״̬Ϊ�ύ��
	 */
	public List<DDJ11> selectByQTFlandNameBYZT(Map<String, Object> map);
	/**
	 * ��ũҩ��ѯ��������״̬Ϊ�ύ�ļ���
	 */
	public List<DDJ11> selectAlllistBYQTZT(Map<String, Object> map);
}
