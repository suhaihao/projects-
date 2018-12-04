package com.ssh.user.dao;

import java.util.List;
import java.util.Map;

import com.ssh.user.model.DDJ11;
import com.ssh.user.model.DDJ12;
import com.ssh.user.util.Page;

public interface DDJ12Mapper {
/**
 * 根据名字查询相关数据
 */
public DDJ12 selectByName(String name);
/**
 * 插入一条数据
 */
public String inddj12(Map<String,Object> map);
/**
 * 根据条件查询返回对应集合
 */
public List<DDJ12> SelectctByTJ(Map<String,Object> map);
/**
 * 获取集合个数
 */
public int getcount();
/**
 * 无条件集合带分页
 */
public List<DDJ12> SelectctAlllist(Page page);
/**
 * 根据id查询相关数据
 */
public DDJ12 selectById(String id);
}
