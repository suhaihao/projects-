package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.DSYS05;

public interface DSYS05Service {
	/**
	 * ��ѯȫ������
	 * @return
	 */
	public List<DSYS05> SelectAllBM();
	/**
	 * ����BM��ѯΪΨһ����
	 */
	public DSYS05 SelectByBM(String BMBM);
	/**
	 * ���ݸ��ಿ�Ų�ѯ�������
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
	 */
	public void upInfo(DSYS05 dSYS05);
}
