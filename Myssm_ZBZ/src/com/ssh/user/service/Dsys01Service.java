package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.Dsys01;

public interface Dsys01Service {
	/**
	 * ���ݷ�ҳ��ȡȫ������
	 * @param map
	 * @return
	 */
	public List<Dsys01> SelectAllPage(Map<String, Object> map);
	/**
	 * ��ȡ��Ӧ����
	 * @param map
	 * @return
	 */
	public int GetCount(Map<String,Object> map);
//---------------------------------------------------------------------------
	/**
	 * �ֻ���ֲ��վ ֲ��վ��Ա����
	 */
	public List<Dsys01> SelectAllByxxdblb(Map<String, Object> map);
	/**
	 * �ֻ���ֲ��վ ֲ��վ��Ա����
	 */
	public int GetCountByZBZ(Map<String, Object> map);
	/**
	 * ֲ��վ�ļ���
	 */
	public List<Dsys01> SelectAllPage_ZBZ(Map<String, Object> map);
}
