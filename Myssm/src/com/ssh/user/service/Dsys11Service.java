package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.DDJ03;
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
}
