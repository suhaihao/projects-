package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.Dsys02_zfzz;

/**
 * ���Ĵ���ӿ�
 */
public interface Dsys02_zfzzMapper {
	/**
	 * ��ѯȫ������Ϣ
	 */
	public List<Dsys02_zfzz> SelectByBmMenu(int Dsys03id);
	/**
	 * ��ɫȨ�޻�ȡ�˵�
	 */
	public List<Dsys02_zfzz> SelectAllByQXMenu();
	/**
	 *  ��ȡȫ���˵�
	 */
	public List<Dsys02_zfzz> SelectAllMenu();
}
 
