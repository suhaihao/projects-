package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.Dsys02_dsys03;

public interface Dsys02_dsys03Service {
/**
 * �����м��һ������
 */
public void indsys0203(Dsys02_dsys03 dsys02_dsys03);
/**
 * ����fatherIDɾ������
 */
public void deldsys0203(int father,int ddj01_jfid);
/**
 * ����father��ȡȫ������
 */
public List<Integer> SelectByfather(int father,int ddj01_jfid);
}
