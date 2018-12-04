package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.DDJ01_PJMapper;
import com.ssh.user.model.DDJ01_PJ;
import com.ssh.user.service.DDJ01_PJService;
@Service("dDJ01_PJService")
public class DDJ01_PJServiceImpl implements DDJ01_PJService{
	@Autowired
	private DDJ01_PJMapper dDJ01_PJMapper;

	@Override
	public int getCount(Map<String, Object> map) {
		return dDJ01_PJMapper.getCount(map);
	}

	@Override
	public List<DDJ01_PJ> SelectByDDJ01_JFID(Map<String, Object> map) {
		return dDJ01_PJMapper.SelectByDDJ01_JFID(map);
	}

	@Override
	public void insert(DDJ01_PJ dDJ01_PJ) {
		dDJ01_PJMapper.insert(dDJ01_PJ);
	}

	@Override
	public String getJFID() {
		return dDJ01_PJMapper.getJFID();
	}

	@Override
	public DDJ01_PJ SelectById(String JFID) {
		return dDJ01_PJMapper.SelectById(JFID);
	}

	@Override
	public void update(DDJ01_PJ dDJ01_PJ) {
		dDJ01_PJMapper.update(dDJ01_PJ);
	}

	@Override
	public void delete(String JFID) {
		dDJ01_PJMapper.delete(JFID);
	}
}
