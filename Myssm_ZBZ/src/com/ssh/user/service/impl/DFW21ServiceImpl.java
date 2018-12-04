package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.DDJ01_PJMapper;
import com.ssh.user.dao.DFW21Mapper;
import com.ssh.user.model.DDJ01_PJ;
import com.ssh.user.model.DFW21;
import com.ssh.user.model.DFW21_FJ;
import com.ssh.user.model.DFW21_JSR;
import com.ssh.user.service.DDJ01_PJService;
import com.ssh.user.service.DFW21Service;
@Service("dFW21Service")
public class DFW21ServiceImpl implements DFW21Service{
	@Autowired
	private DFW21Mapper dFW21Mapper;

	@Override
	public int getCount(Map<String, Object> map) {
		return dFW21Mapper.getCount(map);
	}

	@Override
	public List<DFW21> SelectAll(Map<String, Object> map) {
		return dFW21Mapper.SelectAll(map);
	}

	@Override
	public String getJFID() {
		return dFW21Mapper.getJFID();
	}

	@Override
	public void insert(DFW21 dFW21) {
		dFW21Mapper.insert(dFW21);
	}

	@Override
	public void insert_jsr(DFW21_JSR dFW21_JSR) {
		dFW21Mapper.insert_jsr(dFW21_JSR);
	}

	@Override
	public void insert_fj(DFW21_FJ dFW21_FJ) {
		dFW21Mapper.insert_fj(dFW21_FJ);		
	}

	@Override
	public DFW21 SelectByID(String JFID) {
		return dFW21Mapper.SelectByID(JFID);
	}

	@Override
	public List<DFW21_JSR> SelectByDFW21_JFID_JSR(Map<String, Object> map) {
		return dFW21Mapper.SelectByDFW21_JFID_JSR(map);
	}

	@Override
	public List<DFW21_FJ> SelectByDFW21_JFID_FJ(Map<String, Object> map) {
		return dFW21Mapper.SelectByDFW21_JFID_FJ(map);
	}

	@Override
	public void del_fj(String JFID) {
		dFW21Mapper.del_fj(JFID);
	}

	@Override
	public void update(DFW21 dFW21) {
		dFW21Mapper.update(dFW21);
	}

	@Override
	public void del_jsr_f(String DFW21_JFID) {
		dFW21Mapper.del_jsr_f(DFW21_JFID);
	}

	@Override
	public void del_fj_f(String DFW21_JFID) {
		dFW21Mapper.del_fj_f(DFW21_JFID);
	}

	@Override
	public void del(String JFID) {
		dFW21Mapper.del(JFID);
	}

	
}
