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
public List<Integer> SelectByBm(String bm);
/**
 * �����ɫ
 */
public void insertJS(Dsys03 dsys03);
/**
 * ȥ������ҳ��
 */
public Dsys03 SelectByJfid(int JFID);
/**
 * ����Ҫ������Ϣ
 */
public void upInfo(Dsys03 dsys03);
}
