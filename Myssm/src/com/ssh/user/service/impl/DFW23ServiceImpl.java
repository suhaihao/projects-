package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.DFW23Mapper;
import com.ssh.user.model.DFW23;
import com.ssh.user.model.DFW23_FJ;
import com.ssh.user.service.DFW23Service;
@Service("dFW23Service")
public class DFW23ServiceImpl implements DFW23Service{
	@Autowired
	private DFW23Mapper dFW23Mapper;

	@Override
	public int getCount(Map<String, Object> map) {
		return dFW23Mapper.getCount(map);
	}

	@Override
	public List<DFW23> SelectAll(Map<String, Object> map) {
		return dFW23Mapper.SelectAll(map);
	}

	@Override
	public String getJFID() {
		return dFW23Mapper.getJFID();
	}

	@Override
	public void insert(DFW23 dFW23) {
		dFW23Mapper.insert(dFW23);
	}


	@Override
	public void insert_fj(DFW23_FJ dFW23_FJ) {
		dFW23Mapper.insert_fj(dFW23_FJ);		
	}

	@Override
	public DFW23 SelectByID(String JFID) {
		return dFW23Mapper.SelectByID(JFID);
	}


	@Override
	public List<DFW23_FJ> SelectByDFW23_JFID_FJ(Map<String, Object> map) {
		return dFW23Mapper.SelectByDFW23_JFID_FJ(map);
	}

	@Override
	public void del_fj(String JFID) {
		dFW23Mapper.del_fj(JFID);
	}


	@Override
	public void del_fj_f(String DFW23_JFID) {
		dFW23Mapper.del_fj_f(DFW23_JFID);
	}

	@Override
	public void del(String JFID) {
		dFW23Mapper.del(JFID);
	}

	@Override
	public void update(DFW23 dFW23) {
		dFW23Mapper.update(dFW23);
	}


	
}
