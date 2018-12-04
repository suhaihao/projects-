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
public int SelectByBm(String bm);
}
