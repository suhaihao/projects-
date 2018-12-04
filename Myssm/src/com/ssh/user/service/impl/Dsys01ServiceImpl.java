package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.Dsys01Mapper;
import com.ssh.user.model.DSYS05;
import com.ssh.user.model.Dsys01;
import com.ssh.user.service.Dsys01Service;

@Service("dsys01Service")
public class Dsys01ServiceImpl implements Dsys01Service {
	@Autowired
	private Dsys01Mapper dsys01Mapper;

	@Override
	public List<Dsys01> SelectAllPage(Map<String, Object> map) {
		return dsys01Mapper.SelectAllPage(map);
	}

	@Override
	public int GetCount(Map<String, Object> map) {
		return dsys01Mapper.GetCount(map);
	}

	@Override
	public List<Dsys01> SelectAllByxxdblb(Map<String, Object> map) {
		return dsys01Mapper.SelectAllByxxdblb(map);
	}

	@Override
	public int GetCountByZBZ(Map<String, Object> map) {
		return dsys01Mapper.GetCountByZBZ(map);
	}

	@Override
	public List<Dsys01> SelectAllPage_ZBZ(Map<String, Object> map) {
		return dsys01Mapper.SelectAllPage_ZBZ(map);
	}

	@Override
	public List<DSYS05> selectBysys05(Map<String, Object> map) {
		return dsys01Mapper.selectBysys05(map);
	}
}
