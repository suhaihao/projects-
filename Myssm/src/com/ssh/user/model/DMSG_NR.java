package com.ssh.user.model;

public class DMSG_NR {
	/**
	 * ��Ӧ����ʱ��
	 */
	private String FS_RQ;
	/**
	 * ��������
	 */
	private String NR;
	/**
	 * ͼƬ��ַ
	 */
	private String TB_DZ;
	/**
	 * ���ͷ���
	 */
	private String FX;
	
	public String getFX() {
		return FX;
	}
	public void setFX(String fX) {
		FX = fX;
	}
	public String getFS_RQ() {
		return FS_RQ;
	}
	public void setFS_RQ(String fS_RQ) {
		FS_RQ = fS_RQ;
	}
	public String getNR() {
		return NR;
	}
	public void setNR(String nR) {
		NR = nR;
	}
	public String getTB_DZ() {
		return TB_DZ;
	}
	public void setTB_DZ(String tB_DZ) {
		TB_DZ = tB_DZ;
	}
	@Override
	public String toString() {
		return "DMSG_NR [FS_RQ=" + FS_RQ + ", NR=" + NR + ", FX=" + FX
				+ ", TB_DZ=" + TB_DZ + "]";
	}
	
}
