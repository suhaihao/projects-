package com.ssh.user.service;

import java.util.List;

import com.ssh.user.model.DDJ11;
import com.ssh.user.model.DDJ12;
import com.ssh.user.util.Page;

public interface DDJ12Service {
/**
 * 根据名字查询
 */
public DDJ12 selectByName(String name);
/**
 * 插入一条数据
 */
public String inserddj12(DDJ12 dDJ12);
/**
 * 带条件查询返回集合
 */
public List<DDJ12> SelectctByTJ(Page page,String mc,String fl);
/**
 * 获取全部集合个数
 */
public int getcount();
/**
 * 获取全部集合带分页
 */
public  List<DDJ12> SelectctAllList(Page page);
/**
 * 根据id查询出对应数据
 */
public DDJ12 selsctByid(String id);
}
