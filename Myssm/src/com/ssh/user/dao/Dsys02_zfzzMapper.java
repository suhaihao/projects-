package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.Dsys02_zfzz;

/**
 * ���Ĵ���ӿ�
 */
public interface Dsys02_zfzzMapper {
	/**
	 * ��ѯȫ������Ϣ
	 */
	public List<Dsys02_zfzz> SelectByBmMenu(Map<String,String> map);
	/**
	 * ��ɫȨ�޻�ȡ�˵�
	 */
	public List<Dsys02_zfzz> SelectAllByQXMenu();
	/**
	 *  ��ȡȫ���˵�
	 */
	public List<Dsys02_zfzz> SelectAllMenu();
}
 
