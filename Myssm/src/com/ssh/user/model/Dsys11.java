package com.ssh.user.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="dsys11")
public class Dsys11 {
/**
* 唯一主见
*/
@Id
private String JFID;
/**
 * 编码类别
 */
@Column(name="BMLB")
private String BMLB;
/**
 * 编码
 */
@Column(name="BM")
private String BM;
/**
 * 汉字说明
 */
@Column(name="HZMC")
private String HZMC;
/**
 * 标志位1
 */
@Column(name="BZ1")
private String BZ1;
/**
 * 标志位2
 */
@Column(name="BZ2")
private String BZ2;
/**
 * 标志位3
 */
@Column(name="BZ3")
private String BZ3;
/**
 * 标志位4
 */
@Column(name="BZ4")
private String BZ4;
/**
 * 标志位5
 */
@Column(name="BZ5")
private String BZ5;
/**
 * 标志位6
 */
@Column(name="BZ6")
private String BZ6;
/**
 * 备注
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
