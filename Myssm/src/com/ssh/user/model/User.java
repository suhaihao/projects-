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
 * �û�ΨһID
 */
@Id
@Column(name="JFID")
private String JFID;
/**
 * �û�����
 */
@Column(name="JFUSERID")
private String JFUSERID;
/**
 * �û�����
 */
@Column(name="JFPASSWORD")
private String JFPASSWORD;

/**
 * ��Ա����
 */
@Column(name="JFNAME")
private String JFNAME;
/**
 * ��Ӧר����֯ID
 */
@Column(name="DDJ01_JFID")
private String DDJ01_JFID;
/**
 * ��ע
 */
@Column(name="JFREMARK")
private String JFREMARK;
/**
 * ״̬ 0���� 1������
 */
@Column(name="JFSTATE")
private String JFSTATE;
/**
 * ����
 */
@Column(name="SR")
private Date SR;
/**
 * �Ա�
 */
@Column(name="XB")
private String XB;
/**
 * ѧ������ZJ_XL
 */
@Column(name="XL")
private String XL;
/**
 * �绰
 */
@Column(name="DH")
private String DH;
/**
 * �ֻ�
 */
@Column(name="SJ")
private String SJ;
/**
 * ��������
 */
@Column(name="DZXX")
private String DZXX;
/**
 * ¼������
 */
@Column(name="LRRQ")
private Date LRRQ;
/**
 * ¼����Ա
 */
@Column(name="LRRY")
private String LRRY;
/**
 * ¼����Ա
 */
@Column(name="LRRYMC")
private String LRRYMC;
/**
 * �Ƿ�ǿ���޸�����
 */
@Column(name="SF_XGPW")
private String SF_XGPW;
/**
 * ��Ա����
 */
@Column(name="RYFL")
private String RYFL;
/**
 * ��Ƭ·��
 */
@Column(name="ZPLJ")
private String ZPLJ;
/**
 * ��Ƭ�ļ���
 */
@Column(name="ZPWJM")
private String ZPWJM;
/**
 * ��Ϣ������� 3 ר����֯ 4 ����
 */
@Column(name="XXDBLB")
private String XXDBLB;
/**
 * ����
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
 * һ�Զ����
 
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
