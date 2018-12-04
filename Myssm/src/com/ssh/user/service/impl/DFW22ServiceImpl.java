package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.DFW22Mapper;
import com.ssh.user.model.DFW22;
import com.ssh.user.model.DFW22_CKWJ;
import com.ssh.user.model.DFW22_FJ;
import com.ssh.user.model.DFW22_JSR;
import com.ssh.user.service.DFW22Service;
@Service("dFW22Service")
public class DFW22ServiceImpl implements DFW22Service{
	@Autowired
	private DFW22Mapper dFW22Mapper;

	@Override
	public int getCount(Map<String, Object> map) {
		return dFW22Mapper.getCount(map);
	}

	@Override
	public List<DFW22> SelectAll(Map<String, Object> map) {
		return dFW22Mapper.SelectAll(map);
	}

	@Override
	public String getJFID() {
		return dFW22Mapper.getJFID();
	}

	@Override
	public void insert(DFW22 dFW22) {
		dFW22Mapper.insert(dFW22);
	}

	@Override
	public void insert_jsr(DFW22_JSR dFW22_JSR) {
		dFW22Mapper.insert_jsr(dFW22_JSR);
	}

	@Override
	public void insert_fj(DFW22_FJ dFW22_FJ) {
		dFW22Mapper.insert_fj(dFW22_FJ);		
	}

	@Override
	public DFW22 SelectByID(String JFID) {
		return dFW22Mapper.SelectByID(JFID);
	}

	@Override
	public List<DFW22_JSR> SelectByDFW22_JFID_JSR(Map<String, Object> map) {
		return dFW22Mapper.SelectByDFW22_JFID_JSR(map);
	}

	@Override
	public List<DFW22_FJ> SelectByDFW22_JFID_FJ(Map<String, Object> map) {
		return dFW22Mapper.SelectByDFW22_JFID_FJ(map);
	}

	@Override
	public void del_fj(String JFID) {
		dFW22Mapper.del_fj(JFID);
	}

	@Override
	public void update(DFW22 dFW22) {
		dFW22Mapper.update(dFW22);
	}

	@Override
	public void del_jsr_f(String DFW22_JFID) {
		dFW22Mapper.del_jsr_f(DFW22_JFID);
	}

	@Override
	public void del_fj_f(String DFW22_JFID) {
		dFW22Mapper.del_fj_f(DFW22_JFID);
	}

	@Override
	public void del(String JFID) {
		dFW22Mapper.del(JFID);
	}

	@Override
	public void insert_ckwj(DFW22_CKWJ dFW22_CKWJ) {
		dFW22Mapper.insert_ckwj(dFW22_CKWJ);
	}

	@Override
	public List<DFW22_CKWJ> SelectByDFW22_JFID_CKWJ(Map<String, Object> map) {
		return dFW22Mapper.SelectByDFW22_JFID_CKWJ(map);
	}

	@Override
	public void del_ckwj_f(String DFW22_JFID) {
		dFW22Mapper.del_ckwj_f(DFW22_JFID);
	}

	@Override
	public void upjsr(DFW22_JSR dFW22_JSR) {
		dFW22Mapper.upjsr(dFW22_JSR);
	}

	@Override
	public List<DFW22> SelectAllCX(String DDJ01_JFID) {
		return dFW22Mapper.SelectAllCX(DDJ01_JFID);
	}

	
}
