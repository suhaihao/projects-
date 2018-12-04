package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.DDJ02_DMapper;
import com.ssh.user.model.DDJ02_D;
import com.ssh.user.service.DDJ02_DService;
@Service("dDJ02_DService")
public class DDJ02_DServiceImpl implements  DDJ02_DService{
	@Autowired
	private DDJ02_DMapper dDJ02_DMapper;

	@Override
	@Transactional
	public void insDDXX(DDJ02_D dDJ02_D) {
		dDJ02_DMapper.insedk(dDJ02_D);
	}

	@Override
	public List<DDJ02_D> SelectByDDJ02_JFID(String ddj02_jfid) {
		return dDJ02_DMapper.selectByddj02_jfid(ddj02_jfid);
	}

	@Override
	public DDJ02_D SelectById(String id) {
		return dDJ02_DMapper.SelectByID(id);
	}

	@Override
	@Transactional
	public void uodkxx(DDJ02_D dDJ02_D) {
		dDJ02_DMapper.updkxx(dDJ02_D);
	}

	@Override
	@Transactional
	public void delddj02_d(String id) {
		dDJ02_DMapper.delById(id);
	}

	@Override
	public List<DDJ02_D> SelectBYDDJ02_JFIDPage(Map<String, Object> map) {
		return dDJ02_DMapper.SelectBYDDJ02_JFIDPage(map);
	}

	@Override
	public int getcount(Map<String, Object> map) {
		return dDJ02_DMapper.getCount(map);
	}

	@Override
	public List<DDJ02_D> SelectAllNhDk(Map<String,Object> map) {
		return dDJ02_DMapper.SelectAllNhDk(map);
	}

	@Override
	public int GetAllNhDkCount(Map<String, Object> map) {
		return dDJ02_DMapper.GetAllNhDkCount(map);
	}
}
