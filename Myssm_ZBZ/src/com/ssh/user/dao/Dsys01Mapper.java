package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.Dsys01;
import com.ssh.user.model.Dsys11;

public interface Dsys01Mapper {
	/**
	 * 根据分页获取对应集合
	 * @param map
	 * @return
	 */
	public List<Dsys01> SelectAllPage(Map<String, Object> map);
	/**
	 * 获取对应集合的数量
	 * @param map
	 * @return
	 */
	public int GetCount(Map<String, Object> map);
	/**
	 * 手机植保站 植保站人员 的集合
	 * @param map
	 * @return
	 */
	public List<Dsys01> SelectAllByxxdblb(Map<String, Object> map);
	/**
	 * 手机植保站 植保站人员集合
	 * @param map
	 * @return
	 */
	public int GetCountByZBZ(Map<String, Object> map);
	/**
	 * 植保站的集合
	 */
	public List<Dsys01> SelectAllPage_ZBZ(Map<String, Object> map);
}
