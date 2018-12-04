package com.ssh.user.model;

import java.util.Date;

/**
 * 派单实体类
 * 
 * @author Administrator
 * 
 */
public class DFW01 {
	/**
	 * 用户唯一id
	 */
	private String JFID;
	/**
	 * 用户唯一id
	 */
	private String DDJ01_JFID;
	/**
	 * 专访组织名称
	 */
	private String DDJ01_MC;
	/**
	 * 服务内容
	 */
	private String FWNRLB;
	/**
	 * DDJ02_JFID用户id
	 */
	private String DDJ02_JFID;
	/**
	 * DDJ02_MC用户名称
	 */
	private String DDJ02_MC;
	/**
	 * DDJ02_YDDH用户手机
	 */
	private String DDJ02_YDDH;
	/**
	 * DDJ02_DZ用户地址
	 */
	private String DDJ02_DZ;
	/**
	 * 计划防治时间
	 */
	private String JHSJ;
	/**
	 * 防治负责人
	 */
	private String FZFZR;
	/**
	 * 防止负责人名称
	 */
	private String FZFZR_MC;
	/**
	 * 防治负责人员 ID逗号分隔
	 */
	private String FZRY;
	/**
	 * 派单说明
	 */
	private String PDSM;
	/**
	 * 派单人员JFID
	 */
	private String PDRY;
	/**
	 * 派单人员名称
	 */
	private String PDRY_MC;
	/**
	 * 派单日期
	 */
	private Date PDRQ;
	/**
	 * 状态
	 */
	private String ZT;
	/**
	 * 备注
	 */
	private String BZ;
	/**
	 * 收费金额
	 */
	private double SFJE;
	/**
	 * 完工人员JFID
	 */
	private String WCRY;
	/**
	 * 完工人员姓名
	 */
	private String WCRY_MC;
	/**
	 * 完工日期
	 */
	private Date WCRQ;
	/**
	 * 完工日期字符串
	 */
	private String WCRQSTR;
	/**
	 * 所属部门
	 */
	private String BMBM;
	/**
	 * 农业补贴项目
	 */
	private String DDJ03_JFID;
	/**
	 * 防治面积
	 */
	private double FZMJ;
	/**
	 * 防治负责人员名称
	 */
	private String FZRY_MC;
	/**
	 * 防治人数
	 */
	private int FZRS;
	/**
	 * 是否用防治
	 */
	private String SF_FZ;
	/**
	 * 人工成本
	 * 
	 * @return
	 */
	private Integer RGCB;
	/**
	 * 临时字段评价结果
	 * 
	 * @return
	 */
	private String PJJG;
	/**
	 * 临时字段评价日期
	 * 
	 * @return
	 */
	private String PJRQ;
	/**
	 * 临时字段评价说明
	 * 
	 * @return
	 */
	private String PJSM;
	/**
	 * 序列
	 */
	private String RN;
	
	public String getRN() {
		return RN;
	}

	public void setRN(String rN) {
		RN = rN;
	}

	public String getWCRQSTR() {
		return WCRQSTR;
	}

	public void setWCRQSTR(String wCRQSTR) {
		WCRQSTR = wCRQSTR;
	}

	public String getPJJG() {
		return PJJG;
	}

	public void setPJJG(String pJJG) {
		PJJG = pJJG;
	}

	public String getPJRQ() {
		return PJRQ;
	}

	public void setPJRQ(String pJRQ) {
		PJRQ = pJRQ;
	}

	public String getPJSM() {
		return PJSM;
	}

	public void setPJSM(String pJSM) {
		PJSM = pJSM;
	}

	public Integer getRGCB() {
		return RGCB;
	}

	public void setRGCB(Integer rGCB) {
		RGCB = rGCB;
	}

	public String getJFID() {
		return JFID;
	}

	public void setJFID(String jFID) {
		JFID = jFID;
	}

	public String getDDJ01_JFID() {
		return DDJ01_JFID;
	}

	public void setDDJ01_JFID(String dDJ01_JFID) {
		DDJ01_JFID = dDJ01_JFID;
	}

	public String getDDJ01_MC() {
		return DDJ01_MC;
	}

	public void setDDJ01_MC(String dDJ01_MC) {
		DDJ01_MC = dDJ01_MC;
	}

	public String getFWNRLB() {
		return FWNRLB;
	}

	public void setFWNRLB(String fWNRLB) {
		FWNRLB = fWNRLB;
	}

	public String getDDJ02_JFID() {
		return DDJ02_JFID;
	}

	public void setDDJ02_JFID(String dDJ02_JFID) {
		DDJ02_JFID = dDJ02_JFID;
	}

	public String getDDJ02_MC() {
		return DDJ02_MC;
	}

	public void setDDJ02_MC(String dDJ02_MC) {
		DDJ02_MC = dDJ02_MC;
	}

