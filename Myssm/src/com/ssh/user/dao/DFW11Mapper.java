package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DFW11;

public interface DFW11Mapper {
	/**
	 * 获取对应集合带分页状态为提交有条件
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
