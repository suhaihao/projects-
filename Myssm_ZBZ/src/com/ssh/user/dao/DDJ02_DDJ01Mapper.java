package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ02;
import com.ssh.user.model.DDJ02_D;
import com.ssh.user.model.DDJ02_DDJ01;

public interface DDJ02_DDJ01Mapper {
	/**
	 * ����һ������
	 */
	public void insddj02_d(DDJ02_DDJ01 dDJ02_DDJ01);
	/**
	 * ��ȡ��ǰ�û���֯�µ� id����
	 */
	public List<DDJ02_DDJ01> selectByZZBYID(String DDJ02_JFID);
	/**
	 * ���¶�Ӧ����
	 */
	public void updysj(DDJ02_DDJ01 dDJ02_DDJ01);
	/**
	 * ɾ����Ӧ�Ĺ�ϵ��
	 */
	public void delgxb(DDJ02_DDJ01 dDJ02_DDJ01);
}
