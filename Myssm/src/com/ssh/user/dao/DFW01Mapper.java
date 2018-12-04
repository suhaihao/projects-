package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW01;
import com.ssh.user.model.DFW01_D_FZMX;
import com.ssh.user.model.FWTJ;

public interface DFW01Mapper {
	/**
	 * ����ר����֯��ѯ��ȡ��Ӧ���ϴ���ҳ��Ϣ
	 */
	public List<DFW01> selectByPage(Map<String, Object> map);
	/**
	 * ��ȡ��������
	 */
	public int getCount(Map<String,Object> map);
	/**
	 * ����һ������
	 */
	public void inDFW01(DFW01 dFW01);
	/**
	 * ��ȡΨһid
	 */
	public String getID();
	/**
	 * ����id��ѯ��Ӧ��Ϣ
	 */
	public DFW01 SelectByID(String JFID);
	/**
	 * ������������
	 */
	public void updfw01(DFW01 dFW01);
	/**
	 * ���½�Ǯ
	 */
	public void UPJE(DFW01 dFW01);
	/**
	 * �ύ���ù���
	 */
	public String p_gd_pd(Map<String, Object> map);
	/**
	 * ɾ��������Ϣ����ID
	 */
	public void delByID(String JFID);
//----------------------------------------------------------------------------
	/**
	 * ����ר����֯��ѯ��ȡ��Ӧ���ϴ���ҳ��ϢZT�����ɵ���
	 */
	public List<DFW01> selectByPageZT(Map<String, Object> map);
	/**
	 * ��ȡ��������ZT
	 */
	public int getCountZT(Map<String,Object> map);
	/**
	 * �ɵ�������ɵ��ù���
	 * @param map
	 * @return
	 */
	public String P_gd_wg(Map<String,Object> map);
//----------------------------------------------------------------------------
	/**
	 * ����ר����֯��ѯ��ȡ��Ӧ���ϴ���ҳ��ϢZT�����ɵ���
	 */
	public List<DFW01> selectByPageZT4(Map<String, Object> map);
	/**
	 * ��ȡ��������ZT
	 */
	public int getCountZT4(Map<String,Object> map);
//----------------------------------------------------------------------------
	/**
	 * ��ѯzt=2�ļ���
	 */
	public List<DFW01> SelectByZt();
	/**
	 * ���ù���
	 */
	public String p_gddk_begin(Map<String, Object> map);
//----------------------------------------------------------------------------
	/**
	 * ͳ�Ʒ���
	 */
	public List<FWTJ> TJSJ(Map<String, Object> map);
	/**
	 * ͳ�Ʒ���
	 */
	public FWTJ TJSJHJ(Map<String, Object> map);
	/**
	 * ͳ�Ƶ��
	 * @param map
	 * @return
	 */
	public List<DFW01> TJSJclick(Map<String,Object> map);
	/**
	 * ��ȡ���ͳ�Ƶ�����
	 * @param map
	 * @return
	 */
	public int getcounTJSJclick(Map<String, Object> map);
//--------------------------------------------------------------------------
	/**
	 * ����ID��ȡΨһ��������
	 * @param jfid
	 * @return
	 */
	public DFW01 SelectByJFID(Map<String, Object> map);
	/**
	 * ���ݴ�������ں��û�id��ȡ��Ӧ����
	 * @param wcrq
	 * @param yhid
	 * @return
	 */
	public List<DFW01> SelectByRqYh(String wcrq, String yhid);
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
