package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW01_D;

public interface DFW01_DService {
	/**
	 * ����һ����Ϣ
	 */
	public void insAdd(DFW01_D dFW01_D);
	/**
	 * ����DFW01_JFID��ѯ����Ӧ����
	 */
	public List<DFW01_D> SelectByID(String DFW01_JFID);
	/**
	 * ����JFID��ȡΨһ����
	 */
	public List<DFW01_D> SelectByJFID(String JFID);
	/**
	 * ����DFW01_JFIDɾ������
	 */
	public void DelBYFW01ID(String DFW01_JFID);
	/**
	 * �������ݵؿ���Ϣ
	 */
	public void upDkxx(DFW01_D dFW01_D);
	/**
	 * ɾ����Ӧ�ؿ����JFID
	 */
	public void delDK(String JFID);
	/**
	 * ��ɵؿ������
	 */
    public String p_gddk_wg(Map<String,Object> map);
    /**
     * ���ϵؿ����
     */
    public String P_gddk_zf(Map<String,Object> map);
    /**
     * ���ݵؿ�ID��ȡ��Ӧ����
     */
    public List<DFW01_D> SelectByDDJ02_D_JFID(Map<String,Object> map);
    /**
     * ���ҵؿ��ȫ������
     */
    public List<DFW01_D> SelectAllList(Map<String,Object> map);
    /**
     * ��ȡ��Ӧ��������
     */
    public int getCount(Map<String,Object> map);
//----------------------------------------------------------------------------
    /**
     * �ֻ��ӿ�
     */
    public List<DFW01_D> SelectByYHList(Map<String,Object> map);
    /**
     * ��Ӧ����
     */
    public int getCountByYHSize(Map<String,Object> map);
}
