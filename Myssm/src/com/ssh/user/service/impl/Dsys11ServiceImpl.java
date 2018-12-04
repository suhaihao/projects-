package com.ssh.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.Dsys11Mapper;
import com.ssh.user.model.DDJ03;
import com.ssh.user.model.Dsys11;
import com.ssh.user.service.Dsys11Service;
@Service("dsys11Service")
public class Dsys11ServiceImpl implements Dsys11Service{
	@Autowired
	private Dsys11Mapper dsys11Mapper;
	
	@Override
	public Dsys11 SeleBybm(String bmlb, String bm) {
		return dsys11Mapper.SeleBybm(bmlb, bm);
	}

	@Override
	public List<Dsys11> SelecetAllBM(String bmlb) {
		return dsys11Mapper.SelectAllList(bmlb);
	}

	@Override
	public List<Dsys11> selectAllFw() {
		return dsys11Mapper.SelectAllFW();
	}

	@Override
	public List<Dsys11> selectAllfzcsfl() {
		return dsys11Mapper.SelectAllfzcsfl();
	}

	@Override
	public List<Dsys11> selectAllDj() {
		return dsys11Mapper.SelectAllDj();
	}

	@Override
	public Dsys11 seletBbmDw(String bm) {
		return dsys11Mapper.SelectByBmDw(bm);
	}

	@Override
	public List<DDJ03> SelectAllST() {
		return dsys11Mapper.SelectAllST();
	}

}
