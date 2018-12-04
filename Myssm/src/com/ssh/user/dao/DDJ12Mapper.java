package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ11;
import com.ssh.user.model.DDJ12;
import com.ssh.user.util.Page;

public interface DDJ12Mapper {
/**
 * �������ֲ�ѯ�������
 */
public DDJ12 selectByName(String name);
/**
 * ����һ������
 */
public String inddj12(Map<String,Object> map);
/**
 * ����������ѯ���ض�Ӧ����
 */
public List<DDJ12> SelectctByTJ(Map<String,Object> map);
/**
 * ��ȡ���ϸ���
 */
public int getcount();
/**
 * ���������ϴ���ҳ
 */
public List<DDJ12> SelectctAlllist(Page page);
/**
 * ����id��ѯ�������
 */
public DDJ12 selectById(String id);
}
