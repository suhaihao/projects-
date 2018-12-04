package com.ssh.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.DFW01_DMapper;
import com.ssh.user.model.DFW01_D;
import com.ssh.user.service.DDJ02_DService;
import com.ssh.user.service.DFW01Service;
import com.ssh.user.service.DFW01_DService;
@Service("dFW01_DService")
public class DFW01_DServiceImpl implements DFW01_DService{
	@Autowired
	private DFW01_DMapper dFW01_DMapper;

	@Override
	@Transactional
	public void insAdd(DFW01_D dFW01_D) {
		dFW01_DMapper.insAdd(dFW01_D);
	}
	@Override
	public List<DFW01_D> SelectByID(String DFW01_JFID) {
		return dFW01_DMapper.SelectByID(DFW01_JFID);
	}

	@Override
	public List<DFW01_D> SelectByJFID(String JFID) {
		return dFW01_DMapper.SelectByJFID(JFID);
	}

	@Override
	@Transactional
	public void DelBYFW01ID(String DFW01_JFID) {
		dFW01_DMapper.delByDFW01ID(DFW01_JFID);
	}

	@Override
	@Transactional
	public void upDkxx(DFW01_D dFW01_D) {
		dFW01_DMapper.upDKXX(dFW01_D);
	}

	@Override
	public void delDK(String JFID) {
		dFW01_DMapper.delDK(JFID);
	}
	@Override
	@Transactional
	public String p_gddk_wg(Map<String, Object> map) {
		return dFW01_DMapper.p_gddk_wg(map);
	}
	@Override
	@Transactional
	public String P_gddk_zf(Map<String, Object> map) {
		return dFW01_DMapper.P_gddk_zf(map);
	}
	@Override
	public List<DFW01_D> SelectByDDJ02_D_JFID(Map<String, Object> map) {
		return dFW01_DMapper.SelectByDDJ02_D_JFID(map);
	}
	@Override
	public List<DFW01_D> SelectAllList(Map<String, Object> map) {
		return dFW01_DMapper.SelectAllList(map);
	}
	@Override
	public int getCount(Map<String, Object> map) {
		return dFW01_DMapper.getCount(map);
	}
	@Override
	public List<DFW01_D> SelectByYHList(Map<String, Object> map) {
		return dFW01_DMapper.SelectByYHList(map);
	}
	@Override
	public int getCountByYHSize(Map<String, Object> map) {
		return dFW01_DMapper.getCountByYHSize(map);
	}
	@Override
	public List<DFW01_D> SelectByZT2() {
		return dFW01_DMapper.SelectByZT2();
	}
	@Override
	public List<DFW01_D> SelectByDDJ02_D_JFIDZT(Map<String,Object> map) {
		return dFW01_DMapper.SelectByDDJ02_D_JFIDZT(map);
	}
	
}