	public String getDDJ02_YDDH() {
		return DDJ02_YDDH;
	}

	public void setDDJ02_YDDH(String dDJ02_YDDH) {
		DDJ02_YDDH = dDJ02_YDDH;
	}

	public String getDDJ02_DZ() {
		return DDJ02_DZ;
	}

	public void setDDJ02_DZ(String dDJ02_DZ) {
		DDJ02_DZ = dDJ02_DZ;
	}

	public String getFZFZR() {
		return FZFZR;
	}

	public void setFZFZR(String fZFZR) {
		FZFZR = fZFZR;
	}

	public String getFZFZR_MC() {
		return FZFZR_MC;
	}

	public void setFZFZR_MC(String fZFZR_MC) {
		FZFZR_MC = fZFZR_MC;
	}

	public String getFZRY() {
		return FZRY;
	}

	public void setFZRY(String fZRY) {
		FZRY = fZRY;
	}

	public String getPDSM() {
		return PDSM;
	}

	public void setPDSM(String pDSM) {
		PDSM = pDSM;
	}

	public String getPDRY() {
		return PDRY;
	}

	public void setPDRY(String pDRY) {
		PDRY = pDRY;
	}

	public String getPDRY_MC() {
		return PDRY_MC;
	}

	public void setPDRY_MC(String pDRY_MC) {
		PDRY_MC = pDRY_MC;
	}

	public Date getPDRQ() {
		return PDRQ;
	}

	public void setPDRQ(Date pDRQ) {
		PDRQ = pDRQ;
	}

	public String getZT() {
		return ZT;
	}

	public void setZT(String zT) {
		ZT = zT;
	}

	public String getBZ() {
		return BZ;
	}

	public void setBZ(String bZ) {
		BZ = bZ;
	}

	public String getWCRY() {
		return WCRY;
	}

	public void setWCRY(String wCRY) {
		WCRY = wCRY;
	}

	public String getWCRY_MC() {
		return WCRY_MC;
	}

	public void setWCRY_MC(String wCRY_MC) {
		WCRY_MC = wCRY_MC;
	}

	public Date getWCRQ() {
		return WCRQ;
	}

	public void setWCRQ(Date wCRQ) {
		WCRQ = wCRQ;
	}

	public String getBMBM() {
		return BMBM;
	}

	public void setBMBM(String bMBM) {
		BMBM = bMBM;
	}

	public String getDDJ03_JFID() {
		return DDJ03_JFID;
	}

	public void setDDJ03_JFID(String dDJ03_JFID) {
		DDJ03_JFID = dDJ03_JFID;
	}

	public double getSFJE() {
		return SFJE;
	}

	public void setSFJE(double sFJE) {
		SFJE = sFJE;
	}

	public double getFZMJ() {
		return FZMJ;
	}

	public void setFZMJ(double fZMJ) {
		FZMJ = fZMJ;
	}

	public String getFZRY_MC() {
		return FZRY_MC;
	}

	public void setFZRY_MC(String fZRY_MC) {
		FZRY_MC = fZRY_MC;
	}

	public int getFZRS() {
		return FZRS;
	}

	public void setFZRS(int fZRS) {
		FZRS = fZRS;
	}

	public String getSF_FZ() {
		return SF_FZ;
	}

	public void setSF_FZ(String sF_FZ) {
		SF_FZ = sF_FZ;
	}

	public String getJHSJ() {
		return JHSJ;
	}

	public void setJHSJ(String jHSJ) {
		JHSJ = jHSJ;
	}

	@Override
	public String toString() {
		return "DFW01 [JFID=" + JFID + ", DDJ01_JFID=" + DDJ01_JFID
				+ ", DDJ01_MC=" + DDJ01_MC + ", FWNRLB=" + FWNRLB
				+ ", DDJ02_JFID=" + DDJ02_JFID + ", DDJ02_MC=" + DDJ02_MC
				+ ", DDJ02_YDDH=" + DDJ02_YDDH + ", DDJ02_DZ=" + DDJ02_DZ
				+ ", JHSJ=" + JHSJ + ", FZFZR=" + FZFZR + ", FZFZR_MC="
				+ FZFZR_MC + ", FZRY=" + FZRY + ", PDSM=" + PDSM + ", PDRY="
				+ PDRY + ", PDRY_MC=" + PDRY_MC + ", PDRQ=" + PDRQ + ", ZT="
				+ ZT + ", BZ=" + BZ + ", SFJE=" + SFJE + ", WCRY=" + WCRY
				+ ", WCRY_MC=" + WCRY_MC + ", WCRQ=" + WCRQ + ", BMBM=" + BMBM
				+ ", DDJ03_JFID=" + DDJ03_JFID + ", FZMJ=" + FZMJ
				+ ", FZRY_MC=" + FZRY_MC + ", FZRS=" + FZRS + ", SF_FZ="
				+ SF_FZ + "]";
	}

}
