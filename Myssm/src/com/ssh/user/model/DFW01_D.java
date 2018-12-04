package com.ssh.user.model;

import java.util.Date;
import java.util.List;

/**
 * 派单实体类从表
 */
public class DFW01_D {
	/**
	 * 唯一ID
	 */
	private String JFID;
	/**
	 * DFW01_JFID
	 */
	private String DFW01_JFID;
	/**
	 * 地块JFID
	 */
	private String DDJ02_D_JFID;
	/**
	 * 地块名称
	 */
	private String DDJ02_D_DH;
	/**
	 * 地块类型
	 */
	private String DDJ02_D_DLX;
	/**
	 * 地块面积
	 */
	private Double DDJ02_D_MJ;
	/**
	 * 作物
	 */
	private String ZW;
	/**
	 * 防治对象
	 */
	private String FZDX;
	/**
	 * 是否防治
	 */
	private String SF_FZ;
	/**
	 * 是否巡棚（地）
	 */
	private String SF_XP;
	/**
	 * 开始工作时间
	 */
	private Date KSSJ;
	/**
	 * 开始工作人员
	 */
	private String KSRY;
	/**
	 * 结束工作时间
	 */
	private Date JSSJ;
	/**
	 * 结束工作人员
	 */
	private String JSRY;
	/**
	 * 防治面积
	 */
	private Double FZMJ;
	/**
	 * 说明及嘱托
	 */
	private String SMZT;
	/**
	 * 完工确认日期
	 */
	private Date WGRQ;
	/**
	 * 完工确认人员
	 */
	private String WGRY;
	/**
	 * 完工确认人员名称
	 */
	private String WGRY_MC;
	/**
	 * 农药措施1的JFID
	 */
	private String DDJ11_JFID1;
	/**
	 * 农药措施1的名称
	 */
	private String DDJ11_MC1;
	/**
	 * 农药措施1分类
	 */
	private String DDJ11_FL1;
	/**
	 * 农药措施1单位
	 */
	private String DDJ11_DW1;
	/**
	 * 单位名称
	 */
	private String DDJ11_DW1MC;
	/**
	 * 农药措施1 单价
	 */
	private Double DDJ11_DJ1;
	/**
	 * 农药措施1包装规格
	 */
	private String DDJ11_BZGG1;
	/**
	 * 农药措施数量
	 */
	private Double SYL1;
	/**
	 * 农药措施2JFID
	 */
	private String DDJ11_JFID2;
	/**
	 * 其他措施1的JFID
	 */
	private String DDJ11_JFID3;
	/**
	 * 其他措施2JFID
	 */
	private String DDJ11_JFID4;
	/**
	 * 农药措施2名称
	 */
	private String DDJ11_MC2;
	/**
	 * 其他措施1名称
	 */
	private String DDJ11_MC3;
	/**
	 * 其他措施2名称
	 */
	private String DDJ11_MC4;
	/**
	 * 农药措施2分类
	 */
	private String DDJ11_FL2;
	/**
	 * 其他措施1分类
	 */
	private String DDJ11_FL3;
	/**
	 * 其他措施2分类
	 */
	private String DDJ11_FL4;
	/**
	 * 农药措施2单位
	 */
	private String DDJ11_DW2;
	/**
	 * 单位名称
	 */
	private String DDJ11_DW2MC;
	/**
	 * 其他措施1单位
	 */
	private String DDJ11_DW3;
	/**
	 * 单位名称
	 */
	private String DDJ11_DW3MC;
	/**
	 * 其他措施2单位
	 */
	private String DDJ11_DW4;
	/**
	 * 单位名称
	 */
	private String DDJ11_DW4MC;
	/**
	 * 农药措施2单价
	 */
	private Double DDJ11_DJ2;
	/**
	 * 其他措施1单价
	 */
	private Double DDJ11_DJ3;
	/**
	 * 其他措施2单价
	 */
	private Double DDJ11_DJ4;
	/**
	 * 农药措施2包装规格
	 */
	private String DDJ11_BZGG2;
	/**
	 * 其他措施1包装规格
	 */
	private String DDJ11_BZGG3;
	/**
	 * 其他措施2包装规格
	 */
	private String DDJ11_BZGG4;
	/**
	 * 农药措施2使用数量
	 */
	private Double SYL2;
	/**
	 * 其他措施1使用数量
	 */
	private Double SYL3;
	/**
	 * 其他措施2使用数量
	 */
	private Double SYL4;
	/**
	 * 状态
	 */
	private String ZT;
	/**
	 * 施药器械
	 */
	private String SYQX;
	/**
	 * 施药器械名称
	 */
	private String SYQXMC;
	/**
	 * 作物名称
	 */
	private String ZW_MC;
	/**
	 * 开始工作人员名称
	 */
	private String KSRY_MC;
	/**
	 * 结束工作人员名称
	 */
	private String JSRY_MC;
	/**
	 * 收费金额
	 */
	private Double SFJE;
	/**
	 * 防治人员
	 * @return
	 */
	private String FZRY_MC;
	/**
	 * 防治负责人
	 * @return
	 */
	private String FZFZR_MC;
	/**
	 * 服务内容
	 */
	private String FWNRLB;
	/**
	 * 临时专访组织字段
	 */
	private String DDJ01_MC;
	/**
	 * 图片集合
	 * @return
	 */
	private List<DFW01_D_ZP> zpjh;
	/**
	 * 序列
	 */
	private String RN;
	/**
	 * 临时日期
	 * @return
	 */
	private String LSRQ;
	private String ZWMC;
	
