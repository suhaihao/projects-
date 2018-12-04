package com.ssh.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.DDJ02_DDJ01Mapper;
import com.ssh.user.model.DDJ02_DDJ01;
import com.ssh.user.service.DDJ02_DDJ01Service;

@Service("dDJ02_DDJ01Service")
public class DDJ02_DDJ01ServiceImpl implements DDJ02_DDJ01Service {
	@Autowired
	private DDJ02_DDJ01Mapper dDJ02_DDJ01Mapper;

	@Override
	@Transactional
	public void insedd02_d(DDJ02_DDJ01 dDJ02_DDJ01) {
		dDJ02_DDJ01Mapper.insddj02_d(dDJ02_DDJ01);
	}

	@Override
	public List<DDJ02_DDJ01> SelectByZZID(String DDJ02_JFID) {
		return dDJ02_DDJ01Mapper.selectByZZBYID(DDJ02_JFID);
	}

	@Override
	@Transactional
	public void upsj(DDJ02_DDJ01 dDJ02_DDJ01) {
		dDJ02_DDJ01Mapper.updysj(dDJ02_DDJ01);
	}

	@Override
	@Transactional
	public void delgxb(DDJ02_DDJ01 dDJ02_DDJ01) {
		dDJ02_DDJ01Mapper.delgxb(dDJ02_DDJ01);
	}
}
