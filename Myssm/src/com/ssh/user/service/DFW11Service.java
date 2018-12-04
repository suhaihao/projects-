package com.ssh.user.service;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW11;

public interface DFW11Service {
	/**
	 * 根据带分页获取提交集合有条件
	 * @param map
	 * @return
	 */
	public List<DFW11> SelectByPageAll(Map<String, Object> map);
	/**
	 * 获取对应集合的数量
	 * @param map
	 * @return
	 */
	public int GetCount(Map<String,Object> map);
	/**
	 * 根据ID获取唯一数据
	 * @param JFID
	 * @return
	 */
	public DFW11 SelectByJfid(String JFID);
}
