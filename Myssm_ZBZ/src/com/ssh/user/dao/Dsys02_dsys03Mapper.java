package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.Dsys02_dsys03;

public interface Dsys02_dsys03Mapper {
/**
 * �����м��
 */
public void InZJB(Dsys02_dsys03 dsys02_dsys03);
/**
 * ɾ������
 */
public void delByfatherId(int father);
/**
 * ����father��ȡ��Ӧid
 */
public List<Integer> SelectByfather(int father);
}
