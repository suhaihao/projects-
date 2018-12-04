package com.ssh.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.Dsys02_zfzzMapper;
import com.ssh.user.model.Dsys02_zfzz;
import com.ssh.user.service.Dsys02_zfzzService;

@Service("dsys02_zfzzService")
public class Dsys02_zfzzServiceImpl implements Dsys02_zfzzService{
	@Autowired
	private Dsys02_zfzzMapper dsys02_zfzzMapper;
	@Override
	public List<Dsys02_zfzz> SelectByBmMenu(int Dsys03id) {
		return dsys02_zfzzMapper.SelectByBmMenu(Dsys03id);
	}
	@Override
	public List<Dsys02_zfzz> SelectAllQXMenu() {
		return dsys02_zfzzMapper.SelectAllByQXMenu();
	}
	@Override
	public List<Dsys02_zfzz> SelectAllMenu() {
		return dsys02_zfzzMapper.SelectAllMenu();
	}

}
