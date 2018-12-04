package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DSYS05;
import com.ssh.user.model.Dsys01;

public interface Dsys01Mapper {
	/**
	 * ���ݷ�ҳ��ȡ��Ӧ����
	 * @param map
	 * @return
	 */
	public List<Dsys01> SelectAllPage(Map<String, Object> map);
	/**
	 * ��ȡ��Ӧ���ϵ�����
	 * @param map
	 * @return
	 */
	public int GetCount(Map<String, Object> map);
	/**
	 * �ֻ�ֲ��վ ֲ��վ��Ա �ļ���
	 * @param map
	 * @return
	 */
	public List<Dsys01> SelectAllByxxdblb(Map<String, Object> map);
	/**
	 * �ֻ�ֲ��վ ֲ��վ��Ա����
	 * @param map
	 * @return
	 */
	public int GetCountByZBZ(Map<String, Object> map);
	/**
	 * ֲ��վ�ļ���
	 */
	public List<Dsys01> SelectAllPage_ZBZ(Map<String, Object> map);
	/**
	 * ��ȡ����dsys05
	 */
	public List<DSYS05> selectBysys05(Map<String, Object> map);
}
