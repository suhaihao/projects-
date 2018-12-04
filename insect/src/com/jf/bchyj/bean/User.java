package com.jf.bchyj.bean;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	private String userjfid;
	private String userid;
	private String username;
	private String bmbm;
	private String bmmc;
	private String roleid;
	private String password;
    private String xz;
    private String cun;
    private String jfdeptprop;
	public String getJfdeptprop() {
		return jfdeptprop;
	}

	public void setJfdeptprop(String jfdeptprop) {
		this.jfdeptprop = jfdeptprop;
	}

	public String getUserjfid() {
		return userjfid;
	}

	public void setUserjfid(String userjfid) {
		this.userjfid = userjfid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBmbm() {
		return bmbm;
	}

	public void setBmbm(String bmbm) {
		this.bmbm = bmbm;
	}

	public String getBmmc() {
		return bmmc;
	}

	public void setBmmc(String bmmc) {
		this.bmmc = bmmc;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getXz() {
		return xz;
	}

	public void setXz(String xz) {
		this.xz = xz;
	}

	public String getCun() {
		return cun;
	}

	public void setCun(String cun) {
		this.cun = cun;
	}

}
