package com.ssh.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.DSYS01_DSYS03Mapper;
import com.ssh.user.model.Dsys01_dsys03;
import com.ssh.user.service.DSYS01_DSYS03Service;

@Service("dSYS01_DSYS03Service")
public class DSYS01_DSYS03ServiceImpl implements DSYS01_DSYS03Service {
	@Autowired
	private DSYS01_DSYS03Mapper dSYS01_DSYS03Mapper;

	@Override
	@Transactional
	public void insertJS(Dsys01_dsys03 dsys01_dsys03) {
		dSYS01_DSYS03Mapper.insertJS(dsys01_dsys03);
	}

	@Override
	@Transactional
	public void delAll(int JFID) {
		dSYS01_DSYS03Mapper.delAll(JFID);
	}

	@Override
	public List<Dsys01_dsys03> SelectByJS(String JFID) {
		return dSYS01_DSYS03Mapper.SelectByJS(JFID);
	}
}
