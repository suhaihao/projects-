package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.DSYS05;

public interface DSYS05Mapper {
	/**
	 * ��ѯ����ĩ���ļ���
	 * @param BMJC
	 * @param BMBM
	 * @return
	 */
	public List<DSYS05> SelectAllBM();
	/**
	 * ����BM��ѯΪΨһ����
	 */
	public DSYS05 SelectByBM(String BMBM);
	/**
	 * ���ݸ���BM��ѯ�������
	 */
	public List<DSYS05> SelectByFather(String BMBM,String BMJC);
	/**
	 * ����ID��ѯ������
	 */
	public DSYS05 SelectByJFID(int JFID);
	/**
	 * ����һ������
	 */
	public void instInfo(DSYS05 dSYS05);
	/**
	 * �޸�һ������
	 * @param dSYS05
	 */
	public void upInfo(DSYS05 dSYS05);
}
