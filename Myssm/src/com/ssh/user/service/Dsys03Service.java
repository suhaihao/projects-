package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.Dsys03;

public interface Dsys03Service {
/**
 * ��ȡȫ����ɫ
 */
public List<Dsys03> SelectAllList();
/**
 * ���ݲ��ű����ȡid
 * 
 */
public int SelectByBm(String bm);
}
