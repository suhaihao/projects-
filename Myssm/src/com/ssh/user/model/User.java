package com.ssh.user.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "dsys01_zfzz") 
public class User {
/**
 * @GeneratedValue(strategy=GenerationType.IDENTITY)
 * 用户唯一ID
 */
@Id
@Column(name="JFID")
private String JFID;
/**
 * 用户姓名
 */
@Column(name="JFUSERID")
private String JFUSERID;
/**
 * 用户密码
 */
@Column(name="JFPASSWORD")
private String JFPASSWORD;

/**
 * 人员名称
 */
@Column(name="JFNAME")
private String JFNAME;
/**
 * 对应专防组织ID
 */
@Column(name="DDJ01_JFID")
private String DDJ01_JFID;
/**
 * 备注
 */
@Column(name="JFREMARK")
private String JFREMARK;
/**
 * 状态 0正常 1不正常
 */
@Column(name="JFSTATE")
private String JFSTATE;
/**
 * 生日
 */
@Column(name="SR")
private Date SR;
/**
 * 性别
 */
@Column(name="XB")
private String XB;
/**
 * 学历代码ZJ_XL
 */
@Column(name="XL")
private String XL;
/**
 * 电话
 */
@Column(name="DH")
private String DH;
/**
 * 手机
 */
@Column(name="SJ")
private String SJ;
/**
 * 电子邮箱
 */
@Column(name="DZXX")
private String DZXX;
/**
 * 录入日期
 */
@Column(name="LRRQ")
private Date LRRQ;
/**
 * 录入人员
 */
@Column(name="LRRY")
private String LRRY;
/**
 * 录入人员
 */
@Column(name="LRRYMC")
private String LRRYMC;
/**
 * 是否强制修改密码
 */
@Column(name="SF_XGPW")
private String SF_XGPW;
/**
 * 人员分类
 */
@Column(name="RYFL")
private String RYFL;
/**
 * 照片路径
 */
@Column(name="ZPLJ")
private String ZPLJ;
/**
 * 照片文件名
 */
@Column(name="ZPWJM")
private String ZPWJM;
/**
 * 消息代表类别 3 专访组织 4 个人
 */
@Column(name="XXDBLB")
private String XXDBLB;
/**
 * 序列
 */
@Column(name="RN")
private String RN;

public String getRN() {
	return RN;
}
public void setRN(String rN) {
	RN = rN;
}
public String getXXDBLB() {
	return XXDBLB;
}
public void setXXDBLB(String xXDBLB) {
	XXDBLB = xXDBLB;
}
public String getJFID() {
	return JFID;
}
public void setJFID(String jFID) {
	JFID = jFID;
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
public String getJFNAME() {
	return JFNAME;
}
public void setJFNAME(String jFNAME) {
	JFNAME = jFNAME;
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
public String getSF_XGPW() {
	return SF_XGPW;
}
public void setSF_XGPW(String sF_XGPW) {
	SF_XGPW = sF_XGPW;
}
public String getRYFL() {
	return RYFL;
}
public void setRYFL(String rYFL) {
	RYFL = rYFL;
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
public String getDDJ01_JFID() {
	return DDJ01_JFID;
}
public void setDDJ01_JFID(String dDJ01_JFID) {
	DDJ01_JFID = dDJ01_JFID;
}
public String getLRRYMC() {
	return LRRYMC;
}
public void setLRRYMC(String lRRYMC) {
	LRRYMC = lRRYMC;
}
@Override
public String toString() {
	return "User [JFID=" + JFID + ", JFUSERID=" + JFUSERID + ", JFPASSWORD="
			+ JFPASSWORD + ", JFNAME=" + JFNAME + ", DDJ01_JFID=" + DDJ01_JFID
			+ ", JFREMARK=" + JFREMARK + ", JFSTATE=" + JFSTATE + ", SR=" + SR
			+ ", XB=" + XB + ", XL=" + XL + ", DH=" + DH + ", SJ=" + SJ
			+ ", DZXX=" + DZXX + ", LRRQ=" + LRRQ + ", LRRY=" + LRRY
			+ ", LRRYMC=" + LRRYMC + ", SF_XGPW=" + SF_XGPW + ", RYFL=" + RYFL
			+ ", ZPLJ=" + ZPLJ + ", ZPWJM=" + ZPWJM + ", XXDBLB=" + XXDBLB
			+ "]";
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
