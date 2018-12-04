package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ03;
import com.ssh.user.model.Dsys10;
import com.ssh.user.model.Dsys11;

public interface Dsys11Service {
	/**
	 * ���ݱ�������ȡ��Ӧ��Ϣ
	 * 
	 */
	public Dsys11 SeleBybm(String bmlb, String bm);

	/**
	 * �����������Ӧ����
	 */
	public List<Dsys11> SelecetAllBM(String bmlb);

	/**
	 * ��ȡ���񼯺�
	 */
	public List<Dsys11> selectAllFw();

	/**
	 * ��ȡ���δ�ʩ���༯��
	 */
	public List<Dsys11> selectAllfzcsfl();

	/**
	 * ��ѯ���ۼ���
	 */
	public List<Dsys11> selectAllDj();

	/**
	 * ����bm��ѯһ����λ
	 */
	public Dsys11 seletBbmDw(String bm);

	/**
	 * ��ѯ��ͼ�е���Ŀ
	 */
	public List<DDJ03> SelectAllST();

	// ---------------------------------------------------------------------------
	/**
	 * ��ѯdsys10ȫ�����ݴ���ҳ
	 * @param map
	 * @return
	 */
	public List<Dsys10> SelectDsys10(Map<String, Object> map);
	/**
	 * ��ȡdsys10ȫ����������
	 * @param map
	 * @return
	 */
	public int getDsys10Count(Map<String, Object> map);
	/**
	 * ��ѯDsys11ȫ�����ݴ���ҳ
	 */
	public List<Dsys11> SelectDsys11(Map<String, Object> map);
	/**
	 * ��ȡdsys10ȫ����������
	 * @param map
	 * @return
	 */
	public int getDsys11Count(Map<String, Object> map);
	/**
	 * �鿴�����Ƿ��ظ�
	 * @param BM
	 * @param BMLB
	 * @return
	 */
	public Dsys11 SelectByBM_BMLB(String BM,String BMLB);
	/**
	 * ����dsys11
	 * @param dsys11
	 */
	public void insert(Dsys11 dsys11);
	/**
	 * ����JFID��ѯΨһ����
	 * @param JFID
	 * @return
	 */
	public Dsys11 SelectByJFID(String JFID);
	/**
	 * ��������
	 * @param dsys11
	 */
	public void update(Dsys11 dsys11);
	/**
	 * ����IDɾ������
	 * @param JFID
	 */
	public void delete(String JFID);
}
