package com.ssh.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.Dsys02_dsys03Mapper;
import com.ssh.user.model.Dsys02_dsys03;
import com.ssh.user.service.Dsys02_dsys03Service;
@Service("dsys02_dsys03Service")
public class Dsys02_dsys03ServiceImpl implements Dsys02_dsys03Service{
	@Autowired
	Dsys02_dsys03Mapper dsys02_dsys03Mapper;
	@Override
	@Transactional
	public void indsys0203(Dsys02_dsys03 dsys02_dsys03) {
		dsys02_dsys03Mapper.InZJB(dsys02_dsys03);
	}
	@Override
	@Transactional
	public void deldsys0203(int father,int ddj01_jfid) {
		dsys02_dsys03Mapper.delByfatherId(father,ddj01_jfid);
	}
	@Override
	public List<Integer> SelectByfather(int father,int ddj01_jfid) {
		return dsys02_dsys03Mapper.SelectByfather(father,ddj01_jfid);
	}

}
