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
}
