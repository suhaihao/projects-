package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.DFW11Mapper;
import com.ssh.user.model.DFW11;
import com.ssh.user.service.DFW11Service;

@Service("dFW11Service")
public class DFW11ServiceImpl implements DFW11Service {
	@Autowired
	private DFW11Mapper dFW11Mapper;

	@Override
	public List<DFW11> SelectByPageAll(Map<String, Object> map) {
		return dFW11Mapper.SelectByPageAll(map);
	}

	@Override
	public int GetCount(Map<String, Object> map) {
		return dFW11Mapper.GetCount(map);
	}

	@Override
	public DFW11 SelectByJfid(String JFID) {
		return dFW11Mapper.SelectByJfid(JFID);
	}
}
