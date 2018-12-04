package com.ssh.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.DFW11_DMapper;
import com.ssh.user.model.DFW11_D;
import com.ssh.user.service.DFW11_DService;

@Service("dFW11_DService")
public class DFW11_DServiceImpl implements DFW11_DService {
	@Autowired
	private DFW11_DMapper dFW11_DMapper;

	@Override
	public List<DFW11_D> SelectByFatherID(String DFW11_JFID) {
		return dFW11_DMapper.SelectByFatherID(DFW11_JFID);
	}

	@Override
	public void insert(DFW11_D dFW11_D) {
		dFW11_DMapper.insert(dFW11_D);
	}

	@Override
	public void delete(String DFW11_JFID) {
		dFW11_DMapper.delete(DFW11_JFID);
	}

	@Override
	public void deleteByJFID(String JFID) {
		dFW11_DMapper.deleteByJFID(JFID);
	}
}
