package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.Dsys01_dsys03;

public interface DSYS01_DSYS03Mapper {
	/**
	 * �����Ӧ����
	 */
	public void insertJS(Dsys01_dsys03 dsys01_dsys03);
	/**
	 * ����IDɾ��ȫ������
	 */
	public void delAll(int JFID);
	/**
	 * ��ѯ��ؽ�ɫ����
	 */
	public List<Dsys01_dsys03> SelectByJS(String JFID);
}
