package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.Dsys02_zfzz;

public interface Dsys02_zfzzService {
	/**
	 * ��ѯȫ���˵�
	 */
	public List<Dsys02_zfzz> SelectByBmMenu(Map<String,String> map);
	/**
	 * ��ɫȨ�޻�ȡ��Ӧ�˵�
	 */
	public List<Dsys02_zfzz> SelectAllQXMenu();
	/**
	 * ��ȡȫ���Ĳ˵�
	 */
	public List<Dsys02_zfzz> SelectAllMenu();
	
}
