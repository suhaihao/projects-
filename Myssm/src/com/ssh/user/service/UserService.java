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
	 * ��ȡȫ���û��û�
	 */
	public List<User> SelectAllUser(Page page,String DDJ01_JFID);
	/**
	 * �����û�
	 */
	public void addUser(User user);
	/**
	 * ����id�����û�
	 */
	public User SelectById(String id);
	/**
	 * �����û���Ϣ
	 */
	public void UpUser(User user);
	/**
	 * �ֻ������û���Ϣ
	 */
	public void UpUserphone(User user);
	/**
	 * ����IDɾ���û�
	 */
	public void delUser(String id);
	/**
	 * ��ȡ�û���ȫ����������
	 */
	public int getAllUserSize(String DDJ01_JFID);
	/**
	 * ��ȡ�����ļ�������
	 */
	public int getAllUserSizeByTJ(String JFNAME,String DDJ01_JFID);
	/**
	 * �޸��û�����
	 */
	public void uppasword(User user);
	/**
	 * ��������ģ����ѯ����ҳ
	 */
	public List<User> SelectByName(Page page,String name,String DDJ01_JFID);
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
	public String SelectByQx(Map<String,String> map);
	
}
 
