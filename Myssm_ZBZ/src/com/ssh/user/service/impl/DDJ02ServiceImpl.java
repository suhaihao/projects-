package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.DDJ02Mapper;
import com.ssh.user.model.DDJ02;
import com.ssh.user.service.DDJ02Service;

@Service("dDJ02Service")
public class DDJ02ServiceImpl implements DDJ02Service {
	@Autowired
	private DDJ02Mapper dDJ02Mapper;

	@Override
	public List<DDJ02> selectByZzPage(Map<String,Object> map) {
		return dDJ02Mapper.SelectByZZPage(map);
	}

	@Override
	public int getCount() {
		return dDJ02Mapper.getCount();
	}

	@Override
	public DDJ02 selectbyZZ(String ddj01_jfid, String yhm) {
		return dDJ02Mapper.SelectByzz(ddj01_jfid, yhm);
	}

	@Override
	public List<DDJ02> selecByYHM(String yhm) {
		return dDJ02Mapper.selectByYHM(yhm);
	}

	@Override
	public List<DDJ02> selectByBDZZ(String ddj01_jfid, String yhm) {
		return dDJ02Mapper.SelectByBDZZ(ddj01_jfid, yhm);
	}

	@Override
	@Transactional
	public void insddj02(DDJ02 dDJ02) {
		dDJ02Mapper.insddj02(dDJ02);
	}

	@Override
	public String getID() {
		return dDJ02Mapper.getID();
	}

	@Override
	public List<DDJ02> SelectByID(String id) {
		return dDJ02Mapper.selectByID(id);
	}

	@Override
	@Transactional
	public void upnhxx(DDJ02 dDJ02) {
		dDJ02Mapper.upddj02(dDJ02);
	}

	@Override
	public void uppassword(DDJ02 dDJ02) {
		dDJ02Mapper.uppasword(dDJ02);
	}

	@Override
	public DDJ02 SelectByYHMOne(String YHM) {
		return dDJ02Mapper.SelectByYHMOne(YHM);
	}

	@Override
	@Transactional
	public void upToken(DDJ02 dDJ02) {
		dDJ02Mapper.uoToken(dDJ02);
	}

	@Override
	public int getCountByTj(String MC) {
		return dDJ02Mapper.getCountByTj(MC);
	}

	@Override
	public List<DDJ02> SelectAllSize(Map<String, Object> map) {
		return dDJ02Mapper.SelectAllSize(map);
	}

	@Override
	public int GetCount(Map<String, Object> map) {
		return dDJ02Mapper.GetCount(map);
	}

	@Override
	public List<DDJ02> SelectTJ(Map<String, Object> map) {
		return dDJ02Mapper.SelectTJ(map);
	}

	@Override
	public List<DDJ02> SelectTJ2(Map<String, Object> map) {
		return dDJ02Mapper.SelectTJ2(map);
	}

	@Override
	public List<DDJ02> SelectTJ3(Map<String, Object> map) {
		return dDJ02Mapper.SelectTJ3(map);
	}

	@Override
	public DDJ02 SelectHj(Map<String, Object> map) {
		return dDJ02Mapper.SelectHj(map);
	}

	@Override
	public List<DDJ02> SelectAllSizeBySJ(Map<String, Object> map) {
		return dDJ02Mapper.SelectAllSizeBySJ(map);
	}

	@Override
	public int getCountBySJ() {
		return dDJ02Mapper.getCountBySJ();
	}

	@Override
	public List<DDJ02> SelectAll(Map<String, Object> map) {
		return dDJ02Mapper.SelectAll(map);
	}

	@Override
	public int getCountSelectAll(Map<String,Object> map) {
		return dDJ02Mapper.getCountSelectAll(map);
	}

	@Override
	public List<DDJ02> SelectTJ4(Map<String, Object> map) {
		return dDJ02Mapper.SelectTJ4(map);
	}
}
