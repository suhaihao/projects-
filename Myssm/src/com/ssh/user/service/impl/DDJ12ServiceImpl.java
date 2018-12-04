package com.ssh.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.DDJ12Mapper;
import com.ssh.user.model.DDJ12;
import com.ssh.user.service.DDJ12Service;
import com.ssh.user.util.Page;


@Service("dDJ12Service")
public class DDJ12ServiceImpl implements DDJ12Service {
	@Autowired
	private DDJ12Mapper dDJ12Mapper;

	@Override
	public DDJ12 selectByName(String name) {
		return dDJ12Mapper.selectByName(name);
	}

	@Override
	@Transactional
	public String inserddj12(DDJ12 dDJ12) {
		synchronized (this) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("psi_cllb","1");
		map.put("psi_ddj11_jfid",dDJ12.getDDJ11_JFID());
		dDJ12Mapper.inddj12(map);
		return map.get("pso_reason").toString();
		}
	}

	@Override
	public List<DDJ12> SelectctByTJ(Page page,String mc,String fl) {
		synchronized (this) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("max", page.getMax());
		map.put("min", page.getMin());
		map.put("mc",mc);
		map.put("fl",fl);
		return dDJ12Mapper.SelectctByTJ(map);
		}
	}

	@Override
	public int getcount() {
		return dDJ12Mapper.getcount();
	}

	@Override
	public List<DDJ12> SelectctAllList(Page page) {
		return dDJ12Mapper.SelectctAlllist(page);
	}

	@Override
	public DDJ12 selsctByid(String id) {
		return dDJ12Mapper.selectById(id);
	}
}
