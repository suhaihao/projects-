package com.ssh.user.service;

import com.ssh.user.model.DDJ02_DDJ01;

public interface DDJ02_DDJ01Service {
	/**
	 * 插入一条数据
	 */
	public void insedd02_d(DDJ02_DDJ01 dDJ02_DDJ01);
	/**
	 * 获取当前用户组织下的 DDJ02_JFID相等的数据
	 */
	public DDJ02_DDJ01 SelectByZZID(String DDJ01_JFID,String DDJ02_JFID);
	/**
	 * 更新对应数据
	 */
	public void upsj(DDJ02_DDJ01 dDJ02_DDJ01);
	/**
	 * 删除当前组织下的手机关系删除
	 */
	public void delgxb(DDJ02_DDJ01 dDJ02_DDJ01);
}
