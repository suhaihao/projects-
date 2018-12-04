package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW01;
import com.ssh.user.model.DFW01_D_FZMX;
import com.ssh.user.model.FWTJ;

public interface DFW01Service {
	/**
	 * ���ݸ���ר����֯��ȡ��Ӧ���ϴ���ҳ
	 */
	public List<DFW01> SelectByPage(Map<String, Object> map);
	/**
	 * ��ȡ��Ӧ��֯�µļ�������
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * ����һ������
	 */
	public void inDFW01(DFW01 dFW01);
	/**
	 * ��ѯΨһID
	 */
	public String getID();
	/**
	 * ����ID��ѯ��Ӧ����
	 */
	public DFW01 SelectByID(String JFID);
	/**
	 * ������������
	 */
	public void updfw01(DFW01 dFW01);
	/**
	 * ���½��
	 */
	public void UPJE(DFW01 dFW01);
	/**
	 * �ύ���ù���
	 */
	public String p_gd_pd(Map<String,Object> map);
	/**
	 * ����JFIDɾ������
	 */
	public void delzb(String JFID);
//-----------------------------------------------------------------------------
	/**
	 * ���ݸ���ר����֯��ȡ��Ӧ���ϴ���ҳZT�����ɵ���
	 */
	public List<DFW01> SelectByPageZT(Map<String, Object> map);
	/**
	 * ��ȡ��Ӧ��֯�µļ�������ZT
	 */
	public int getCountZT(Map<String,Object> map);
	/**
	 * �ɵ�������ɵ��ù���
	 * @param map
	 * @return
	 */
	public String P_gd_wg(Map<String,Object> map);
//------------------------------------------------------
	/**
	 * ���ݸ���ר����֯��ȡ��Ӧ���ϴ���ҳ
	 */
	public List<DFW01> SelectByPageZT4(Map<String, Object> map);
	/**
	 * ��ȡ��Ӧ��֯�µļ�������ZT
	 */
	public int getCountZT4(Map<String,Object> map);
//----------------------------------------------------------
	/**
	 * �賿12��ִ�еķ���
	 */
	public  List<DFW01> SelectByZt2();
	/**
	 * ���ù���
	 */
	public String p_gddk_begin(Map<String,Object> map);
//--------------------------------------------------------------------
	/**
	 * ͳ������
	 */
	public List<FWTJ> TJSJ(Map<String,Object> map);
	/**
	 * �ϼ�
	 */
	public FWTJ TJSJHJ(Map<String,Object> map);
	/**
	 * ͳ�Ʒ�����ͳ�Ʋ�ѯ
	 */
	public List<DFW01> TJSJclick(Map<String,Object> map);
	/**
	 * ��ȡ��������
	 * @param map
	 * @return
	 */
	public int getcounTJSJclick(Map<String,Object> map);
//--------------------------------------------------------------------------
	/**
	 * �ֻ��˸���id��ȡΨһ��������
	 * @param jfid
	 * @return
	 */
	public DFW01 SelectByJFID(Map<String, Object> map);
	/**
	 * ����������� ���û�ID��ȡ��Ӧ����
	 * @param wcrq
	 * @param yhid
	 * @return
	 */
	public List<DFW01> SelectByRqYh(String wcrq,String yhid);
	/**
	 * �ֻ���ȡ״̬Ϊ2��
	 */
	public List<DFW01> SelectBy_ZT_DDJ01_JFID(Map<String,Object> map);
	/**
	 * ��ȡ״̬Ϊ2��Ӧ��֯�µļ�������
	 * @param map
	 * @return
	 */
	public int getBy_ZT_DDJ01_JFIDCount(Map<String,Object> map);
	/**
	 * ��ѯ��ʩ�����ͳ��
	 * @param DFW01_JFID
	 * @return
	 */
	public List<DFW01_D_FZMX> SelectDFW01_D_FZMX(String DFW01_JFID);
}
