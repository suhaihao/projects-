package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW01_D;

public interface DFW01_DMapper {
	/**
	 * ����һ������
	 */
	public void insAdd(DFW01_D dFW01_D);
	/**
	 * ����DFW01_JFID��ȡ��Ӧ����
	 */
	public List<DFW01_D> SelectByID(String DFW01_JFID);
	/**
	 * ����ID��ȡΨһ����
	 */
	public List<DFW01_D> SelectByJFID(String JFID);
	/**
	 * ����DFW01_JFID
	 */
	public void delByDFW01ID(String DFW01_JFID);
	/**
	 * ���µؿ���Ϣ
	 */
	public void upDKXX(DFW01_D dFW01_D);
	/**
	 * ����IDɾ��һ������
	 */
	public void delDK(String JFID);
	/**
	 * �ؿ��깤���ù���
	 */
	public String p_gddk_wg(Map<String,Object> map);
	/**
	 * ���ϵؿ�
	 */
	public String P_gddk_zf(Map<String,Object> map);
	/**
	 * ���ݵؿ�ID��ȡ��Ӧ����
	 */
	public List<DFW01_D> SelectByDDJ02_D_JFID(Map<String,Object> map);
	/**
	 * ���Ҷ�Ӧ�ؿ�ļ��Ϸ��μ���
	 */
	public List<DFW01_D> SelectAllList(Map<String, Object> map);
	/**
     * ��ȡ��Ӧ��������
     */
    public int getCount(Map<String,Object> map);
//----------------------------------------------------------------------------\
    /**
     * �ֻ��ӿڵؿ��ѯ
     * @param map
     * @return
     */
    public List<DFW01_D> SelectByYHList(Map<String, Object> map);
    /**
     * ���ȫ�����û��ؿ�����
     * @param map
     * @return
     */
    public int getCountByYHSize(Map<String, Object> map);
}
