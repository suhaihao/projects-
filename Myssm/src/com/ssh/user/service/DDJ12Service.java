package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.DDJ11;
import com.ssh.user.model.DDJ12;
import com.ssh.user.util.Page;

public interface DDJ12Service {
/**
 * �������ֲ�ѯ
 */
public DDJ12 selectByName(String name);
/**
 * ����һ������
 */
public String inserddj12(DDJ12 dDJ12);
/**
 * ��������ѯ���ؼ���
 */
public List<DDJ12> SelectctByTJ(Page page,String mc,String fl);
/**
 * ��ȡȫ�����ϸ���
 */
public int getcount();
/**
 * ��ȡȫ�����ϴ���ҳ
 */
public  List<DDJ12> SelectctAllList(Page page);
/**
 * ����id��ѯ����Ӧ����
 */
public DDJ12 selsctByid(String id);
}
