package com.ssh.user.model;

public class DDJ12 {
	/**
	 * 唯一id
	 */
	private String JFID;
	/**
	 * DDJ11的id
	 */
	private String DDJ11_JFID;
	/**
	 * 名称
	 */
	private String MC;
	/**
	 * 分类
	 */
	private String FL;
	/**
	 * 单位
	 */
	private String DW;
	/**
	 * 单价
	 */
	private int DJ;
	/**
	 * 包装规格
	 */
	private String BZGG;
	/**
	 * 备注
	 */
	private String BZ;
	/**
	 * 生产厂家
	 * @return
	 */
	private String SCCJ;
	
	public String getSCCJ() {
		return SCCJ;
	}
	public void setSCCJ(String sCCJ) {
		SCCJ = sCCJ;
	}
	public String getJFID() {
		return JFID;
	}
	public void setJFID(String jFID) {
		JFID = jFID;
	}
	public String getDDJ11_JFID() {
		return DDJ11_JFID;
	}
	public void setDDJ11_JFID(String dDJ11_JFID) {
		DDJ11_JFID = dDJ11_JFID;
	}
	public String getMC() {
		return MC;
	}
	public void setMC(String mC) {
		MC = mC;
	}
	public String getFL() {
		return FL;
	}
	public void setFL(String fL) {
		FL = fL;
	}
	public String getDW() {
		return DW;
	}
	public void setDW(String dW) {
		DW = dW;
	}
	public int getDJ() {
		return DJ;
	}
	public void setDJ(int dJ) {
		DJ = dJ;
	}
	public String getBZGG() {
		return BZGG;
	}
	public void setBZGG(String bZGG) {
		BZGG = bZGG;
	}
	public String getBZ() {
		return BZ;
	}
	public void setBZ(String bZ) {
		BZ = bZ;
	}
	
}
