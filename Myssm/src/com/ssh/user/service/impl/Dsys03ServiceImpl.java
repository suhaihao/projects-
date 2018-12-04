package com.ssh.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.Dsys03Mapper;
import com.ssh.user.model.Dsys03;
import com.ssh.user.service.Dsys03Service;
@Service("dsys03Service")
public class Dsys03ServiceImpl implements Dsys03Service{
	@Autowired
	private Dsys03Mapper dsys03Mapper;

	@Override
	public List<Dsys03> SelectAllList() {
		return dsys03Mapper.SelectAllList();
	}

	@Override
	public int SelectByBm(String bm) {
		return dsys03Mapper.SelectByBm(bm);
	}
}
