package com.ssh.user.service;

import com.ssh.user.model.DDJ02_DDJ01;

public interface DDJ02_DDJ01Service {
	/**
	 * ����һ������
	 */
	public void insedd02_d(DDJ02_DDJ01 dDJ02_DDJ01);
	/**
	 * ��ȡ��ǰ�û���֯�µ� DDJ02_JFID��ȵ�����
	 */
	public DDJ02_DDJ01 SelectByZZID(String DDJ01_JFID,String DDJ02_JFID);
	/**
	 * ���¶�Ӧ����
	 */
	public void upsj(DDJ02_DDJ01 dDJ02_DDJ01);
	/**
	 * ɾ����ǰ��֯�µ��ֻ���ϵɾ��
	 */
	public void delgxb(DDJ02_DDJ01 dDJ02_DDJ01);
}
