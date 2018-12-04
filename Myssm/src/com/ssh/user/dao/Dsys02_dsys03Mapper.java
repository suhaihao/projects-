package com.ssh.user.dao;

import java.util.List;

import com.ssh.user.model.Dsys02_dsys03;

public interface Dsys02_dsys03Mapper {
/**
 * 插入中间表
 */
public void InZJB(Dsys02_dsys03 dsys02_dsys03);
/**
 * 删除数据
 */
public void delByfatherId(int father,int ddj01_jfid);
/**
 * 根据father获取对应id
 */
public List<Integer> SelectByfather(int father,int ddj01_jfid);
}
