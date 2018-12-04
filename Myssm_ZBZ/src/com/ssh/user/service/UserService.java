package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.User;
import com.ssh.user.util.Page;




/**
 * �û�����
 * @author Ljh
 *
 */

public interface UserService {

	/**
	 * �����û�����ѯ�û�
	 */
	public User SelectByName(String name);
	/**
	 * �����û�����ѯ�û�ZFZZ�����
	 */
	public User SelectByName_zfzz(String name);
	/**
	 * ��ȡȫ���û��û�
	 */
	public List<User> SelectAllUser(Page page);
	/**
	 * �����û�
	 */
	public void addUser(User user);
	/**
	 * ����id�����û�
	 */
	public User SelectById(String id);
	/**
	 * ����id�����û�zfzz
	 */
	public User SelectByIdZFZZ(String id);
	/**
	 * �����û���Ϣ
	 */
	public void UpUser(User user);
	/**
	 * ����IDɾ���û�
	 */
	public void delUser(String id);
	/**
	 * ��ȡ�û���ȫ����������
	 */
	public int getAllUserSize();
	/**
	 * ��ȡ�����ļ�������
	 */
	public int getAllUserSizeByTJ(String JFNAME);
	/**
	 * �޸��û�����
	 */
	public void uppasword(User user);
	/**
	 * ��������ģ����ѯ����ҳ
	 */
	public List<User> SelectByName(Page page,String name);
	/**
	 * ��ȡȫ�����ϴ���һ��map
	 */
	public List<User> SelectAllList(Map<String,Object> map);
	/**
	 * ��ȡ��Ӧ������������һ��map
	 */
	public int getCountAllSize(Map<String,Object> map);
	/**
	 * ҹ����²�ѯ����
	 */
	public User SelectByZFZZ(String DDJ01_JFID);
//---------------------------------------------------------------------------
	/**
	 * ����ר����֯������ȡ��Ӧ����
	 */
	public List<User> SelectByLBZZ(Map<String,Object> map);
	/**
	 * �Ϸ�����Ӧ��������
	 */
	public int getCountByzz(Map<String,Object> map);
//---------------------------------------------------------------------------
	/**
	 * ��½Ȩ���ж�
	 */
	public String SelectByQx(int JFID);
	/**
	 * ������֯����һ��ר����֯��Ϣ
	 * @param user
	 */
	public void insertZFZZ(User user);
	/**
	 * ����ר����֯IDɾ���û�
	 * @param DDJ01_JFID
	 */
	public void deleteByZFZZ(String DDJ01_JFID);
	/**
	 * ����ר����֯ID��ѯ��ԱΪ99��
	 * @param DDJ01_JFID
	 * @return
	 */
	public  User SelectByZFZZBy99(String DDJ01_JFID);
}
 
