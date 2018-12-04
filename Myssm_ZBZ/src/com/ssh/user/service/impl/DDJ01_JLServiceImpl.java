package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.DDJ01_JLMapper;
import com.ssh.user.dao.DDJ01_PJMapper;
import com.ssh.user.model.DDJ01_JL;
import com.ssh.user.model.DDJ01_PJ;
import com.ssh.user.service.DDJ01_JLService;
import com.ssh.user.service.DDJ01_PJService;

@Service("dDJ01_JLService")
public class DDJ01_JLServiceImpl implements DDJ01_JLService {
	@Autowired
	private DDJ01_JLMapper dDJ01_JLMapper;

	@Override
	public int getCount(Map<String, Object> map) {
		return dDJ01_JLMapper.getCount(map);
	}

	@Override
	public List<DDJ01_JL> SelectByDDJ01_JFID(Map<String, Object> map) {
		return dDJ01_JLMapper.SelectByDDJ01_JFID(map);
	}

	@Override
	public void insert(DDJ01_JL dDJ01_JL) {
		dDJ01_JLMapper.insert(dDJ01_JL);
	}

	@Override
	public String getJFID() {
		return dDJ01_JLMapper.getJFID();
	}

	@Override
	public DDJ01_JL SelectById(String JFID) {
		return dDJ01_JLMapper.SelectById(JFID);
	}

	@Override
	public void update(DDJ01_JL dDJ01_JL) {
		dDJ01_JLMapper.update(dDJ01_JL);
	}

	@Override
	public void delete(String JFID) {
		dDJ01_JLMapper.delete(JFID);
	}

}
