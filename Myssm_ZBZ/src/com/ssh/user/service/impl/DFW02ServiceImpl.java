package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.DFW02Mapper;
import com.ssh.user.model.DFW02;
import com.ssh.user.service.DFW02Service;

@Service("dFW02Service")
public class DFW02ServiceImpl implements DFW02Service {
	@Autowired
	private DFW02Mapper dFW02Mapper;

	@Override
	public List<DFW02> SelectByTXRQList() {
		return dFW02Mapper.SelectByTXRQList();
	}

	@Override
	public int getCountLL(Map<String, Object> map) {
		return dFW02Mapper.getCountLL(map);
	}

	@Override
	public List<DFW02> SelectByLLList(Map<String, Object> map) {
		return dFW02Mapper.SelectByLLList(map);
	}

	@Override
	public DFW02 SelectByJFID(String JIFD) {
		return dFW02Mapper.SelectByJFID(JIFD);
	}

	@Override
	@Transactional
	public String p_gd_pj(Map<String, Object> map) {
		return dFW02Mapper.p_gd_pj(map);
	}

	@Override
	public List<DFW02> SelectByTimeDddj01Dddj02(Map<String, Object> map) {
		return dFW02Mapper.SelectByTimeDddj01Dddj02(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return dFW02Mapper.getCount(map);
	}

	@Override
	public List<DFW02> SelectFWXGTJ1(Map<String, String> map) {
		return dFW02Mapper.SelectFWXGTJ1(map);
	}

	@Override
	public List<DFW02> SelectFWXGTJ2(Map<String, String> map) {
		return dFW02Mapper.SelectFWXGTJ2(map);
	}

	@Override
	public List<DFW02> SelectFWXGTJ3(Map<String, String> map) {
		return dFW02Mapper.SelectFWXGTJ3(map);
	}

	@Override
	public DFW02 SelectFWXGTJHJ(Map<String, String> map) {
		return dFW02Mapper.SelectFWXGTJHJ(map);
	}
}
