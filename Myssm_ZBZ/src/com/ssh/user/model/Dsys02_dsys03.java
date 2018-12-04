package com.ssh.user.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 中间表
 * @author Administrator
 *
 */
@Entity
@Table(name = "dsys02_dsys03")
public class Dsys02_dsys03 {
/**
 * dsys02id
 */
@Column(name = "DSYS02_JFID")
private int DSYS02_JFID;
/**
 * dsys03id
 */
@Column(name = "DSYS03_JFID")
private int DSYS03_JFID;
/**
 * 权限
 */
@Column(name = "QX")
private String QX;
/**
 * 备注
 */
@Column(name = "BZ")
private String BZ;
public int getDSYS02_JFID() {
	return DSYS02_JFID;
}
public void setDSYS02_JFID(int dSYS02_JFID) {
	DSYS02_JFID = dSYS02_JFID;
}
public int getDSYS03_JFID() {
	return DSYS03_JFID;
}
public void setDSYS03_JFID(int dSYS03_JFID) {
	DSYS03_JFID = dSYS03_JFID;
}
public String getQX() {
	return QX;
}
public void setQX(String qX) {
	QX = qX;
}
public String getBZ() {
	return BZ;
}
public void setBZ(String bZ) {
	BZ = bZ;
}

}
