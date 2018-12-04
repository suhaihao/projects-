package com.ssh.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.DSYS05Mapper;
import com.ssh.user.model.DSYS05;
import com.ssh.user.service.DSYS05Service;

@Service("dSYS05Service")
public class DSYS05ServiceImpl implements DSYS05Service {
	@Autowired
	private DSYS05Mapper dSYS05Mapper;

	@Override
	public List<DSYS05> SelectAllBM() {
		return dSYS05Mapper.SelectAllBM();
	}

	@Override
	public DSYS05 SelectByBM(String BMBM) {
		return dSYS05Mapper.SelectByBM(BMBM);
	}

	@Override
	public List<DSYS05> SelectByFather(String BMBM,String BMJC){
		return dSYS05Mapper.SelectByFather(BMBM,BMJC);
	}

	@Override
	public DSYS05 SelectByJFID(int JFID) {
		return dSYS05Mapper.SelectByJFID(JFID);
	}

	@Override
	public void instInfo(DSYS05 dSYS05) {
		dSYS05Mapper.instInfo(dSYS05);
	}

	@Override
	public void upInfo(DSYS05 dSYS05) {
		dSYS05Mapper.upInfo(dSYS05);
	}
}
