package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.User;
import com.ssh.user.util.Page;



/**
 * userDAO
 * @author 
 * @date   
 */
public interface UserMapper {
	/**
	 * �������������û�
	 */
	public User SelectByName(String name);
	/**
	 * ���ȫ���û�
	 */
	public List<User> SelectAllUser(Map<String,Object> map);
	/**
	 * ����û�
	 */
	public void addUser(User user);
	/**
	 * ����ID�����û���Ϣ
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
	 * ��ȡ����������������
	 */
	public int getAllUserSizeByTj(String JFNAME,String DDJ01_JFID);
	/**
	 * �����û���Ϣ
	 */
	public void uppasword(User user);
	/**
	 * �������ֻ�ȡ�û�����
	 */
	public List<User> SelectByNameAll(Map<String,Object> map);
	/**
	 * ��ȡ��Ӧ���ϴ���һ��map
	 */
	public List<User> SelectAllList(Map<String,Object> map);
	/**
	 * ��ȡ���ϵ���������һ��map
	 * @param map
	 * @return
	 */
	public int getCountAllSize(Map<String,Object> map);
	/**
	 * ҹ����²�ѯ����
	 */
	public User SelectByZFZZ(String DDJ01_JFID);
//--------------------------------------------------------------------------
	/**
	 * �ֻ��˸������ר����֯��ȡ��Ӧ����
	 * @param map
	 * @return
	 */
	public List<User> SelectByLBZZ(Map<String, Object> map);
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
 
