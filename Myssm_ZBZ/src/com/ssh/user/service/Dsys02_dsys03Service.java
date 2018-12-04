package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.Dsys02_dsys03;

public interface Dsys02_dsys03Service {
/**
 * 插入中间表一条数据
 */
public void indsys0203(Dsys02_dsys03 dsys02_dsys03);
/**
 * 根据fatherID删除数据
 */
public void deldsys0203(int father);
/**
 * 根据father获取全部集合
 */
public List<Integer> SelectByfather(int father);
}
