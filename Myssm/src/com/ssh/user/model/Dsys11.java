package com.ssh.user.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dsys11")
public class Dsys11 {
/**
* Ψһ����
*/
@Id
private String JFID;
/**
 * �������
 */
@Column(name="BMLB")
private String BMLB;
/**
 * ����
 */
@Column(name="BM")
private String BM;
/**
 * ����˵��
 */
@Column(name="HZMC")
private String HZMC;
/**
 * ��־λ1
 */
@Column(name="BZ1")
private String BZ1;
/**
 * ��־λ2
 */
@Column(name="BZ2")
private String BZ2;
/**
 * ��־λ3
 */
@Column(name="BZ3")
private String BZ3;
/**
 * ��־λ4
 */
@Column(name="BZ4")
private String BZ4;
/**
 * ��־λ5
 */
@Column(name="BZ5")
private String BZ5;
/**
 * ��־λ6
 */
@Column(name="BZ6")
private String BZ6;
/**
 * ��ע
 */
@Column(name="BZ")
private String BZ;
public String getJFID() {
	return JFID;
}
public void setJFID(String jFID) {
	JFID = jFID;
}
public String getBMLB() {
	return BMLB;
}
public void setBMLB(String bMLB) {
	BMLB = bMLB;
}
public String getBM() {
	return BM;
}
public void setBM(String bM) {
	BM = bM;
}
public String getHZMC() {
	return HZMC;
}
public void setHZMC(String hZMC) {
	HZMC = hZMC;
}
public String getBZ1() {
	return BZ1;
}
public void setBZ1(String bZ1) {
	BZ1 = bZ1;
}
public String getBZ2() {
	return BZ2;
}
public void setBZ2(String bZ2) {
	BZ2 = bZ2;
}
public String getBZ3() {
	return BZ3;
}
public void setBZ3(String bZ3) {
	BZ3 = bZ3;
}
public String getBZ4() {
	return BZ4;
}
public void setBZ4(String bZ4) {
	BZ4 = bZ4;
}
public String getBZ5() {
	return BZ5;
}
public void setBZ5(String bZ5) {
	BZ5 = bZ5;
}
public String getBZ6() {
	return BZ6;
}
public void setBZ6(String bZ6) {
	BZ6 = bZ6;
}
public String getBZ() {
	return BZ;
}
public void setBZ(String bZ) {
	BZ = bZ;
}

}
