package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ11;
import com.ssh.user.util.Page;

public interface DDJ11Service {
	/**
	 * ��ѯ�������δ�ʩ�ķ�ҳȫ������
	 */
	public List<DDJ11> selectAlllist(Page page,String ddj01_jfid);

	/**
	 * ��ȡ���ϵ�����
	 */
	public int getCount(String ddj01_jfid);
	/**
	 * ��ȡ���ϵ�����
	 */
	public int getCountBYTJ(String ddj01_jfid,String MC,String FL);
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
	public List<DDJ11> selectByFlandName(Page page,String mc,String fl,String ddj01_jfid);
	/**
	 * �������ֻ�ȡһ������
	 */
	public DDJ11 selectByMc(String MC,String ddj01_jfid);
	/**
	 * ����id����һ������
	 */
	public List<DDJ11> selectByid(String id);
	/**
	 * ������֤�����Ƿ��ظ�
	 */
	public DDJ11 selectByMcID(String id,String MC,String ddj01_jfid);
	/**
	 * ���¶�Ӧ����
	 */
	public void upsj(DDJ11 dDJ11);
	/**
	 * ȡ�������ֶ�
	 */
	public String qxup(DDJ11 dDJ11);
	/**
	 * �����ύ�ļ���
	 */
	public int getCountByZTTJ(String ddj01_jfid);
	/**
	 * ��������ѯ�ύ����
	 */
	public int getCountBYTJZT(String ddj01_jfid,String MC,String FL);
	/**
	 * ����������ѯ��ȡ����״̬Ϊ�ύ��
	 */
	public List<DDJ11> selectByFlandNameBYZT(Page page,String mc,String fl,String ddj01_jfid);
	/**
	 * ����������ѯ״̬Ϊ�ύ�ļ���
	 */
	public List<DDJ11> selectAlllistBYZT(Page page, String ddj01_jfid);
	/**
	 * ���ҷ�ũҩ�ύ�ļ���
	 */
	public int getCountByQTZTTJ(String ddj01_jfid);
	/**
	 * ��ũҩ��������ѯ�ύ����
	 */
	public int getCountBYQTTJZT(String ddj01_jfid,String MC,String FL);
	/**
	 * ��ũҩ����������ѯ��ȡ����״̬Ϊ�ύ��
	 */
	public List<DDJ11> selectByQTFlandNameBYZT(Page page,String mc,String fl,String ddj01_jfid);
	/**
	 * ��ũҩ����������ѯ״̬Ϊ�ύ�ļ���
	 */
	public List<DDJ11> selectAlllistBYQTZT(Page page, String ddj01_jfid);
}
