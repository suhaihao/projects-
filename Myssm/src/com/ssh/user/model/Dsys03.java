package com.ssh.user.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "dsys03")
public class Dsys03 {
	/**
	 * ��ɫ��Ψһid
	 */
	@Id
	@Column(name = "JFID")
	private int JFID;
	/**
	 * ��ɫ�ı���
	 */
	@Column(name = "ROLE_BM")
	private String ROLE_BM;
	/**
	 * ��ɫ���
	 */
	@Column(name = "ROLE_BMLB")
	private String ROLE_BMLB;
	/**
	 * ��ɫ����
	 */
	@Column(name = "ROLE_NAME")
	private String ROLE_NAME;

	public int getJFID() {
		return JFID;
	}

	public void setJFID(int jFID) {
		JFID = jFID;
	}

	public String getROLE_BM() {
		return ROLE_BM;
	}

	public void setROLE_BM(String rOLE_BM) {
		ROLE_BM = rOLE_BM;
	}

	public String getROLE_BMLB() {
		return ROLE_BMLB;
	}

	public void setROLE_BMLB(String rOLE_BMLB) {
		ROLE_BMLB = rOLE_BMLB;
	}

	public String getROLE_NAME() {
		return ROLE_NAME;
	}

	public void setROLE_NAME(String rOLE_NAME) {
		ROLE_NAME = rOLE_NAME;
	}

}
