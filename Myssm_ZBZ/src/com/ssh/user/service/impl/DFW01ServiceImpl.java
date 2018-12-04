package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.DFW01Mapper;
import com.ssh.user.model.DFW01;
import com.ssh.user.model.FWTJ;
import com.ssh.user.service.DFW01Service;
@Service("dFW01Service")
public class DFW01ServiceImpl implements DFW01Service{
	@Autowired
	private DFW01Mapper dFW01Mapper;

	@Override
	public List<DFW01> SelectByPage(Map<String, Object> map) {
		return dFW01Mapper.selectByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return dFW01Mapper.getCount(map);
	}

	@Override
	@Transactional
	public void inDFW01(DFW01 dFW01) {
		dFW01Mapper.inDFW01(dFW01);
	}

	@Override
	public String getID() {
		return dFW01Mapper.getID();
	}

	@Override
	public DFW01 SelectByID(String JFID) {
		return dFW01Mapper.SelectByID(JFID);
	}

	@Override
	@Transactional
	public void updfw01(DFW01 dFW01) {
		dFW01Mapper.updfw01(dFW01);
	}

	@Override
	@Transactional
	public void UPJE(DFW01 dFW01) {
		dFW01Mapper.UPJE(dFW01);
	}

	@Override
	@Transactional
	public String p_gd_pd(Map<String, Object> map) {
		return dFW01Mapper.p_gd_pd(map);
	}

	@Override
	public void delzb(String JFID) {
		dFW01Mapper.delByID(JFID);
	}

	@Override
	public List<DFW01> SelectByPageZT(Map<String, Object> map) {
		return dFW01Mapper.selectByPageZT(map);
	}

	@Override
	public int getCountZT(Map<String, Object> map) {
		return dFW01Mapper.getCountZT(map);
	}

	@Override
	public String P_gd_wg(Map<String, Object> map) {
		return dFW01Mapper.P_gd_wg(map);
	}

	@Override
	public List<DFW01> SelectByPageZT4(Map<String, Object> map) {
		return dFW01Mapper.selectByPageZT4(map);
	}

	@Override
	public int getCountZT4(Map<String, Object> map) {
		return dFW01Mapper.getCountZT4(map);
	}

	@Override
	public List<DFW01> SelectByZt2() {
		return dFW01Mapper.SelectByZt();
	}

	@Override
	@Transactional
	public String p_gddk_begin(Map<String, Object> map) {
		return dFW01Mapper.p_gddk_begin(map);
	}

	@Override
	public List<FWTJ> TJSJ(Map<String, Object> map) {
		return dFW01Mapper.TJSJ(map);
	}

	@Override
	public FWTJ TJSJHJ(Map<String, Object> map) {
		return dFW01Mapper.TJSJHJ(map);
	}

	@Override
	public List<DFW01> TJSJclick(Map<String, Object> map) {
		return dFW01Mapper.TJSJclick(map);
	}

	@Override
	public int getcounTJSJclick(Map<String, Object> map) {
		return dFW01Mapper.getcounTJSJclick(map);
	}

	@Override
	public DFW01 SelectByJFID(Map<String, Object> map) {
		return dFW01Mapper.SelectByJFID(map);
	}

	@Override
	public List<DFW01> SelectByRqYh(String wcrq, String yhid) {
		return dFW01Mapper.SelectByRqYh(wcrq, yhid);
	}
	
}
