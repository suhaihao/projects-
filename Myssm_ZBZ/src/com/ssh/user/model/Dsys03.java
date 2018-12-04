package com.ssh.user.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "dsys03")
public class Dsys03 {
	/**
	 * 角色表唯一id
	 */
	@Id
	@Column(name = "JFID")
	private Integer JFID;
	/**
	 * 角色的编码
	 */
	@Column(name = "ROLE_BM")
	private String ROLE_BM;
	/**
	 * 角色类别
	 */
	@Column(name = "ROLE_BMLB")
	private String ROLE_BMLB;
	/**
	 * 角色名称
	 */
	@Column(name = "ROLE_NAME")
	private String ROLE_NAME;
	/**
	 * 备注
	 */
	private String BZ;
	

	/**
	 * @return the bZ
	 */
	public String getBZ() {
		return BZ;
	}

	/**
	 * @param bZ the bZ to set
	 */
	public void setBZ(String bZ) {
		BZ = bZ;
	}

	/**
	 * @return the jFID
	 */
	public Integer getJFID() {
		return JFID;
	}

	/**
	 * @param jFID the jFID to set
	 */
	public void setJFID(Integer jFID) {
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

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Dsys03 [JFID=" + JFID + ", ROLE_BM=" + ROLE_BM + ", ROLE_BMLB="
				+ ROLE_BMLB + ", ROLE_NAME=" + ROLE_NAME + ", BZ=" + BZ + "]";
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */

}
