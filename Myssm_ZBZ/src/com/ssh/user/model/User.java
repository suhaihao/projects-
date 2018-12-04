package com.ssh.user.model;

import java.util.Date;


public class User {
/**
 * 用户唯一ID
 */
private Integer JFID;
/**
 * 字符ID
 */
private String JFIDSTR;
/**
 * 人员名称
 */
private String JFNAME;
/**
 * 对应dsys05部门编码
 */
private String JFDSYS05_CODE;
/**
 * 部门名称
 */
private String JFDSYS05_CODEMC;
/**
 * 用户姓名
 */
private String JFUSERID;
/**
 * 用户密码
 */
private String JFPASSWORD;
/**
 * 专访组织ID
 */
private String DDJ01_JFID;
/**
 * 备注
 */
private String JFREMARK;
/**
 * 状态0正常1不正常
 */
private String JFSTATE;
/**
 * 人员分类 ZJ_RYFL
 */
private String RYFL;
/**
 * 生日
 */
private Date SR;
/**
 * 性别
 */
private String XB;
/**
 * 学历ZJ_XL
 */
private String XL;
/**
 * 电话
 */
private String DH;
/**
 * 手机
 */
private String SJ;
/**
 * 电子邮箱
 */
private String DZXX;
/**
 * 录入日期
 */
private Date LRRQ;
/**
 * 录入人员
 */
private String LRRY;
/**
 * 录入人员名称
 */
private String LRRYMC;
/**
 * 照片路径
 */
private String ZPLJ;
/**
 * 文件名
 */
private String ZPWJM;
/**
 * 查询范围
 */
private String CXFW;
/**
 * 是否强制修改密码
 */
private String SF_XGPW;
/**
 * 消息代表类别
 */
private String XXDBLB;
/**
 * 序列
 */
private String RN;

public String getLRRYMC() {
	return LRRYMC;
}
public void setLRRYMC(String lRRYMC) {
	LRRYMC = lRRYMC;
}
public String getJFIDSTR() {
	return JFIDSTR;
}
public void setJFIDSTR(String jFIDSTR) {
	JFIDSTR = jFIDSTR;
}
public String getDDJ01_JFID() {
	return DDJ01_JFID;
}
public void setDDJ01_JFID(String dDJ01_JFID) {
	DDJ01_JFID = dDJ01_JFID;
}
public String getJFDSYS05_CODEMC() {
	return JFDSYS05_CODEMC;
}
public void setJFDSYS05_CODEMC(String jFDSYS05_CODEMC) {
	JFDSYS05_CODEMC = jFDSYS05_CODEMC;
}
public Integer getJFID() {
	return JFID;
}
public void setJFID(Integer jFID) {
	JFID = jFID;
}
public String getJFNAME() {
	return JFNAME;
}
public void setJFNAME(String jFNAME) {
	JFNAME = jFNAME;
}
public String getJFDSYS05_CODE() {
	return JFDSYS05_CODE;
}
public void setJFDSYS05_CODE(String jFDSYS05_CODE) {
	JFDSYS05_CODE = jFDSYS05_CODE;
}
public String getJFUSERID() {
	return JFUSERID;
}
public void setJFUSERID(String jFUSERID) {
	JFUSERID = jFUSERID;
}
public String getJFPASSWORD() {
	return JFPASSWORD;
}
public void setJFPASSWORD(String jFPASSWORD) {
	JFPASSWORD = jFPASSWORD;
}
public String getJFREMARK() {
	return JFREMARK;
}
public void setJFREMARK(String jFREMARK) {
	JFREMARK = jFREMARK;
}
public String getJFSTATE() {
	return JFSTATE;
}
public void setJFSTATE(String jFSTATE) {
	JFSTATE = jFSTATE;
}
public String getRYFL() {
	return RYFL;
}
public void setRYFL(String rYFL) {
	RYFL = rYFL;
}
public Date getSR() {
	return SR;
}
public void setSR(Date sR) {
	SR = sR;
}
public String getXB() {
	return XB;
}
public void setXB(String xB) {
	XB = xB;
}
public String getXL() {
	return XL;
}
public void setXL(String xL) {
	XL = xL;
}
public String getDH() {
	return DH;
}
public void setDH(String dH) {
	DH = dH;
}
public String getSJ() {
	return SJ;
}
public void setSJ(String sJ) {
	SJ = sJ;
}
public String getDZXX() {
	return DZXX;
}
public void setDZXX(String dZXX) {
	DZXX = dZXX;
}
public Date getLRRQ() {
	return LRRQ;
}
public void setLRRQ(Date lRRQ) {
	LRRQ = lRRQ;
}
public String getLRRY() {
	return LRRY;
}
public void setLRRY(String lRRY) {
	LRRY = lRRY;
}
public String getZPLJ() {
	return ZPLJ;
}
public void setZPLJ(String zPLJ) {
	ZPLJ = zPLJ;
}
public String getZPWJM() {
	return ZPWJM;
}
public void setZPWJM(String zPWJM) {
	ZPWJM = zPWJM;
}
public String getCXFW() {
	return CXFW;
}
public void setCXFW(String cXFW) {
	CXFW = cXFW;
}
public String getSF_XGPW() {
	return SF_XGPW;
}
public void setSF_XGPW(String sF_XGPW) {
	SF_XGPW = sF_XGPW;
}
public String getXXDBLB() {
	return XXDBLB;
}
public void setXXDBLB(String xXDBLB) {
	XXDBLB = xXDBLB;
}
public String getRN() {
	return RN;
}
public void setRN(String rN) {
	RN = rN;
}
@Override
public String toString() {
	return "User [JFID=" + JFID + ", JFNAME=" + JFNAME + ", JFDSYS05_CODE="
			+ JFDSYS05_CODE + ", JFUSERID=" + JFUSERID + ", JFPASSWORD="
			+ JFPASSWORD + ", JFREMARK=" + JFREMARK + ", JFSTATE=" + JFSTATE
			+ ", RYFL=" + RYFL + ", SR=" + SR + ", XB=" + XB + ", XL=" + XL
			+ ", DH=" + DH + ", SJ=" + SJ + ", DZXX=" + DZXX + ", LRRQ=" + LRRQ
			+ ", LRRY=" + LRRY + ", ZPLJ=" + ZPLJ + ", ZPWJM=" + ZPWJM
			+ ", CXFW=" + CXFW + ", SF_XGPW=" + SF_XGPW + ", XXDBLB=" + XXDBLB
			+ ", RN=" + RN + "]";
}


/**
 * 一对多关联
 
@OneToMany(targetEntity=Teachaer.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
@JoinColumn(name="sonname",updatable=false) 
private Set<Teachaer> teachaers = new HashSet<Teachaer>();

public Set<Teachaer> getTeachaers() {
	return teachaers;
}
public void setTeachaers(Set<Teachaer> teachaers) {
	this.teachaers = teachaers;
}
*/

}
