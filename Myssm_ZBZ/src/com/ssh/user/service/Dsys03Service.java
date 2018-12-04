package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.Dsys03;

public interface Dsys03Service {
/**
 * 获取全部角色
 */
public List<Dsys03> SelectAllList();
/**
 * 根据部门编码获取id
 * 
 */
public List<Integer> SelectByBm(String bm);
/**
 * 插入角色
 */
public void insertJS(Dsys03 dsys03);
/**
 * 去往更新页面
 */
public Dsys03 SelectByJfid(int JFID);
/**
 * 更新要更新信息
 */
public void upInfo(Dsys03 dsys03);
}
