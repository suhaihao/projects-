package com.ssh.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.user.dao.DFW01_D_ZPMapper;
import com.ssh.user.model.DFW01_D_ZP;
import com.ssh.user.service.DFW01_D_ZPService;

@Service("dFW01_D_ZPService")
public class DFW01_D_ZPServiceImpl implements DFW01_D_ZPService {
	@Autowired
	private DFW01_D_ZPMapper dFW01_D_ZPMapper;

	@Override
	public List<DFW01_D_ZP> SelectBYDK(String DFW01_D_JFID) {
		return dFW01_D_ZPMapper.SelectByDK(DFW01_D_JFID);
	}

	@Override
	public void delZP(String JFID) {
		dFW01_D_ZPMapper.delZP(JFID);
	}
}
