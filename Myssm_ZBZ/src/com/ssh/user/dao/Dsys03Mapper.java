package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.Dsys03;

public interface Dsys03Mapper {
	/**
	 * ���ȫ������
	 */
	public List<Dsys03> SelectAllList();
	/**
	 * 
	 */
	public List<Integer> SelectByBm(String bm);
	/**
	 * �����ɫ
	 */
	public void insertJS(Dsys03 dsys03);
	/**
	 * ����ID��ѯ��Ӧ��Ϣ
	 * @param JFID
	 * @return
	 */
	public Dsys03 SelectByJfid(int JFID);
	/**
	 * ������Ϣ
	 * @param dsys03
	 */
	public void upInfo(Dsys03 dsys03);
}