	public String getSYQXMC() {
		return SYQXMC;
	}
	public void setSYQXMC(String sYQXMC) {
		SYQXMC = sYQXMC;
	}
	public String getZWMC() {
		return ZWMC;
	}
	public void setZWMC(String zWMC) {
		ZWMC = zWMC;
	}
	public String getLSRQ() {
		return LSRQ;
	}
	public void setLSRQ(String lSRQ) {
		LSRQ = lSRQ;
	}
	public String getRN() {
		return RN;
	}
	public void setRN(String rN) {
		RN = rN;
	}
	public List<DFW01_D_ZP> getZpjh() {
		return zpjh;
	}
	public void setZpjh(List<DFW01_D_ZP> zpjh) {
		this.zpjh = zpjh;
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
	public String getFZRY_MC() {
		return FZRY_MC;
	}
	public void setFZRY_MC(String fZRY_MC) {
		FZRY_MC = fZRY_MC;
	}
	public String getFZFZR_MC() {
		return FZFZR_MC;
	}
	public void setFZFZR_MC(String fZFZR_MC) {
		FZFZR_MC = fZFZR_MC;
	}
	public String getJFID() {
		return JFID;
	}
	public void setJFID(String jFID) {
		JFID = jFID;
	}
	public String getDFW01_JFID() {
		return DFW01_JFID;
	}
	public void setDFW01_JFID(String dFW01_JFID) {
		DFW01_JFID = dFW01_JFID;
	}
	public String getDDJ02_D_JFID() {
		return DDJ02_D_JFID;
	}
	public void setDDJ02_D_JFID(String dDJ02_D_JFID) {
		DDJ02_D_JFID = dDJ02_D_JFID;
	}
	public String getDDJ02_D_DH() {
		return DDJ02_D_DH;
	}
	public void setDDJ02_D_DH(String dDJ02_D_DH) {
		DDJ02_D_DH = dDJ02_D_DH;
	}
	public String getDDJ02_D_DLX() {
		return DDJ02_D_DLX;
	}
	public void setDDJ02_D_DLX(String dDJ02_D_DLX) {
		DDJ02_D_DLX = dDJ02_D_DLX;
	}
	
	public String getZW() {
		return ZW;
	}
	public void setZW(String zW) {
		ZW = zW;
	}
	public String getFZDX() {
		return FZDX;
	}
	public void setFZDX(String fZDX) {
		FZDX = fZDX;
	}
	public String getSF_FZ() {
		return SF_FZ;
	}
	public void setSF_FZ(String sF_FZ) {
		SF_FZ = sF_FZ;
	}
	public String getSF_XP() {
		return SF_XP;
	}
	public void setSF_XP(String sF_XP) {
		SF_XP = sF_XP;
	}
	public Date getKSSJ() {
		return KSSJ;
	}
	public void setKSSJ(Date kSSJ) {
		KSSJ = kSSJ;
	}
	public String getKSRY() {
		return KSRY;
	}
	public void setKSRY(String kSRY) {
		KSRY = kSRY;
	}
	public Date getJSSJ() {
		return JSSJ;
	}
	public void setJSSJ(Date jSSJ) {
		JSSJ = jSSJ;
	}
	public String getJSRY() {
		return JSRY;
	}
	public void setJSRY(String jSRY) {
		JSRY = jSRY;
	}
	
	public String getSMZT() {
		return SMZT;
	}
	public void setSMZT(String sMZT) {
		SMZT = sMZT;
	}
	public Date getWGRQ() {
		return WGRQ;
	}
	public void setWGRQ(Date wGRQ) {
		WGRQ = wGRQ;
	}
	public String getWGRY() {
		return WGRY;
	}
	public void setWGRY(String wGRY) {
		WGRY = wGRY;
	}
	public String getWGRY_MC() {
		return WGRY_MC;
	}
	public void setWGRY_MC(String wGRY_MC) {
		WGRY_MC = wGRY_MC;
	}
	public String getDDJ11_JFID1() {
		return DDJ11_JFID1;
	}
	public void setDDJ11_JFID1(String dDJ11_JFID1) {
		DDJ11_JFID1 = dDJ11_JFID1;
	}
	public String getDDJ11_MC1() {
		return DDJ11_MC1;
	}
	public void setDDJ11_MC1(String dDJ11_MC1) {
		DDJ11_MC1 = dDJ11_MC1;
	}
	public String getDDJ11_FL1() {
		return DDJ11_FL1;
	}
	public void setDDJ11_FL1(String dDJ11_FL1) {
		DDJ11_FL1 = dDJ11_FL1;
	}
	public String getDDJ11_DW1() {
		return DDJ11_DW1;
	}
	public void setDDJ11_DW1(String dDJ11_DW1) {
		DDJ11_DW1 = dDJ11_DW1;
	}
	
	public String getDDJ11_BZGG1() {
		return DDJ11_BZGG1;
	}
	public void setDDJ11_BZGG1(String dDJ11_BZGG1) {
		DDJ11_BZGG1 = dDJ11_BZGG1;
	}
	
	public String getDDJ11_JFID2() {
		return DDJ11_JFID2;
	}
	public void setDDJ11_JFID2(String dDJ11_JFID2) {
		DDJ11_JFID2 = dDJ11_JFID2;
	}
	public String getDDJ11_JFID3() {
		return DDJ11_JFID3;
	}
	public void setDDJ11_JFID3(String dDJ11_JFID3) {
		DDJ11_JFID3 = dDJ11_JFID3;
	}
	public String getDDJ11_JFID4() {
		return DDJ11_JFID4;
	}
	public void setDDJ11_JFID4(String dDJ11_JFID4) {
		DDJ11_JFID4 = dDJ11_JFID4;
	}
	public String getDDJ11_MC2() {
		return DDJ11_MC2;
	}
	public void setDDJ11_MC2(String dDJ11_MC2) {
		DDJ11_MC2 = dDJ11_MC2;
	}
	public String getDDJ11_MC3() {
		return DDJ11_MC3;
	}
	public void setDDJ11_MC3(String dDJ11_MC3) {
		DDJ11_MC3 = dDJ11_MC3;
	}
	public String getDDJ11_MC4() {
		return DDJ11_MC4;
	}
	public void setDDJ11_MC4(String dDJ11_MC4) {
		DDJ11_MC4 = dDJ11_MC4;
	}
	public String getDDJ11_FL2() {
		return DDJ11_FL2;
	}
	public void setDDJ11_FL2(String dDJ11_FL2) {
		DDJ11_FL2 = dDJ11_FL2;
	}
	public String getDDJ11_FL3() {
		return DDJ11_FL3;
	}
	public void setDDJ11_FL3(String dDJ11_FL3) {
		DDJ11_FL3 = dDJ11_FL3;
	}
	public String getDDJ11_FL4() {
		return DDJ11_FL4;
	}
	public void setDDJ11_FL4(String dDJ11_FL4) {
		DDJ11_FL4 = dDJ11_FL4;
	}
	public String getDDJ11_DW2() {
		return DDJ11_DW2;
	}
	public void setDDJ11_DW2(String dDJ11_DW2) {
		DDJ11_DW2 = dDJ11_DW2;
	}
	public String getDDJ11_DW3() {
		return DDJ11_DW3;
	}
	public void setDDJ11_DW3(String dDJ11_DW3) {
		DDJ11_DW3 = dDJ11_DW3;
	}
	public String getDDJ11_DW4() {
		return DDJ11_DW4;
	}
	public void setDDJ11_DW4(String dDJ11_DW4) {
		DDJ11_DW4 = dDJ11_DW4;
	}
	
	
	public String getDDJ11_BZGG2() {
		return DDJ11_BZGG2;
	}
	public void setDDJ11_BZGG2(String dDJ11_BZGG2) {
		DDJ11_BZGG2 = dDJ11_BZGG2;
	}
	public String getDDJ11_BZGG3() {
		return DDJ11_BZGG3;
	}
	public void setDDJ11_BZGG3(String dDJ11_BZGG3) {
		DDJ11_BZGG3 = dDJ11_BZGG3;
	}
	public String getDDJ11_BZGG4() {
		return DDJ11_BZGG4;
	}
	public void setDDJ11_BZGG4(String dDJ11_BZGG4) {
		DDJ11_BZGG4 = dDJ11_BZGG4;
	}

	public String getZT() {
		return ZT;
	}
	public void setZT(String zT) {
		ZT = zT;
	}
	public String getSYQX() {
		return SYQX;
	}
	public void setSYQX(String sYQX) {
		SYQX = sYQX;
	}
	public String getZW_MC() {
		return ZW_MC;
	}
	public void setZW_MC(String zW_MC) {
		ZW_MC = zW_MC;
	}
	public String getKSRY_MC() {
		return KSRY_MC;
	}
	public void setKSRY_MC(String kSRY_MC) {
		KSRY_MC = kSRY_MC;
	}
	public String getJSRY_MC() {
		return JSRY_MC;
	}
	public void setJSRY_MC(String jSRY_MC) {
		JSRY_MC = jSRY_MC;
	}
	public Double getDDJ02_D_MJ() {
		return DDJ02_D_MJ;
	}
	public void setDDJ02_D_MJ(Double dDJ02_D_MJ) {
		DDJ02_D_MJ = dDJ02_D_MJ;
	}
	public Double getFZMJ() {
		return FZMJ;
	}
	public void setFZMJ(Double fZMJ) {
		FZMJ = fZMJ;
	}
	public Double getDDJ11_DJ1() {
		return DDJ11_DJ1;
	}
	public void setDDJ11_DJ1(Double dDJ11_DJ1) {
		DDJ11_DJ1 = dDJ11_DJ1;
	}
	public Double getSYL1() {
		return SYL1;
	}
	public void setSYL1(Double sYL1) {
		SYL1 = sYL1;
	}
	public Double getDDJ11_DJ2() {
		return DDJ11_DJ2;
	}
	public void setDDJ11_DJ2(Double dDJ11_DJ2) {
		DDJ11_DJ2 = dDJ11_DJ2;
	}
	public Double getDDJ11_DJ3() {
		return DDJ11_DJ3;
	}
	public void setDDJ11_DJ3(Double dDJ11_DJ3) {
		DDJ11_DJ3 = dDJ11_DJ3;
	}
	public Double getDDJ11_DJ4() {
		return DDJ11_DJ4;
	}
	public void setDDJ11_DJ4(Double dDJ11_DJ4) {
		DDJ11_DJ4 = dDJ11_DJ4;
	}
	
	public Double getSYL2() {
		return SYL2;
	}
	public void setSYL2(Double sYL2) {
		SYL2 = sYL2;
	}
	public Double getSYL3() {
		return SYL3;
	}
	public void setSYL3(Double sYL3) {
		SYL3 = sYL3;
	}
	public Double getSYL4() {
		return SYL4;
	}
	public void setSYL4(Double sYL4) {
		SYL4 = sYL4;
	}
	public Double getSFJE() {
		return SFJE;
	}
	public void setSFJE(Double sFJE) {
		SFJE = sFJE;
	}
	
	public String getDDJ11_DW1MC() {
		return DDJ11_DW1MC;
	}
	public void setDDJ11_DW1MC(String dDJ11_DW1MC) {
		DDJ11_DW1MC = dDJ11_DW1MC;
	}
	public String getDDJ11_DW2MC() {
		return DDJ11_DW2MC;
	}
	public void setDDJ11_DW2MC(String dDJ11_DW2MC) {
		DDJ11_DW2MC = dDJ11_DW2MC;
	}
	public String getDDJ11_DW3MC() {
		return DDJ11_DW3MC;
	}
	public void setDDJ11_DW3MC(String dDJ11_DW3MC) {
		DDJ11_DW3MC = dDJ11_DW3MC;
	}
	public String getDDJ11_DW4MC() {
		return DDJ11_DW4MC;
	}
	public void setDDJ11_DW4MC(String dDJ11_DW4MC) {
		DDJ11_DW4MC = dDJ11_DW4MC;
	}
	@Override
	public String toString() {
		return "DFW01_D [JFID=" + JFID + ", DFW01_JFID=" + DFW01_JFID
				+ ", DDJ02_D_JFID=" + DDJ02_D_JFID + ", DDJ02_D_DH="
				+ DDJ02_D_DH + ", DDJ02_D_DLX=" + DDJ02_D_DLX + ", DDJ02_D_MJ="
				+ DDJ02_D_MJ + ", ZW=" + ZW + ", FZDX=" + FZDX + ", SF_FZ="
				+ SF_FZ + ", SF_XP=" + SF_XP + ", KSSJ=" + KSSJ + ", KSRY="
				+ KSRY + ", JSSJ=" + JSSJ + ", JSRY=" + JSRY + ", FZMJ=" + FZMJ
				+ ", SMZT=" + SMZT + ", WGRQ=" + WGRQ + ", WGRY=" + WGRY
				+ ", WGRY_MC=" + WGRY_MC + ", DDJ11_JFID1=" + DDJ11_JFID1
				+ ", DDJ11_MC1=" + DDJ11_MC1 + ", DDJ11_FL1=" + DDJ11_FL1
				+ ", DDJ11_DW1=" + DDJ11_DW1 + ", DDJ11_DJ1=" + DDJ11_DJ1
				+ ", DDJ11_BZGG1=" + DDJ11_BZGG1 + ", SYL1=" + SYL1
				+ ", DDJ11_JFID2=" + DDJ11_JFID2 + ", DDJ11_JFID3="
				+ DDJ11_JFID3 + ", DDJ11_JFID4=" + DDJ11_JFID4 + ", DDJ11_MC2="
				+ DDJ11_MC2 + ", DDJ11_MC3=" + DDJ11_MC3 + ", DDJ11_MC4="
				+ DDJ11_MC4 + ", DDJ11_FL2=" + DDJ11_FL2 + ", DDJ11_FL3="
				+ DDJ11_FL3 + ", DDJ11_FL4=" + DDJ11_FL4 + ", DDJ11_DW2="
				+ DDJ11_DW2 + ", DDJ11_DW3=" + DDJ11_DW3 + ", DDJ11_DW4="
				+ DDJ11_DW4 + ", DDJ11_DJ2=" + DDJ11_DJ2 + ", DDJ11_DJ3="
				+ DDJ11_DJ3 + ", DDJ11_DJ4=" + DDJ11_DJ4 + ", DDJ11_BZGG2="
				+ DDJ11_BZGG2 + ", DDJ11_BZGG3=" + DDJ11_BZGG3
				+ ", DDJ11_BZGG4=" + DDJ11_BZGG4 + ", SYL2=" + SYL2 + ", SYL3="
				+ SYL3 + ", SYL4=" + SYL4 + ", ZT=" + ZT + ", SYQX=" + SYQX
				+ ", ZW_MC=" + ZW_MC + ", KSRY_MC=" + KSRY_MC + ", JSRY_MC="
				+ JSRY_MC + ", SFJE=" + SFJE + "]";
	}
	
	
}
