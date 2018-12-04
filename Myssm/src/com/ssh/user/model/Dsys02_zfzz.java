package com.ssh.user.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "dsys02_zfzz") 
public class Dsys02_zfzz {
/**
 * 表单唯一ID
 */
@Id
private String JFID;
/**
 * 子系统编号
 */
@Column(name="APP_NAME")
private String APP_NAME;
/**
 * 菜单编号
 */
@Column(name="MENU_ID")
private String MENU_ID;
/**
 * 模块编号
 */
@Column(name="ITEM_ID")
private String ITEM_ID;
/**
 * 模块名称
 */
@Column(name="ITEM_NAME")
private String ITEM_NAME;
/**
 * 模块说明
 */
@Column(name="ITEM_CMT")
private String ITEM_CMT;
/**
 * 应用程序
 */
@Column(name="ITEM_WINDOW")
private String ITEM_WINDOW;
/**
 * 对应图标
 */
@Column(name="ITEM_PIC_NAME")
private String ITEM_PIC_NAME;
/**
 * 模块路径
 */
@Column(name="ITEM_PATH")
private String ITEM_PATH;
/**
 * 是否显示0显示1不显示
 */
@Column(name="SF_NOSHOW")
private String SF_NOSHOW;
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
public String getAPP_NAME() {
	return APP_NAME;
}
public void setAPP_NAME(String aPP_NAME) {
	APP_NAME = aPP_NAME;
}
public String getMENU_ID() {
	return MENU_ID;
}
public void setMENU_ID(String mENU_ID) {
	MENU_ID = mENU_ID;
}
public String getITEM_ID() {
	return ITEM_ID;
}
public void setITEM_ID(String iTEM_ID) {
	ITEM_ID = iTEM_ID;
}
public String getITEM_NAME() {
	return ITEM_NAME;
}
public void setITEM_NAME(String iTEM_NAME) {
	ITEM_NAME = iTEM_NAME;
}
public String getITEM_CMT() {
	return ITEM_CMT;
}
public void setITEM_CMT(String iTEM_CMT) {
	ITEM_CMT = iTEM_CMT;
}
public String getITEM_WINDOW() {
	return ITEM_WINDOW;
}
public void setITEM_WINDOW(String iTEM_WINDOW) {
	ITEM_WINDOW = iTEM_WINDOW;
}
public String getITEM_PIC_NAME() {
	return ITEM_PIC_NAME;
}
public void setITEM_PIC_NAME(String iTEM_PIC_NAME) {
	ITEM_PIC_NAME = iTEM_PIC_NAME;
}
public String getITEM_PATH() {
	return ITEM_PATH;
}
public void setITEM_PATH(String iTEM_PATH) {
	ITEM_PATH = iTEM_PATH;
}
public String getSF_NOSHOW() {
	return SF_NOSHOW;
}
public void setSF_NOSHOW(String sF_NOSHOW) {
	SF_NOSHOW = sF_NOSHOW;
}
public String getBZ() {
	return BZ;
}
public void setBZ(String bZ) {
	BZ = bZ;
}

}
