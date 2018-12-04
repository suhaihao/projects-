package com.ssh.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.DDJ01Mapper;
import com.ssh.user.model.DDJ01;
import com.ssh.user.model.DDJ01_D;
import com.ssh.user.service.DDJ01Service;
import com.ssh.user.util.Page;
@Service("dDJ01Service")
public class DDJ01ServiceImpl implements DDJ01Service{
	@Autowired
	private DDJ01Mapper dDJ01Mapper;
	@Override
	public List<DDJ01> selectByUserid(Page page,String ddj01id) {
		synchronized (this) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("max", page.getMax());
		map.put("min", page.getMin());
		map.put("ddj01id",ddj01id);
		return dDJ01Mapper.SelectByUserId(map);
		}
	}
	@Override
	public int getSizeByUser(String jfid) {
		return dDJ01Mapper.getALLByuser(jfid);
	}
	@Override
	public List<DDJ01> SelectByDD01ID(String ddj01id) {
		return dDJ01Mapper.selectByDDJ01id(ddj01id);
	}
	@Override
	@Transactional
	public void updd01Byid(DDJ01 dDJ01) {
		dDJ01Mapper.upByID(dDJ01);
	}
	@Override
	@Transactional
	public void insdd_d(DDJ01_D dDJ01_D) {
		dDJ01Mapper.ins_d(dDJ01_D);
	}
	@Override
	public List<DDJ01_D> SelectByDDID(String dd01jfid) {
		return dDJ01Mapper.selectBydd01id(dd01jfid);
	}
	@Override
	@Transactional
	public void delAllfw(String dd01jfid) {
		dDJ01Mapper.delAllfw(dd01jfid);
	}
	@Override
	public DDJ01 SelectByID(String ddj01id) {
		return dDJ01Mapper.SelectByID(ddj01id);
	}
	@Override
	public List<DDJ01> SelectAlllSize() {
		return dDJ01Mapper.SelectAlllSize();
	}
//--------------------------------------------------------------------------
	@Override
	public List<DDJ01> PhoneSelectByPage(Map<String, Object> map) {
		return dDJ01Mapper.PhoneSelectByPage(map);
	}
	@Override
	public int PhoneGetCount(Map<String, Object> map) {
		return dDJ01Mapper.PhoneGetCount(map);
	}
	@Override
	public DDJ01 SelectBYJFID(String JFID) {
		return dDJ01Mapper.SelectBYJFID(JFID);
	}
	@Override
	public List<DDJ01> SelectAll_ZBZ(Map<String, Object> map) {
		return dDJ01Mapper.SelectAll_ZBZ(map);
	}
	@Override
	public int getCount(Map<String, Object> map) {
		return dDJ01Mapper.getCount(map);
	}
	@Override
	public String getJFID() {
		return dDJ01Mapper.getJFID();
	}
	@Override
	public void insertInfo(DDJ01 dDJ01) {
		dDJ01Mapper.insertInfo(dDJ01);
	}
	@Override
	public void updatePassword(String JFUSERID, String JFPASSWORD) {
		dDJ01Mapper.updatePassword(JFUSERID, JFPASSWORD);
	}
	@Override
	public void deleteZFZZ(String JFID) {
		dDJ01Mapper.deleteZFZZ(JFID);
	}
	@Override
	public List<DDJ01> SelectAllZFZZ(Map<String, Object> map) {
		return dDJ01Mapper.SelectAllZFZZ(map);
	}
	@Override
	public void upzfzz(String JFID,String JFUSERID) {
		dDJ01Mapper.upzfzz(JFID,JFUSERID);
	}
	@Override
	public List<DDJ01> SelectByZT(Map<String, Object> map) {
		return dDJ01Mapper.SelectByZT(map);
	}
	@Override
	public int getCountByZT(Map<String, Object> map) {
		return dDJ01Mapper.getCountByZT(map);
	}
	
}
