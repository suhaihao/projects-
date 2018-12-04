package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.DDJ03;
import com.ssh.user.model.Dsys11;

public interface Dsys11Mapper {
	/**
	 * �������Ͳ�ѯ���ض���
	 */
	public Dsys11 SeleBybm(String bmlb, String bm);
	/**
	 * �����������Ӧ�ļ���
	 */
	public List<Dsys11> SelectAllList(String bmlb);
	/**
	 * ��ȡ������ؼ���
	 */
	public List<Dsys11> SelectAllFW();
	/**
	 * ��÷��δ�ʩ����
	 */
	public List<Dsys11> SelectAllfzcsfl();
	/**
	 * ��ȡ���ۼ���
	 */
	public List<Dsys11> SelectAllDj();
	/**
	 * ����bm��ѯһ����λ
	 */
	public Dsys11 SelectByBmDw(String bm);
	/**
	 * ��ȡDDJ03��ȫ������
	 */
	public List<DDJ03> SelectAllST();
}
