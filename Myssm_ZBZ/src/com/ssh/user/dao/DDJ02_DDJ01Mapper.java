package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DDJ02_D;
import com.ssh.user.model.DDJ02_DDJ01;

public interface DDJ02_DDJ01Mapper {
	/**
	 * 插入一条数据
	 */
	public void insddj02_d(DDJ02_DDJ01 dDJ02_DDJ01);
	/**
	 * 获取当前用户组织下的 id数据
	 */
	public List<DDJ02_DDJ01> selectByZZBYID(String DDJ02_JFID);
	/**
	 * 更新对应数据
	 */
	public void updysj(DDJ02_DDJ01 dDJ02_DDJ01);
	/**
	 * 删除对应的关系表
	 */
	public void delgxb(DDJ02_DDJ01 dDJ02_DDJ01);
}
