package com.ssh.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.user.dao.DDJ11Mapper;
import com.ssh.user.model.DDJ11;
import com.ssh.user.service.DDJ11Service;
import com.ssh.user.util.Page;

@Service("dDJ11Service")
public class DDJ11ServiceImpl implements DDJ11Service {
	@Autowired
	private DDJ11Mapper dDJ11Mapper;

	@Override
	public List<DDJ11> selectAlllist(Page page, String ddj01_jfid) {
		synchronized (this) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("max", page.getMax());
			map.put("min", page.getMin());
			map.put("ddj01_jfid", ddj01_jfid);
			return dDJ11Mapper.selectByAlllist(map);
		}
	}

	@Override
	public int getCount(String ddj01_jfid) {
		return dDJ11Mapper.getCount(ddj01_jfid);
	}

	@Override
	@Transactional
	public void inddj11(DDJ11 dDJ11) {
		dDJ11Mapper.inddj11(dDJ11);
	}

	@Override
	public String getID() {
		return dDJ11Mapper.getID();
	}

	@Override
	@Transactional
	public void delddj11(String id) {
		dDJ11Mapper.delddj11(id);
	}

	@Override
	public List<DDJ11> selectByFlandName(Page page, String mc, String fl,
			String ddj01_jfid) {
		synchronized (this) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("max", page.getMax());
			map.put("min", page.getMin());
			map.put("mc", mc);
			map.put("fl", fl);
			map.put("ddj01_jfid", ddj01_jfid);
			return dDJ11Mapper.selectListByflname(map);
		}
	}

	@Override
	public DDJ11 selectByMc(String MC, String ddj01_jfid) {

		return dDJ11Mapper.selectByMc(MC, ddj01_jfid);
	}

	@Override
	public List<DDJ11> selectByid(String id) {
		return dDJ11Mapper.selectByid(id);
	}

	@Override
	public DDJ11 selectByMcID(String id, String MC, String ddj01_jfid) {
		return dDJ11Mapper.selectByMcID(id, MC, ddj01_jfid);
	}

	@Override
	@Transactional
	public void upsj(DDJ11 dDJ11) {
		dDJ11Mapper.updysj(dDJ11);
	}

	@Override
	@Transactional
	public String qxup(DDJ11 dDJ11) {
		synchronized (this) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("psi_cllb", "0");
			map.put("psi_ddj11_jfid", dDJ11.getJFID());
			dDJ11Mapper.qxup(map);
			return map.get("pso_return").toString();
		}
	}

	@Override
	public int getCountBYTJ(String ddj01_jfid, String MC, String FL) {
		return dDJ11Mapper.getCountByTJ(ddj01_jfid, MC, FL);
	}

	@Override
	public int getCountByZTTJ(String ddj01_jfid) {
		return dDJ11Mapper.getCountByZTTJ(ddj01_jfid);
	}

	@Override
	public int getCountBYTJZT(String ddj01_jfid, String MC, String FL) {
		return dDJ11Mapper.getCountBYTJZT(ddj01_jfid, MC, FL);
	}

	@Override
	public List<DDJ11> selectByFlandNameBYZT(Page page, String mc, String fl,
			String ddj01_jfid) {
		synchronized (this) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("max", page.getMax());
			map.put("min", page.getMin());
			map.put("mc", mc);
			map.put("fl", fl);
			map.put("ddj01_jfid", ddj01_jfid);
		return dDJ11Mapper.selectByFlandNameBYZT(map);
		}
	}
	@Override
	public List<DDJ11> selectAlllistBYZT(Page page, String ddj01_jfid) {
		synchronized (this) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("max", page.getMax());
			map.put("min", page.getMin());
			map.put("ddj01_jfid", ddj01_jfid);
			return dDJ11Mapper.selectAlllistBYZT(map);
		}
	}

	@Override
	public int getCountByQTZTTJ(String ddj01_jfid) {
		return dDJ11Mapper.getCountByQTZTTJ(ddj01_jfid);
	}

	@Override
	public int getCountBYQTTJZT(String ddj01_jfid, String MC, String FL) {
		return dDJ11Mapper.getCountBYQTTJZT(ddj01_jfid, MC, FL);
	}

	@Override
	public List<DDJ11> selectByQTFlandNameBYZT(Page page, String mc, String fl,
			String ddj01_jfid) {
		synchronized (this) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("max", page.getMax());
			map.put("min", page.getMin());
			map.put("mc", mc);
			map.put("fl", fl);
			map.put("ddj01_jfid", ddj01_jfid);
		return dDJ11Mapper.selectByQTFlandNameBYZT(map);
		}
	}

	@Override
	public List<DDJ11> selectAlllistBYQTZT(Page page, String ddj01_jfid) {
		synchronized (this) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("max", page.getMax());
			map.put("min", page.getMin());
			map.put("ddj01_jfid", ddj01_jfid);
		return dDJ11Mapper.selectAlllistBYQTZT(map);
		}
	}
}
