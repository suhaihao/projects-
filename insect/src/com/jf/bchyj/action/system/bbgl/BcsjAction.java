package com.jf.bchyj.action.system.bbgl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.jf.bchyj.bean.User;
import com.jf.util.ExportExcel;

import mt.controller.InitAction;
import mt.controller.base.ServletObject;
import mt.database.extend.ExecuteConnection;

public class BcsjAction extends InitAction {
	protected void other(ServletObject so) {
		String fwd = so.getActForward();
		User user = (User) so.httpServletRequest.getSession().getAttribute(
				"user");
		String BMBM = user.getBmbm();
		String JFID = so.httpServletRequest.getParameter("JFID");
		String KSTBRQ = so.httpServletRequest.getParameter("KSTBRQ");
		String JZTBRQ = so.httpServletRequest.getParameter("JZTBRQ");
		String RWSJ = so.httpServletRequest.getParameter("RWSJ");
		String DCRQ = so.httpServletRequest.getParameter("DCRQ");
		String ZT = so.httpServletRequest.getParameter("ZT");
		String lb = so.httpServletRequest.getParameter("lb");
		String zbid = so.httpServletRequest.getParameter("zbid");
		String rwid = so.httpServletRequest.getParameter("rwid");
		String LRRY = user.getUsername();
		Calendar c = Calendar.getInstance();
		String JFNO = c.get(Calendar.YEAR) + "" + (c.get(Calendar.MONTH) + 1)
				+ zbid;
		String BBLX = "";
		if (ZT.equals("0")) {
			BBLX = "1";
		} else {
			if (lb.equals("zc")) {
				BBLX = "2";
			} else if (lb.equals("cb")) {
				BBLX = "3";
			} else if (lb.equals("lb")) {
				BBLX = "4";
			}
		}
			// 小麦病虫周报表
			try {
				if (fwd.equals("Q001")) {
					String YC_BZCD = so.httpServletRequest
							.getParameter("YC_BZCD");
					String YC_XZCD = so.httpServletRequest
							.getParameter("YC_XZCD");
					String YC_DQFS = so.httpServletRequest
							.getParameter("YC_DQFS");
					String YC_DQTB_FS = so.httpServletRequest
							.getParameter("YC_DQTB_FS");
					String YC_BZFS = so.httpServletRequest
							.getParameter("YC_BZFS");
					String YC_LJFS = so.httpServletRequest
							.getParameter("YC_LJFS");
					String YC_LJTB_SQ = so.httpServletRequest
							.getParameter("YC_LJTB_SQ");
					String YC_LJTB_SZ = so.httpServletRequest
							.getParameter("YC_LJTB_SZ");
					String YC_DQFZ = so.httpServletRequest
							.getParameter("YC_DQFZ");
					String YC_DQTB_FZ = so.httpServletRequest
							.getParameter("YC_DQTB_FZ");
					String YC_BZWC = so.httpServletRequest
							.getParameter("YC_BZWC");
					String YC_LJFZ = so.httpServletRequest
							.getParameter("YC_LJFZ");
					String YC_LJTB_FZ = so.httpServletRequest
							.getParameter("YC_LJTB_FZ");
					String YC_FZXG = so.httpServletRequest
							.getParameter("YC_FZXG");
					String YC_RXFZ = so.httpServletRequest
							.getParameter("YC_RXFZ");
					String YC_PJMD = so.httpServletRequest
							.getParameter("YC_PJMD");
					String YC_ZGMD = so.httpServletRequest
							.getParameter("YC_ZGMD");
					String YC_FSQY = so.httpServletRequest
							.getParameter("YC_FSQY");
					String XJC_BZCD = so.httpServletRequest
							.getParameter("XJC_BZCD");
					String XJC_XZCD = so.httpServletRequest
							.getParameter("XJC_XZCD");
					String XJC_DQFS = so.httpServletRequest
							.getParameter("XJC_DQFS");
					String XJC_DQTB_FS = so.httpServletRequest
							.getParameter("XJC_DQTB_FS");
					String XJC_BZFS = so.httpServletRequest
							.getParameter("XJC_BZFS");
					String XJC_LJFS = so.httpServletRequest
							.getParameter("XJC_LJFS");
					String XJC_LJTB_SQ = so.httpServletRequest
							.getParameter("XJC_LJTB_SQ");
					String XJC_LJTB_SZ = so.httpServletRequest
							.getParameter("XJC_LJTB_SZ");
					String XJC_DQFZ = so.httpServletRequest
							.getParameter("XJC_DQFZ");
					String XJC_DQTB_FZ = so.httpServletRequest
							.getParameter("XJC_DQTB_FZ");
					String XJC_BZWC = so.httpServletRequest
							.getParameter("XJC_BZWC");
					String XJC_LJFZ = so.httpServletRequest
							.getParameter("XJC_LJFZ");
					String XJC_LJTB_FZ = so.httpServletRequest
							.getParameter("XJC_LJTB_FZ");
					String XJC_FZXG = so.httpServletRequest
							.getParameter("XJC_FZXG");
					String XJC_RXFZ = so.httpServletRequest
							.getParameter("XJC_RXFZ");
					String XJC_FSQY = so.httpServletRequest
							.getParameter("XJC_FSQY");
					String MZZ_BZCD = so.httpServletRequest
							.getParameter("MZZ_BZCD");
					String MZZ_XZCD = so.httpServletRequest
							.getParameter("MZZ_XZCD");
					String MZZ_DQFS = so.httpServletRequest
							.getParameter("MZZ_DQFS");
					String MZZ_DQTB_FS = so.httpServletRequest
							.getParameter("MZZ_DQTB_FS");
					String MZZ_BZFS = so.httpServletRequest
							.getParameter("MZZ_BZFS");
					String MZZ_LJFS = so.httpServletRequest
							.getParameter("MZZ_LJFS");
					String MZZ_LJTB_SQ = so.httpServletRequest
							.getParameter("MZZ_LJTB_SQ");
					String MZZ_LJTB_SZ = so.httpServletRequest
							.getParameter("MZZ_LJTB_SZ");
					String MZZ_DQFZ = so.httpServletRequest
							.getParameter("MZZ_DQFZ");
					String MZZ_DQTB_FZ = so.httpServletRequest
							.getParameter("MZZ_DQTB_FZ");
					String MZZ_BZWC = so.httpServletRequest
							.getParameter("MZZ_BZWC");
					String MZZ_LJFZ = so.httpServletRequest
							.getParameter("MZZ_LJFZ");
					String MZZ_LJTB_FZ = so.httpServletRequest
							.getParameter("MZZ_LJTB_FZ");
					String MZZ_FZXG = so.httpServletRequest
							.getParameter("MZZ_FZXG");
					String MZZ_RXFZ = so.httpServletRequest
							.getParameter("MZZ_RXFZ");
					String MZZ_PJMD = so.httpServletRequest
							.getParameter("MZZ_PJMD");
					String MZZ_ZGMD = so.httpServletRequest
							.getParameter("MZZ_ZGMD");
					String MZZ_FSQY = so.httpServletRequest
							.getParameter("MZZ_FSQY");
					String TXB_BZCD = so.httpServletRequest
							.getParameter("TXB_BZCD");
					String TXB_XZCD = so.httpServletRequest
							.getParameter("TXB_XZCD");
					String TXB_DQFS = so.httpServletRequest
							.getParameter("TXB_DQFS");
					String TXB_DQTB_FS = so.httpServletRequest
							.getParameter("TXB_DQTB_FS");
					String TXB_BZFS = so.httpServletRequest
							.getParameter("TXB_BZFS");
					String TXB_LJFS = so.httpServletRequest
							.getParameter("TXB_LJFS");
					String TXB_LJTB_SQ = so.httpServletRequest
							.getParameter("TXB_LJTB_SQ");
					String TXB_LJTB_SZ = so.httpServletRequest
							.getParameter("TXB_LJTB_SZ");
					String TXB_DQFZ = so.httpServletRequest
							.getParameter("TXB_DQFZ");
					String TXB_DQTB_FZ = so.httpServletRequest
							.getParameter("TXB_DQTB_FZ");
					String TXB_BZWC = so.httpServletRequest
							.getParameter("TXB_BZWC");
					String TXB_LJFZ = so.httpServletRequest
							.getParameter("TXB_LJFZ");
					String TXB_LJTB_FZ = so.httpServletRequest
							.getParameter("TXB_LJTB_FZ");
					String TXB_FZXG = so.httpServletRequest
							.getParameter("TXB_FZXG");
					String TXB_RXFZ = so.httpServletRequest
							.getParameter("TXB_RXFZ");
					String TXB_PJMD = so.httpServletRequest
							.getParameter("TXB_PJMD");
					String TXB_ZGMD = so.httpServletRequest
							.getParameter("TXB_ZGMD");
					String TXB_FSQY = so.httpServletRequest
							.getParameter("TXB_FSQY");
					String BFB_BZCD = so.httpServletRequest
							.getParameter("BFB_BZCD");
					String BFB_XZCD = so.httpServletRequest
							.getParameter("BFB_XZCD");
					String BFB_DQFS = so.httpServletRequest
							.getParameter("BFB_DQFS");
					String BFB_DQTB_FS = so.httpServletRequest
							.getParameter("BFB_DQTB_FS");
					String BFB_BZFS = so.httpServletRequest
							.getParameter("BFB_BZFS");
					String BFB_LJFS = so.httpServletRequest
							.getParameter("BFB_LJFS");
					String BFB_LJTB_SQ = so.httpServletRequest
							.getParameter("BFB_LJTB_SQ");
					String BFB_LJTB_SZ = so.httpServletRequest
							.getParameter("BFB_LJTB_SZ");
					String BFB_DQFZ = so.httpServletRequest
							.getParameter("BFB_DQFZ");
					String BFB_DQTB_FZ = so.httpServletRequest
							.getParameter("BFB_DQTB_FZ");
					String BFB_BZWC = so.httpServletRequest
							.getParameter("BFB_BZWC");
					String BFB_LJFZ = so.httpServletRequest
							.getParameter("BFB_LJFZ");
					String BFB_LJTB_FZ = so.httpServletRequest
							.getParameter("BFB_LJTB_FZ");
					String BFB_FZXG = so.httpServletRequest
							.getParameter("BFB_FZXG");
					String BFB_RXFZ = so.httpServletRequest
							.getParameter("BFB_RXFZ");
					String BFB_PJMD = so.httpServletRequest
							.getParameter("BFB_PJMD");
					String BFB_ZGMD = so.httpServletRequest
							.getParameter("BFB_ZGMD");
					String BFB_FSQY = so.httpServletRequest
							.getParameter("BFB_FSQY");
					String WKB_BZCD = so.httpServletRequest
							.getParameter("WKB_BZCD");
					String WKB_XZCD = so.httpServletRequest
							.getParameter("WKB_XZCD");
					String WKB_DQFS = so.httpServletRequest
							.getParameter("WKB_DQFS");
					String WKB_DQTB_FS = so.httpServletRequest
							.getParameter("WKB_DQTB_FS");
					String WKB_BZFS = so.httpServletRequest
							.getParameter("WKB_BZFS");
					String WKB_LJFS = so.httpServletRequest
							.getParameter("WKB_LJFS");
					String WKB_LJTB_SQ = so.httpServletRequest
							.getParameter("WKB_LJTB_SQ");
					String WKB_LJTB_SZ = so.httpServletRequest
							.getParameter("WKB_LJTB_SZ");
					String WKB_DQFZ = so.httpServletRequest
							.getParameter("WKB_DQFZ");
					String WKB_DQTB_FZ = so.httpServletRequest
							.getParameter("WKB_DQTB_FZ");
					String WKB_BZWC = so.httpServletRequest
							.getParameter("WKB_BZWC");
					String WKB_LJFZ = so.httpServletRequest
							.getParameter("WKB_LJFZ");
					String WKB_LJTB_FZ = so.httpServletRequest
							.getParameter("WKB_LJTB_FZ");
					String WKB_FZXG = so.httpServletRequest
							.getParameter("WKB_FZXG");
					String WKB_RXFZ = so.httpServletRequest
							.getParameter("WKB_RXFZ");
					String WKB_PJMD = so.httpServletRequest
							.getParameter("WKB_PJMD");
					String WKB_ZGMD = so.httpServletRequest
							.getParameter("WKB_ZGMD");
					String WKB_FSQY = so.httpServletRequest
							.getParameter("WKB_FSQY");
					String CMB_BZCD = so.httpServletRequest
							.getParameter("CMB_BZCD");
					String CMB_XZCD = so.httpServletRequest
							.getParameter("CMB_XZCD");
					String CMB_DQFS = so.httpServletRequest
							.getParameter("CMB_DQFS");
					String CMB_DQTB_FS = so.httpServletRequest
							.getParameter("CMB_DQTB_FS");
					String CMB_BZFS = so.httpServletRequest
							.getParameter("CMB_BZFS");
					String CMB_LJFS = so.httpServletRequest
							.getParameter("CMB_LJFS");
					String CMB_LJTB_SQ = so.httpServletRequest
							.getParameter("CMB_LJTB_SQ");
					String CMB_LJTB_SZ = so.httpServletRequest
							.getParameter("CMB_LJTB_SZ");
					String CMB_DQFZ = so.httpServletRequest
							.getParameter("CMB_DQFZ");
					String CMB_DQTB_FZ = so.httpServletRequest
							.getParameter("CMB_DQTB_FZ");
					String CMB_BZWC = so.httpServletRequest
							.getParameter("CMB_BZWC");
					String CMB_LJFZ = so.httpServletRequest
							.getParameter("CMB_LJFZ");
					String CMB_LJTB_FZ = so.httpServletRequest
							.getParameter("CMB_LJTB_FZ");
					String CMB_FZXG = so.httpServletRequest
							.getParameter("CMB_FZXG");
					String CMB_RXFZ = so.httpServletRequest
							.getParameter("CMB_RXFZ");
					String CMB_PJMD = so.httpServletRequest
							.getParameter("CMB_PJMD");
					String CMB_ZGMD = so.httpServletRequest
							.getParameter("CMB_ZGMD");
					String CMB_FSQY = so.httpServletRequest
							.getParameter("CMB_FSQY");
					String SYQ = so.httpServletRequest.getParameter("SYQ");
					String FSQK = so.httpServletRequest.getParameter("FSQK");
					String FKQK = so.httpServletRequest.getParameter("FKQK");
					String FKFX = so.httpServletRequest.getParameter("FKFX");
					String HJ_BZCD = "";
					String HJ_XZCD = "";
					String HJ_DQFS = so.httpServletRequest
							.getParameter("HJ_DQFS");
					String HJ_DQTB_FS = so.httpServletRequest
							.getParameter("HJ_DQTB_FS");
					String HJ_BZFS = so.httpServletRequest
							.getParameter("HJ_BZFS");
					String HJ_LJFS = so.httpServletRequest
							.getParameter("HJ_LJFS");
					String HJ_LJTB_SQ = so.httpServletRequest
							.getParameter("HJ_LJTB_SQ");
					String HJ_LJTB_SZ = so.httpServletRequest
							.getParameter("HJ_LJTB_SZ");
					String HJ_DQFZ = so.httpServletRequest
							.getParameter("HJ_DQFZ");
					String HJ_DQTB_FZ = so.httpServletRequest
							.getParameter("HJ_DQTB_FZ");
					String HJ_BZWC = so.httpServletRequest
							.getParameter("HJ_BZWC");
					String HJ_LJFZ = so.httpServletRequest
							.getParameter("HJ_LJFZ");
					String HJ_LJTB_FZ = so.httpServletRequest
							.getParameter("HJ_LJTB_FZ");
					String HJ_FZXG = so.httpServletRequest
							.getParameter("HJ_FZXG");
					String HJ_RXFZ = so.httpServletRequest
							.getParameter("HJ_RXFZ");
					String HJ_PJMD = so.httpServletRequest
							.getParameter("HJ_PJMD");
					String HJ_ZGMD = so.httpServletRequest
							.getParameter("HJ_ZGMD");
					String HJ_FSQY = so.httpServletRequest
							.getParameter("HJ_FSQY");
					String XJC_PJMD_YC = so.httpServletRequest
							.getParameter("XJC_PJMD_YC");
					String XJC_ZGMD_YC = so.httpServletRequest
							.getParameter("XJC_ZGMD_YC");
					String XJC_PJMD_CC = so.httpServletRequest
							.getParameter("XJC_PJMD_CC");
					String XJC_ZGMD_CC = so.httpServletRequest
							.getParameter("XJC_ZGMD_CC");
					String XJC_PJMD_WHL = so.httpServletRequest
							.getParameter("XJC_PJMD_WHL");
					String XJC_ZGMD_WHL = so.httpServletRequest
							.getParameter("XJC_ZGMD_WHL");
					String XJC_PJMD_BHCL = so.httpServletRequest
							.getParameter("XJC_PJMD_BHCL");
					String XJC_ZGMD_BHCL = so.httpServletRequest
							.getParameter("XJC_ZGMD_BHCL");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d001.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D"
								+ zbid
								+ " (JFID,YC_BZCD,YC_XZCD,YC_DQFS,YC_DQTB_FS,YC_BZFS,YC_LJFS,YC_LJTB_SQ,YC_LJTB_SZ,YC_DQFZ,YC_DQTB_FZ,YC_BZWC,YC_LJFZ,YC_LJTB_FZ,YC_FZXG,YC_RXFZ,YC_PJMD,"
								+ "YC_ZGMD,YC_FSQY,XJC_BZCD,XJC_XZCD,XJC_DQFS,XJC_DQTB_FS,"
								+ "XJC_BZFS,XJC_LJFS,XJC_LJTB_SQ,XJC_LJTB_SZ,XJC_DQFZ,"
								+ "XJC_DQTB_FZ,XJC_BZWC,XJC_LJFZ,XJC_LJTB_FZ,XJC_FZXG,"
								+ "XJC_RXFZ,XJC_FSQY,MZZ_BZCD,MZZ_XZCD,MZZ_DQFS,MZZ_DQTB_FS,"
								+ "MZZ_BZFS,MZZ_LJFS,MZZ_LJTB_SQ,MZZ_LJTB_SZ,MZZ_DQFZ,MZZ_DQTB_FZ,"
								+ "MZZ_BZWC,MZZ_LJFZ,MZZ_LJTB_FZ,MZZ_FZXG,MZZ_RXFZ,MZZ_PJMD,MZZ_ZGMD,"
								+ "MZZ_FSQY,TXB_BZCD,TXB_XZCD,"
								+ "TXB_BZFS,TXB_LJFS,TXB_LJTB_SQ,"
								+ "TXB_LJTB_SZ,TXB_DQFZ,TXB_DQTB_FZ,"
								+ "TXB_BZWC,TXB_LJFZ,TXB_LJTB_FZ,"
								+ "TXB_FZXG,TXB_RXFZ,TXB_PJMD,"
								+ "TXB_ZGMD,TXB_FSQY,BFB_BZCD,"
								+ "BFB_XZCD,BFB_DQFS,BFB_DQTB_FS,"
								+ "BFB_BZFS,BFB_LJFS,BFB_LJTB_SQ,"
								+ "BFB_LJTB_SZ,BFB_DQFZ,BFB_DQTB_FZ,"
								+ "BFB_BZWC,BFB_LJFZ,BFB_LJTB_FZ,"
								+ "BFB_FZXG,BFB_RXFZ,BFB_PJMD,"
								+ "BFB_ZGMD,BFB_FSQY,WKB_BZCD,"
								+ "WKB_XZCD,WKB_DQFS,WKB_DQTB_FS,"
								+ "WKB_BZFS,WKB_LJFS,WKB_LJTB_SQ,"
								+ "WKB_LJTB_SZ,WKB_DQFZ,WKB_DQTB_FZ,"
								+ "WKB_BZWC,WKB_LJFZ,WKB_LJTB_FZ,"
								+ "WKB_FZXG,WKB_RXFZ,WKB_PJMD,"
								+ "WKB_ZGMD,WKB_FSQY,CMB_BZCD,"
								+ "CMB_XZCD,CMB_DQFS,CMB_DQTB_FS,"
								+ "CMB_BZFS,CMB_LJFS,CMB_LJTB_SQ,"
								+ "CMB_LJTB_SZ,CMB_DQFZ,CMB_DQTB_FZ,"
								+ "CMB_BZWC,CMB_LJFZ,CMB_LJTB_FZ,"
								+ "CMB_FZXG,CMB_RXFZ,CMB_PJMD,"
								+ "CMB_ZGMD,CMB_FSQY,SYQ,"
								+ "FSQK,FKQK,FKFX,"
								+ "HJ_BZCD,HJ_XZCD,HJ_DQFS,"
								+ "HJ_DQTB_FS,HJ_BZFS,HJ_LJFS,"
								+ "HJ_LJTB_SQ,HJ_LJTB_SZ,HJ_DQFZ,"
								+ "HJ_DQTB_FZ,HJ_BZWC,HJ_LJFZ,"
								+ "HJ_LJTB_FZ,HJ_FZXG,HJ_RXFZ,"
								+ "HJ_PJMD,HJ_ZGMD,HJ_FSQY,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,DCRQ,"
								+ "XJC_PJMD_YC,XJC_ZGMD_YC,XJC_PJMD_CC,"
								+ "XJC_ZGMD_CC,XJC_PJMD_WHL,XJC_ZGMD_WHL,"
								+ "TXB_DQFS,TXB_DQTB_FS,XJC_PJMD_BHCL,XJC_ZGMD_BHCL) VALUES ('"
								+ JFID + "','" + YC_BZCD + "','" + YC_XZCD
								+ "','" + YC_DQFS + "','" + YC_DQTB_FS + "','"
								+ YC_BZFS + "','" + YC_LJFS + "','"
								+ YC_LJTB_SQ + "','" + YC_LJTB_SZ + "','"
								+ YC_DQFZ + "','" + YC_DQTB_FZ + "','"
								+ YC_BZWC + "','" + YC_LJFZ + "','"
								+ YC_LJTB_FZ + "','" + YC_FZXG + "','"
								+ YC_RXFZ + "','" + YC_PJMD + "','" + YC_ZGMD
								+ "','" + YC_FSQY + "','" + XJC_BZCD + "','"
								+ XJC_XZCD + "','" + XJC_DQFS + "','"
								+ XJC_DQTB_FS + "','" + XJC_BZFS + "','"
								+ XJC_LJFS + "','" + XJC_LJTB_SQ + "','"
								+ XJC_LJTB_SZ + "','" + XJC_DQFZ + "','"
								+ XJC_DQTB_FZ + "','" + XJC_BZWC + "','"
								+ XJC_LJFZ + "','" + XJC_LJTB_FZ + "','"
								+ XJC_FZXG + "','" + XJC_RXFZ + "','"
								+ XJC_FSQY + "','" + MZZ_BZCD + "','"
								+ MZZ_XZCD + "','" + MZZ_DQFS + "','"
								+ MZZ_DQTB_FS + "','" + MZZ_BZFS + "','"
								+ MZZ_LJFS + "','" + MZZ_LJTB_SQ + "','"
								+ MZZ_LJTB_SZ + "','" + MZZ_DQFZ + "','"
								+ MZZ_DQTB_FZ + "','" + MZZ_BZWC + "','"
								+ MZZ_LJFZ + "','" + MZZ_LJTB_FZ + "','"
								+ MZZ_FZXG + "','" + MZZ_RXFZ + "','"
								+ MZZ_PJMD + "','" + MZZ_ZGMD + "','"
								+ MZZ_FSQY + "','" + TXB_BZCD + "','"
								+ TXB_XZCD + "','" + TXB_BZFS + "','"
								+ TXB_LJFS + "','" + TXB_LJTB_SQ + "','"
								+ TXB_LJTB_SZ + "','" + TXB_DQFZ + "','"
								+ TXB_DQTB_FZ + "','" + TXB_BZWC + "','"
								+ TXB_LJFZ + "','" + TXB_LJTB_FZ + "','"
								+ TXB_FZXG + "','" + TXB_RXFZ + "','"
								+ TXB_PJMD + "','" + TXB_ZGMD + "','"
								+ TXB_FSQY + "','" + BFB_BZCD + "','"
								+ BFB_XZCD + "','" + BFB_DQFS + "','"
								+ BFB_DQTB_FS + "','" + BFB_BZFS + "','"
								+ BFB_LJFS + "','" + BFB_LJTB_SQ + "','"
								+ BFB_LJTB_SZ + "','" + BFB_DQFZ + "','"
								+ BFB_DQTB_FZ + "','" + BFB_BZWC + "','"
								+ BFB_LJFZ + "','" + BFB_LJTB_FZ + "','"
								+ BFB_FZXG + "','" + BFB_RXFZ + "','"
								+ BFB_PJMD + "','" + BFB_ZGMD + "','"
								+ BFB_FSQY + "','" + WKB_BZCD + "','"
								+ WKB_XZCD + "','" + WKB_DQFS + "','"
								+ WKB_DQTB_FS + "','" + WKB_BZFS + "','"
								+ WKB_LJFS + "','" + WKB_LJTB_SQ + "','"
								+ WKB_LJTB_SZ + "','" + WKB_DQFZ + "','"
								+ WKB_DQTB_FZ + "','" + WKB_BZWC + "','"
								+ WKB_LJFZ + "','" + WKB_LJTB_FZ + "','"
								+ WKB_FZXG + "','" + WKB_RXFZ + "','"
								+ WKB_PJMD + "','" + WKB_ZGMD + "','"
								+ WKB_FSQY + "','" + CMB_BZCD + "','"
								+ CMB_XZCD + "','" + CMB_DQFS + "','"
								+ CMB_DQTB_FS + "','" + CMB_BZFS + "','"
								+ CMB_LJFS + "','" + CMB_LJTB_SQ + "','"
								+ CMB_LJTB_SZ + "','" + CMB_DQFZ + "','"
								+ CMB_DQTB_FZ + "','" + CMB_BZWC + "','"
								+ CMB_LJFZ + "','" + CMB_LJTB_FZ + "','"
								+ CMB_FZXG + "','" + CMB_RXFZ + "','"
								+ CMB_PJMD + "','" + CMB_ZGMD + "','"
								+ CMB_FSQY + "','" + SYQ + "','" + FSQK + "','"
								+ FKQK + "','" + FKFX + "','" + HJ_BZCD + "','"
								+ HJ_XZCD + "','" + HJ_DQFS + "','"
								+ HJ_DQTB_FS + "','" + HJ_BZFS + "','"
								+ HJ_LJFS + "','" + HJ_LJTB_SQ + "','"
								+ HJ_LJTB_SZ + "','" + HJ_DQFZ + "','"
								+ HJ_DQTB_FZ + "','" + HJ_BZWC + "','"
								+ HJ_LJFZ + "','" + HJ_LJTB_FZ + "','"
								+ HJ_FZXG + "','" + HJ_RXFZ + "','" + HJ_PJMD
								+ "','" + HJ_ZGMD + "','" + HJ_FSQY + "','"
								+ JFNO + "',to_date('" + KSTBRQ
								+ "','yyyy-MM-dd HH24:mi:ss'),to_date('"
								+ JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'" + LRRY
								+ "',to_date('" + RWSJ
								+ "','yyyy-MM-dd HH24:mi:ss'),to_date('" + DCRQ
								+ "','yyyy-MM-dd'),'" + XJC_PJMD_YC + "','"
								+ XJC_ZGMD_YC + "','" + XJC_PJMD_CC + "','"
								+ XJC_ZGMD_CC + "','" + XJC_PJMD_WHL + "','"
								+ XJC_ZGMD_WHL + "','" + TXB_DQFS + "','"
								+ TXB_DQTB_FS + "','" + XJC_PJMD_BHCL + "','"
								+ XJC_ZGMD_BHCL + "')";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					} else {
						// 更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "YC_BZCD='" + YC_BZCD + "',YC_XZCD='"
								+ YC_XZCD + "',YC_DQFS='" + YC_DQFS + "',"
								+ "YC_BZFS='" + YC_BZFS + "',YC_LJFS='"
								+ YC_LJFS + "',YC_LJTB_SQ='" + YC_LJTB_SQ
								+ "'," + "YC_LJTB_SZ='" + YC_LJTB_SZ
								+ "',YC_DQFZ='" + YC_DQFZ + "',YC_DQTB_FZ='"
								+ YC_DQTB_FZ + "'," + "YC_BZWC='" + YC_BZWC
								+ "',YC_LJFZ='" + YC_LJFZ + "',YC_LJTB_FZ='"
								+ YC_LJTB_FZ + "'," + "YC_FZXG='" + YC_FZXG
								+ "',YC_RXFZ='" + YC_RXFZ + "',YC_PJMD='"
								+ YC_PJMD + "'," + "YC_ZGMD='" + YC_ZGMD
								+ "',YC_FSQY='" + YC_FSQY + "',XJC_BZCD='"
								+ XJC_BZCD + "'," + "XJC_XZCD='" + XJC_XZCD
								+ "',XJC_DQFS='" + XJC_DQFS + "',XJC_DQTB_FS='"
								+ XJC_DQTB_FS + "'," + "XJC_BZFS='" + XJC_BZFS
								+ "',XJC_LJFS='" + XJC_LJFS + "',XJC_LJTB_SQ='"
								+ XJC_LJTB_SQ + "'," + "XJC_LJTB_SZ='"
								+ XJC_LJTB_SZ + "',XJC_DQFZ='" + XJC_DQFZ
								+ "',XJC_DQTB_FZ='" + XJC_DQTB_FZ + "',"
								+ "XJC_BZWC='" + XJC_BZWC + "',XJC_LJFZ='"
								+ XJC_LJFZ + "',XJC_LJTB_FZ='" + XJC_LJTB_FZ
								+ "'," + "XJC_FZXG='" + XJC_FZXG
								+ "',XJC_RXFZ='" + XJC_RXFZ + "',XJC_FSQY='"
								+ XJC_FSQY + "'," + "MZZ_BZCD='" + MZZ_BZCD
								+ "',MZZ_XZCD='" + MZZ_XZCD + "',MZZ_DQFS='"
								+ MZZ_DQFS + "'," + "MZZ_DQTB_FS='"
								+ MZZ_DQTB_FS + "',MZZ_BZFS='" + MZZ_BZFS
								+ "',MZZ_LJFS='" + MZZ_LJFS + "',"
								+ "MZZ_LJTB_SQ='" + MZZ_LJTB_SQ
								+ "',MZZ_LJTB_SZ='" + MZZ_LJTB_SZ
								+ "',MZZ_DQFZ='" + MZZ_DQFZ + "',"
								+ "MZZ_DQTB_FZ='" + MZZ_DQTB_FZ
								+ "',MZZ_BZWC='" + MZZ_BZWC + "',MZZ_LJFZ='"
								+ MZZ_LJFZ + "'," + "MZZ_LJTB_FZ='"
								+ MZZ_LJTB_FZ + "',MZZ_FZXG='" + MZZ_FZXG
								+ "',MZZ_RXFZ='" + MZZ_RXFZ + "',"
								+ "MZZ_PJMD='" + MZZ_PJMD + "',MZZ_ZGMD='"
								+ MZZ_ZGMD + "',MZZ_FSQY='" + MZZ_FSQY + "',"
								+ "TXB_BZCD='" + TXB_BZCD + "',TXB_XZCD='"
								+ TXB_XZCD + "',TXB_DQFS='" + TXB_DQFS + "',"
								+ "TXB_DQTB_FS='" + TXB_DQTB_FS
								+ "',TXB_BZFS='" + TXB_BZFS + "',TXB_LJFS='"
								+ TXB_LJFS + "'," + "TXB_LJTB_SQ='"
								+ TXB_LJTB_SQ + "',TXB_LJTB_SZ='" + TXB_LJTB_SZ
								+ "',TXB_DQFZ='" + TXB_DQFZ + "',"
								+ "TXB_DQTB_FZ='" + TXB_DQTB_FZ
								+ "',TXB_BZWC='" + TXB_BZWC + "',TXB_LJFZ='"
								+ TXB_LJFZ + "'," + "TXB_LJTB_FZ='"
								+ TXB_LJTB_FZ + "',TXB_FZXG='" + TXB_FZXG
								+ "',TXB_RXFZ='" + TXB_RXFZ + "',"
								+ "TXB_PJMD='" + TXB_PJMD + "',TXB_ZGMD='"
								+ TXB_ZGMD + "',TXB_FSQY='" + TXB_FSQY + "',"
								+ "BFB_BZCD='" + BFB_BZCD + "',BFB_XZCD='"
								+ BFB_XZCD + "',BFB_DQFS='" + BFB_DQFS + "',"
								+ "BFB_DQTB_FS='" + BFB_DQTB_FS
								+ "',BFB_BZFS='" + BFB_BZFS + "',BFB_LJFS='"
								+ BFB_LJFS + "'," + "BFB_LJTB_SQ='"
								+ BFB_LJTB_SQ + "',BFB_LJTB_SZ='" + BFB_LJTB_SZ
								+ "',BFB_DQFZ='" + BFB_DQFZ + "',"
								+ "BFB_DQTB_FZ='" + BFB_DQTB_FZ
								+ "',BFB_BZWC='" + BFB_BZWC + "',BFB_LJFZ='"
								+ BFB_LJFZ + "'," + "BFB_LJTB_FZ='"
								+ BFB_LJTB_FZ + "',BFB_FZXG='" + BFB_FZXG
								+ "',BFB_RXFZ='" + BFB_RXFZ + "',"
								+ "BFB_PJMD='" + BFB_PJMD + "',BFB_ZGMD='"
								+ BFB_ZGMD + "',BFB_FSQY='" + BFB_FSQY + "',"
								+ "WKB_BZCD='" + WKB_BZCD + "',WKB_XZCD='"
								+ WKB_XZCD + "',WKB_DQFS='" + WKB_DQFS + "',"
								+ "WKB_DQTB_FS='" + WKB_DQTB_FS
								+ "',WKB_BZFS='" + WKB_BZFS + "',WKB_LJFS='"
								+ WKB_LJFS + "'," + "WKB_LJTB_SQ='"
								+ WKB_LJTB_SQ + "',WKB_LJTB_SZ='" + WKB_LJTB_SZ
								+ "',WKB_DQFZ='" + WKB_DQFZ + "',"
								+ "WKB_DQTB_FZ='" + WKB_DQTB_FZ
								+ "',WKB_BZWC='" + WKB_BZWC + "',WKB_LJFZ='"
								+ WKB_LJFZ + "'," + "WKB_LJTB_FZ='"
								+ WKB_LJTB_FZ + "',WKB_FZXG='" + WKB_FZXG
								+ "',WKB_RXFZ='" + WKB_RXFZ + "',"
								+ "WKB_PJMD='" + WKB_PJMD + "',WKB_ZGMD='"
								+ WKB_ZGMD + "',WKB_FSQY='" + WKB_FSQY + "',"
								+ "CMB_BZCD='" + CMB_BZCD + "',CMB_XZCD='"
								+ CMB_XZCD + "',CMB_DQFS='" + CMB_DQFS + "',"
								+ "CMB_DQTB_FS='" + CMB_DQTB_FS
								+ "',CMB_BZFS='" + CMB_BZFS + "',CMB_LJFS='"
								+ CMB_LJFS + "'," + "CMB_LJTB_SQ='"
								+ CMB_LJTB_SQ + "',CMB_LJTB_SZ='" + CMB_LJTB_SZ
								+ "',CMB_DQFZ='" + CMB_DQFZ + "',"
								+ "CMB_DQTB_FZ='" + CMB_DQTB_FZ
								+ "',CMB_BZWC='" + CMB_BZWC + "',CMB_LJFZ='"
								+ CMB_LJFZ + "'," + "CMB_LJTB_FZ='"
								+ CMB_LJTB_FZ + "',CMB_FZXG='" + CMB_FZXG
								+ "',CMB_RXFZ='" + CMB_RXFZ + "',"
								+ "CMB_PJMD='" + CMB_PJMD + "',CMB_ZGMD='"
								+ CMB_ZGMD + "',CMB_FSQY='" + CMB_FSQY + "',"
								+ "SYQ='" + SYQ + "',FSQK='" + FSQK
								+ "',FKQK='" + FKQK + "'," + "FKFX='" + FKFX
								+ "',HJ_BZCD='" + HJ_BZCD + "',HJ_XZCD='"
								+ HJ_XZCD + "'," + "HJ_DQFS='" + HJ_DQFS
								+ "',HJ_DQTB_FS='" + HJ_DQTB_FS + "',HJ_BZFS='"
								+ HJ_BZFS + "'," + "HJ_LJFS='" + HJ_LJFS
								+ "',HJ_LJTB_SQ='" + HJ_LJTB_SQ
								+ "',HJ_LJTB_SZ='" + HJ_LJTB_SZ + "',"
								+ "HJ_DQFZ='" + HJ_DQFZ + "',HJ_DQTB_FZ='"
								+ HJ_DQTB_FZ + "',HJ_BZWC='" + HJ_BZWC + "',"
								+ "HJ_LJFZ='" + HJ_LJFZ + "',HJ_LJTB_FZ='"
								+ HJ_LJTB_FZ + "',HJ_FZXG='" + HJ_FZXG + "',"
								+ "HJ_RXFZ='" + HJ_RXFZ + "',HJ_PJMD='"
								+ HJ_PJMD + "',HJ_ZGMD='" + HJ_ZGMD + "',"
								+ "HJ_FSQY='" + HJ_FSQY + "',BBLX='" + BBLX
								+ "',ZT='" + ZT + "'," + "DCRQ=to_date('"
								+ DCRQ + "','yyyy-MM-dd'),XJC_PJMD_YC='"
								+ XJC_PJMD_YC + "',XJC_ZGMD_YC='" + XJC_ZGMD_YC
								+ "'," + "XJC_PJMD_CC='" + XJC_PJMD_CC
								+ "',XJC_ZGMD_CC='" + XJC_ZGMD_CC
								+ "',XJC_PJMD_WHL='" + XJC_PJMD_WHL + "',"
								+ "XJC_ZGMD_WHL='" + XJC_ZGMD_WHL
								+ "',XJC_PJMD_BHCL='" + XJC_PJMD_BHCL
								+ "',XJC_ZGMD_BHCL='" + XJC_ZGMD_BHCL + "',"
								+ "YC_DQTB_FS='" + YC_DQTB_FS + "'"
								+ "  WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
				}
				// 玉米病虫周报表
				if (fwd.equals("Q002")) {
					String YDYMM_DQFS = so.httpServletRequest
							.getParameter("YDYMM_DQFS");
					String YDYMM_DQTB_FS = so.httpServletRequest
							.getParameter("YDYMM_DQTB_FS");
					String YDYMM_BZFS = so.httpServletRequest
							.getParameter("YDYMM_BZFS");
					String YDYMM_LJFS = so.httpServletRequest
							.getParameter("YDYMM_LJFS");
					String YDYMM_LJTB_SQ = so.httpServletRequest
							.getParameter("YDYMM_LJTB_SQ");
					String YDYMM_LJTB_SZ = so.httpServletRequest
							.getParameter("YDYMM_LJTB_SZ");
					String YDYMM_DQFZ = so.httpServletRequest
							.getParameter("YDYMM_DQFZ");
					String YDYMM_DQTB_FZ = so.httpServletRequest
							.getParameter("YDYMM_DQTB_FZ");
					String YDYMM_BZWC = so.httpServletRequest
							.getParameter("YDYMM_BZWC");
					String YDYMM_LJFZ = so.httpServletRequest
							.getParameter("YDYMM_LJFZ");
					String YDYMM_LJTB_FZ = so.httpServletRequest
							.getParameter("YDYMM_LJTB_FZ");
					String YDYMM_FZXG = so.httpServletRequest
							.getParameter("YDYMM_FZXG");
					String YDYMM_RXFZ = so.httpServletRequest
							.getParameter("YDYMM_RXFZ");
					String YDYMM_PJMD_BH = so.httpServletRequest
							.getParameter("YDYMM_PJMD_BH");
					String YDYMM_ZGMD_BH = so.httpServletRequest
							.getParameter("YDYMM_ZGMD_BH");
					String YDYMM_FSQY = so.httpServletRequest
							.getParameter("YDYMM_FSQY");
					String YDYMM_PJMD_BZ = so.httpServletRequest
							.getParameter("YDYMM_PJMD_BZ");
					String YDYMM_ZGMD_BZ = so.httpServletRequest
							.getParameter("YDYMM_ZGMD_BZ");
					String EDYMM_BZCD = so.httpServletRequest
							.getParameter("EDYMM_BZCD");
					String EDYMM_XZCD = so.httpServletRequest
							.getParameter("EDYMM_XZCD");
					String EDYMM_DQFS = so.httpServletRequest
							.getParameter("EDYMM_DQFS");
					String EDYMM_DQTB_FS = so.httpServletRequest
							.getParameter("EDYMM_DQTB_FS");
					String EDYMM_BZFS = so.httpServletRequest
							.getParameter("EDYMM_BZFS");
					String EDYMM_LJFS = so.httpServletRequest
							.getParameter("EDYMM_LJFS");
					String EDYMM_LJTB_SQ = so.httpServletRequest
							.getParameter("EDYMM_LJTB_SQ");
					String EDYMM_LJTB_SZ = so.httpServletRequest
							.getParameter("EDYMM_LJTB_SZ");
					String EDYMM_DQFZ = so.httpServletRequest
							.getParameter("EDYMM_DQFZ");
					String EDYMM_DQTB_FZ = so.httpServletRequest
							.getParameter("EDYMM_DQTB_FZ");
					String EDYMM_BZWC = so.httpServletRequest
							.getParameter("EDYMM_BZWC");
					String EDYMM_LJFZ = so.httpServletRequest
							.getParameter("EDYMM_LJFZ");
					String EDYMM_LJTB_FZ = so.httpServletRequest
							.getParameter("EDYMM_LJTB_FZ");
					String EDYMM_FZXG = so.httpServletRequest
							.getParameter("EDYMM_FZXG");
					String EDYMM_RXFZ = so.httpServletRequest
							.getParameter("EDYMM_RXFZ");
					String EDYMM_PJMD_BH = so.httpServletRequest
							.getParameter("EDYMM_PJMD_BH");
					String EDYMM_ZGMD_BH = so.httpServletRequest
							.getParameter("EDYMM_PJMD_BH");
					String EDYMM_FSQY = so.httpServletRequest
							.getParameter("EDYMM_FSQY");
					String EDYMM_PJMD_BZ = so.httpServletRequest
							.getParameter("EDYMM_PJMD_BZ");
					String EDYMM_ZGMD_BZ = so.httpServletRequest
							.getParameter("EDYMM_ZGMD_BZ");
					String SDYMM_BZCD = so.httpServletRequest
							.getParameter("SDYMM_BZCD");
					String SDYMM_XZCD = so.httpServletRequest
							.getParameter("SDYMM_XZCD");
					String SDYMM_DQFS = so.httpServletRequest
							.getParameter("SDYMM_DQFS");
					String SDYMM_DQTB_FS = so.httpServletRequest
							.getParameter("SDYMM_DQTB_FS");
					String SDYMM_BZFS = so.httpServletRequest
							.getParameter("SDYMM_BZFS");
					String SDYMM_LJFS = so.httpServletRequest
							.getParameter("SDYMM_LJFS");
					String SDYMM_LJTB_SQ = so.httpServletRequest
							.getParameter("SDYMM_LJTB_SQ");
					String SDYMM_LJTB_SZ = so.httpServletRequest
							.getParameter("SDYMM_LJTB_SZ");
					String SDYMM_DQFZ = so.httpServletRequest
							.getParameter("SDYMM_DQFZ");
					String SDYMM_DQTB_FZ = so.httpServletRequest
							.getParameter("SDYMM_DQTB_FZ");
					String SDYMM_BZWC = so.httpServletRequest
							.getParameter("SDYMM_BZWC");
					String SDYMM_LJFZ = so.httpServletRequest
							.getParameter("SDYMM_LJFZ");
					String SDYMM_LJTB_FZ = so.httpServletRequest
							.getParameter("SDYMM_LJTB_FZ");
					String SDYMM_FZXG = so.httpServletRequest
							.getParameter("SDYMM_FZXG");
					String SDYMM_RXFZ = so.httpServletRequest
							.getParameter("SDYMM_RXFZ");
					String SDYMM_PJMD_BH = so.httpServletRequest
							.getParameter("SDYMM_PJMD_BH");
					String SDYMM_ZGMD_BH = so.httpServletRequest
							.getParameter("SDYMM_ZGMD_BH");
					String SDYMM_FSQY = so.httpServletRequest
							.getParameter("SDYMM_FSQY");
					String SDYMM_PJMD_BZ = so.httpServletRequest
							.getParameter("SDYMM_PJMD_BZ");
					String SDYMM_ZGMD_BZ = so.httpServletRequest
							.getParameter("SDYMM_ZGMD_BZ");
					String EDNC_BZCD = so.httpServletRequest
							.getParameter("EDNC_BZCD");
					String EDNC_XZCD = so.httpServletRequest
							.getParameter("EDNC_XZCD");
					String EDNC_DQFS = so.httpServletRequest
							.getParameter("EDNC_DQFS");
					String EDNC_DQTB_FS = so.httpServletRequest
							.getParameter("EDNC_DQTB_FS");
					String EDNC_BZFS = so.httpServletRequest
							.getParameter("EDNC_BZFS");
					String EDNC_LJFS = so.httpServletRequest
							.getParameter("EDNC_LJFS");
					String EDNC_LJTB_SQ = so.httpServletRequest
							.getParameter("EDNC_LJTB_SQ");
					String EDNC_LJTB_SZ = so.httpServletRequest
							.getParameter("EDNC_LJTB_SZ");
					String EDNC_DQFZ = so.httpServletRequest
							.getParameter("EDNC_DQFZ");
					String EDNC_DQTB_FZ = so.httpServletRequest
							.getParameter("EDNC_DQTB_FZ");
					String EDNC_BZWC = so.httpServletRequest
							.getParameter("EDNC_BZWC");
					String EDNC_LJFZ = so.httpServletRequest
							.getParameter("EDNC_LJFZ");
					String EDNC_LJTB_FZ = so.httpServletRequest
							.getParameter("EDNC_LJTB_FZ");
					String EDNC_FSQY = so.httpServletRequest
							.getParameter("EDNC_FSQY");
					String SDNC_BZCD = so.httpServletRequest
							.getParameter("SDNC_BZCD");
					String SDNC_XZCD = so.httpServletRequest
							.getParameter("SDNC_XZCD");
					String SDNC_DQFS = so.httpServletRequest
							.getParameter("SDNC_DQFS");
					String SDNC_DQTB_FS = so.httpServletRequest
							.getParameter("SDNC_DQTB_FS");
					String SDNC_BZFS = so.httpServletRequest
							.getParameter("SDNC_BZFS");
					String SDNC_LJFS = so.httpServletRequest
							.getParameter("SDNC_LJFS");
					String SDNC_LJTB_SQ = so.httpServletRequest
							.getParameter("SDNC_LJTB_SQ");
					String SDNC_LJTB_SZ = so.httpServletRequest
							.getParameter("SDNC_LJTB_SZ");
					String SDNC_DQFZ = so.httpServletRequest
							.getParameter("SDNC_DQFZ");
					String SDNC_DQTB_FZ = so.httpServletRequest
							.getParameter("SDNC_DQTB_FZ");
					String SDNC_BZWC = so.httpServletRequest
							.getParameter("SDNC_BZWC");
					String SDNC_LJFZ = so.httpServletRequest
							.getParameter("SDNC_LJFZ");
					String SDNC_LJTB_FZ = so.httpServletRequest
							.getParameter("SDNC_LJTB_FZ");
					String SDNC_FSQY = so.httpServletRequest
							.getParameter("SDNC_FSQY");
					String YC_BZCD = so.httpServletRequest
							.getParameter("YC_BZCD");
					String YC_XZCD = so.httpServletRequest
							.getParameter("YC_XZCD");
					String YC_DQFS = so.httpServletRequest
							.getParameter("YC_DQFS");
					String YC_DQTB_FS = so.httpServletRequest
							.getParameter("YC_DQTB_FS");
					String YC_BZFS = so.httpServletRequest
							.getParameter("YC_BZFS");
					String YC_LJFS = so.httpServletRequest
							.getParameter("YC_LJFS");
					String YC_LJTB_SQ = so.httpServletRequest
							.getParameter("YC_LJTB_SQ");
					String YC_LJTB_SZ = so.httpServletRequest
							.getParameter("YC_LJTB_SZ");
					String YC_DQFZ = so.httpServletRequest
							.getParameter("YC_DQFZ");
					String YC_DQTB_FZ = so.httpServletRequest
							.getParameter("YC_DQTB_FZ");
					String YC_BZWC = so.httpServletRequest
							.getParameter("YC_BZWC");
					String YC_LJFZ = so.httpServletRequest
							.getParameter("YC_LJFZ");
					String YC_LJTB_FZ = so.httpServletRequest
							.getParameter("YC_LJTB_FZ");
					String YC_FSQY = so.httpServletRequest
							.getParameter("YC_FSQY");
					String EDMLC_BZCD = so.httpServletRequest
							.getParameter("EDMLC_BZCD");
					String EDMLC_XZCD = so.httpServletRequest
							.getParameter("EDMLC_XZCD");
					String EDMLC_DQFS = so.httpServletRequest
							.getParameter("EDMLC_DQFS");
					String EDMLC_DQTB_FS = so.httpServletRequest
							.getParameter("EDMLC_DQTB_FS");
					String EDMLC_BZFS = so.httpServletRequest
							.getParameter("EDMLC_BZFS");
					String EDMLC_LJFS = so.httpServletRequest
							.getParameter("EDMLC_LJFS");
					String EDMLC_LJTB_SQ = so.httpServletRequest
							.getParameter("EDMLC_LJTB_SQ");
					String EDMLC_LJTB_SZ = so.httpServletRequest
							.getParameter("EDMLC_LJTB_SZ");
					String EDMLC_DQFZ = so.httpServletRequest
							.getParameter("EDMLC_DQFZ");
					String EDMLC_DQTB_FZ = so.httpServletRequest
							.getParameter("EDMLC_DQTB_FZ");
					String EDMLC_BZWC = so.httpServletRequest
							.getParameter("EDMLC_BZWC");
					String EDMLC_LJFZ = so.httpServletRequest
							.getParameter("EDMLC_LJFZ");
					String EDMLC_LJTB_FZ = so.httpServletRequest
							.getParameter("EDMLC_LJTB_FZ");
					String EDMLC_FSQY = so.httpServletRequest
							.getParameter("EDMLC_FSQY");
					String SDMLC_FSQY = so.httpServletRequest
							.getParameter("SDMLC_FSQY");
					String FDMLC_FSQY = so.httpServletRequest
							.getParameter("FDMLC_FSQY");
					String DBB_FSQY = so.httpServletRequest
							.getParameter("DBB_FSQY");
					String XBB_FSQY = so.httpServletRequest
							.getParameter("XBB_FSQY");
					String HBB_FSQY = so.httpServletRequest
							.getParameter("HBB_FSQY");
					String XB_FSQY = so.httpServletRequest
							.getParameter("XB_FSQY");
					String SYQ = so.httpServletRequest.getParameter("SYQ");
					String FSQK = so.httpServletRequest.getParameter("FSQK");
					String FKQK = so.httpServletRequest.getParameter("FKQK");
					String FKFX = so.httpServletRequest.getParameter("FKFX");
					String HJ_DQFS = so.httpServletRequest
							.getParameter("HJ_DQFS");
					String HJ_DQTB_FS = so.httpServletRequest
							.getParameter("HJ_DQTB_FS");
					String HJ_BZFS = so.httpServletRequest
							.getParameter("HJ_BZFS");
					String HJ_LJFS = so.httpServletRequest
							.getParameter("HJ_LJFS");
					String HJ_LJTB_SQ = so.httpServletRequest
							.getParameter("HJ_LJTB_SQ");
					String HJ_LJTB_SZ = so.httpServletRequest
							.getParameter("HJ_LJTB_SZ");
					String HJ_DQFZ = so.httpServletRequest
							.getParameter("HJ_DQFZ");
					String HJ_DQTB_FZ = so.httpServletRequest
							.getParameter("HJ_DQTB_FZ");
					String HJ_BZWC = so.httpServletRequest
							.getParameter("HJ_BZWC");
					String HJ_LJFZ = so.httpServletRequest
							.getParameter("HJ_LJFZ");
					String HJ_LJTB_FZ = so.httpServletRequest
							.getParameter("HJ_LJTB_FZ");
					String HJ_FZXG = so.httpServletRequest
							.getParameter("HJ_FZXG");
					String HJ_RXFZ = so.httpServletRequest
							.getParameter("HJ_RXFZ");
					String HJ_PJMD = so.httpServletRequest
							.getParameter("HJ_PJMD");
					String HJ_ZGMD = so.httpServletRequest
							.getParameter("HJ_ZGMD");
					String HJ_FSQY = so.httpServletRequest
							.getParameter("HJ_FSQY");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d002.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " ("
								+ "JFID,YDYMM_DQFS,YDYMM_DQTB_FS,YDYMM_BZFS"
								+ "YDYMM_LJFS,YDYMM_LJTB_SQ,YDYMM_LJTB_SZ,"
								+ "YDYMM_DQFZ,YDYMM_DQTB_FZ,YDYMM_BZWC,"
								+ "YDYMM_LJFZ,YDYMM_LJTB_FZ,YDYMM_FZXG,"
								+ "YDYMM_RXFZ,YDYMM_PJMD_BH,YDYMM_ZGMD_BH,"
								+ "YDYMM_FSQY,EDYMM_DQFS,EDYMM_DQTB_FS,"
								+ "EDYMM_BZFS,EDYMM_LJFS,EDYMM_LJTB_SQ,"
								+ "EDYMM_LJTB_SZ,EDYMM_DQFZ,EDYMM_DQTB_FZ,"
								+ "EDYMM_BZCD,EDYMM_XZCD,"
								+ "EDYMM_BZWC,EDYMM_LJFZ,EDYMM_LJTB_FZ,"
								+ "EDYMM_FZXG,EDYMM_RXFZ,EDYMM_PJMD_BH,"
								+ "EDYMM_ZGMD_BH,EDYMM_FSQY,SDYMM_BZCD,"
								+ "SDYMM_XZCD,SDYMM_DQFS,SDYMM_DQTB_FS,"
								+ "SDYMM_BZFS,SDYMM_LJFS,SDYMM_LJTB_SQ,"
								+ "SDYMM_LJTB_SZ,SDYMM_DQFZ,SDYMM_DQTB_FZ,"
								+ "SDYMM_BZWC,SDYMM_LJFZ,SDYMM_LJTB_FZ,"
								+ "SDYMM_FZXG,SDYMM_RXFZ,SDYMM_PJMD_BH,"
								+ "SDYMM_ZGMD_BH,SDYMM_FSQY,EDNC_BZCD,"
								+ "EDNC_XZCD,EDNC_DQFS,EDNC_DQTB_FS,"
								+ "EDNC_BZFS,EDNC_LJFS,EDNC_LJTB_SQ,"
								+ "EDNC_LJTB_SZ,EDNC_DQFZ,EDNC_DQTB_FZ,"
								+ "EDNC_BZWC,EDNC_LJFZ,EDNC_LJTB_FZ,"
								+ "EDNC_FSQY,SDNC_BZCD,SDNC_XZCD,"
								+ "SDNC_DQFS,SDNC_DQTB_FS,SDNC_BZFS,"
								+ "SDNC_LJFS,SDNC_LJTB_SQ,SDNC_LJTB_SZ,"
								+ "SDNC_DQFZ,SDNC_DQTB_FZ,SDNC_BZWC,"
								+ "SDNC_LJFZ,SDNC_LJTB_FZ,SDNC_FSQY,"
								+ "YC_BZCD,YC_XZCD,YC_DQFS,"
								+ "YC_DQTB_FS,YC_BZFS,YC_LJFS,"
								+ "YC_LJTB_SQ,YC_LJTB_SZ,YC_DQFZ,"
								+ "YC_DQTB_FZ,YC_BZWC,YC_LJFZ,"
								+ "YC_LJTB_FZ,YC_FSQY,EDMLC_BZCD,"
								+ "EDMLC_XZCD,EDMLC_DQFS,EDMLC_DQTB_FS,"
								+ "EDMLC_BZFS,EDMLC_LJFS,EDMLC_LJTB_SQ,"
								+ "EDMLC_LJTB_SZ,EDMLC_DQFZ,EDMLC_DQTB_FZ,"
								+ "EDMLC_BZWC,EDMLC_LJFZ,EDMLC_LJTB_FZ,"
								+ "EDMLC_FSQY,SDMLC_FSQY,FDMLC_FSQY,"
								+ "DBB_FSQY,XBB_FSQY,HBB_FSQY,"
								+ "XB_FSQY,SYQ,FSQK," + "FKQK,FKFX,HJ_DQFS,"
								+ "HJ_DQTB_FS,HJ_BZFS,HJ_LJFS,"
								+ "HJ_LJTB_SQ,HJ_LJTB_SZ,HJ_DQFZ,"
								+ "HJ_DQTB_FZ,HJ_BZWC,HJ_LJFZ,"
								+ "HJ_LJTB_FZ,HJ_FZXG,HJ_RXFZ,"
								+ "HJ_PJMD,HJ_ZGMD,HJ_FSQY,"
								+ "JFNO,KSTBRQ,JZTBRQ," + "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT,"
								+ "DCRQ,YDYMM_PJMD_BZ,YDYMM_ZGMD_BZ,"
								+ "EDYMM_PJMD_BZ,EDYMM_ZGMD_BZ,SDYMM_PJMD_BZ,"
								+ "YDYMM_BZFS,SDYMM_ZGMD_BZ) VALUES ('" + JFID
								+ "','" + YDYMM_DQFS + "','" + YDYMM_DQTB_FS+"'"+YDYMM_BZFS
								+ "','" + YDYMM_LJFS + "','" + YDYMM_LJTB_SQ
								+ "','" + YDYMM_LJTB_SZ + "','" + YDYMM_DQFZ
								+ "','" + YDYMM_DQTB_FZ + "','" + YDYMM_BZWC
								+ "','" + YDYMM_LJFZ + "','" + YDYMM_LJTB_FZ
								+ "','" + YDYMM_FZXG + "','" + YDYMM_RXFZ
								+ "','" + YDYMM_PJMD_BH + "','" + YDYMM_ZGMD_BH
								+ "','" + YDYMM_FSQY + "','" + EDYMM_DQFS
								+ "','" + EDYMM_DQTB_FS + "','" + EDYMM_BZFS
								+ "','" + EDYMM_LJFS + "','" + EDYMM_LJTB_SQ
								+ "','" + EDYMM_LJTB_SZ + "','" + EDYMM_DQFZ
								+ "','" + EDYMM_DQTB_FZ + "','" + EDYMM_BZCD
								+ "','" + EDYMM_XZCD + "','" + EDYMM_BZWC
								+ "','" + EDYMM_LJFZ + "','" + EDYMM_LJTB_FZ
								+ "','" + EDYMM_FZXG + "','" + EDYMM_RXFZ
								+ "','" + EDYMM_PJMD_BH + "','" + EDYMM_ZGMD_BH
								+ "','" + EDYMM_FSQY + "','" + SDYMM_BZCD
								+ "','" + SDYMM_XZCD + "','" + SDYMM_DQFS
								+ "','" + SDYMM_DQTB_FS + "','" + SDYMM_BZFS
								+ "','" + SDYMM_LJFS + "','" + SDYMM_LJTB_SQ
								+ "','" + SDYMM_LJTB_SZ + "','" + SDYMM_DQFZ
								+ "','" + SDYMM_DQTB_FZ + "','" + SDYMM_BZWC
								+ "','" + SDYMM_LJFZ + "','" + SDYMM_LJTB_FZ
								+ "','" + SDYMM_FZXG + "','" + SDYMM_RXFZ
								+ "','" + SDYMM_PJMD_BH + "','" + SDYMM_ZGMD_BH
								+ "','" + SDYMM_FSQY + "','" + EDNC_BZCD
								+ "','" + EDNC_XZCD + "','" + EDNC_DQFS + "','"
								+ EDNC_DQTB_FS + "','" + EDNC_BZFS + "','"
								+ EDNC_LJFS + "','" + EDNC_LJTB_SQ + "','"
								+ EDNC_LJTB_SZ + "','" + EDNC_DQFZ + "','"
								+ EDNC_DQTB_FZ + "','" + EDNC_BZWC + "','"
								+ EDNC_LJFZ + "','" + EDNC_LJTB_FZ + "','"
								+ EDNC_FSQY + "','" + SDNC_BZCD + "','"
								+ SDNC_XZCD + "','" + SDNC_DQFS + "','"
								+ SDNC_DQTB_FS + "','" + SDNC_BZFS + "','"
								+ SDNC_LJFS + "','" + SDNC_LJTB_SQ + "','"
								+ SDNC_LJTB_SZ + "','" + SDNC_DQFZ + "','"
								+ SDNC_DQTB_FZ + "','" + SDNC_BZWC + "','"
								+ SDNC_LJFZ + "','" + SDNC_LJTB_FZ + "','"
								+ SDNC_FSQY + "','" + YC_BZCD + "','" + YC_XZCD
								+ "','" + YC_DQFS + "','" + YC_DQTB_FS + "','"
								+ YC_BZFS + "','" + YC_LJFS + "','"
								+ YC_LJTB_SQ + "','" + YC_LJTB_SZ + "','"
								+ YC_DQFZ + "','" + YC_DQTB_FZ + "','"
								+ YC_BZWC + "','" + YC_LJFZ + "','"
								+ YC_LJTB_FZ + "','" + YC_FSQY + "','"
								+ EDMLC_BZCD + "','" + EDMLC_XZCD + "','"
								+ EDMLC_DQFS + "','" + EDMLC_DQTB_FS + "','"
								+ EDMLC_BZFS + "','" + EDMLC_LJFS + "','"
								+ EDMLC_LJTB_SQ + "','" + EDMLC_LJTB_SZ + "','"
								+ EDMLC_DQFZ + "','" + EDMLC_DQTB_FZ + "','"
								+ EDMLC_BZWC + "','" + EDMLC_LJFZ + "','"
								+ EDMLC_LJTB_FZ + "','" + EDMLC_FSQY + "','"
								+ SDMLC_FSQY + "','" + FDMLC_FSQY + "','"
								+ DBB_FSQY + "','" + XBB_FSQY + "','"
								+ HBB_FSQY + "','" + XB_FSQY + "','" + SYQ
								+ "','" + FSQK + "','" + FKQK + "','" + FKFX
								+ "','" + HJ_DQFS + "','" + HJ_DQTB_FS + "','"
								+ HJ_BZFS + "','" + HJ_LJFS + "','"
								+ HJ_LJTB_SQ + "','" + HJ_LJTB_SZ + "','"
								+ HJ_DQFZ + "','" + HJ_DQTB_FZ + "','"
								+ HJ_BZWC + "','" + HJ_LJFZ + "','"
								+ HJ_LJTB_FZ + "','" + HJ_FZXG + "','"
								+ HJ_RXFZ + "','" + HJ_PJMD + "','" + HJ_ZGMD
								+ "','" + HJ_FSQY + "','" + JFNO
								+ "',to_date('" + KSTBRQ
								+ "','yyyy-MM-dd HH24:mi:ss'),to_date('"
								+ JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'" + LRRY
								+ "',to_date('" + RWSJ
								+ "','yyyy-MM-dd HH24:mi:ss'),'" + ZT + "',"
								+ "to_date('" + DCRQ + "','yyyy-MM-dd'),'"
								+ YDYMM_PJMD_BZ + "','" + YDYMM_ZGMD_BZ + "','"
								+ EDYMM_PJMD_BZ + "','" + EDYMM_ZGMD_BZ + "','"
								+ SDYMM_PJMD_BZ + "','" + YDYMM_BZFS + "','"
								+ SDYMM_ZGMD_BZ + "')";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					} else {
						// 更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "YDYMM_DQFS='" + YDYMM_DQFS + "',YDYMM_DQTB_FS='"+YDYMM_DQTB_FS+"',"
								+ "YDYMM_BZFS='"+YDYMM_BZFS+"',YDYMM_LJFS='"+YDYMM_LJFS+"',"
								+ "YDYMM_LJTB_SZ='"+YDYMM_LJTB_SZ+"',YDYMM_DQFZ='"+YDYMM_DQFZ+"',"
								+ "YDYMM_DQTB_FZ='"+YDYMM_DQTB_FZ+"',YDYMM_BZWC='"+YDYMM_BZWC+"',"
								+ "YDYMM_LJFZ='"+YDYMM_LJFZ+"',YDYMM_LJTB_FZ='"+YDYMM_LJTB_FZ+"',"
								+ "YDYMM_FZXG='"+YDYMM_FZXG+"',YDYMM_RXFZ='"+YDYMM_RXFZ+"',"
								+ "YDYMM_PJMD_BH='"+YDYMM_PJMD_BH+"',YDYMM_ZGMD_BH='"+YDYMM_ZGMD_BH+"',"
								+ "YDYMM_FSQY='"+YDYMM_FSQY+"',EDYMM_BZCD='"+EDYMM_BZCD+"',"
								+ "EDYMM_XZCD='"+EDYMM_XZCD+"',EDYMM_DQFS='"+EDYMM_DQFS+"',"
								+ "EDYMM_DQTB_FS='"+EDYMM_DQTB_FS+"',EDYMM_BZFS='"+EDYMM_BZFS+"',"
								+ "EDYMM_LJFS='"+EDYMM_LJFS+"',EDYMM_LJTB_SQ='"+EDYMM_LJTB_SQ+"',"
								+ "EDYMM_LJTB_SZ='"+EDYMM_LJTB_SZ+"',EDYMM_DQFZ='"+EDYMM_DQFZ+"',"
								+ "EDYMM_DQTB_FZ='"+EDYMM_DQTB_FZ+"',EDYMM_BZWC='"+EDYMM_BZWC+"',"
								+ "EDYMM_LJFZ='"+EDYMM_LJFZ+"',EDYMM_LJTB_FZ='"+EDYMM_LJTB_FZ+"',"
								+ "EDYMM_FZXG='"+EDYMM_FZXG+"',EDYMM_RXFZ='"+EDYMM_RXFZ+"',"
								+ "EDYMM_PJMD_BH='"+EDYMM_PJMD_BH+"',EDYMM_ZGMD_BH='"+EDYMM_ZGMD_BH+"',"
								+ "EDYMM_FSQY='"+EDYMM_FSQY+"',SDYMM_BZCD='"+SDYMM_BZCD+"',"
								+ "SDYMM_XZCD='"+SDYMM_XZCD+"',SDYMM_DQFS='"+SDYMM_DQFS+"',"
								+ "SDYMM_DQTB_FS='"+SDYMM_DQTB_FS+"',SDYMM_BZFS='"+SDYMM_BZFS+"',"
								+ "SDYMM_LJFS='"+SDYMM_LJFS+"',SDYMM_LJTB_SQ='"+SDYMM_LJTB_SQ+"',"
								+ "SDYMM_LJTB_SZ='"+SDYMM_LJTB_SZ+"',SDYMM_DQFZ='"+SDYMM_DQFZ+"',"
								+ "SDYMM_DQTB_FZ='"+SDYMM_DQTB_FZ+"',SDYMM_BZWC='"+SDYMM_BZWC+"',"
								+ "SDYMM_LJFZ='"+SDYMM_LJFZ+"',SDYMM_LJTB_FZ='"+SDYMM_LJTB_FZ+"',"
								+ "SDYMM_FZXG='"+SDYMM_FZXG+"',SDYMM_RXFZ='"+SDYMM_RXFZ+"',"
								+ "SDYMM_PJMD_BH='"+SDYMM_PJMD_BH+"',SDYMM_ZGMD_BH='"+SDYMM_ZGMD_BH+"',"
								+ "SDYMM_FSQY='"+SDYMM_FSQY+"',EDNC_BZCD='"+EDNC_BZCD+"',"
								+ "EDNC_XZCD='"+EDNC_XZCD+"',EDNC_DQFS='"+EDNC_DQFS+"',"
								+ "EDNC_DQTB_FS='"+EDNC_DQTB_FS+"',EDNC_BZFS='"+EDNC_BZFS+"',"
								+ "EDNC_LJFS='"+EDNC_LJFS+"',EDNC_LJTB_SQ='"+EDNC_LJTB_SQ+"',"
								+ "EDNC_LJTB_SZ='"+EDNC_LJTB_SZ+"',EDNC_DQFZ='"+EDNC_DQFZ+"',"
								+ "EDNC_DQTB_FZ='"+EDNC_DQTB_FZ+"',EDNC_BZWC='"+EDNC_BZWC+"',"
								+ "EDNC_LJFZ='"+EDNC_LJFZ+"',EDNC_LJTB_FZ='"+EDNC_LJTB_FZ+"',"
								+ "EDNC_FSQY='"+EDNC_FSQY+"',SDNC_BZCD='"+SDNC_BZCD+"',"
								+ "SDNC_XZCD='"+SDNC_XZCD+"',SDNC_DQFS='"+SDNC_DQFS+"',"
								+ "SDNC_DQTB_FS='"+SDNC_DQTB_FS+"',SDNC_BZFS='"+SDNC_BZFS+"',"
								+ "SDNC_LJFS='"+SDNC_LJFS+"',SDNC_LJTB_SQ='"+SDNC_LJTB_SQ+"',"
								+ "SDNC_LJTB_SZ='"+SDNC_LJTB_SZ+"',SDNC_DQFZ='"+SDNC_DQFZ+"',"
								+ "SDNC_DQTB_FZ='"+SDNC_DQTB_FZ+"',SDNC_BZWC='"+SDNC_BZWC+"',"
								+ "SDNC_LJFZ='"+SDNC_LJFZ+"',SDNC_LJTB_FZ='"+SDNC_LJTB_FZ+"',"
								+ "SDNC_FSQY='"+SDNC_FSQY+"',YC_BZCD='"+YC_BZCD+"',"
								+ "YC_XZCD='"+YC_XZCD+"',YC_DQFS='"+YC_DQFS+"',"
								+ "YC_DQTB_FS='"+YC_DQTB_FS+"',YC_BZFS='"+YC_BZFS+"',"
								+ "YC_LJFS='"+YC_LJFS+"',YC_LJTB_SQ='"+YC_LJTB_SQ+"',"
								+ "YC_LJTB_SZ='"+YC_LJTB_SZ+"',YC_DQFZ='"+YC_DQFZ+"',"
								+ "YC_DQTB_FZ='"+YC_DQTB_FZ+"',YC_BZWC='"+YC_BZWC+"',"
								+ "YC_LJFZ='"+YC_LJFZ+"',YC_LJTB_FZ='"+YC_LJTB_FZ+"',"
								+ "YC_FSQY='"+YC_FSQY+"',EDMLC_BZCD='"+EDMLC_BZCD+"',"
								+ "EDMLC_XZCD='"+EDMLC_XZCD+"',EDMLC_DQFS='"+EDMLC_DQFS+"',"
								+ "EDMLC_DQTB_FS='"+EDMLC_DQTB_FS+"',EDMLC_BZFS='"+EDMLC_BZFS+"',"
								+ "EDMLC_LJFS='"+EDMLC_LJFS+"',EDMLC_LJTB_SQ='"+EDMLC_LJTB_SQ+"',"
								+ "EDMLC_LJTB_SZ='"+EDMLC_LJTB_SZ+"',EDMLC_DQFZ='"+EDMLC_DQFZ+"',"
								+ "EDMLC_DQTB_FZ='"+EDMLC_DQTB_FZ+"',EDMLC_BZWC='"+EDMLC_BZWC+"',"
								+ "EDMLC_LJFZ='"+EDMLC_LJFZ+"',EDMLC_LJTB_FZ='"+EDMLC_LJTB_FZ+"',"
								+ "EDMLC_FSQY='"+EDMLC_FSQY+"',SDMLC_FSQY='"+SDMLC_FSQY+"',"
								+ "FDMLC_FSQY='"+FDMLC_FSQY+"',DBB_FSQY='"+DBB_FSQY+"',"
								+ "XBB_FSQY='"+XBB_FSQY+"',HBB_FSQY='"+HBB_FSQY+"',"
								+ "XB_FSQY='"+XB_FSQY+"',SYQ='"+SYQ+"',"
								+ "FSQK='"+FSQK+"',FKQK='"+FKQK+"',"
								+ "FKFX='"+FKFX+"',HJ_DQFS='"+HJ_DQFS+"',"
								+ "HJ_DQTB_FS='"+HJ_DQTB_FS+"',HJ_BZFS='"+HJ_BZFS+"',"
								+ "HJ_LJFS='"+HJ_LJFS+"',HJ_LJTB_SQ='"+HJ_LJTB_SQ+"',"
								+ "HJ_LJTB_SZ='"+HJ_LJTB_SZ+"',HJ_DQFZ='"+HJ_DQFZ+"',"
								+ "HJ_DQTB_FZ='"+HJ_DQTB_FZ+"',HJ_BZWC='"+HJ_BZWC+"',"
								+ "HJ_LJFZ='"+HJ_LJFZ+"',HJ_LJTB_FZ='"+HJ_LJTB_FZ+"',"
								+ "HJ_FZXG='"+HJ_FZXG+"',HJ_RXFZ='"+HJ_RXFZ+"',"
								+ "HJ_PJMD='"+HJ_PJMD+"',HJ_ZGMD='"+HJ_ZGMD+"',"
								+ "HJ_FSQY='"+HJ_FSQY+"',DCRQ=to_date('"
								+ DCRQ + "','yyyy-MM-dd'),"
								+ "YDYMM_PJMD_BZ='"+YDYMM_PJMD_BZ+"',YDYMM_ZGMD_BZ='"+YDYMM_ZGMD_BZ+"',"
								+ "EDYMM_PJMD_BZ='"+EDYMM_PJMD_BZ+"',EDYMM_ZGMD_BZ='"+EDYMM_ZGMD_BZ+"',"
								+ "SDYMM_PJMD_BZ='"+SDYMM_PJMD_BZ+"',SDYMM_ZGMD_BZ='"+SDYMM_ZGMD_BZ+"',"
								+ "BBLX='"+BBLX+"',ZT='"+ZT+"',"
								+ "YDYMM_LJTB_SQ='"+YDYMM_LJTB_SQ+"'  WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
					// 更新任务表
				}
				// 草地螟周报表
				if (fwd.equals("Q003")) {
					String YDD_BZCD = so.httpServletRequest
							.getParameter("YDD_BZCD");
					String YDD_XZCD = so.httpServletRequest
							.getParameter("YDD_XZCD");
					String YDD_DQFS = so.httpServletRequest
							.getParameter("YDD_DQFS");
					String YDD_DQTB_FS = so.httpServletRequest
							.getParameter("YDD_DQTB_FS");
					String YDD_BZFS = so.httpServletRequest
							.getParameter("YDD_BZFS");
					String YDD_LJFS = so.httpServletRequest
							.getParameter("YDD_LJFS");
					String YDD_LJTB_SQ = so.httpServletRequest
							.getParameter("YDD_LJTB_SQ");
					String YDD_LJTB_SZ = so.httpServletRequest
							.getParameter("YDD_LJTB_SZ");
					String YDD_DQFZ = so.httpServletRequest
							.getParameter("YDD_DQFZ");
					String YDD_DQTB_FZ = so.httpServletRequest
							.getParameter("YDD_DQTB_FZ");
					String YDD_BZWC = so.httpServletRequest
							.getParameter("YDD_BZWC");
					String YDD_LJFZ = so.httpServletRequest
							.getParameter("YDD_LJFZ");
					String YDD_LJTB_FZ = so.httpServletRequest
							.getParameter("YDD_LJTB_FZ");
					String YDD_FZXG = so.httpServletRequest
							.getParameter("YDD_FZXG");
					String YDD_RXFZ = so.httpServletRequest
							.getParameter("YDD_RXFZ");
					String YDD_PJMD = so.httpServletRequest
							.getParameter("YDD_PJMD");
					String YDD_ZGMD = so.httpServletRequest
							.getParameter("YDD_ZGMD");
					String YDD_FSQY = so.httpServletRequest
							.getParameter("YDD_FSQY");
					String YD_BZCD = so.httpServletRequest
							.getParameter("YD_BZCD");
					String YD_XZCD = so.httpServletRequest
							.getParameter("YD_XZCD");
					String YD_DQFS = so.httpServletRequest
							.getParameter("YD_DQFS");
					String YD_DQTB_FS = so.httpServletRequest
							.getParameter("YD_DQTB_FS");
					String YD_BZFS = so.httpServletRequest
							.getParameter("YD_BZFS");
					String YD_LJFS = so.httpServletRequest
							.getParameter("YD_LJFS");
					String YD_LJTB_SQ = so.httpServletRequest
							.getParameter("YD_LJTB_SQ");
					String YD_LJTB_SZ = so.httpServletRequest
							.getParameter("YD_LJTB_SZ");
					String YD_DQFZ = so.httpServletRequest
							.getParameter("YD_DQFZ");
					String YD_DQTB_FZ = so.httpServletRequest
							.getParameter("YD_DQTB_FZ");
					String YD_BZWC = so.httpServletRequest
							.getParameter("YD_BZWC");
					String YD_LJFZ = so.httpServletRequest
							.getParameter("YD_LJFZ");
					String YD_LJTB_FZ = so.httpServletRequest
							.getParameter("YD_LJTB_FZ");
					String YD_FZXG = so.httpServletRequest
							.getParameter("YD_FZXG");
					String YD_RXFZ = so.httpServletRequest
							.getParameter("YD_RXFZ");
					String YD_PJMD = so.httpServletRequest
							.getParameter("YD_PJMD");
					String YD_ZGMD = so.httpServletRequest
							.getParameter("YD_ZGMD");
					String YD_FSQY = so.httpServletRequest
							.getParameter("YD_FSQY");
					String ED_BZCD = so.httpServletRequest
							.getParameter("ED_BZCD");
					String ED_XZCD = so.httpServletRequest
							.getParameter("ED_XZCD");
					String ED_DQFS = so.httpServletRequest
							.getParameter("ED_DQFS");
					String ED_DQTB_FS = so.httpServletRequest
							.getParameter("ED_DQTB_FS");
					String ED_BZFS = so.httpServletRequest
							.getParameter("ED_BZFS");
					String ED_LJFS = so.httpServletRequest
							.getParameter("ED_LJFS");
					String ED_LJTB_SQ = so.httpServletRequest
							.getParameter("ED_LJTB_SQ");
					String ED_LJTB_SZ = so.httpServletRequest
							.getParameter("ED_LJTB_SZ");
					String ED_DQFZ = so.httpServletRequest
							.getParameter("ED_DQFZ");
					String ED_DQTB_FZ = so.httpServletRequest
							.getParameter("ED_DQTB_FZ");
					String ED_BZWC = so.httpServletRequest
							.getParameter("ED_BZWC");
					String ED_LJFZ = so.httpServletRequest
							.getParameter("ED_LJFZ");
					String ED_LJTB_FZ = so.httpServletRequest
							.getParameter("ED_LJTB_FZ");
					String ED_FZXG = so.httpServletRequest
							.getParameter("ED_FZXG");
					String ED_RXFZ = so.httpServletRequest
							.getParameter("ED_RXFZ");
					String ED_PJMD = so.httpServletRequest
							.getParameter("ED_PJMD");
					String ED_ZGMD = so.httpServletRequest
							.getParameter("ED_ZGMD");
					String ED_FSQY = so.httpServletRequest
							.getParameter("ED_FSQY");
					String YDYDD_BZCD = so.httpServletRequest
							.getParameter("YDYDD_BZCD");
					String YDYDD_XZCD = so.httpServletRequest
							.getParameter("YDYDD_XZCD");
					String YDYDD_DQFS = so.httpServletRequest
							.getParameter("YDYDD_DQFS");
					String YDYDD_DQTB_FS = so.httpServletRequest
							.getParameter("YDYDD_DQTB_FS");
					String YDYDD_BZFS = so.httpServletRequest
							.getParameter("YDYDD_BZFS");
					String YDYDD_LJFS = so.httpServletRequest
							.getParameter("YDYDD_LJFS");
					String YDYDD_LJTB_SQ = so.httpServletRequest
							.getParameter("YDYDD_LJTB_SQ");
					String YDYDD_LJTB_SZ = so.httpServletRequest
							.getParameter("YDYDD_LJTB_SZ");
					String YDYDD_DQFZ = so.httpServletRequest
							.getParameter("YDYDD_DQFZ");
					String YDYDD_DQTB_FZ = so.httpServletRequest
							.getParameter("YDYDD_DQTB_FZ");
					String YDYDD_BZWC = so.httpServletRequest
							.getParameter("YDYDD_BZWC");
					String YDYDD_LJFZ = so.httpServletRequest
							.getParameter("YDYDD_LJFZ");
					String YDYDD_LJTB_FZ = so.httpServletRequest
							.getParameter("YDYDD_LJTB_FZ");
					String YDYDD_FZXG = so.httpServletRequest
							.getParameter("YDYDD_FZXG");
					String YDYDD_RXFZ = so.httpServletRequest
							.getParameter("YDYDD_RXFZ");
					String YDYDD_PJMD = so.httpServletRequest
							.getParameter("YDYDD_PJMD");
					String YDYDD_ZGMD = so.httpServletRequest
							.getParameter("YDYDD_ZGMD");
					String YDYDD_FSQY = so.httpServletRequest
							.getParameter("YDYDD_FSQY");
					String EDYDD_BZCD = so.httpServletRequest
							.getParameter("EDYDD_BZCD");
					String EDYDD_XZCD = so.httpServletRequest
							.getParameter("EDYDD_XZCD");
					String EDYDD_DQFS = so.httpServletRequest
							.getParameter("EDYDD_DQFS");
					String EDYDD_DQTB_FS = so.httpServletRequest
							.getParameter("EDYDD_DQTB_FS");
					String EDYDD_BZFS = so.httpServletRequest
							.getParameter("EDYDD_BZFS");
					String EDYDD_LJFS = so.httpServletRequest
							.getParameter("EDYDD_LJFS");
					String EDYDD_LJTB_SQ = so.httpServletRequest
							.getParameter("EDYDD_LJTB_SQ");
					String EDYDD_LJTB_SZ = so.httpServletRequest
							.getParameter("EDYDD_LJTB_SZ");
					String EDYDD_DQFZ = so.httpServletRequest
							.getParameter("EDYDD_DQFZ");
					String EDYDD_DQTB_FZ = so.httpServletRequest
							.getParameter("EDYDD_DQTB_FZ");
					String EDYDD_BZWC = so.httpServletRequest
							.getParameter("EDYDD_BZWC");
					String EDYDD_LJFZ = so.httpServletRequest
							.getParameter("EDYDD_LJFZ");
					String EDYDD_LJTB_FZ = so.httpServletRequest
							.getParameter("EDYDD_LJTB_FZ");
					String EDYDD_FZXG = so.httpServletRequest
							.getParameter("EDYDD_FZXG");
					String EDYDD_RXFZ = so.httpServletRequest
							.getParameter("EDYDD_RXFZ");
					String EDYDD_PJMD = so.httpServletRequest
							.getParameter("EDYDD_PJMD");
					String EDYDD_ZGMD = so.httpServletRequest
							.getParameter("EDYDD_ZGMD");
					String EDYDD_FSQY = so.httpServletRequest
							.getParameter("EDYDD_FSQY");
					String SYQ = so.httpServletRequest.getParameter("SYQ");
					String FSQK = so.httpServletRequest.getParameter("FSQK");
					String FKQK = so.httpServletRequest.getParameter("FKQK");
					String FKFX = so.httpServletRequest.getParameter("FKFX");
					String HJ_BZCD = so.httpServletRequest
							.getParameter("HJ_BZCD");
					String HJ_XZCD = so.httpServletRequest
							.getParameter("HJ_XZCD");
					String HJ_DQFS = so.httpServletRequest
							.getParameter("HJ_DQFS");
					String HJ_DQTB_FS = so.httpServletRequest
							.getParameter("HJ_DQTB_FS");
					String HJ_BZFS = so.httpServletRequest
							.getParameter("HJ_BZFS");
					String HJ_LJFS = so.httpServletRequest
							.getParameter("HJ_LJFS");
					String HJ_LJTB_SQ = so.httpServletRequest
							.getParameter("HJ_LJTB_SQ");
					String HJ_LJTB_SZ = so.httpServletRequest
							.getParameter("HJ_LJTB_SZ");
					String HJ_DQFZ = so.httpServletRequest
							.getParameter("HJ_DQFZ");
					String HJ_DQTB_FZ = so.httpServletRequest
							.getParameter("HJ_DQTB_FZ");
					String HJ_BZWC = so.httpServletRequest
							.getParameter("HJ_BZWC");
					String HJ_LJFZ = so.httpServletRequest
							.getParameter("HJ_LJFZ");
					String HJ_LJTB_FZ = so.httpServletRequest
							.getParameter("HJ_LJTB_FZ");
					String HJ_FZXG = so.httpServletRequest
							.getParameter("HJ_FZXG");
					String HJ_RXFZ = so.httpServletRequest
							.getParameter("HJ_RXFZ");
					String HJ_PJMD = so.httpServletRequest
							.getParameter("HJ_PJMD");
					String HJ_ZGMD = so.httpServletRequest
							.getParameter("HJ_ZGMD");
					String HJ_FSQY = so.httpServletRequest
							.getParameter("HJ_FSQY");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d003.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YDD_BZCD,YDD_XZCD,YDD_DQFS,"
								+ "YDD_BZFS,YDD_LJFS,YDD_LJTB_SQ,"
								+ "YDD_LJTB_SZ,YDD_DQFZ,YDD_DQTB_FZ,"
								+ "YDD_BZWC,YDD_LJFZ,YDD_LJTB_FZ,"
								+ "YDD_FZXG,YDD_RXFZ,YDD_PJMD,"
								+ "YDD_ZGMD,YDD_FSQY,YD_BZCD,"
								+ "YD_XZCD,YD_DQFS,YD_DQTB_FS,"
								+ "YD_BZFS,YD_LJFS,YD_LJTB_SQ,"
								+ "YD_LJTB_SZ,YD_DQFZ,YD_DQTB_FZ,"
								+ "YD_BZWC,YD_LJFZ,YD_LJTB_FZ,"
								+ "YD_FZXG,YD_RXFZ,YD_PJMD,"
								+ "YD_ZGMD,YD_FSQY,ED_BZCD,"
								+ "ED_XZCD,ED_DQFS,ED_DQTB_FS,"
								+ "ED_BZFS,ED_LJFS,ED_LJTB_SQ,"
								+ "ED_LJTB_SZ,ED_DQFZ,ED_DQTB_FZ,"
								+ "ED_BZWC,ED_LJFZ,ED_LJTB_FZ,"
								+ "ED_FZXG,ED_RXFZ,ED_PJMD,"
								+ "ED_ZGMD,ED_FSQY,YDYDD_BZCD,"
								+ "YDYDD_XZCD,YDYDD_DQFS,YDYDD_DQTB_FS,"
								+ "YDYDD_BZFS,YDYDD_LJFS,YDYDD_LJTB_SQ,"
								+ "YDYDD_LJTB_SZ,YDYDD_DQFZ,YDYDD_DQTB_FZ,"
								+ "YDYDD_BZWC,YDYDD_LJFZ,YDYDD_LJTB_FZ,"
								+ "YDYDD_FZXG,YDYDD_RXFZ,YDYDD_PJMD,"
								+ "YDYDD_ZGMD,YDYDD_FSQY,EDYDD_BZCD,"
								+ "EDYDD_XZCD,EDYDD_DQFS,EDYDD_DQTB_FS,"
								+ "EDYDD_BZFS,EDYDD_LJFS,EDYDD_LJTB_SQ,"
								+ "EDYDD_LJTB_SZ,EDYDD_DQFZ,EDYDD_DQTB_FZ,"
								+ "EDYDD_BZWC,EDYDD_LJFZ,EDYDD_LJTB_FZ,"
								+ "EDYDD_FZXG,EDYDD_RXFZ,EDYDD_PJMD,"
								+ "EDYDD_ZGMD,EDYDD_FSQY,SYQ,"
								+ "FSQK,FKQK,FKFX," + "HJ_DQFS,"
								+ "HJ_DQTB_FS,HJ_BZFS,HJ_LJFS,"
								+ "HJ_LJTB_SQ,HJ_LJTB_SZ,HJ_DQFZ,"
								+ "HJ_DQTB_FZ,HJ_BZWC,HJ_LJFZ,"
								+ "HJ_LJTB_FZ,HJ_FZXG,HJ_RXFZ,"
								+ "HJ_PJMD,HJ_ZGMD,HJ_FSQY,"
								+ "JFNO,KSTBRQ,JZTBRQ," + "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT,"
								+ "YDD_DQTB_FS,DCRQ) VALUES ('" + JFID + "','"
								+ YDD_BZCD + "','" + YDD_XZCD + "','"
								+ YDD_DQFS + "','" + YDD_BZFS + "','"
								+ YDD_LJFS + "','" + YDD_LJTB_SQ + "','"
								+ YDD_LJTB_SZ + "','" + YDD_DQFZ + "','"
								+ YDD_DQTB_FZ + "','" + YDD_BZWC + "','"
								+ YDD_LJFZ + "','" + YDD_LJTB_FZ + "','"
								+ YDD_FZXG + "','" + YDD_RXFZ + "','"
								+ YDD_PJMD + "','" + YDD_ZGMD + "','"
								+ YDD_FSQY + "','" + YD_BZCD + "','" + YD_XZCD
								+ "','" + YD_DQFS + "','" + YD_DQTB_FS + "','"
								+ YD_BZFS + "','" + YD_LJFS + "','"
								+ YD_LJTB_SQ + "','" + YD_LJTB_SZ + "','"
								+ YD_DQFZ + "','" + YD_DQTB_FZ + "','"
								+ YD_BZWC + "','" + YD_LJFZ + "','"
								+ YD_LJTB_FZ + "','" + YD_FZXG + "','"
								+ YD_RXFZ + "','" + YD_PJMD + "','" + YD_ZGMD
								+ "','" + YD_FSQY + "','" + ED_BZCD + "','"
								+ ED_XZCD + "','" + ED_DQFS + "','"
								+ ED_DQTB_FS + "','" + ED_BZFS + "','"
								+ ED_LJFS + "','" + ED_LJTB_SQ + "','"
								+ ED_LJTB_SZ + "','" + ED_DQFZ + "','"
								+ ED_DQTB_FZ + "','" + ED_BZWC + "','"
								+ ED_LJFZ + "','" + ED_LJTB_FZ + "','"
								+ ED_FZXG + "','" + ED_RXFZ + "','" + ED_PJMD
								+ "','" + ED_ZGMD + "','" + ED_FSQY + "','"
								+ YDYDD_BZCD + "','" + YDYDD_XZCD + "','"
								+ YDYDD_DQFS + "','" + YDYDD_DQTB_FS + "','"
								+ YDYDD_BZFS + "','" + YDYDD_LJFS + "','"
								+ YDYDD_LJTB_SQ + "','" + YDYDD_LJTB_SZ + "','"
								+ YDYDD_DQFZ + "','" + YDYDD_DQTB_FZ + "','"
								+ YDYDD_BZWC + "','" + YDYDD_LJFZ + "','"
								+ YDYDD_LJTB_FZ + "','" + YDYDD_FZXG + "','"
								+ YDYDD_RXFZ + "','" + YDYDD_PJMD + "','"
								+ YDYDD_ZGMD + "','" + YDYDD_FSQY + "','"
								+ EDYDD_BZCD + "','" + EDYDD_XZCD + "','"
								+ EDYDD_DQFS + "','" + EDYDD_DQTB_FS + "','"
								+ EDYDD_BZFS + "','" + EDYDD_LJFS + "','"
								+ EDYDD_LJTB_SQ + "','" + EDYDD_LJTB_SZ + "','"
								+ EDYDD_DQFZ + "','" + EDYDD_DQTB_FZ + "','"
								+ EDYDD_BZWC + "','" + EDYDD_LJFZ + "','"
								+ EDYDD_LJTB_FZ + "','" + EDYDD_FZXG + "','"
								+ EDYDD_RXFZ + "','" + EDYDD_PJMD + "','"
								+ EDYDD_ZGMD + "','" + EDYDD_FSQY + "','" + SYQ
								+ "','" + FSQK + "','" + FKQK + "','" + FKFX
								+ "','" + HJ_DQFS + "','" + HJ_DQTB_FS + "','"
								+ HJ_BZFS + "','" + HJ_LJFS + "','"
								+ HJ_LJTB_SQ + "','" + HJ_LJTB_SZ + "','"
								+ HJ_DQFZ + "','" + HJ_DQTB_FZ + "','"
								+ HJ_BZWC + "','" + HJ_LJFZ + "','"
								+ HJ_LJTB_FZ + "','" + HJ_FZXG + "','"
								+ HJ_RXFZ + "','" + HJ_PJMD + "','" + HJ_ZGMD
								+ "','" + HJ_FSQY + "','" + JFNO
								+ "',to_date('" + KSTBRQ
								+ "','yyyy-MM-dd HH24:mi:ss'),to_date('"
								+ JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'" + LRRY
								+ "',to_date('" + RWSJ
								+ "','yyyy-MM-dd HH24:mi:ss'),'" + ZT + "','"
								+ YDD_DQTB_FS + "',to_date('" + DCRQ
								+ "','yyyy-MM-dd'))";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
					else
					{
						//更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "YDD_BZCD='" + YDD_BZCD + "',YDD_XZCD='"+YDD_XZCD+"',"
								+ "YDD_DQTB_FS='" + YDD_DQTB_FS + "',YDD_BZFS='"+YDD_BZFS+"',"
								+ "YDD_LJFS='" + YDD_LJFS + "',YDD_LJTB_SQ='"+YDD_LJTB_SQ+"',"
								+ "YDD_LJTB_SZ='" + YDD_LJTB_SZ + "',YDD_DQFZ='"+YDD_DQFZ+"',"
								+ "YDD_DQTB_FZ='" + YDD_DQTB_FZ + "',YDD_BZWC='"+YDD_BZWC+"',"
								+ "YDD_LJFZ='" + YDD_LJFZ + "',YDD_LJTB_FZ='"+YDD_LJTB_FZ+"',"
								+ "YDD_FZXG='" + YDD_FZXG + "',YDD_RXFZ='"+YDD_RXFZ+"',"
								+ "YDD_PJMD='" + YDD_PJMD + "',YDD_ZGMD='"+YDD_ZGMD+"',"
								+ "YDD_FSQY='" + YDD_FSQY + "',YD_BZCD='"+YD_BZCD+"',"
								+ "YD_XZCD='" + YD_XZCD + "',YD_DQFS='"+YD_DQFS+"',"
								+ "YD_DQTB_FS='" + YD_DQTB_FS + "',YD_BZFS='"+YD_BZFS+"',"
								+ "YD_LJFS='" + YD_LJFS + "',YD_LJTB_SQ='"+YD_LJTB_SQ+"',"
								+ "YD_LJTB_SZ='" + YD_LJTB_SZ + "',YD_DQFZ='"+YD_DQFZ+"',"
								+ "YD_DQTB_FZ='" + YD_DQTB_FZ + "',YD_BZWC='"+YD_BZWC+"',"
								+ "YD_LJFZ='" + YD_LJFZ + "',YD_LJTB_FZ='"+YD_LJTB_FZ+"',"
								+ "YD_FZXG='" + YD_FZXG + "',YD_RXFZ='"+YD_RXFZ+"',"
								+ "YD_PJMD='" + YD_PJMD + "',YD_ZGMD='"+YD_ZGMD+"',"
								+ "YD_FSQY='" + YD_FSQY + "',ED_BZCD='"+ED_BZCD+"',"
								+ "ED_XZCD='" + ED_XZCD + "',ED_DQFS='"+ED_DQFS+"',"
								+ "ED_DQTB_FS='" + ED_DQTB_FS + "',ED_BZFS='"+ED_BZFS+"',"
								+ "ED_LJFS='" + ED_LJFS + "',ED_LJTB_SQ='"+ED_LJTB_SQ+"',"
								+ "ED_LJTB_SZ='" + ED_LJTB_SZ + "',ED_DQFZ='"+ED_DQFZ+"',"
								+ "ED_DQTB_FZ='" + ED_DQTB_FZ + "',ED_BZWC='"+ED_BZWC+"',"
								+ "ED_LJFZ='" + ED_LJFZ + "',ED_LJTB_FZ='"+ED_LJTB_FZ+"',"
								+ "ED_FZXG='" + ED_FZXG + "',ED_RXFZ='"+ED_RXFZ+"',"
								+ "ED_PJMD='" + ED_PJMD + "',ED_ZGMD='"+ED_ZGMD+"',"
								+ "ED_FSQY='" + ED_FSQY + "',YDYDD_BZCD='"+YDYDD_BZCD+"',"
								+ "YDYDD_XZCD='" + YDYDD_XZCD + "',YDYDD_DQFS='"+YDYDD_DQFS+"',"
								+ "YDYDD_DQTB_FS='" + YDYDD_DQTB_FS + "',YDYDD_BZFS='"+YDYDD_BZFS+"',"
								+ "YDYDD_LJFS='" + YDYDD_LJFS + "',YDYDD_LJTB_SQ='"+YDYDD_LJTB_SQ+"',"
								+ "YDYDD_LJTB_SZ='" + YDYDD_LJTB_SZ + "',YDYDD_DQFZ='"+YDYDD_DQFZ+"',"
								+ "YDYDD_DQTB_FZ='" + YDYDD_DQTB_FZ + "',YDYDD_BZWC='"+YDYDD_BZWC+"',"
								+ "YDYDD_LJFZ='" + YDYDD_LJFZ + "',YDYDD_LJTB_FZ='"+YDYDD_LJTB_FZ+"',"
								+ "YDYDD_FZXG='" + YDYDD_FZXG + "',YDYDD_RXFZ='"+YDYDD_RXFZ+"',"
								+ "YDYDD_PJMD='" + YDYDD_PJMD + "',YDYDD_ZGMD='"+YDYDD_ZGMD+"',"
								+ "YDYDD_FSQY='" + YDYDD_FSQY + "',EDYDD_BZCD='"+EDYDD_BZCD+"',"
								+ "EDYDD_XZCD='" + EDYDD_XZCD + "',EDYDD_DQFS='"+EDYDD_DQFS+"',"
								+ "EDYDD_DQTB_FS='" + EDYDD_DQTB_FS + "',EDYDD_BZFS='"+EDYDD_BZFS+"',"
								+ "EDYDD_LJFS='" + EDYDD_LJFS + "',EDYDD_LJTB_SQ='"+EDYDD_LJTB_SQ+"',"
								+ "EDYDD_LJTB_SZ='" + EDYDD_LJTB_SZ + "',EDYDD_DQFZ='"+EDYDD_DQFZ+"',"
								+ "EDYDD_DQTB_FZ='" + EDYDD_DQTB_FZ + "',EDYDD_BZWC='"+EDYDD_BZWC+"',"
								+ "EDYDD_LJFZ='" + EDYDD_LJFZ + "',EDYDD_LJTB_FZ='"+EDYDD_LJTB_FZ+"',"
								+ "EDYDD_FZXG='" + EDYDD_FZXG + "',EDYDD_RXFZ='"+EDYDD_RXFZ+"',"
								+ "EDYDD_PJMD='" + EDYDD_PJMD + "',EDYDD_ZGMD='"+EDYDD_ZGMD+"',"
								+ "EDYDD_FSQY='" + EDYDD_FSQY + "',SYQ='"+SYQ+"',"
								+ "FSQK='" + FSQK + "',FKQK='"+FKQK+"',"
								+ "FKFX='" + FKFX + "',"
								+ "HJ_DQFS='" + HJ_DQFS + "',HJ_DQTB_FS='"+HJ_DQTB_FS+"',"
								+ "HJ_BZFS='" + HJ_BZFS + "',HJ_LJFS='"+HJ_LJFS+"',"
								+ "HJ_LJTB_SQ='" + HJ_LJTB_SQ + "',HJ_LJTB_SZ='"+HJ_LJTB_SZ+"',"
								+ "HJ_DQFZ='" + HJ_DQFZ + "',HJ_DQTB_FZ='"+HJ_DQTB_FZ+"',"
								+ "HJ_BZWC='" + HJ_BZWC + "',HJ_LJFZ='"+HJ_LJFZ+"',"
								+ "HJ_LJTB_FZ='" + HJ_LJTB_FZ + "',HJ_FZXG='"+HJ_FZXG+"',"
								+ "HJ_RXFZ='" + HJ_RXFZ + "',HJ_PJMD='"+HJ_PJMD+"',"
								+ "HJ_ZGMD='" + HJ_ZGMD + "',HJ_FSQY='"+HJ_FSQY+"',"
								+ "BBLX='" + BBLX + "',ZT='"+ZT+"',"
								+ "YDD_DQFS='"+YDD_DQFS+"',DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd')  WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
				}
				//小麦病虫发生情况统计表
				if (fwd.equals("Q004")) {
					String MY_FSCD = so.httpServletRequest.getParameter("MY_FSCD");
					String MY_FSMJ = so.httpServletRequest.getParameter("MY_FSMJ");
					String MY_FZMJ = so.httpServletRequest.getParameter("MY_FZMJ");
					String MY_SJSS = so.httpServletRequest.getParameter("MY_SJSS");
					String MY_WHSS = so.httpServletRequest.getParameter("MY_WHSS");
					String MZZ_FSCD = so.httpServletRequest.getParameter("MZZ_FSCD");
					String MZZ_FSMJ = so.httpServletRequest.getParameter("MZZ_FSMJ");
					String MZZ_FZMJ = so.httpServletRequest.getParameter("MZZ_FZMJ");
					String MZZ_SJSS = so.httpServletRequest.getParameter("MZZ_SJSS");
					String MZZ_WHSS = so.httpServletRequest.getParameter("MZZ_WHSS");
					String XJC_FSCD = so.httpServletRequest.getParameter("XJC_FSCD");
					String XJC_FSMJ = so.httpServletRequest.getParameter("XJC_FSMJ");
					String XJC_FZMJ = so.httpServletRequest.getParameter("XJC_FZMJ");
					String XJC_SJSS = so.httpServletRequest.getParameter("XJC_SJSS");
					String XJC_WHSS = so.httpServletRequest.getParameter("XJC_WHSS");
					String YDNC_FSCD = so.httpServletRequest.getParameter("YDNC_FSCD");
					String YDNC_FSMJ = so.httpServletRequest.getParameter("YDNC_FSMJ");
					String YDNC_FZMJ = so.httpServletRequest.getParameter("YDNC_FZMJ");
					String YDNC_SJSS = so.httpServletRequest.getParameter("YDNC_SJSS");
					String YDNC_WHSS = so.httpServletRequest.getParameter("YDNC_WHSS");
					String DXHC_FSCD = so.httpServletRequest.getParameter("DXHC_FSCD");
					String DXHC_FSMJ = so.httpServletRequest.getParameter("DXHC_FSMJ");
					String DXHC_FZMJ = so.httpServletRequest.getParameter("DXHC_FZMJ");
					String DXHC_SJSS = so.httpServletRequest.getParameter("DXHC_SJSS");
					String DXHC_WHSS = so.httpServletRequest.getParameter("DXHC_WHSS");
					String HFS_FSCD = so.httpServletRequest.getParameter("HFS_FSCD");
					String HFS_FSMJ = so.httpServletRequest.getParameter("HFS_FSMJ");
					String HFS_FZMJ = so.httpServletRequest.getParameter("HFS_FZMJ");
					String HFS_SJSS = so.httpServletRequest.getParameter("HFS_SJSS");
					String HFS_WHSS = so.httpServletRequest.getParameter("HFS_WHSS");
					String TH_FSCD = so.httpServletRequest.getParameter("TH_FSCD");
					String TH_FSMJ = so.httpServletRequest.getParameter("TH_FSMJ");
					String TH_FZMJ = so.httpServletRequest.getParameter("TH_FZMJ");
					String TH_SJSS = so.httpServletRequest.getParameter("TH_SJSS");
					String TH_WHSS = so.httpServletRequest.getParameter("TH_WHSS");
					String MYF_FSCD = so.httpServletRequest.getParameter("MYF_FSCD");
					String MYF_FSMJ = so.httpServletRequest.getParameter("MYF_FSMJ");
					String MYF_FZMJ = so.httpServletRequest.getParameter("MYF_FZMJ");
					String MYF_SJSS = so.httpServletRequest.getParameter("MYF_SJSS");
					String MYF_WHSS = so.httpServletRequest.getParameter("MYF_WHSS");
					String MJF_FSCD = so.httpServletRequest.getParameter("MJF_FSCD");
					String MJF_FSMJ = so.httpServletRequest.getParameter("MJF_FSMJ");
					String MJF_FZMJ = so.httpServletRequest.getParameter("MJF_FZMJ");
					String MJF_SJSS = so.httpServletRequest.getParameter("MJF_SJSS");
					String MJF_WHSS = so.httpServletRequest.getParameter("MJF_WHSS");
					String QTCH_FSCD = so.httpServletRequest.getParameter("QTCH_FSCD");
					String QTCH_FSMJ = so.httpServletRequest.getParameter("QTCH_FSMJ");
					String QTCH_FZMJ = so.httpServletRequest.getParameter("QTCH_FZMJ");
					String QTCH_SJSS = so.httpServletRequest.getParameter("QTCH_SJSS");
					String QTCH_WHSS = so.httpServletRequest.getParameter("QTCH_WHSS");
					String CHHJ_FSCD = so.httpServletRequest.getParameter("CHHJ_FSCD");
					String CHHJ_FSMJ = so.httpServletRequest.getParameter("CHHJ_FSMJ");
					String CHHJ_FZMJ = so.httpServletRequest.getParameter("CHHJ_FZMJ");
					String CHHJ_SJSS = so.httpServletRequest.getParameter("CHHJ_SJSS");
					String CHHJ_WHSS = so.httpServletRequest.getParameter("CHHJ_WHSS");
					String TXB_FSCD = so.httpServletRequest.getParameter("TXB_FSCD");
					String TXB_FSMJ = so.httpServletRequest.getParameter("TXB_FSMJ");
					String TXB_FZMJ = so.httpServletRequest.getParameter("TXB_FZMJ");
					String TXB_SJSS = so.httpServletRequest.getParameter("TXB_SJSS");
					String TXB_WHSS = so.httpServletRequest.getParameter("TXB_WHSS");
					String YXB_FSCD = so.httpServletRequest.getParameter("YXB_FSCD");
					String YXB_FSMJ = so.httpServletRequest.getParameter("YXB_FSMJ");
					String YXB_FZMJ = so.httpServletRequest.getParameter("YXB_FZMJ");
					String YXB_SJSS = so.httpServletRequest.getParameter("YXB_SJSS");
					String YXB_WHSS = so.httpServletRequest.getParameter("YXB_WHSS");
					String CMB_FSCD = so.httpServletRequest.getParameter("CMB_FSCD");
					String CMB_FSMJ = so.httpServletRequest.getParameter("CMB_FSMJ");
					String CMB_FZMJ = so.httpServletRequest.getParameter("CMB_FZMJ");
					String CMB_SJSS = so.httpServletRequest.getParameter("CMB_SJSS");
					String CMB_WHSS = so.httpServletRequest.getParameter("CMB_WHSS");
					String BFB_FSCD = so.httpServletRequest.getParameter("BFB_FSCD");
					String BFB_FSMJ = so.httpServletRequest.getParameter("BFB_FSMJ");
					String BFB_FZMJ = so.httpServletRequest.getParameter("BFB_FZMJ");
					String BFB_SJSS = so.httpServletRequest.getParameter("BFB_SJSS");
					String BFB_WHSS = so.httpServletRequest.getParameter("BFB_WHSS");
					String WKB_FSCD = so.httpServletRequest.getParameter("WKB_FSCD");
					String WKB_FSMJ = so.httpServletRequest.getParameter("WKB_FSMJ");
					String WKB_FZMJ = so.httpServletRequest.getParameter("WKB_FZMJ");
					String WKB_SJSS = so.httpServletRequest.getParameter("WKB_SJSS");
					String WKB_WHSS = so.httpServletRequest.getParameter("WKB_WHSS");
					String HSB_FSCD = so.httpServletRequest.getParameter("HSB_FSCD");
					String HSB_FSMJ = so.httpServletRequest.getParameter("HSB_FSMJ");
					String HSB_FZMJ = so.httpServletRequest.getParameter("HSB_FZMJ");
					String HSB_SJSS = so.httpServletRequest.getParameter("HSB_SJSS");
					String HSB_WHSS = so.httpServletRequest.getParameter("HSB_WHSS");
					String BBB_FSCD = so.httpServletRequest.getParameter("BBB_FSCD");
					String BBB_FSMJ = so.httpServletRequest.getParameter("BBB_FSMJ");
					String BBB_FZMJ = so.httpServletRequest.getParameter("BBB_FZMJ");
					String BBB_SJSS = so.httpServletRequest.getParameter("BBB_SJSS");
					String BBB_WHSS = so.httpServletRequest.getParameter("BBB_WHSS");
					String QSB_FSCD = so.httpServletRequest.getParameter("QSB_FSCD");
					String QSB_FSMJ = so.httpServletRequest.getParameter("QSB_FSMJ");
					String QSB_FZMJ = so.httpServletRequest.getParameter("QSB_FZMJ");
					String QSB_SJSS = so.httpServletRequest.getParameter("QSB_SJSS");
					String QSB_WHSS = so.httpServletRequest.getParameter("QSB_WHSS");
					String GFB_FSCD = so.httpServletRequest.getParameter("GFB_FSCD");
					String GFB_FSMJ = so.httpServletRequest.getParameter("GFB_FSMJ");
					String GFB_FZMJ = so.httpServletRequest.getParameter("GFB_FZMJ");
					String GFB_SJSS = so.httpServletRequest.getParameter("GFB_SJSS");
					String GFB_WHSS = so.httpServletRequest.getParameter("GFB_WHSS");
					String YKB_FSCD = so.httpServletRequest.getParameter("YKB_FSCD");
					String YKB_FSMJ = so.httpServletRequest.getParameter("YKB_FSMJ");
					String YKB_FZMJ = so.httpServletRequest.getParameter("YKB_FZMJ");
					String YKB_SJSS = so.httpServletRequest.getParameter("YKB_SJSS");
					String YKB_WHSS = so.httpServletRequest.getParameter("YKB_WHSS");
					String XCB_FSCD = so.httpServletRequest.getParameter("XCB_FSCD");
					String XCB_FSMJ = so.httpServletRequest.getParameter("XCB_FSMJ");
					String XCB_FZMJ = so.httpServletRequest.getParameter("XCB_FZMJ");
					String XCB_SJSS = so.httpServletRequest.getParameter("XCB_SJSS");
					String XCB_WHSS = so.httpServletRequest.getParameter("XCB_WHSS");
					String XFB_FSCD = so.httpServletRequest.getParameter("XFB_FSCD");
					String XFB_FSMJ = so.httpServletRequest.getParameter("XFB_FSMJ");
					String XFB_FZMJ = so.httpServletRequest.getParameter("XFB_FZMJ");
					String XFB_SJSS = so.httpServletRequest.getParameter("XFB_SJSS");
					String XFB_WHSS = so.httpServletRequest.getParameter("XFB_WHSS");
					String QTB_FSCD = so.httpServletRequest.getParameter("QTB_FSCD");
					String QTB_FSMJ = so.httpServletRequest.getParameter("QTB_FSMJ");
					String QTB_FZMJ = so.httpServletRequest.getParameter("QTB_FZMJ");
					String QTB_SJSS = so.httpServletRequest.getParameter("QTB_SJSS");
					String QTB_WHSS = so.httpServletRequest.getParameter("QTB_WHSS");
					String BHHJ_FSCD = so.httpServletRequest.getParameter("BHHJ_FSCD");
					String BHHJ_FSMJ = so.httpServletRequest.getParameter("BHHJ_FSMJ");
					String BHHJ_FZMJ = so.httpServletRequest.getParameter("BHHJ_FZMJ");
					String BHHJ_SJSS = so.httpServletRequest.getParameter("BHHJ_SJSS");
					String BHHJ_WHSS = so.httpServletRequest.getParameter("BHHJ_WHSS");
					String BCHJ_FSCD = so.httpServletRequest.getParameter("BCHJ_FSCD");
					String BCHJ_FSMJ = so.httpServletRequest.getParameter("BCHJ_FSMJ");
					String BCHJ_FZMJ = so.httpServletRequest.getParameter("BCHJ_FZMJ");
					String BCHJ_SJSS = so.httpServletRequest.getParameter("BCHJ_SJSS");
					String BCHJ_WHSS = so.httpServletRequest.getParameter("BCHJ_WHSS");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d004.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "MY_FSCD,MY_FSMJ,MY_FZMJ,"
								+ "MY_WHSS,MZZ_FSCD,MZZ_FSMJ,"
								+ "MZZ_FZMJ,MZZ_SJSS,MZZ_WHSS,"
								+ "XJC_FSCD,XJC_FSMJ,XJC_FZMJ,"
								+ "XJC_SJSS,XJC_WHSS,YDNC_FSCD,"
								+ "YDNC_FSMJ,YDNC_FZMJ,YDNC_SJSS,"
								+ "YDNC_WHSS,DXHC_FSCD,DXHC_FSMJ,"
								+ "DXHC_FZMJ,DXHC_SJSS,DXHC_WHSS,"
								+ "HFS_FSCD,HFS_FSMJ,HFS_FZMJ,"
								+ "HFS_SJSS,HFS_WHSS,TH_FSCD,"
								+ "TH_FSMJ,TH_FZMJ,TH_SJSS,"
								+ "TH_WHSS,MYF_FSCD,MYF_FSMJ,"
								+ "MYF_FZMJ,MYF_SJSS,MYF_WHSS,"
								+ "MJF_FSCD,MJF_FSMJ,MJF_FZMJ,"
								+ "MJF_SJSS,MJF_WHSS,QTCH_FSCD,"
								+ "QTCH_FSMJ,QTCH_FZMJ,QTCH_SJSS,"
								+ "QTCH_WHSS,CHHJ_FSCD,CHHJ_FSMJ,"
								+ "CHHJ_FZMJ,CHHJ_SJSS,CHHJ_WHSS,"
								+ "TXB_FSCD,TXB_FSMJ,TXB_FZMJ,"
								+ "TXB_SJSS,TXB_WHSS,YXB_FSCD,"
								+ "YXB_FSMJ,YXB_FZMJ,YXB_SJSS,"
								+ "YXB_WHSS,CMB_FSCD,CMB_FSMJ,"
								+ "CMB_FZMJ,CMB_SJSS,CMB_WHSS,"
								+ "BFB_FSCD,BFB_FSMJ,BFB_FZMJ,"
								+ "BFB_SJSS,BFB_WHSS,WKB_FSCD,"
								+ "WKB_FSMJ,WKB_FZMJ,WKB_SJSS,"
								+ "WKB_WHSS,HSB_FSCD,HSB_FSMJ,"
								+ "HSB_FZMJ,HSB_SJSS,HSB_WHSS,"
								+ "BBB_FSCD,BBB_FSMJ,BBB_FZMJ,"
								+ "BBB_SJSS,BBB_WHSS,QSB_FSCD,"
								+ "QSB_FSMJ,QSB_FZMJ,QSB_SJSS,"
								+ "QSB_WHSS,GFB_FSCD,GFB_FSMJ,"
								+ "GFB_FZMJ,GFB_SJSS,GFB_WHSS,"
								+ "YKB_FSCD,YKB_FSMJ,YKB_FZMJ,"
								+ "YKB_SJSS,YKB_WHSS,XCB_FSCD,"
								+ "XCB_FSMJ,XCB_FZMJ,XCB_SJSS,"
								+ "XCB_WHSS,XFB_FSCD,XFB_FSMJ,"
								+ "XFB_FZMJ,XFB_SJSS,XFB_WHSS,"
								+ "QTB_FSCD,QTB_FSMJ,QTB_FZMJ,"
								+ "QTB_SJSS,QTB_WHSS,BHHJ_FSCD,"
								+ "BHHJ_FSMJ,BHHJ_FZMJ,BHHJ_SJSS,"
								+ "BHHJ_WHSS,BCHJ_FSCD,BCHJ_FSMJ,"
								+ "BCHJ_FZMJ,BCHJ_SJSS,BCHJ_WHSS,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT,"
								+ "MY_SJSS,DCRQ) VALUES ('" + JFID + "','"
								+ MY_FSCD + "','" + MY_FSMJ + "','"+MY_FZMJ+"','"
								+ MY_WHSS + "','" + MZZ_FSCD + "','"+MZZ_FSMJ+"','"
								+ MZZ_FZMJ + "','" + MZZ_SJSS + "','"+MZZ_WHSS+"','"
								+ XJC_FSCD + "','" + XJC_FSMJ + "','"+XJC_FZMJ+"','"
								+ XJC_SJSS + "','" + XJC_WHSS + "','"+YDNC_FSCD+"','"
								+ YDNC_FSMJ + "','" + YDNC_FZMJ + "','"+YDNC_SJSS+"','"
								+ YDNC_WHSS + "','" + DXHC_FSCD + "','"+DXHC_FSMJ+"','"
								+ DXHC_FZMJ + "','" + DXHC_SJSS + "','"+DXHC_WHSS+"','"
								+ HFS_FSCD + "','" + HFS_FSMJ + "','"+HFS_FZMJ+"','"
								+ HFS_SJSS + "','" + HFS_WHSS + "','"+TH_FSCD+"','"
								+ TH_FSMJ + "','" + TH_FZMJ + "','"+TH_SJSS+"','"
								+ TH_WHSS + "','" + MYF_FSCD + "','"+MYF_FSMJ+"','"
								+ MYF_FZMJ + "','" + MYF_SJSS + "','"+MYF_WHSS+"','"
								+ MJF_FSCD + "','" + MJF_FSMJ + "','"+MJF_FZMJ+"','"
								+ MJF_SJSS + "','" + MJF_WHSS + "','"+QTCH_FSCD+"','"
								+ QTCH_FSMJ + "','" + QTCH_FZMJ + "','"+QTCH_SJSS+"','"
								+ QTCH_WHSS + "','" + CHHJ_FSCD + "','"+CHHJ_FSMJ+"','"
								+ CHHJ_FZMJ + "','" + CHHJ_SJSS + "','"+CHHJ_WHSS+"','"
								+ TXB_FSCD + "','" + TXB_FSMJ + "','"+TXB_FZMJ+"','"
								+ TXB_SJSS + "','" + TXB_WHSS + "','"+YXB_FSCD+"','"
								+ YXB_FSMJ + "','" + YXB_FZMJ + "','"+YXB_SJSS+"','"
								+ YXB_WHSS + "','" + CMB_FSCD + "','"+CMB_FSMJ+"','"
								+ CMB_FZMJ + "','" + CMB_SJSS + "','"+CMB_WHSS+"','"
								+ BFB_FSCD + "','" + BFB_FSMJ + "','"+BFB_FZMJ+"','"
								+ BFB_SJSS + "','" + BFB_WHSS + "','"+WKB_FSCD+"','"
								+ WKB_FSMJ + "','" + WKB_FZMJ + "','"+WKB_SJSS+"','"
								+ WKB_WHSS + "','" + HSB_FSCD + "','"+HSB_FSMJ+"','"
								+ HSB_FZMJ + "','" + HSB_SJSS + "','"+HSB_WHSS+"','"
								+ BBB_FSCD + "','" + BBB_FSMJ + "','"+BBB_FZMJ+"','"
								+ BBB_SJSS + "','" + BBB_WHSS + "','"+QSB_FSCD+"','"
								+ QSB_FSMJ + "','" + QSB_FZMJ + "','"+QSB_SJSS+"','"
								+ QSB_WHSS + "','" + GFB_FSCD + "','"+GFB_FSMJ+"','"
								+ GFB_FZMJ + "','" + GFB_SJSS + "','"+GFB_WHSS+"','"
								+ YKB_FSCD + "','" + YKB_FSMJ + "','"+YKB_FZMJ+"','"
								+ YKB_SJSS + "','" + YKB_WHSS + "','"+XCB_FSCD+"','"
								+ XCB_FSMJ + "','" + XCB_FZMJ + "','"+XCB_SJSS+"','"
								+ XCB_WHSS + "','" + XFB_FSCD + "','"+XFB_FSMJ+"','"
								+ XFB_FZMJ + "','" + XFB_SJSS + "','"+XFB_WHSS+"','"
								+ QTB_FSCD + "','" + QTB_FSMJ + "','"+QTB_FZMJ+"','"
								+ QTB_SJSS + "','" + QTB_WHSS + "','"+BHHJ_FSCD+"','"
								+ BHHJ_FSMJ + "','" + BHHJ_FZMJ + "','"+BHHJ_SJSS+"','"
								+ BHHJ_WHSS + "','" + BCHJ_FSCD + "','"+BCHJ_FSMJ+"','"
								+ BCHJ_FZMJ + "','" + BCHJ_SJSS + "','"+BCHJ_WHSS+"','"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"','"
								+ MY_SJSS + "',to_date('" + DCRQ + "','yyyy-MM-dd'))";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
					else
					{
						//更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "MY_FSCD='" + MY_FSCD + "',MY_FSMJ='"+MY_FSMJ+"',"
								+ "MY_SJSS='" + MY_SJSS + "',MY_WHSS='"+MY_WHSS+"',"
								+ "MZZ_FSCD='" + MZZ_FSCD + "',MZZ_FSMJ='"+MZZ_FSMJ+"',"
								+ "MZZ_FZMJ='" + MZZ_FZMJ + "',MZZ_SJSS='"+MZZ_SJSS+"',"
								+ "MZZ_WHSS='" + MZZ_WHSS + "',XJC_FSCD='"+XJC_FSCD+"',"
								+ "XJC_FSMJ='" + XJC_FSMJ + "',XJC_FZMJ='"+XJC_FZMJ+"',"
								+ "XJC_SJSS='" + XJC_SJSS + "',XJC_WHSS='"+XJC_WHSS+"',"
								+ "YDNC_FSCD='" + YDNC_FSCD + "',YDNC_FSMJ='"+YDNC_FSMJ+"',"
								+ "YDNC_FZMJ='" + YDNC_FZMJ + "',YDNC_SJSS='"+YDNC_SJSS+"',"
								+ "YDNC_WHSS='" + YDNC_WHSS + "',DXHC_FSCD='"+DXHC_FSCD+"',"
								+ "DXHC_FSMJ='" + DXHC_FSMJ + "',DXHC_FZMJ='"+DXHC_FZMJ+"',"
								+ "DXHC_SJSS='" + DXHC_SJSS + "',DXHC_WHSS='"+DXHC_WHSS+"',"
								+ "HFS_FSCD='" + HFS_FSCD + "',HFS_FSMJ='"+HFS_FSMJ+"',"
								+ "HFS_FZMJ='" + HFS_FZMJ + "',HFS_SJSS='"+HFS_SJSS+"',"
								+ "HFS_WHSS='" + HFS_WHSS + "',TH_FSCD='"+TH_FSCD+"',"
								+ "TH_FSMJ='" + TH_FSMJ + "',TH_FZMJ='"+TH_FZMJ+"',"
								+ "TH_SJSS='" + TH_SJSS + "',TH_WHSS='"+TH_WHSS+"',"
								+ "MYF_FSCD='" + MYF_FSCD + "',MYF_FSMJ='"+MYF_FSMJ+"',"
								+ "MYF_FZMJ='" + MYF_FZMJ + "',MYF_SJSS='"+MYF_SJSS+"',"
								+ "MYF_WHSS='" + MYF_WHSS + "',MJF_FSCD='"+MJF_FSCD+"',"
								+ "MJF_FSMJ='" + MJF_FSMJ + "',MJF_FZMJ='"+MJF_FZMJ+"',"
								+ "MJF_SJSS='" + MJF_SJSS + "',MJF_WHSS='"+MJF_WHSS+"',"
								+ "QTCH_FSCD='" + QTCH_FSCD + "',QTCH_FSMJ='"+QTCH_FSMJ+"',"
								+ "QTCH_FZMJ='" + QTCH_FZMJ + "',QTCH_SJSS='"+QTCH_SJSS+"',"
								+ "QTCH_WHSS='" + QTCH_WHSS + "',CHHJ_FSCD='"+CHHJ_FSCD+"',"
								+ "CHHJ_FSMJ='" + CHHJ_FSMJ + "',CHHJ_FZMJ='"+CHHJ_FZMJ+"',"
								+ "CHHJ_SJSS='" + CHHJ_SJSS + "',CHHJ_WHSS='"+CHHJ_WHSS+"',"
								+ "TXB_FSCD='" + TXB_FSCD + "',TXB_FSMJ='"+TXB_FSMJ+"',"
								+ "TXB_FZMJ='" + TXB_FZMJ + "',TXB_SJSS='"+TXB_SJSS+"',"
								+ "TXB_WHSS='" + TXB_WHSS + "',YXB_FSCD='"+YXB_FSCD+"',"
								+ "YXB_FSMJ='" + YXB_FSMJ + "',YXB_FZMJ='"+YXB_FZMJ+"',"
								+ "YXB_SJSS='" + YXB_SJSS + "',YXB_WHSS='"+YXB_WHSS+"',"
								+ "CMB_FSCD='" + CMB_FSCD + "',CMB_FSMJ='"+CMB_FSMJ+"',"
								+ "CMB_FZMJ='" + CMB_FZMJ + "',CMB_SJSS='"+CMB_SJSS+"',"
								+ "CMB_WHSS='" + CMB_WHSS + "',BFB_FSCD='"+BFB_FSCD+"',"
								+ "BFB_FSMJ='" + BFB_FSMJ + "',BFB_FZMJ='"+BFB_FZMJ+"',"
								+ "BFB_SJSS='" + BFB_SJSS + "',BFB_WHSS='"+BFB_WHSS+"',"
								+ "WKB_FSCD='" + WKB_FSCD + "',WKB_FSMJ='"+WKB_FSMJ+"',"
								+ "WKB_FZMJ='" + WKB_FZMJ + "',WKB_SJSS='"+WKB_SJSS+"',"
								+ "WKB_WHSS='" + WKB_WHSS + "',HSB_FSCD='"+HSB_FSCD+"',"
								+ "HSB_FSMJ='" + HSB_FSMJ + "',HSB_FZMJ='"+HSB_FZMJ+"',"
								+ "HSB_SJSS='" + HSB_SJSS + "',HSB_WHSS='"+HSB_WHSS+"',"
								+ "BBB_FSCD='" + BBB_FSCD + "',BBB_FSMJ='"+BBB_FSMJ+"',"
								+ "BBB_FZMJ='" + BBB_FZMJ + "',BBB_SJSS='"+BBB_SJSS+"',"
								+ "BBB_WHSS='" + BBB_WHSS + "',QSB_FSCD='"+QSB_FSCD+"',"
								+ "QSB_FSMJ='" + QSB_FSMJ + "',QSB_FZMJ='"+QSB_FZMJ+"',"
								+ "QSB_SJSS='" + QSB_SJSS + "',QSB_WHSS='"+QSB_WHSS+"',"
								+ "GFB_FSCD='" + GFB_FSCD + "',GFB_FSMJ='"+GFB_FSMJ+"',"
								+ "GFB_FZMJ='" + GFB_FZMJ + "',GFB_SJSS='"+GFB_SJSS+"',"
								+ "GFB_WHSS='" + GFB_WHSS + "',YKB_FSCD='"+YKB_FSCD+"',"
								+ "YKB_FSMJ='" + YKB_FSMJ + "',YKB_FZMJ='"+YKB_FZMJ+"',"
								+ "YKB_SJSS='" + YKB_SJSS + "',YKB_WHSS='"+YKB_WHSS+"',"
								+ "XCB_FSCD='" + XCB_FSCD + "',XCB_FSMJ='"+XCB_FSMJ+"',"
								+ "XCB_FZMJ='" + XCB_FZMJ + "',XCB_SJSS='"+XCB_SJSS+"',"
								+ "XCB_WHSS='" + XCB_WHSS + "',XFB_FSCD='"+XFB_FSCD+"',"
								+ "XFB_FSMJ='" + XFB_FSMJ + "',XFB_FZMJ='"+XFB_FZMJ+"',"
								+ "XFB_SJSS='" + XFB_SJSS + "',XFB_WHSS='"+XFB_WHSS+"',"
								+ "QTB_FSCD='" + QTB_FSCD + "',QTB_FSMJ='"+QTB_FSMJ+"',"
								+ "QTB_FZMJ='" + QTB_FZMJ + "',QTB_SJSS='"+QTB_SJSS+"',"
								+ "QTB_WHSS='" + QTB_WHSS + "',BHHJ_FSCD='"+BHHJ_FSCD+"',"
								+ "BHHJ_FSMJ='" + BHHJ_FSMJ + "',BHHJ_FZMJ='"+BHHJ_FZMJ+"',"
								+ "BHHJ_SJSS='" + BHHJ_SJSS + "',BHHJ_WHSS='"+BHHJ_WHSS+"',"
								+ "BCHJ_FSCD='" + BCHJ_FSCD + "',BCHJ_FSMJ='"+BCHJ_FSMJ+"',"
								+ "BCHJ_FZMJ='" + BCHJ_FZMJ + "',BCHJ_SJSS='"+BCHJ_SJSS+"',"
								+ "BCHJ_WHSS='" + BCHJ_WHSS + "',BBLX='"+BBLX+"',"
								+ "ZT='" + ZT + "',"
								+ "MY_FZMJ='"+MY_FZMJ+"',DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd')  WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
				}
				//玉米病虫害年度统计表								
				if (fwd.equals("Q005")) {
					String YDYMM_FSCD = so.httpServletRequest.getParameter("YDYMM_FSCD");
					String YDYMM_FSMJ = so.httpServletRequest.getParameter("YDYMM_FSMJ");
					String YDYMM_FZMJ = so.httpServletRequest.getParameter("YDYMM_FZMJ");
					String YDYMM_SJSS = so.httpServletRequest.getParameter("YDYMM_SJSS");
					String YDYMM_WHSS = so.httpServletRequest.getParameter("YDYMM_WHSS");
					String YDYMM_FSQY = so.httpServletRequest.getParameter("YDYMM_FSQY");
					String YDYMM_FSSQ = so.httpServletRequest.getParameter("YDYMM_FSSQ");
					String YDYMM_BZ = so.httpServletRequest.getParameter("YDYMM_BZ");
					String EDYMM_FSCD = so.httpServletRequest.getParameter("EDYMM_FSCD");
					String EDYMM_FSMJ = so.httpServletRequest.getParameter("EDYMM_FSMJ");
					String EDYMM_FZMJ = so.httpServletRequest.getParameter("EDYMM_FZMJ");
					String EDYMM_SJSS = so.httpServletRequest.getParameter("EDYMM_SJSS");
					String EDYMM_WHSS = so.httpServletRequest.getParameter("EDYMM_WHSS");
					String EDYMM_FSQY = so.httpServletRequest.getParameter("EDYMM_FSQY");
					String EDYMM_FSSQ = so.httpServletRequest.getParameter("EDYMM_FSSQ");
					String EDYMM_BZ = so.httpServletRequest.getParameter("EDYMM_BZ");
					String SDYMM_FSCD = so.httpServletRequest.getParameter("SDYMM_FSCD");
					String SDYMM_FSMJ = so.httpServletRequest.getParameter("SDYMM_FSMJ");
					String SDYMM_FZMJ = so.httpServletRequest.getParameter("SDYMM_FZMJ");
					String SDYMM_SJSS = so.httpServletRequest.getParameter("SDYMM_SJSS");
					String SDYMM_WHSS = so.httpServletRequest.getParameter("SDYMM_WHSS");
					String SDYMM_FSQY = so.httpServletRequest.getParameter("SDYMM_FSQY");
					String SDYMM_FSSQ = so.httpServletRequest.getParameter("SDYMM_FSSQ");
					String SDYMM_BZ = so.httpServletRequest.getParameter("SDYMM_BZ");
					String EDWYE_FSCD = so.httpServletRequest.getParameter("EDWYE_FSCD");
					String EDWYE_FSMJ = so.httpServletRequest.getParameter("EDWYE_FSMJ");
					String EDWYE_FZMJ = so.httpServletRequest.getParameter("EDWYE_FZMJ");
					String EDWYE_SJSS = so.httpServletRequest.getParameter("EDWYE_SJSS");
					String EDWYE_WHSS = so.httpServletRequest.getParameter("EDWYE_WHSS");
					String EDWYE_FSQY = so.httpServletRequest.getParameter("EDWYE_FSQY");
					String EDWYE_FSSQ = so.httpServletRequest.getParameter("EDWYE_FSSQ");
					String EDWYE_BZ = so.httpServletRequest.getParameter("EDWYE_BZ");
					String EDNC_FSCD = so.httpServletRequest.getParameter("EDNC_FSCD");
					String EDNC_FSMJ = so.httpServletRequest.getParameter("EDNC_FSMJ");
					String EDNC_FZMJ = so.httpServletRequest.getParameter("EDNC_FZMJ");
					String EDNC_SJSS = so.httpServletRequest.getParameter("EDNC_SJSS");
					String EDNC_WHSS = so.httpServletRequest.getParameter("EDNC_WHSS");
					String EDNC_FSQY = so.httpServletRequest.getParameter("EDNC_FSQY");
					String 	EDNC_FSSQ = so.httpServletRequest.getParameter("EDNC_FSSQ");
					String EDNC_BZ = so.httpServletRequest.getParameter("EDNC_BZ");
					String SDNC_FSCD = so.httpServletRequest.getParameter("SDNC_FSCD");
					String SDNC_FSMJ = so.httpServletRequest.getParameter("SDNC_FSMJ");
					String SDNC_FZMJ = so.httpServletRequest.getParameter("SDNC_FZMJ");
					String SDNC_SJSS = so.httpServletRequest.getParameter("SDNC_SJSS");
					String SDNC_WHSS = so.httpServletRequest.getParameter("SDNC_WHSS");
					String SDNC_FSQY = so.httpServletRequest.getParameter("SDNC_FSQY");
					String SDNC_FSSQ = so.httpServletRequest.getParameter("SDNC_FSSQ");
					String SDNC_BZ = so.httpServletRequest.getParameter("SDNC_BZ");
					String EDMLC_FSCD = so.httpServletRequest.getParameter("EDMLC_FSCD");
					String EDMLC_FSMJ = so.httpServletRequest.getParameter("EDMLC_FSMJ");
					String EDMLC_FZMJ = so.httpServletRequest.getParameter("EDMLC_FZMJ");
					String EDMLC_SJSS = so.httpServletRequest.getParameter("EDMLC_SJSS");
					String EDMLC_WHSS = so.httpServletRequest.getParameter("EDMLC_WHSS");
					String EDMLC_FSQY = so.httpServletRequest.getParameter("EDMLC_FSQY");
					String EDMLC_FSSQ = so.httpServletRequest.getParameter("EDMLC_FSSQ");
					String EDMLC_BZ = so.httpServletRequest.getParameter("EDMLC_BZ");
					String SDMLC_FSCD = so.httpServletRequest.getParameter("SDMLC_FSCD");
					String SDMLC_FSMJ = so.httpServletRequest.getParameter("SDMLC_FSMJ");
					String SDMLC_FZMJ = so.httpServletRequest.getParameter("SDMLC_FZMJ");
					String 	SDMLC_SJSS = so.httpServletRequest.getParameter("SDMLC_SJSS");
					String SDMLC_WHSS = so.httpServletRequest.getParameter("SDMLC_WHSS");
					String SDMLC_FSQY = so.httpServletRequest.getParameter("SDMLC_FSQY");
					String SDMLC_FSSQ = so.httpServletRequest.getParameter("SDMLC_FSSQ");
					String SDMLC_BZ = so.httpServletRequest.getParameter("SDMLC_BZ");
					String FDMLC_FSCD = so.httpServletRequest.getParameter("FDMLC_FSCD");
					String FDMLC_FSMJ = so.httpServletRequest.getParameter("FDMLC_FSMJ");
					String FDMLC_FZMJ = so.httpServletRequest.getParameter("FDMLC_FZMJ");
					String FDMLC_SJSS = so.httpServletRequest.getParameter("FDMLC_SJSS");
					String FDMLC_WHSS = so.httpServletRequest.getParameter("FDMLC_WHSS");
					String FDMLC_FSQY = so.httpServletRequest.getParameter("FDMLC_FSQY");
					String FDMLC_FSSQ = so.httpServletRequest.getParameter("FDMLC_FSSQ");
					String FDMLC_BZ = so.httpServletRequest.getParameter("FDMLC_BZ");
					String CDM_FSCD = so.httpServletRequest.getParameter("CDM_FSCD");
					String CDM_FSMJ = so.httpServletRequest.getParameter("CDM_FSMJ");
					String CDM_FZMJ = so.httpServletRequest.getParameter("CDM_FZMJ");
					String CDM_SJSS = so.httpServletRequest.getParameter("CDM_SJSS");
					String CDM_WHSS = so.httpServletRequest.getParameter("CDM_WHSS");
					String CDM_FSQY = so.httpServletRequest.getParameter("CDM_FSQY");
					String CDM_FSSQ = so.httpServletRequest.getParameter("CDM_FSSQ");
					String 	CDM_BZ = so.httpServletRequest.getParameter("CDM_BZ");
					String 	YC_FSCD = so.httpServletRequest.getParameter("YC_FSCD");
					String YC_FSMJ = so.httpServletRequest.getParameter("YC_FSMJ");
					String YC_FZMJ = so.httpServletRequest.getParameter("YC_FZMJ");
					String YC_SJSS = so.httpServletRequest.getParameter("YC_SJSS");
					String YC_WHSS = so.httpServletRequest.getParameter("YC_WHSS");
					String YC_FSQY = so.httpServletRequest.getParameter("YC_FSQY");
					String YC_FSSQ = so.httpServletRequest.getParameter("YC_FSSQ");
					String YC_BZ = so.httpServletRequest.getParameter("YC_BZ");
					String JM_FSCD = so.httpServletRequest.getParameter("JM_FSCD");
					String JM_FSMJ = so.httpServletRequest.getParameter("JM_FSMJ");
					String JM_FZMJ = so.httpServletRequest.getParameter("JM_FZMJ");
					String JM_SJSS = so.httpServletRequest.getParameter("JM_SJSS");
					String JM_WHSS = so.httpServletRequest.getParameter("JM_WHSS");
					String JM_FSQY = so.httpServletRequest.getParameter("JM_FSQY");
					String JM_FSSQ = so.httpServletRequest.getParameter("JM_FSSQ");
					String JM_BZ = so.httpServletRequest.getParameter("JM_BZ");
					String YM_FSCD = so.httpServletRequest.getParameter("YM_FSCD");
					String YM_FSMJ = so.httpServletRequest.getParameter("YM_FSMJ");
					String YM_FZMJ = so.httpServletRequest.getParameter("YM_FZMJ");
					String YM_SJSS = so.httpServletRequest.getParameter("YM_SJSS");
					String YM_WHSS = so.httpServletRequest.getParameter("YM_WHSS");
					String YM_FSQY = so.httpServletRequest.getParameter("YM_FSQY");
					String YM_FSSQ = so.httpServletRequest.getParameter("YM_FSSQ");
					String YM_BZ = so.httpServletRequest.getParameter("YM_BZ");
					String SBYJC_FSCD = so.httpServletRequest.getParameter("SBYJC_FSCD");
					String SBYJC_FSMJ = so.httpServletRequest.getParameter("SBYJC_FSMJ");
					String SBYJC_FZMJ = so.httpServletRequest.getParameter("SBYJC_FZMJ");
					String SBYJC_SJSS = so.httpServletRequest.getParameter("SBYJC_SJSS");
					String SBYJC_WHSS = so.httpServletRequest.getParameter("SBYJC_WHSS");
					String SBYJC_FSQY = so.httpServletRequest.getParameter("SBYJC_FSQY");
					String SBYJC_FSSQ = so.httpServletRequest.getParameter("SBYJC_FSSQ");
					String SBYJC_BZ = so.httpServletRequest.getParameter("SBYJC_BZ");
					String TH_FSCD = so.httpServletRequest.getParameter("TH_FSCD");
					String TH_FSMJ = so.httpServletRequest.getParameter("TH_FSMJ");
					String TH_FZMJ = so.httpServletRequest.getParameter("TH_FZMJ");
					String TH_SJSS = so.httpServletRequest.getParameter("TH_SJSS");
					String TH_WHSS = so.httpServletRequest.getParameter("TH_WHSS");
					String TH_FSQY = so.httpServletRequest.getParameter("TH_FSQY");
					String TH_FSSQ = so.httpServletRequest.getParameter("TH_FSSQ");
					String TH_BZ = so.httpServletRequest.getParameter("TH_BZ");
					String DXHC_FSCD = so.httpServletRequest.getParameter("DXHC_FSCD");
					String DXHC_FSMJ = so.httpServletRequest.getParameter("DXHC_FSMJ");
					String DXHC_FZMJ = so.httpServletRequest.getParameter("DXHC_FZMJ");
					String DXHC_SJSS = so.httpServletRequest.getParameter("DXHC_SJSS");
					String DXHC_WHSS = so.httpServletRequest.getParameter("DXHC_WHSS");
					String DXHC_FSQY = so.httpServletRequest.getParameter("DXHC_FSQY");
					String DXHC_FSSQ = so.httpServletRequest.getParameter("DXHC_FSSQ");
					String DXHC_BZ = so.httpServletRequest.getParameter("DXHC_BZ");
					String QTCH_FSCD = so.httpServletRequest.getParameter("QTCH_FSCD");
					String QTCH_FSMJ = so.httpServletRequest.getParameter("QTCH_FSMJ");
					String QTCH_FZMJ = so.httpServletRequest.getParameter("QTCH_FZMJ");
					String QTCH_SJSS = so.httpServletRequest.getParameter("QTCH_SJSS");
					String QTCH_WHSS = so.httpServletRequest.getParameter("QTCH_WHSS");
					String QTCH_FSQY = so.httpServletRequest.getParameter("QTCH_FSQY");
					String QTCH_FSSQ = so.httpServletRequest.getParameter("QTCH_FSSQ");
					String QTCH_BZ = so.httpServletRequest.getParameter("QTCH_BZ");
					String CHHJ_FSMJ = so.httpServletRequest.getParameter("CHHJ_FSMJ");
					String CHHJ_FZMJ = so.httpServletRequest.getParameter("CHHJ_FZMJ");
					String CHHJ_SJSS = so.httpServletRequest.getParameter("CHHJ_SJSS");
					String CHHJ_WHSS = so.httpServletRequest.getParameter("CHHJ_WHSS");
					String CHHJ_FSQY = so.httpServletRequest.getParameter("CHHJ_FSQY");
					String CHHJ_FSSQ = so.httpServletRequest.getParameter("CHHJ_FSSQ");
					String CHHJ_BZ = so.httpServletRequest.getParameter("CHHJ_BZ");
					String DBB_FSCD = so.httpServletRequest.getParameter("DBB_FSCD");
					String DBB_FSMJ = so.httpServletRequest.getParameter("DBB_FSMJ");
					String DBB_FZMJ = so.httpServletRequest.getParameter("DBB_FZMJ");
					String DBB_SJSS = so.httpServletRequest.getParameter("DBB_SJSS");
					String DBB_WHSS = so.httpServletRequest.getParameter("DBB_WHSS");
					String DBB_FSQY = so.httpServletRequest.getParameter("DBB_FSQY");
					String DBB_FSSQ = so.httpServletRequest.getParameter("DBB_FSSQ");
					String DBB_BZ = so.httpServletRequest.getParameter("DBB_BZ");
					String XBB_FSCD = so.httpServletRequest.getParameter("XBB_FSCD");
					String XBB_FSMJ = so.httpServletRequest.getParameter("XBB_FSMJ");
					String XBB_FZMJ = so.httpServletRequest.getParameter("XBB_FZMJ");
					String XBB_SJSS = so.httpServletRequest.getParameter("XBB_SJSS");
					String XBB_WHSS = so.httpServletRequest.getParameter("XBB_WHSS");
					String XBB_FSQY = so.httpServletRequest.getParameter("XBB_FSQY");
					String XBB_FSSQ = so.httpServletRequest.getParameter("XBB_FSSQ");
					String XBB_BZ = so.httpServletRequest.getParameter("XBB_BZ");
					String HBB_FSCD = so.httpServletRequest.getParameter("HBB_FSCD");
					String HBB_FSMJ = so.httpServletRequest.getParameter("HBB_FSMJ");
					String HBB_FZMJ = so.httpServletRequest.getParameter("HBB_FZMJ");
					String HBB_SJSS = so.httpServletRequest.getParameter("HBB_SJSS");
					String HBB_WHSS = so.httpServletRequest.getParameter("HBB_WHSS");
					String HBB_FSQY = so.httpServletRequest.getParameter("HBB_FSQY");
					String HBB_FSSQ = so.httpServletRequest.getParameter("HBB_FSSQ");
					String HBB_BZ = so.httpServletRequest.getParameter("HBB_BZ");
					String YMWBMYBB_FSCD = so.httpServletRequest.getParameter("YMWBMYBB_FSCD");
					String YMWBMYBB_FSMJ = so.httpServletRequest.getParameter("YMWBMYBB_FSMJ");
					String YMWBMYBB_FZMJ = so.httpServletRequest.getParameter("YMWBMYBB_FZMJ");
					String YMWBMYBB_SJSS = so.httpServletRequest.getParameter("YMWBMYBB_SJSS");
					String YMWBMYBB_WHSS = so.httpServletRequest.getParameter("YMWBMYBB_WHSS");
					String YMWBMYBB_FSQY = so.httpServletRequest.getParameter("YMWBMYBB_FSQY");
					String YMWBMYBB_FSSQ = so.httpServletRequest.getParameter("YMWBMYBB_FSSQ");
					String YMWBMYBB_BZ = so.httpServletRequest.getParameter("YMWBMYBB_BZ");
					String WKB_FSCD = so.httpServletRequest.getParameter("WKB_FSCD");
					String WKB_FSMJ = so.httpServletRequest.getParameter("WKB_FSMJ");
					String WKB_FZMJ = so.httpServletRequest.getParameter("WKB_FZMJ");
					String WKB_SJSS = so.httpServletRequest.getParameter("WKB_SJSS");
					String WKB_WHSS = so.httpServletRequest.getParameter("WKB_WHSS");
					String WKB_FSQY = so.httpServletRequest.getParameter("WKB_FSQY");
					String WKB_FSSQ = so.httpServletRequest.getParameter("WKB_FSSQ");
					String WKB_BZ = so.httpServletRequest.getParameter("WKB_BZ");
					String SHSB_FSCD = so.httpServletRequest.getParameter("SHSB_FSCD");
					String SHSB_FSMJ = so.httpServletRequest.getParameter("SHSB_FSMJ");
					String SHSB_FZMJ = so.httpServletRequest.getParameter("SHSB_FZMJ");
					String SHSB_SJSS = so.httpServletRequest.getParameter("SHSB_SJSS");
					String SHSB_WHSS = so.httpServletRequest.getParameter("SHSB_WHSS");
					String SHSB_FSQY = so.httpServletRequest.getParameter("SHSB_FSQY");
					String SHSB_FSSQ = so.httpServletRequest.getParameter("SHSB_FSSQ");
					String SHSB_BZ = so.httpServletRequest.getParameter("SHSB_BZ");
					String XB_FSCD = so.httpServletRequest.getParameter("XB_FSCD");
					String XB_FSMJ = so.httpServletRequest.getParameter("XB_FSMJ");
					String XB_FZMJ = so.httpServletRequest.getParameter("XB_FZMJ");
					String XB_SJSS = so.httpServletRequest.getParameter("XB_SJSS");
					String XB_WHSS = so.httpServletRequest.getParameter("XB_WHSS");
					String XB_FSQY = so.httpServletRequest.getParameter("XB_FSQY");
					String XB_FSSQ = so.httpServletRequest.getParameter("XB_FSSQ");
					String XB_BZ = so.httpServletRequest.getParameter("XB_BZ");
					String LHFB_FSCD = so.httpServletRequest.getParameter("LHFB_FSCD");
					String LHFB_FSMJ = so.httpServletRequest.getParameter("LHFB_FSMJ");
					String LHFB_FZMJ = so.httpServletRequest.getParameter("LHFB_FZMJ");
					String LHFB_SJSS = so.httpServletRequest.getParameter("LHFB_SJSS");
					String LHFB_WHSS = so.httpServletRequest.getParameter("LHFB_WHSS");
					String LHFB_FSQY = so.httpServletRequest.getParameter("LHFB_FSQY");
					String LHFB_FSSQ = so.httpServletRequest.getParameter("LHFB_FSSQ");
					String LHFB_BZ = so.httpServletRequest.getParameter("LHFB_BZ");
					String CSB_FSCD = so.httpServletRequest.getParameter("CSB_FSCD");
					String CSB_FSMJ = so.httpServletRequest.getParameter("CSB_FSMJ");
					String CSB_FZMJ = so.httpServletRequest.getParameter("CSB_FZMJ");
					String CSB_SJSS = so.httpServletRequest.getParameter("CSB_SJSS");
					String CSB_WHSS = so.httpServletRequest.getParameter("CSB_WHSS");
					String CSB_FSQY = so.httpServletRequest.getParameter("CSB_FSQY");
					String CSB_FSSQ = so.httpServletRequest.getParameter("CSB_FSSQ");
					String CSB_BZ = so.httpServletRequest.getParameter("CSB_BZ");
					String DFB_FSCD = so.httpServletRequest.getParameter("DFB_FSCD");
					String DFB_FSMJ = so.httpServletRequest.getParameter("DFB_FSMJ");
					String DFB_FZMJ = so.httpServletRequest.getParameter("DFB_FZMJ");
					String DFB_SJSS = so.httpServletRequest.getParameter("DFB_SJSS");
					String DFB_WHSS = so.httpServletRequest.getParameter("DFB_WHSS");
					String DFB_FSQY = so.httpServletRequest.getParameter("DFB_FSQY");
					String DFB_FSSQ = so.httpServletRequest.getParameter("DFB_FSSQ");
					String DFB_BZ = so.httpServletRequest.getParameter("DFB_BZ");
					String QTB_FSCD = so.httpServletRequest.getParameter("QTB_FSCD");
					String QTB_FSMJ = so.httpServletRequest.getParameter("QTB_FSMJ");
					String QTB_FZMJ = so.httpServletRequest.getParameter("QTB_FZMJ");
					String QTB_SJSS = so.httpServletRequest.getParameter("QTB_SJSS");
					String QTB_WHSS = so.httpServletRequest.getParameter("QTB_WHSS");
					String QTB_FSQY = so.httpServletRequest.getParameter("QTB_FSQY");
					String QTB_FSSQ = so.httpServletRequest.getParameter("QTB_FSSQ");
					String QTB_BZ = so.httpServletRequest.getParameter("QTB_BZ");
					String BHHJ_FSMJ = so.httpServletRequest.getParameter("BHHJ_FSMJ");
					String BHHJ_FZMJ = so.httpServletRequest.getParameter("BHHJ_FZMJ");
					String BHHJ_SJSS = so.httpServletRequest.getParameter("BHHJ_SJSS");
					String BHHJ_WHSS = so.httpServletRequest.getParameter("BHHJ_WHSS");
					String BHHJ_FSQY = so.httpServletRequest.getParameter("BHHJ_FSQY");
					String BHHJ_FSSQ = so.httpServletRequest.getParameter("BHHJ_FSSQ");
					String BHHJ_BZ = so.httpServletRequest.getParameter("BHHJ_BZ");
					String BCHJ_FSMJ = so.httpServletRequest.getParameter("BCHJ_FSMJ");
					String BCHJ_FZMJ = so.httpServletRequest.getParameter("BCHJ_FZMJ");
					String BCHJ_SJSS = so.httpServletRequest.getParameter("BCHJ_SJSS");
					String BCHJ_WHSS = so.httpServletRequest.getParameter("BCHJ_WHSS");
					String BCHJ_FSQY = so.httpServletRequest.getParameter("BCHJ_FSQY");
					String BCHJ_FSSQ = so.httpServletRequest.getParameter("BCHJ_FSSQ");
					String BCHJ_BZ = so.httpServletRequest.getParameter("BCHJ_BZ");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d005.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YDYMM_FSCD,YDYMM_FSMJ,YDYMM_FZMJ,"
								+ "YDYMM_WHSS,YDYMM_FSQY,YDYMM_FSSQ,"
								+ "YDYMM_BZ,EDYMM_FSCD,EDYMM_FSMJ,"
								+ "EDYMM_FZMJ,EDYMM_SJSS,EDYMM_WHSS,"
								+ "EDYMM_FSQY,EDYMM_FSSQ,EDYMM_BZ,"
								+ "SDYMM_FSCD,SDYMM_FSMJ,SDYMM_FZMJ,"
								+ "SDYMM_SJSS,SDYMM_WHSS,SDYMM_FSQY,"
								+ "SDYMM_FSSQ,SDYMM_BZ,EDWYE_FSCD,"
								+ "EDWYE_FSMJ,EDWYE_FZMJ,EDWYE_SJSS,"
								+ "EDWYE_WHSS,EDWYE_FSQY,EDWYE_FSSQ,"
								+ "EDWYE_BZ,EDNC_FSCD,EDNC_FSMJ,"
								+ "EDNC_FZMJ,EDNC_SJSS,EDNC_WHSS,"
								+ "EDNC_FSQY,EDNC_FSSQ,EDNC_BZ,"
								+ "SDNC_FSCD,SDNC_FSMJ,SDNC_FZMJ,"
								+ "SDNC_SJSS,SDNC_WHSS,SDNC_FSQY,"
								+ "SDNC_FSSQ,SDNC_BZ,EDMLC_FSCD,"
								+ "EDMLC_FSMJ,EDMLC_FZMJ,EDMLC_SJSS,"
								+ "EDMLC_WHSS,EDMLC_FSQY,EDMLC_FSSQ,"
								+ "EDMLC_BZ,SDMLC_FSCD,SDMLC_FSMJ,"
								+ "SDMLC_FZMJ,SDMLC_SJSS,SDMLC_WHSS,"
								+ "SDMLC_FSQY,SDMLC_FSSQ,SDMLC_BZ,"
								+ "FDMLC_FSCD,FDMLC_FSMJ,FDMLC_FZMJ,"
								+ "FDMLC_SJSS,FDMLC_WHSS,FDMLC_FSQY,"
								+ "FDMLC_FSSQ,FDMLC_BZ,CDM_FSCD,"
								+ "CDM_FSMJ,CDM_FZMJ,CDM_SJSS,"
								+ "CDM_WHSS,CDM_FSQY,CDM_FSSQ,"
								+ "CDM_BZ,YC_FSCD,YC_FSMJ,"
								+ "YC_FZMJ,YC_SJSS,YC_WHSS,"
								+ "YC_FSQY,YC_FSSQ,YC_BZ,"
								+ "JM_FSCD,JM_FSMJ,JM_FZMJ,"
								+ "JM_SJSS,JM_WHSS,JM_FSQY,"
								+ "JM_FSSQ,JM_BZ,YM_FSCD,"
								+ "YM_FSMJ,YM_FZMJ,YM_SJSS,"
								+ "YM_WHSS,YM_FSQY,YM_FSSQ,"
								+ "YM_BZ,SBYJC_FSCD,SBYJC_FSMJ,"
								+ "SBYJC_FZMJ,SBYJC_SJSS,SBYJC_WHSS,"
								+ "SBYJC_FSQY,SBYJC_FSSQ,SBYJC_BZ,"
								+ "TH_FSCD,TH_FSMJ,TH_FZMJ,"
								+ "TH_SJSS,TH_WHSS,TH_FSQY,"
								+ "TH_FSSQ,TH_BZ,DXHC_FSCD,"
								+ "DXHC_FSMJ,DXHC_FZMJ,DXHC_SJSS,"
								+ "DXHC_WHSS,DXHC_FSQY,DXHC_FSSQ,"
								+ "DXHC_BZ,QTCH_FSCD,QTCH_FSMJ,"
								+ "QTCH_FZMJ,QTCH_SJSS,QTCH_WHSS,"
								+ "QTCH_FSQY,QTCH_FSSQ,QTCH_BZ,"
								+ "CHHJ_FSMJ,CHHJ_FZMJ,"
								+ "CHHJ_SJSS,CHHJ_WHSS,CHHJ_FSQY,"
								+ "CHHJ_FSSQ,CHHJ_BZ,DBB_FSCD,"
								+ "DBB_FSMJ,DBB_FZMJ,DBB_SJSS,"
								+ "DBB_WHSS,DBB_FSQY,DBB_FSSQ,"
								+ "DBB_BZ,XBB_FSCD,XBB_FSMJ,"
								+ "XBB_FZMJ,XBB_SJSS,XBB_WHSS,"
								+ "XBB_FSQY,XBB_FSSQ,XBB_BZ,"
								+ "HBB_FSCD,HBB_FSMJ,HBB_FZMJ,"
								+ "HBB_SJSS,HBB_WHSS,HBB_FSQY,"
								+ "HBB_FSSQ,HBB_BZ,YMWBMYBB_FSCD,"
								+ "YMWBMYBB_FSMJ,YMWBMYBB_FZMJ,YMWBMYBB_SJSS,"
								+ "YMWBMYBB_WHSS,YMWBMYBB_FSQY,YMWBMYBB_FSSQ,"
								+ "YMWBMYBB_BZ,WKB_FSCD,WKB_FSMJ,"
								+ "WKB_FZMJ,WKB_SJSS,WKB_WHSS,"
								+ "WKB_FSQY,WKB_FSSQ,WKB_BZ,"
								+ "SHSB_FSCD,SHSB_FSMJ,SHSB_FZMJ,"
								+ "SHSB_SJSS,SHSB_WHSS,SHSB_FSQY,"
								+ "SHSB_FSSQ,SHSB_BZ,XB_FSCD,"
								+ "XB_FSMJ,XB_FZMJ,XB_SJSS,"
								+ "XB_WHSS,XB_FSQY,XB_FSSQ,"
								+ "XB_BZ,LHFB_FSCD,LHFB_FSMJ,"
								+ "LHFB_FZMJ,LHFB_SJSS,LHFB_WHSS,"
								+ "LHFB_FSQY,LHFB_FSSQ,LHFB_BZ,"
								+ "CSB_FSCD,CSB_FSMJ,CSB_FZMJ,"
								+ "CSB_SJSS,CSB_WHSS,CSB_FSQY,"
								+ "CSB_FSSQ,CSB_BZ,DFB_FSCD,"
								+ "DFB_FSMJ,DFB_FZMJ,DFB_SJSS,"
								+ "DFB_WHSS,DFB_FSQY,DFB_FSSQ,"
								+ "DFB_BZ,QTB_FSCD,QTB_FSMJ,"
								+ "QTB_FZMJ,QTB_SJSS,QTB_WHSS,"
								+ "QTB_FSQY,QTB_FSSQ,QTB_BZ,"
								+ "BHHJ_FSMJ,BHHJ_FZMJ,"
								+ "BHHJ_SJSS,BHHJ_WHSS,BHHJ_FSQY,"
								+ "BHHJ_FSSQ,BHHJ_BZ,"
								+ "BCHJ_FSMJ,BCHJ_FZMJ,BCHJ_SJSS,"
								+ "BCHJ_WHSS,BCHJ_FSQY,BCHJ_FSSQ,"
								+ "BCHJ_BZ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT,"
								+ "YDYMM_SJSS,DCRQ) VALUES ('" + JFID + "','"
								+ YDYMM_FSCD + "','" + YDYMM_FSMJ + "','"+YDYMM_FZMJ+"','"
								+ YDYMM_WHSS + "','" + YDYMM_FSQY + "',to_date('"+YDYMM_FSSQ+"','yyyy-MM-dd'),'"
								+ YDYMM_BZ + "','" + EDYMM_FSCD + "','"+EDYMM_FSMJ+"','"
								+ EDYMM_FZMJ + "','" + EDYMM_SJSS + "','"+EDYMM_WHSS+"','"
								+ EDYMM_FSQY + "',to_date('" + EDYMM_FSSQ + "','yyyy-MM-dd'),'"+EDYMM_BZ+"','"
								+ SDYMM_FSCD + "','" + SDYMM_FSMJ + "','"+SDYMM_FZMJ+"','"
								+ SDYMM_SJSS + "','" + SDYMM_WHSS + "','"+SDYMM_FSQY+"',to_date('"
								+ SDYMM_FSSQ + "','yyyy-MM-dd'),'" + SDYMM_BZ + "','"+EDWYE_FSCD+"','"
								+ EDWYE_FSMJ + "','" + EDWYE_FZMJ + "','"+EDWYE_SJSS+"','"
								+ EDWYE_WHSS + "','" + EDWYE_FSQY + "',to_date('"+EDWYE_FSSQ+"','yyyy-MM-dd'),'"
								+ EDWYE_BZ + "','" + EDNC_FSCD + "','"+EDNC_FSMJ+"','"
								+ EDNC_FZMJ + "','" + EDNC_SJSS + "','"+EDNC_WHSS+"','"
								+ EDNC_FSQY + "',to_date('" + EDNC_FSSQ + "','yyyy-MM-dd'),'"+EDNC_BZ+"','"
								+ SDNC_FSCD + "','" + SDNC_FSMJ + "','"+SDNC_FZMJ+"','"
								+ SDNC_SJSS + "','" + SDNC_WHSS + "','"+SDNC_FSQY+"',to_date('"
								+ SDNC_FSSQ + "','yyyy-MM-dd'),'" + SDNC_BZ + "','"+EDMLC_FSCD+"','"
								+ EDMLC_FSMJ + "','" + EDMLC_FZMJ + "','"+EDMLC_SJSS+"','"
								+ EDMLC_WHSS + "','" + EDMLC_FSQY + "',to_date('"+EDMLC_FSSQ+"','yyyy-MM-dd'),'"
								+ EDMLC_BZ + "','" + SDMLC_FSCD + "','"+SDMLC_FSMJ+"','"
								+ SDMLC_FZMJ + "','" + SDMLC_SJSS + "','"+SDMLC_WHSS+"','"
								+ SDMLC_FSQY + "',to_date('" + SDMLC_FSSQ + "','yyyy-MM-dd'),'"+SDMLC_BZ+"','"
								+ FDMLC_FSCD + "','" + FDMLC_FSMJ + "','"+FDMLC_FZMJ+"','"
								+ FDMLC_SJSS + "','" + FDMLC_WHSS + "','"+FDMLC_FSQY+"',to_date('"
								+ FDMLC_FSSQ + "','yyyy-MM-dd'),'" + FDMLC_BZ + "','"+CDM_FSCD+"','"
								+ CDM_FSMJ + "','" + CDM_FZMJ + "','"+CDM_SJSS+"','"
								+ CDM_WHSS + "','" + CDM_FSQY + "',to_date('"+CDM_FSSQ+"','yyyy-MM-dd'),'"
								+ CDM_BZ + "','" + YC_FSCD + "','"+YC_FSMJ+"','"
								+ YC_FZMJ + "','" + YC_SJSS + "','"+YC_WHSS+"','"
								+ YC_FSQY + "',to_date('" + YC_FSSQ + "','yyyy-MM-dd'),'"+YC_BZ+"','"
								+ JM_FSCD + "','" + JM_FSMJ + "','"+JM_FZMJ+"','"
								+ JM_SJSS + "','" + JM_WHSS + "','"+JM_FSQY+"',to_date('"
								+ JM_FSSQ + "','yyyy-MM-dd'),'" + JM_BZ + "','"+YM_FSCD+"','"
								+ YM_FSMJ + "','" + YM_FZMJ + "','"+YM_SJSS+"','"
								+ YM_WHSS + "','" + YM_FSQY + "',to_date('"+YM_FSSQ+"','yyyy-MM-dd'),'"
								+ YM_BZ + "','" + SBYJC_FSCD + "','"+SBYJC_FSMJ+"','"
								+ SBYJC_FZMJ + "','" + SBYJC_SJSS + "','"+SBYJC_WHSS+"','"
								+ SBYJC_FSQY + "',to_date('" + SBYJC_FSSQ + "','yyyy-MM-dd'),'"+SBYJC_BZ+"','"
								+ TH_FSCD + "','" + TH_FSMJ + "','"+TH_FZMJ+"','"
								+ TH_SJSS + "','" + TH_WHSS + "','"+TH_FSQY+"',to_date('"
								+ TH_FSSQ + "','yyyy-MM-dd'),'" + TH_BZ + "','"+DXHC_FSCD+"','"
								+ DXHC_FSMJ + "','" + DXHC_FZMJ + "','"+DXHC_SJSS+"','"
								+ DXHC_WHSS + "','" + DXHC_FSQY + "',to_date('"+DXHC_FSSQ+"','yyyy-MM-dd'),'"
								+ DXHC_BZ + "','" + QTCH_FSCD + "','"+QTCH_FSMJ+"','"
								+ QTCH_FZMJ + "','" + QTCH_SJSS + "','"+QTCH_WHSS+"','"
								+ QTCH_FSQY + "',to_date('" + QTCH_FSSQ + "','yyyy-MM-dd'),'"+QTCH_BZ+"','"
								+ CHHJ_FSMJ + "','"+CHHJ_FZMJ+"','"
								+ CHHJ_SJSS + "','" + CHHJ_WHSS + "','"+CHHJ_FSQY+"',to_date('"
								+ CHHJ_FSSQ + "','yyyy-MM-dd'),'" + CHHJ_BZ + "','"+DBB_FSCD+"','"
								+ DBB_FSMJ + "','" + DBB_FZMJ + "','"+DBB_SJSS+"','"
								+ DBB_WHSS + "','" + DBB_FSQY + "',to_date('"+DBB_FSSQ+"','yyyy-MM-dd'),'"
								+ DBB_BZ + "','" + XBB_FSCD + "','"+XBB_FSMJ+"','"
								+ XBB_FZMJ + "','" + XBB_SJSS + "','"+XBB_WHSS+"','"
								+ XBB_FSQY + "',to_date('" + XBB_FSSQ + "','yyyy-MM-dd'),'"+XBB_BZ+"','"
								+ HBB_FSCD + "','" + HBB_FSMJ + "','"+HBB_FZMJ+"','"
								+ HBB_SJSS + "','" + HBB_WHSS + "','"+HBB_FSQY+"',to_date('"
								+ HBB_FSSQ + "','yyyy-MM-dd'),'" + HBB_BZ + "','"+YMWBMYBB_FSCD+"','"
								+ YMWBMYBB_FSMJ + "','" + YMWBMYBB_FZMJ + "','"+YMWBMYBB_SJSS+"','"
								+ YMWBMYBB_WHSS + "','" + YMWBMYBB_FSQY + "',to_date('"+YMWBMYBB_FSSQ+"','yyyy-MM-dd'),'"
								+ YMWBMYBB_BZ + "','" + WKB_FSCD + "','"+WKB_FSMJ+"','"
								+ WKB_FZMJ + "','" + WKB_SJSS + "','"+WKB_WHSS+"','"
								+ WKB_FSQY + "',to_date('" + WKB_FSSQ + "','yyyy-MM-dd'),'"+WKB_BZ+"','"
								+ SHSB_FSCD + "','" + SHSB_FSMJ + "','"+SHSB_FZMJ+"','"
								+ SHSB_SJSS + "','" + SHSB_WHSS + "','"+SHSB_FSQY+"',to_date('"
								+ SHSB_FSSQ + "','yyyy-MM-dd'),'" + SHSB_BZ + "','"+XB_FSCD+"','"
								+ XB_FSMJ + "','" + XB_FZMJ + "','"+XB_SJSS+"','"
								+ XB_WHSS + "','" + XB_FSQY + "',to_date('"+XB_FSSQ+"','yyyy-MM-dd'),'"
								+ XB_BZ + "','" + LHFB_FSCD + "','"+LHFB_FSMJ+"','"
								+ LHFB_FZMJ + "','" + LHFB_SJSS + "','"+LHFB_WHSS+"','"
								+ LHFB_FSQY + "',to_date('" + LHFB_FSSQ + "','yyyy-MM-dd'),'"+LHFB_BZ+"','"
								+ CSB_FSCD + "','" + CSB_FSMJ + "','"+CSB_FZMJ+"','"
								+ CSB_SJSS + "','" + CSB_WHSS + "','"+CSB_FSQY+"',to_date('"
								+ CSB_FSSQ + "','yyyy-MM-dd'),'" + CSB_BZ + "','"+DFB_FSCD+"','"
								+ DFB_FSMJ + "','" + DFB_FZMJ + "','"+DFB_SJSS+"','"
								+ DFB_WHSS + "','" + DFB_FSQY + "',to_date('"+DFB_FSSQ+"','yyyy-MM-dd'),'"
								+ DFB_BZ + "','" + QTB_FSCD + "','"+QTB_FSMJ+"','"
								+ QTB_FZMJ + "','" + QTB_SJSS + "','"+QTB_WHSS+"','"
								+ QTB_FSQY + "',to_date('" + QTB_FSSQ + "','yyyy-MM-dd'),'"+QTB_BZ+"','"
							    + BHHJ_FSMJ + "','"+BHHJ_FZMJ+"','"
								+ BHHJ_SJSS + "','" + BHHJ_WHSS + "','"+BHHJ_FSQY+"',to_date('"
								+ BHHJ_FSSQ + "','yyyy-MM-dd'),'" + BHHJ_BZ + "','"
								+ BCHJ_FSMJ + "','" + BCHJ_FZMJ + "','"+BCHJ_SJSS+"','"
								+ BCHJ_WHSS + "','" + BCHJ_FSQY + "',to_date('"+BCHJ_FSSQ+"','yyyy-MM-dd'),'"
								+ BCHJ_BZ + "','"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"','"
								+ YDYMM_SJSS + "',to_date('" + DCRQ + "','yyyy-MM-dd'))";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
					else
					{
						//更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "YDYMM_FSCD='" + YDYMM_FSCD + "',YDYMM_FSMJ='"+YDYMM_FSMJ+"',"
								+ "YDYMM_WHSS='" + YDYMM_WHSS + "',YDYMM_FSQY='"+YDYMM_FSQY+"',"
								+ "YDYMM_FSSQ=to_date('" + YDYMM_FSSQ + "','yyyy-MM-dd'),YDYMM_BZ='"+YDYMM_BZ+"',"
								+ "EDYMM_FSCD='" + EDYMM_FSCD + "',EDYMM_FSMJ='"+EDYMM_FSMJ+"',"
								+ "EDYMM_FZMJ='" + EDYMM_FZMJ + "',EDYMM_SJSS='"+EDYMM_SJSS+"',"
								+ "EDYMM_WHSS='" + EDYMM_WHSS + "',EDYMM_FSQY='"+EDYMM_FSQY+"',"
								+ "EDYMM_FSSQ=to_date('" + EDYMM_FSSQ + "','yyyy-MM-dd'),EDYMM_BZ='"+EDYMM_BZ+"',"
								+ "SDYMM_FSCD='" + SDYMM_FSCD + "',SDYMM_FSMJ='"+SDYMM_FSMJ+"',"
								+ "SDYMM_FZMJ='" + SDYMM_FZMJ + "',SDYMM_SJSS='"+SDYMM_SJSS+"',"
								+ "SDYMM_WHSS='" + SDYMM_WHSS + "',SDYMM_FSQY='"+SDYMM_FSQY+"',"
								+ "SDYMM_FSSQ=to_date('" + SDYMM_FSSQ + "','yyyy-MM-dd'),SDYMM_BZ='"+SDYMM_BZ+"',"
								+ "EDWYE_FSCD='" + EDWYE_FSCD + "',EDWYE_FSMJ='"+EDWYE_FSMJ+"',"
								+ "EDWYE_FZMJ='" + EDWYE_FZMJ + "',EDWYE_SJSS='"+EDWYE_SJSS+"',"
								+ "EDWYE_WHSS='" + EDWYE_WHSS + "',EDWYE_FSQY='"+EDWYE_FSQY+"',"
								+ "EDWYE_FSSQ=to_date('" + EDWYE_FSSQ + "','yyyy-MM-dd'),EDWYE_BZ='"+EDWYE_BZ+"',"
								+ "EDNC_FSCD='" + EDNC_FSCD + "',EDNC_FSMJ='"+EDNC_FSMJ+"',"
								+ "EDNC_FZMJ='" + EDNC_FZMJ + "',EDNC_SJSS='"+EDNC_SJSS+"',"
								+ "EDNC_WHSS='" + EDNC_WHSS + "',EDNC_FSQY='"+EDNC_FSQY+"',"
								+ "EDNC_FSSQ=to_date('" + EDNC_FSSQ + "','yyyy-MM-dd'),EDNC_BZ='"+EDNC_BZ+"',"
								+ "SDNC_FSCD='" + SDNC_FSCD + "',SDNC_FSMJ='"+SDNC_FSMJ+"',"
								+ "SDNC_FZMJ='" + SDNC_FZMJ + "',SDNC_SJSS='"+SDNC_SJSS+"',"
								+ "SDNC_WHSS='" + SDNC_WHSS + "',SDNC_FSQY='"+SDNC_FSQY+"',"
								+ "SDNC_FSSQ=to_date('" + SDNC_FSSQ + "','yyyy-MM-dd'),SDNC_BZ='"+SDNC_BZ+"',"
								+ "EDMLC_FSCD='" + EDMLC_FSCD + "',EDMLC_FSMJ='"+EDMLC_FSMJ+"',"
								+ "EDMLC_FZMJ='" + EDMLC_FZMJ + "',EDMLC_SJSS='"+EDMLC_SJSS+"',"
								+ "EDMLC_WHSS='" + EDMLC_WHSS + "',EDMLC_FSQY='"+EDMLC_FSQY+"',"
								+ "EDMLC_FSSQ=to_date('" + EDMLC_FSSQ + "','yyyy-MM-dd'),EDMLC_BZ='"+EDMLC_BZ+"',"
								+ "SDMLC_FSCD='" + SDMLC_FSCD + "',SDMLC_FSMJ='"+SDMLC_FSMJ+"',"
								+ "SDMLC_FZMJ='" + SDMLC_FZMJ + "',SDMLC_SJSS='"+SDMLC_SJSS+"',"
								+ "SDMLC_WHSS='" + SDMLC_WHSS + "',SDMLC_FSQY='"+SDMLC_FSQY+"',"
								+ "SDMLC_FSSQ=to_date('" + SDMLC_FSSQ + "','yyyy-MM-dd'),SDMLC_BZ='"+SDMLC_BZ+"',"
								+ "FDMLC_FSCD='" + FDMLC_FSCD + "',FDMLC_FSMJ='"+FDMLC_FSMJ+"',"
								+ "FDMLC_FZMJ='" + FDMLC_FZMJ + "',FDMLC_SJSS='"+FDMLC_SJSS+"',"
								+ "FDMLC_WHSS='" + FDMLC_WHSS + "',FDMLC_FSQY='"+FDMLC_FSQY+"',"
								+ "FDMLC_FSSQ=to_date('" + FDMLC_FSSQ + "','yyyy-MM-dd'),FDMLC_BZ='"+FDMLC_BZ+"',"
								+ "CDM_FSCD='" + CDM_FSCD + "',CDM_FSMJ='"+CDM_FSMJ+"',"
								+ "CDM_FZMJ='" + CDM_FZMJ + "',CDM_SJSS='"+CDM_SJSS+"',"
								+ "CDM_WHSS='" + CDM_WHSS + "',CDM_FSQY='"+CDM_FSQY+"',"
								+ "CDM_FSSQ=to_date('" + CDM_FSSQ + "','yyyy-MM-dd'),CDM_BZ='"+CDM_BZ+"',"
								+ "YC_FSCD='" + YC_FSCD + "',YC_FSMJ='"+YC_FSMJ+"',"
								+ "YC_FZMJ='" + YC_FZMJ + "',YC_SJSS='"+YC_SJSS+"',"
								+ "YC_WHSS='" + YC_WHSS + "',YC_FSQY='"+YC_FSQY+"',"
								+ "YC_FSSQ=to_date('" + YC_FSSQ + "','yyyy-MM-dd'),YC_BZ='"+YC_BZ+"',"
								+ "JM_FSCD='" + JM_FSCD + "',JM_FSMJ='"+JM_FSMJ+"',"
								+ "JM_FZMJ='" + JM_FZMJ + "',JM_SJSS='"+JM_SJSS+"',"
								+ "JM_WHSS='" + JM_WHSS + "',JM_FSQY='"+JM_FSQY+"',"
								+ "JM_FSSQ=to_date('" + JM_FSSQ + "','yyyy-MM-dd'),JM_BZ='"+JM_BZ+"',"
								+ "YM_FSCD='" + YM_FSCD + "',YM_FSMJ='"+YM_FSMJ+"',"
								+ "YM_FZMJ='" + YM_FZMJ + "',YM_SJSS='"+YM_SJSS+"',"
								+ "YM_WHSS='" + YM_WHSS + "',YM_FSQY='"+YM_FSQY+"',"
								+ "YM_FSSQ=to_date('" + YM_FSSQ + "','yyyy-MM-dd'),YM_BZ='"+YM_BZ+"',"
								+ "SBYJC_FSCD='" + SBYJC_FSCD + "',SBYJC_FSMJ='"+SBYJC_FSMJ+"',"
								+ "SBYJC_FZMJ='" + SBYJC_FZMJ + "',SBYJC_SJSS='"+SBYJC_SJSS+"',"
								+ "SBYJC_WHSS='" + SBYJC_WHSS + "',SBYJC_FSQY='"+SBYJC_FSQY+"',"
								+ "SBYJC_FSSQ=to_date('" + SBYJC_FSSQ + "','yyyy-MM-dd'),SBYJC_BZ='"+SBYJC_BZ+"',"
								+ "TH_FSCD='" + TH_FSCD + "',TH_FSMJ='"+TH_FSMJ+"',"
								+ "TH_FZMJ='" + TH_FZMJ + "',TH_SJSS='"+TH_SJSS+"',"
								+ "TH_WHSS='" + TH_WHSS + "',TH_FSQY='"+TH_FSQY+"',"
								+ "TH_FSSQ=to_date('" + TH_FSSQ + "','yyyy-MM-dd'),TH_BZ='"+TH_BZ+"',"
								+ "DXHC_FSCD='" + DXHC_FSCD + "',DXHC_FSMJ='"+DXHC_FSMJ+"',"
								+ "DXHC_FZMJ='" + DXHC_FZMJ + "',DXHC_SJSS='"+DXHC_SJSS+"',"
								+ "DXHC_WHSS='" + DXHC_WHSS + "',DXHC_FSQY='"+DXHC_FSQY+"',"
								+ "DXHC_FSSQ=to_date('" + DXHC_FSSQ + "','yyyy-MM-dd'),DXHC_BZ='"+DXHC_BZ+"',"
								+ "QTCH_FSCD='" + QTCH_FSCD + "',QTCH_FSMJ='"+QTCH_FSMJ+"',"
								+ "QTCH_FZMJ='" + QTCH_FZMJ + "',QTCH_SJSS='"+QTCH_SJSS+"',"
								+ "QTCH_WHSS='" + QTCH_WHSS + "',QTCH_FSQY='"+QTCH_FSQY+"',"
								+ "QTCH_FSSQ=to_date('" + QTCH_FSSQ + "','yyyy-MM-dd'),QTCH_BZ='"+QTCH_BZ+"',"
							    + "CHHJ_FSMJ='"+CHHJ_FSMJ+"',"
								+ "CHHJ_FZMJ='" + CHHJ_FZMJ + "',CHHJ_SJSS='"+CHHJ_SJSS+"',"
								+ "CHHJ_WHSS='" + CHHJ_WHSS + "',CHHJ_FSQY='"+CHHJ_FSQY+"',"
								+ "CHHJ_FSSQ=to_date('" + CHHJ_FSSQ + "','yyyy-MM-dd'),CHHJ_BZ='"+CHHJ_BZ+"',"
								+ "DBB_FSCD='" + DBB_FSCD + "',DBB_FSMJ='"+DBB_FSMJ+"',"
								+ "DBB_FZMJ='" + DBB_FZMJ + "',DBB_SJSS='"+DBB_SJSS+"',"
								+ "DBB_WHSS='" + DBB_WHSS + "',DBB_FSQY='"+DBB_FSQY+"',"
								+ "DBB_FSSQ=to_date('" + DBB_FSSQ + "','yyyy-MM-dd'),DBB_BZ='"+DBB_BZ+"',"
								+ "XBB_FSCD='" + XBB_FSCD + "',XBB_FSMJ='"+XBB_FSMJ+"',"
								+ "XBB_FZMJ='" + XBB_FZMJ + "',XBB_SJSS='"+XBB_SJSS+"',"
								+ "XBB_WHSS='" + XBB_WHSS + "',XBB_FSQY='"+XBB_FSQY+"',"
								+ "XBB_FSSQ=to_date('" + XBB_FSSQ + "','yyyy-MM-dd'),XBB_BZ='"+XBB_BZ+"',"
								+ "HBB_FSCD='" + HBB_FSCD + "',HBB_FSMJ='"+HBB_FSMJ+"',"
								+ "HBB_FZMJ='" + HBB_FZMJ + "',HBB_SJSS='"+HBB_SJSS+"',"
								+ "HBB_WHSS='" + HBB_WHSS + "',HBB_FSQY='"+HBB_FSQY+"',"
								+ "HBB_FSSQ=to_date('" + HBB_FSSQ + "','yyyy-MM-dd'),HBB_BZ='"+HBB_BZ+"',"
								+ "YMWBMYBB_FSCD='" + YMWBMYBB_FSCD + "',YMWBMYBB_FSMJ='"+YMWBMYBB_FSMJ+"',"
								+ "YMWBMYBB_FZMJ='" + YMWBMYBB_FZMJ + "',YMWBMYBB_SJSS='"+YMWBMYBB_SJSS+"',"
								+ "YMWBMYBB_WHSS='" + YMWBMYBB_WHSS + "',YMWBMYBB_FSQY='"+YMWBMYBB_FSQY+"',"
								+ "YMWBMYBB_FSSQ=to_date('" + YMWBMYBB_FSSQ + "','yyyy-MM-dd'),YMWBMYBB_BZ='"+YMWBMYBB_BZ+"',"
								+ "WKB_FSCD='" + WKB_FSCD + "',WKB_FSMJ='"+WKB_FSMJ+"',"
								+ "WKB_FZMJ='" + WKB_FZMJ + "',WKB_SJSS='"+WKB_SJSS+"',"
								+ "WKB_WHSS='" + WKB_WHSS + "',WKB_FSQY='"+WKB_FSQY+"',"
								+ "WKB_FSSQ=to_date('" + WKB_FSSQ + "','yyyy-MM-dd'),WKB_BZ='"+WKB_BZ+"',"
								+ "SHSB_FSCD='" + SHSB_FSCD + "',SHSB_FSMJ='"+SHSB_FSMJ+"',"
								+ "SHSB_FZMJ='" + SHSB_FZMJ + "',SHSB_SJSS='"+SHSB_SJSS+"',"
								+ "SHSB_WHSS='" + SHSB_WHSS + "',SHSB_FSQY='"+SHSB_FSQY+"',"
								+ "SHSB_FSSQ=to_date('" + SHSB_FSSQ + "','yyyy-MM-dd'),SHSB_BZ='"+SHSB_BZ+"',"
								+ "XB_FSCD='" + XB_FSCD + "',XB_FSMJ='"+XB_FSMJ+"',"
								+ "XB_FZMJ='" + XB_FZMJ + "',XB_SJSS='"+XB_SJSS+"',"
								+ "XB_WHSS='" + XB_WHSS + "',XB_FSQY='"+XB_FSQY+"',"
								+ "XB_FSSQ=to_date('" + XB_FSSQ + "','yyyy-MM-dd'),XB_BZ='"+XB_BZ+"',"
								+ "LHFB_FSCD='" + LHFB_FSCD + "',LHFB_FSMJ='"+LHFB_FSMJ+"',"
								+ "LHFB_FZMJ='" + LHFB_FZMJ + "',LHFB_SJSS='"+LHFB_SJSS+"',"
								+ "LHFB_WHSS='" + LHFB_WHSS + "',LHFB_FSQY='"+LHFB_FSQY+"',"
								+ "LHFB_FSSQ=to_date('" + LHFB_FSSQ + "','yyyy-MM-dd'),LHFB_BZ='"+LHFB_BZ+"',"
								+ "CSB_FSCD='" + CSB_FSCD + "',CSB_FSMJ='"+CSB_FSMJ+"',"
								+ "CSB_FZMJ='" + CSB_FZMJ + "',CSB_SJSS='"+CSB_SJSS+"',"
								+ "CSB_WHSS='" + CSB_WHSS + "',CSB_FSQY='"+CSB_FSQY+"',"
								+ "CSB_FSSQ=to_date('" + CSB_FSSQ + "','yyyy-MM-dd'),CSB_BZ='"+CSB_BZ+"',"
								+ "DFB_FSCD='" + DFB_FSCD + "',DFB_FSMJ='"+DFB_FSMJ+"',"
								+ "DFB_FZMJ='" + DFB_FZMJ + "',DFB_SJSS='"+DFB_SJSS+"',"
								+ "DFB_WHSS='" + DFB_WHSS + "',DFB_FSQY='"+DFB_FSQY+"',"
								+ "DFB_FSSQ=to_date('" + DFB_FSSQ + "','yyyy-MM-dd'),DFB_BZ='"+DFB_BZ+"',"
								+ "QTB_FSCD='" + QTB_FSCD + "',QTB_FSMJ='"+QTB_FSMJ+"',"
								+ "QTB_FZMJ='" + QTB_FZMJ + "',QTB_SJSS='"+QTB_SJSS+"',"
								+ "QTB_WHSS='" + QTB_WHSS + "',QTB_FSQY='"+QTB_FSQY+"',"
								+ "QTB_FSSQ=to_date('" + QTB_FSSQ + "','yyyy-MM-dd'),QTB_BZ='"+QTB_BZ+"',"
						        + "BHHJ_FSMJ='"+BHHJ_FSMJ+"',"
								+ "BHHJ_FZMJ='" + BHHJ_FZMJ + "',BHHJ_SJSS='"+BHHJ_SJSS+"',"
								+ "BHHJ_WHSS='" + BHHJ_WHSS + "',BHHJ_FSQY='"+BHHJ_FSQY+"',"
								+ "BHHJ_FSSQ=to_date('" + BHHJ_FSSQ + "','yyyy-MM-dd'),BHHJ_BZ='"+BHHJ_BZ+"',"
								+ "BCHJ_FSMJ='"+BCHJ_FSMJ+"',"
								+ "BCHJ_FZMJ='" + BCHJ_FZMJ + "',BCHJ_SJSS='"+BCHJ_SJSS+"',"
								+ "BCHJ_WHSS='" + BCHJ_WHSS + "',BCHJ_FSQY='"+BCHJ_FSQY+"',"
								+ "BCHJ_FSSQ=to_date('" + BCHJ_FSSQ + "','yyyy-MM-dd'),BCHJ_BZ='"+BCHJ_BZ+"',"
								+ "YDYMM_FZMJ='" + YDYMM_FZMJ + "',BBLX='"+BBLX+"',"
								+ "ZT='" + ZT + "',"
								+ "YDYMM_SJSS='"+YDYMM_SJSS+"',DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd')  WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
				}
				//小麦病虫害中后期趋势预报因子与预测结果统计表								
				if (fwd.equals("Q006")) {
					 String MD_ZZMJ =so.httpServletRequest.getParameter("MD_ZZMJ");
					 String CM_ZZMJ =so.httpServletRequest.getParameter("CM_ZZMJ");
					 String YLM_MJBL =so.httpServletRequest.getParameter("YLM_MJBL");
					 String ELM_MJBL =so.httpServletRequest.getParameter("ELM_MJBL");
					 String SLM_MJBL =so.httpServletRequest.getParameter("SLM_MJBL");
					 String ZTMQYCNBJ =so.httpServletRequest.getParameter("ZTMQYCNBJ");
					 String ZS =so.httpServletRequest.getParameter("ZS");
					 String ZZPZKCX =so.httpServletRequest.getParameter("ZZPZKCX");
					 String TXB_CD ="";
					 String TXB_MJ =so.httpServletRequest.getParameter("TXB_MJ");
					 String TXB_FSJS =so.httpServletRequest.getParameter("TXB_FSJS");
					 String TXB_BCN =so.httpServletRequest.getParameter("TXB_BCN");
					 String TXB_BSN =so.httpServletRequest.getParameter("TXB_BSN");
					 String TXB_CD_WL ="";
					 String TXB_MJ_WL =so.httpServletRequest.getParameter("TXB_MJ_WL");
					 String TXB_CDYSNB =so.httpServletRequest.getParameter("TXB_CDYSNB");
					 String TXB_ZDFSQY =so.httpServletRequest.getParameter("TXB_ZDFSQY");
					 String BFB_CD ="";
					 String BFB_MJ =so.httpServletRequest.getParameter("BFB_MJ");
					 String BFB_FSJS =so.httpServletRequest.getParameter("BFB_FSJS");
					 String BFB_BCN =so.httpServletRequest.getParameter("BFB_BCN");
					 String BFB_BSN =so.httpServletRequest.getParameter("BFB_BSN");
					 String BFB_CD_WL =so.httpServletRequest.getParameter("BFB_CD_WL");
					 String BFB_MJ_WL =so.httpServletRequest.getParameter("BFB_MJ_WL");
					 String BFB_CDYSNB =so.httpServletRequest.getParameter("BFB_CDYSNB");
					 String BFB_ZDFSQY =so.httpServletRequest.getParameter("BFB_ZDFSQY");
					 String WKB_CD ="";
					 String WKB_MJ =so.httpServletRequest.getParameter("WKB_MJ");
					 String WKB_FSJS =so.httpServletRequest.getParameter("WKB_FSJS");
					 String WKB_BCN =so.httpServletRequest.getParameter("WKB_BCN");
					 String WKB_BSN =so.httpServletRequest.getParameter("WKB_BSN");
					 String WKB_CD_WL =so.httpServletRequest.getParameter("WKB_CD_WL");
					 String WKB_MJ_WL =so.httpServletRequest.getParameter("WKB_MJ_WL");
					 String WKB_CDYSNB =so.httpServletRequest.getParameter("WKB_CDYSNB");
					 String WKB_ZDFSQY =so.httpServletRequest.getParameter("WKB_ZDFSQY");
					 String CMB_CD ="";
					 String CMB_MJ =so.httpServletRequest.getParameter("CMB_MJ");
					 String CMB_FSJS =so.httpServletRequest.getParameter("CMB_FSJS");
					 String CMB_BCN =so.httpServletRequest.getParameter("CMB_BCN");
					 String CMB_BSN =so.httpServletRequest.getParameter("CMB_BSN");
					 String CMB_CD_WL ="";
					 String CMB_MJ_WL =so.httpServletRequest.getParameter("CMB_MJ_WL");
					 String CMB_CDYSNB =so.httpServletRequest.getParameter("CMB_CDYSNB");
					 String CMB_ZDFSQY =so.httpServletRequest.getParameter("CMB_ZDFSQY");
					 String YXB_CD ="";
					 String YXB_MJ =so.httpServletRequest.getParameter("YXB_MJ");
					 String YXB_FSJS =so.httpServletRequest.getParameter("YXB_FSJS");
					 String YXB_BCN =so.httpServletRequest.getParameter("YXB_BCN");
					 String YXB_BSN =so.httpServletRequest.getParameter("YXB_BSN");
					 String YXB_CD_WL =so.httpServletRequest.getParameter("YXB_CD_WL");
					 String YXB_MJ_WL =so.httpServletRequest.getParameter("YXB_MJ_WL");
					 String YXB_CDYSNB =so.httpServletRequest.getParameter("YXB_CDYSNB");
					 String YXB_ZDFSQY =so.httpServletRequest.getParameter("YXB_ZDFSQY");
					 String HSB_CD ="";
					 String HSB_MJ =so.httpServletRequest.getParameter("HSB_MJ");
					 String HSB_FSJS =so.httpServletRequest.getParameter("HSB_FSJS");
					 String HSB_BCN =so.httpServletRequest.getParameter("HSB_BCN");
					 String HSB_BSN =so.httpServletRequest.getParameter("HSB_BSN");
					 String HSB_CD_WL =so.httpServletRequest.getParameter("HSB_CD_WL");
					 String HSB_MJ_WL =so.httpServletRequest.getParameter("HSB_MJ_WL");
					 String HSB_CDYSNB =so.httpServletRequest.getParameter("HSB_CDYSNB");
					 String HSB_ZDFSQY =so.httpServletRequest.getParameter("HSB_ZDFSQY");
					 String BBB_CD ="";
					 String BBB_MJ =so.httpServletRequest.getParameter("BBB_MJ");
					 String BBB_FSJS =so.httpServletRequest.getParameter("BBB_FSJS");
					 String BBB_BCN =so.httpServletRequest.getParameter("BBB_BCN");
					 String BBB_BSN =so.httpServletRequest.getParameter("BBB_BSN");
					 String BBB_CD_WL =so.httpServletRequest.getParameter("BBB_CD_WL");
					 String BBB_MJ_WL =so.httpServletRequest.getParameter("BBB_MJ_WL");
					 String BBB_CDYSNB =so.httpServletRequest.getParameter("BBB_CDYSNB");
					 String BBB_ZDFSQY =so.httpServletRequest.getParameter("BBB_ZDFSQY");
					 String QSB_CD ="";
					 String QSB_MJ =so.httpServletRequest.getParameter("QSB_MJ");
					 String QSB_FSJS =so.httpServletRequest.getParameter("QSB_FSJS");
					 String QSB_BCN =so.httpServletRequest.getParameter("QSB_BCN");
					 String QSB_BSN =so.httpServletRequest.getParameter("QSB_BSN");
					 String QSB_CD_WL ="";
					 String QSB_MJ_WL =so.httpServletRequest.getParameter("QSB_MJ_WL");
					 String QSB_CDYSNB =so.httpServletRequest.getParameter("QSB_CDYSNB");
					 String QSB_ZDFSQY =so.httpServletRequest.getParameter("QSB_ZDFSQY");
					 String GFB_CD ="";
					 String GFB_MJ =so.httpServletRequest.getParameter("GFB_MJ");
					 String GFB_FSJS =so.httpServletRequest.getParameter("GFB_FSJS");
					 String GFB_BCN =so.httpServletRequest.getParameter("GFB_BCN");
					 String GFB_BSN =so.httpServletRequest.getParameter("GFB_BSN");
					 String GFB_CD_WL ="";
					 String GFB_MJ_WL =so.httpServletRequest.getParameter("GFB_MJ_WL");
					 String GFB_CDYSNB =so.httpServletRequest.getParameter("GFB_CDYSNB");
					 String GFB_ZDFSQY =so.httpServletRequest.getParameter("GFB_ZDFSQY");
					 String YKB_CD ="";
					 String YKB_MJ =so.httpServletRequest.getParameter("YKB_MJ");
					 String YKB_FSJS =so.httpServletRequest.getParameter("YKB_FSJS");
					 String YKB_BCN =so.httpServletRequest.getParameter("YKB_BCN");
					 String YKB_BSN =so.httpServletRequest.getParameter("YKB_BSN");
					 String YKB_CD_WL ="";
					 String YKB_MJ_WL =so.httpServletRequest.getParameter("YKB_MJ_WL");
					 String YKB_CDYSNB =so.httpServletRequest.getParameter("YKB_CDYSNB");
					 String YKB_ZDFSQY =so.httpServletRequest.getParameter("YKB_ZDFSQY");
					 String XCB_CD ="";
					 String XCB_MJ =so.httpServletRequest.getParameter("XCB_MJ");
					 String XCB_FSJS =so.httpServletRequest.getParameter("XCB_FSJS");
					 String XCB_BCN =so.httpServletRequest.getParameter("XCB_BCN");
					 String XCB_BSN =so.httpServletRequest.getParameter("XCB_BSN");
					 String XCB_CD_WL ="";
					 String XCB_MJ_WL =so.httpServletRequest.getParameter("XCB_MJ_WL");
					 String XCB_CDYSNB =so.httpServletRequest.getParameter("XCB_CDYSNB");
					 String XCB_ZDFSQY =so.httpServletRequest.getParameter("XCB_ZDFSQY");
					 String XFB_CD ="";
					 String XFB_MJ =so.httpServletRequest.getParameter("XFB_MJ");
					 String XFB_FSJS =so.httpServletRequest.getParameter("XFB_FSJS");
					 String XFB_BCN =so.httpServletRequest.getParameter("XFB_BCN");
					 String XFB_BSN =so.httpServletRequest.getParameter("XFB_BSN");
					 String XFB_CD_WL ="";
					 String XFB_MJ_WL =so.httpServletRequest.getParameter("XFB_MJ_WL");
					 String XFB_CDYSNB =so.httpServletRequest.getParameter("XFB_CDYSNB");
					 String XFB_ZDFSQY =so.httpServletRequest.getParameter("XFB_ZDFSQY");
					 String QTBH_CD ="";
					 String QTBH_MJ =so.httpServletRequest.getParameter("QTBH_MJ");
					 String QTBH_FSJS =so.httpServletRequest.getParameter("QTBH_FSJS");
					 String QTBH_BCN =so.httpServletRequest.getParameter("QTBH_BCN");
					 String QTBH_BSN =so.httpServletRequest.getParameter("QTBH_BSN");
					 String QTBH_CD_WL =so.httpServletRequest.getParameter("QTBH_CD_WL");
					 String QTBH_MJ_WL =so.httpServletRequest.getParameter("QTBH_MJ_WL");
					 String QTBH_CDYSNB =so.httpServletRequest.getParameter("QTBH_CDYSNB");
					 String QTBH_ZDFSQY =so.httpServletRequest.getParameter("QTBH_ZDFSQY");
					 String QTBH_FSZB =so.httpServletRequest.getParameter("QTBH_FSZB");
					 String YC_CD =so.httpServletRequest.getParameter("YC_CD");
					 String YC_MJ =so.httpServletRequest.getParameter("YC_MJ");
					 String YC_FSJS =so.httpServletRequest.getParameter("YC_FSJS");
					 String YC_BCN =so.httpServletRequest.getParameter("YC_BCN");
					 String YC_BSN =so.httpServletRequest.getParameter("YC_BSN");
					 String YC_CD_WL =so.httpServletRequest.getParameter("YC_CD_WL");
					 String YC_MJ_WL =so.httpServletRequest.getParameter("YC_MJ_WL");
					 String YC_CDYSNB =so.httpServletRequest.getParameter("YC_CDYSNB");
					 String YC_ZDFSQY =so.httpServletRequest.getParameter("YC_ZDFSQY");
					 String ZZ_CD ="";
					 String ZZ_MJ =so.httpServletRequest.getParameter("ZZ_MJ");
					 String ZZ_FSJS =so.httpServletRequest.getParameter("ZZ_FSJS");
					 String ZZ_BCN =so.httpServletRequest.getParameter("ZZ_BCN");
					 String ZZ_BSN =so.httpServletRequest.getParameter("ZZ_BSN");
					 String ZZ_CD_WL =so.httpServletRequest.getParameter("ZZ_CD_WL");
					 String ZZ_MJ_WL =so.httpServletRequest.getParameter("ZZ_MJ_WL");
					 String ZZ_CDYSNB =so.httpServletRequest.getParameter("ZZ_CDYSNB");
					 String ZZ_ZDFSQY =so.httpServletRequest.getParameter("ZZ_ZDFSQY");
					 String XJC_CD =so.httpServletRequest.getParameter("XJC_CD");
					 String XJC_MJ =so.httpServletRequest.getParameter("XJC_MJ");
					 String XJC_FSJS =so.httpServletRequest.getParameter("XJC_FSJS");
					 String XJC_BCN =so.httpServletRequest.getParameter("XJC_BCN");
					 String XJC_BSN =so.httpServletRequest.getParameter("XJC_BSN");
					 String XJC_CD_WL =so.httpServletRequest.getParameter("XJC_CD_WL");
					 String XJC_MJ_WL =so.httpServletRequest.getParameter("XJC_MJ_WL");
					 String XJC_CDYSNB =so.httpServletRequest.getParameter("XJC_CDYSNB");
					 String XJC_ZDFSQY =so.httpServletRequest.getParameter("XJC_ZDFSQY");
					 String YDNC_CD ="";
					 String YDNC_MJ =so.httpServletRequest.getParameter("YDNC_MJ");
					 String YDNC_FSJS =so.httpServletRequest.getParameter("YDNC_FSJS");
					 String YDNC_BCN =so.httpServletRequest.getParameter("YDNC_BCN");
					 String YDNC_BSN =so.httpServletRequest.getParameter("YDNC_BSN");
					 String YDNC_CD_WL ="";
					 String YDNC_MJ_WL =so.httpServletRequest.getParameter("YDNC_MJ_WL");
					 String YDNC_CDYSNB =so.httpServletRequest.getParameter("YDNC_CDYSNB");
					 String YDNC_ZDFSQY =so.httpServletRequest.getParameter("YDNC_ZDFSQY");
					 String DXHC_CD =so.httpServletRequest.getParameter("DXHC_CD");
					 String DXHC_MJ =so.httpServletRequest.getParameter("DXHC_MJ");
					 String DXHC_FSJS =so.httpServletRequest.getParameter("DXHC_FSJS");
					 String DXHC_BCN =so.httpServletRequest.getParameter("DXHC_BCN");
					 String DXHC_BSN =so.httpServletRequest.getParameter("DXHC_BSN");
					 String DXHC_CD_WL =so.httpServletRequest.getParameter("DXHC_CD_WL");
					 String DXHC_MJ_WL =so.httpServletRequest.getParameter("DXHC_MJ_WL");
					 String DXHC_CDYSNB =so.httpServletRequest.getParameter("DXHC_CDYSNB");
					 String DXHC_ZDFSQY =so.httpServletRequest.getParameter("DXHC_ZDFSQY");
					 String HFS_CD ="";
					 String HFS_MJ =so.httpServletRequest.getParameter("HFS_MJ");
					 String HFS_FSJS =so.httpServletRequest.getParameter("HFS_FSJS");
					 String HFS_BCN =so.httpServletRequest.getParameter("HFS_BCN");
					 String HFS_BSN =so.httpServletRequest.getParameter("HFS_BSN");
					 String HFS_CD_WL ="";
					 String HFS_MJ_WL =so.httpServletRequest.getParameter("HFS_MJ_WL");
					 String HFS_CDYSNB =so.httpServletRequest.getParameter("HFS_CDYSNB");
					 String HFS_ZDFSQY =so.httpServletRequest.getParameter("HFS_ZDFSQY");
					 String TH_CD ="";
					 String TH_MJ =so.httpServletRequest.getParameter("TH_MJ");
					 String TH_FSJS =so.httpServletRequest.getParameter("TH_FSJS");
					 String TH_BCN =so.httpServletRequest.getParameter("TH_BCN");
					 String TH_BSN =so.httpServletRequest.getParameter("TH_BSN");
					 String TH_CD_WL ="";
					 String TH_MJ_WL =so.httpServletRequest.getParameter("TH_MJ_WL");
					 String TH_CDYSNB =so.httpServletRequest.getParameter("TH_CDYSNB");
					 String TH_ZDFSQY =so.httpServletRequest.getParameter("TH_ZDFSQY");
					 String MYF_CD ="";
					 String MYF_MJ =so.httpServletRequest.getParameter("MYF_MJ");
					 String MYF_FSJS =so.httpServletRequest.getParameter("MYF_FSJS");
					 String MYF_BCN =so.httpServletRequest.getParameter("MYF_BCN");
					 String MYF_BSN =so.httpServletRequest.getParameter("MYF_BSN");
					 String MYF_CD_WL ="";
					 String MYF_MJ_WL =so.httpServletRequest.getParameter("MYF_MJ_WL");
					 String MYF_CDYSNB =so.httpServletRequest.getParameter("MYF_CDYSNB");
					 String MYF_ZDFSQY =so.httpServletRequest.getParameter("MYF_ZDFSQY");
					 String MJF_CD ="";
					 String MJF_MJ =so.httpServletRequest.getParameter("MJF_MJ");
					 String MJF_FSJS =so.httpServletRequest.getParameter("MJF_FSJS");
					 String MJF_BCN =so.httpServletRequest.getParameter("MJF_BCN");
					 String MJF_BSN =so.httpServletRequest.getParameter("MJF_BSN");
					 String MJF_CD_WL ="";
					 String MJF_MJ_WL =so.httpServletRequest.getParameter("MJF_MJ_WL");
					 String MJF_CDYSNB =so.httpServletRequest.getParameter("MJF_CDYSNB");
					 String MJF_ZDFSQY =so.httpServletRequest.getParameter("MJF_ZDFSQY");
					 String QTHC_CD ="";
					 String QTHC_MJ =so.httpServletRequest.getParameter("QTHC_MJ");
					 String QTHC_FSJS =so.httpServletRequest.getParameter("QTHC_FSJS");
					 String QTHC_BCN =so.httpServletRequest.getParameter("QTHC_BCN");
					 String QTHC_BSN =so.httpServletRequest.getParameter("QTHC_BSN");
					 String QTHC_CD_WL =so.httpServletRequest.getParameter("QTHC_CD_WL");
					 String QTHC_MJ_WL =so.httpServletRequest.getParameter("QTHC_MJ_WL");
					 String QTHC_CDYSNB =so.httpServletRequest.getParameter("QTHC_CDYSNB");
					 String QTHC_ZDFSQY =so.httpServletRequest.getParameter("QTHC_ZDFSQY");
					 String QTHC_FSZB =so.httpServletRequest.getParameter("QTHC_FSZB");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d006.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "MD_ZZMJ,CM_ZZMJ,YLM_MJBL,"
								+ "SLM_MJBL,ZTMQYCNBJ,ZS,"
								+ "ZZPZKCX,TXB_CD,TXB_MJ,"
								+ "TXB_FSJS,TXB_BCN,TXB_BSN,"
								+ "TXB_CD_WL,TXB_MJ_WL,TXB_CDYSNB,"
								+ "TXB_ZDFSQY,BFB_CD,BFB_MJ,"
								+ "BFB_FSJS,BFB_BCN,BFB_BSN,"
								+ "BFB_CD_WL,BFB_MJ_WL,BFB_CDYSNB,"
								+ "BFB_ZDFSQY,WKB_CD,WKB_MJ,"
								+ "WKB_FSJS,WKB_BCN,WKB_BSN,"
								+ "WKB_CD_WL,WKB_MJ_WL,WKB_CDYSNB,"
								+ "WKB_ZDFSQY,CMB_CD,CMB_MJ,"
								+ "CMB_FSJS,CMB_BCN,CMB_BSN,"
								+ "CMB_CD_WL,CMB_MJ_WL,CMB_CDYSNB,"
								+ "CMB_ZDFSQY,YXB_CD,YXB_MJ,"
								+ "YXB_FSJS,YXB_BCN,YXB_BSN,"
								+ "YXB_CD_WL,YXB_MJ_WL,YXB_CDYSNB,"
								+ "YXB_ZDFSQY,HSB_CD,HSB_MJ,"
								+ "HSB_FSJS,HSB_BCN,HSB_BSN,"
								+ "HSB_CD_WL,HSB_MJ_WL,HSB_CDYSNB,"
								+ "HSB_ZDFSQY,BBB_CD,BBB_MJ,"
								+ "BBB_FSJS,BBB_BCN,BBB_BSN,"
								+ "BBB_CD_WL,BBB_MJ_WL,BBB_CDYSNB,"
								+ "BBB_ZDFSQY,QSB_CD,QSB_MJ,"
								+ "QSB_FSJS,QSB_BCN,QSB_BSN,"
								+ "QSB_CD_WL,QSB_MJ_WL,QSB_CDYSNB,"
								+ "QSB_ZDFSQY,GFB_CD,GFB_MJ,"
								+ "GFB_FSJS,GFB_BCN,GFB_BSN,"
								+ "GFB_CD_WL,GFB_MJ_WL,GFB_CDYSNB,"
								+ "GFB_ZDFSQY,YKB_CD,YKB_MJ,"
								+ "YKB_FSJS,YKB_BCN,YKB_BSN,"
								+ "YKB_CD_WL,YKB_MJ_WL,YKB_CDYSNB,"
								+ "YKB_ZDFSQY,XCB_CD,XCB_MJ,"
								+ "XCB_FSJS,XCB_BCN,XCB_BSN,"
								+ "XCB_CD_WL,XCB_MJ_WL,XCB_CDYSNB,"
								+ "XCB_ZDFSQY,XFB_CD,XFB_MJ,"
								+ "XFB_FSJS,XFB_BCN,XFB_BSN,"
								+ "XFB_CD_WL,XFB_MJ_WL,XFB_CDYSNB,"
								+ "XFB_ZDFSQY,QTBH_CD,QTBH_MJ,"
								+ "QTBH_FSJS,QTBH_BCN,QTBH_BSN,"
								+ "QTBH_CD_WL,QTBH_MJ_WL,QTBH_CDYSNB,"
								+ "QTBH_ZDFSQY,QTBH_FSZB,YC_CD,"
								+ "YC_MJ,YC_FSJS,YC_BCN,"
								+ "YC_BSN,YC_CD_WL,YC_MJ_WL,"
								+ "YC_CDYSNB,YC_ZDFSQY,ZZ_CD,"
								+ "ZZ_MJ,ZZ_FSJS,ZZ_BCN,"
								+ "ZZ_BSN,ZZ_CD_WL,ZZ_MJ_WL,"
								+ "ZZ_CDYSNB,ZZ_ZDFSQY,XJC_CD,"
								+ "XJC_MJ,XJC_FSJS,XJC_BCN,"
								+ "XJC_BSN,XJC_CD_WL,XJC_MJ_WL,"
								+ "XJC_CDYSNB,XJC_ZDFSQY,YDNC_CD,"
								+ "YDNC_MJ,YDNC_FSJS,YDNC_BCN,"
								+ "YDNC_BSN,YDNC_CD_WL,YDNC_MJ_WL,"
								+ "YDNC_CDYSNB,YDNC_ZDFSQY,DXHC_CD,"
								+ "DXHC_MJ,DXHC_FSJS,DXHC_BCN,"
								+ "DXHC_BSN,DXHC_CD_WL,DXHC_MJ_WL,"
								+ "DXHC_CDYSNB,DXHC_ZDFSQY,HFS_CD,"
								+ "HFS_MJ,HFS_FSJS,HFS_BCN,"
								+ "HFS_BSN,HFS_CD_WL,HFS_MJ_WL,"
								+ "HFS_CDYSNB,HFS_ZDFSQY,TH_CD,"
								+ "TH_MJ,TH_FSJS,TH_BCN,"
								+ "TH_BSN,TH_CD_WL,TH_MJ_WL,"
								+ "TH_CDYSNB,TH_ZDFSQY,MYF_CD,"
								+ "MYF_MJ,MYF_FSJS,MYF_BCN,"
								+ "MYF_BSN,MYF_CD_WL,MYF_MJ_WL,"
								+ "MYF_CDYSNB,MYF_ZDFSQY,MJF_CD,"
								+ "MJF_MJ,MJF_FSJS,MJF_BCN,"
								+ "MJF_BSN,MJF_CD_WL,MJF_MJ_WL,"
								+ "MJF_CDYSNB,MJF_ZDFSQY,QTHC_CD,"
								+ "QTHC_MJ,QTHC_FSJS,QTHC_BCN,"
								+ "QTHC_BSN,QTHC_CD_WL,QTHC_MJ_WL,"
								+ "QTHC_CDYSNB,QTHC_ZDFSQY,QTHC_FSZB,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT,"
								+ "ELM_MJBL,DCRQ) VALUES ('" + JFID + "','"
								+ MD_ZZMJ + "','" + CM_ZZMJ + "','"+YLM_MJBL+"','"
								+ SLM_MJBL + "','" + ZTMQYCNBJ + "','"+ZS+"','"
								+ ZZPZKCX + "','" + TXB_CD + "','"+TXB_MJ+"','"
								+ TXB_FSJS + "','" + TXB_BCN + "','"+TXB_BSN+"','"
								+ TXB_CD_WL + "','" + TXB_MJ_WL + "','"+TXB_CDYSNB+"','"
								+ TXB_ZDFSQY + "','" + BFB_CD + "','"+BFB_MJ+"','"
								+ BFB_FSJS + "','" + BFB_BCN + "','"+BFB_BSN+"','"
								+ BFB_CD_WL + "','" + BFB_MJ_WL + "','"+BFB_CDYSNB+"','"
								+ BFB_ZDFSQY + "','" + WKB_CD + "','"+WKB_MJ+"','"
								+ WKB_FSJS + "','" + WKB_BCN + "','"+WKB_BSN+"','"
								+ WKB_CD_WL + "','" + WKB_MJ_WL + "','"+WKB_CDYSNB+"','"
								+ WKB_ZDFSQY + "','" + CMB_CD + "','"+CMB_MJ+"','"
								+ CMB_FSJS + "','" + CMB_BCN + "','"+CMB_BSN+"','"
								+ CMB_CD_WL + "','" + CMB_MJ_WL + "','"+CMB_CDYSNB+"','"
								+ CMB_ZDFSQY + "','" + YXB_CD + "','"+YXB_MJ+"','"
								+ YXB_FSJS + "','" + YXB_BCN + "','"+YXB_BSN+"','"
								+ YXB_CD_WL + "','" + YXB_MJ_WL + "','"+YXB_CDYSNB+"','"
								+ YXB_ZDFSQY + "','" + HSB_CD + "','"+HSB_MJ+"','"
								+ HSB_FSJS + "','" + HSB_BCN + "','"+HSB_BSN+"','"
								+ HSB_CD_WL + "','" + HSB_MJ_WL + "','"+HSB_CDYSNB+"','"
								+ HSB_ZDFSQY + "','" + BBB_CD + "','"+BBB_MJ+"','"
								+ BBB_FSJS + "','" + BBB_BCN + "','"+BBB_BSN+"','"
								+ BBB_CD_WL + "','" + BBB_MJ_WL + "','"+BBB_CDYSNB+"','"
								+ BBB_ZDFSQY + "','" + QSB_CD + "','"+QSB_MJ+"','"
								+ QSB_FSJS + "','" + QSB_BCN + "','"+QSB_BSN+"','"
								+ QSB_CD_WL + "','" + QSB_MJ_WL + "','"+QSB_CDYSNB+"','"
								+ QSB_ZDFSQY + "','" + GFB_CD + "','"+GFB_MJ+"','"
								+ GFB_FSJS + "','" + GFB_BCN + "','"+GFB_BSN+"','"
								+ GFB_CD_WL + "','" + GFB_MJ_WL + "','"+GFB_CDYSNB+"','"
								+ GFB_ZDFSQY + "','" + YKB_CD + "','"+YKB_MJ+"','"
								+ YKB_FSJS + "','" + YKB_BCN + "','"+YKB_BSN+"','"
								+ YKB_CD_WL + "','" + YKB_MJ_WL + "','"+YKB_CDYSNB +"','"
								+ YKB_ZDFSQY + "','" + XCB_CD + "','"+XCB_MJ +"','"
								+ XCB_FSJS + "','" + XCB_BCN + "','"+XCB_BSN +"','"
								+ XCB_CD_WL + "','" + XCB_MJ_WL + "','"+XCB_CDYSNB +"','"
								+ XCB_ZDFSQY + "','" + XFB_CD + "','"+XFB_MJ +"','"
								+ XFB_FSJS + "','" + XFB_BCN + "','"+XFB_BSN +"','"
								+ XFB_CD_WL + "','" + XFB_MJ_WL + "','"+XFB_CDYSNB +"','"
								+ XFB_ZDFSQY + "','" + QTBH_CD + "','"+QTBH_MJ +"','"
								+ QTBH_FSJS + "','" + QTBH_BCN + "','"+QTBH_BSN +"','"
								+ QTBH_CD_WL + "','" + QTBH_MJ_WL + "','"+QTBH_CDYSNB +"','"
								+ QTBH_ZDFSQY + "','" + QTBH_FSZB + "','"+YC_CD +"','"
								+ YC_MJ + "','" + YC_FSJS + "','"+YC_BCN +"','"
								+ YC_BSN + "','" + YC_CD_WL + "','"+YC_MJ_WL +"','"
								+ YC_CDYSNB + "','" + YC_ZDFSQY + "','"+ZZ_CD +"','"
								+ ZZ_MJ + "','" + ZZ_FSJS + "','"+ZZ_BCN +"','"
								+ ZZ_BSN + "','" + ZZ_CD_WL + "','"+ZZ_MJ_WL +"','"
								+ ZZ_CDYSNB + "','" + ZZ_ZDFSQY + "','"+XJC_CD +"','"
								+ XJC_MJ + "','" + XJC_FSJS + "','"+XJC_BCN +"','"
								+ XJC_BSN + "','" + XJC_CD_WL + "','"+XJC_MJ_WL +"','"
								+ XJC_CDYSNB + "','" + XJC_ZDFSQY + "','"+YDNC_CD +"','"
								+ YDNC_MJ + "','" + YDNC_FSJS + "','"+YDNC_BCN +"','"
								+ YDNC_BSN + "','" + YDNC_CD_WL + "','"+YDNC_MJ_WL +"','"
								+ YDNC_CDYSNB + "','" + YDNC_ZDFSQY + "','"+DXHC_CD +"','"
								+ DXHC_MJ + "','" + DXHC_FSJS + "','"+DXHC_BCN +"','"
								+ DXHC_BSN + "','" + DXHC_CD_WL + "','"+DXHC_MJ_WL +"','"
								+ DXHC_CDYSNB + "','" + DXHC_ZDFSQY + "','"+HFS_CD +"','"
								+ HFS_MJ + "','" + HFS_FSJS + "','"+HFS_BCN +"','"
								+ HFS_BSN + "','" + HFS_CD_WL + "','"+HFS_MJ_WL +"','"
								+ HFS_CDYSNB + "','" + HFS_ZDFSQY + "','"+TH_CD +"','"
								+ TH_MJ + "','" + TH_FSJS + "','"+TH_BCN +"','"
								+ TH_BSN + "','" + TH_CD_WL + "','"+TH_MJ_WL +"','"
								+ TH_CDYSNB + "','" + TH_ZDFSQY + "','"+MYF_CD +"','"
								+ MYF_MJ + "','" + MYF_FSJS + "','"+MYF_BCN +"','"
								+ MYF_BSN + "','" + MYF_CD_WL + "','"+MYF_MJ_WL +"','"
								+ MYF_CDYSNB + "','" + MYF_ZDFSQY + "','"+MJF_CD +"','"
								+ MJF_MJ + "','" + MJF_FSJS + "','"+MJF_BCN +"','"
								+ MJF_BSN + "','" + MJF_CD_WL + "','"+MJF_MJ_WL +"','"
								+ MJF_CDYSNB + "','" + MJF_ZDFSQY + "','"+QTHC_CD +"','"
								+ QTHC_MJ + "','" + QTHC_FSJS + "','"+QTHC_BCN +"','"
								+ QTHC_BSN + "','" + QTHC_CD_WL + "','"+QTHC_MJ_WL +"','"
								+ QTHC_CDYSNB + "','" + QTHC_ZDFSQY + "','"+QTHC_FSZB +"','"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"','"
								+ ELM_MJBL + "',to_date('" + DCRQ + "','yyyy-MM-dd'))";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
					else
					{
						//更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "MD_ZZMJ='" + MD_ZZMJ + "',CM_ZZMJ='"+CM_ZZMJ+"',"
								+ "SLM_MJBL='" + SLM_MJBL + "',ZTMQYCNBJ='"+ZTMQYCNBJ+"',"
								+ "ZS='" + ZS + "',ZZPZKCX='"+ZZPZKCX+"',"
								+ "TXB_CD='" + TXB_CD + "',TXB_MJ='"+TXB_MJ+"',"
								+ "TXB_FSJS='" + TXB_FSJS + "',TXB_BCN='"+TXB_BCN+"',"
								+ "TXB_BSN='" + TXB_BSN + "',TXB_CD_WL='"+TXB_CD_WL+"',"
								+ "TXB_MJ_WL='" + TXB_MJ_WL + "',TXB_CDYSNB='"+TXB_CDYSNB+"',"
								+ "TXB_ZDFSQY='" + TXB_ZDFSQY + "',BFB_CD='"+BFB_CD+"',"
								+ "BFB_MJ='" + BFB_MJ + "',BFB_FSJS='"+BFB_FSJS+"',"
								+ "BFB_BCN='" + BFB_BCN + "',BFB_BSN='"+BFB_BSN+"',"
								+ "BFB_CD_WL='" + BFB_CD_WL + "',BFB_MJ_WL='"+BFB_MJ_WL+"',"
								+ "BFB_CDYSNB='" + BFB_CDYSNB + "',BFB_ZDFSQY='"+BFB_ZDFSQY+"',"
								+ "WKB_CD='" + WKB_CD + "',WKB_MJ='"+WKB_MJ+"',"
								+ "WKB_FSJS='" + WKB_FSJS + "',WKB_BCN='"+WKB_BCN+"',"
								+ "WKB_BSN='" + WKB_BSN + "',WKB_CD_WL='"+WKB_CD_WL+"',"
								+ "WKB_MJ_WL='" + WKB_MJ_WL + "',WKB_CDYSNB='"+WKB_CDYSNB+"',"
								+ "WKB_ZDFSQY='" + WKB_ZDFSQY + "',CMB_CD='"+CMB_CD+"',"
								+ "CMB_MJ='" + CMB_MJ + "',CMB_FSJS='"+CMB_FSJS+"',"
								+ "CMB_BCN='" + CMB_BCN + "',CMB_BSN='"+CMB_BSN+"',"
								+ "CMB_CD_WL='" + CMB_CD_WL + "',CMB_MJ_WL='"+CMB_MJ_WL+"',"
								+ "CMB_CDYSNB='" + CMB_CDYSNB + "',CMB_ZDFSQY='"+CMB_ZDFSQY+"',"
								+ "YXB_CD='" + YXB_CD + "',YXB_MJ='"+YXB_MJ+"',"
								+ "YXB_FSJS='" + YXB_FSJS + "',YXB_BCN='"+YXB_BCN+"',"
								+ "YXB_BSN='" + YXB_BSN + "',YXB_CD_WL='"+YXB_CD_WL+"',"
								+ "YXB_MJ_WL='" + YXB_MJ_WL + "',YXB_CDYSNB='"+YXB_CDYSNB+"',"
								+ "YXB_ZDFSQY='" + YXB_ZDFSQY + "',HSB_CD='"+HSB_CD+"',"
								+ "HSB_MJ='" + HSB_MJ + "',HSB_FSJS='"+HSB_FSJS+"',"
								+ "HSB_BCN='" + HSB_BCN + "',HSB_BSN='"+HSB_BSN+"',"
								+ "HSB_CD_WL='" + HSB_CD_WL + "',HSB_MJ_WL='"+HSB_MJ_WL+"',"
								+ "HSB_CDYSNB='" + HSB_CDYSNB + "',HSB_ZDFSQY='"+HSB_ZDFSQY+"',"
								+ "BBB_CD='" + BBB_CD + "',BBB_MJ='"+BBB_MJ+"',"
								+ "BBB_FSJS='" + BBB_FSJS + "',BBB_BCN='"+BBB_BCN+"',"
								+ "BBB_BSN='" + BBB_BSN + "',BBB_CD_WL='"+BBB_CD_WL+"',"
								+ "BBB_MJ_WL='" + BBB_MJ_WL + "',BBB_CDYSNB='"+BBB_CDYSNB+"',"
								+ "BBB_ZDFSQY='" + BBB_ZDFSQY + "',QSB_CD='"+QSB_CD+"',"
								+ "QSB_MJ='" + QSB_MJ + "',QSB_FSJS='"+QSB_FSJS+"',"
								+ "QSB_BCN='" + QSB_BCN + "',QSB_BSN='"+QSB_BSN+"',"
								+ "QSB_CD_WL='" + QSB_CD_WL + "',QSB_MJ_WL='"+QSB_MJ_WL+"',"
								+ "QSB_CDYSNB='" + QSB_CDYSNB + "',QSB_ZDFSQY='"+QSB_ZDFSQY+"',"
								+ "GFB_CD='" + GFB_CD + "',GFB_MJ='"+GFB_MJ+"',"
								+ "GFB_FSJS='" + GFB_FSJS + "',GFB_BCN='"+GFB_BCN+"',"
								+ "GFB_BSN='" + GFB_BSN + "',GFB_CD_WL='"+GFB_CD_WL+"',"
								+ "GFB_MJ_WL='" + GFB_MJ_WL + "',GFB_CDYSNB='"+GFB_CDYSNB+"',"
								+ "GFB_ZDFSQY='" + GFB_ZDFSQY + "',YKB_CD='"+YKB_CD+"',"
								+ "YKB_MJ='" + YKB_MJ + "',YKB_FSJS='"+YKB_FSJS+"',"
								+ "YKB_BCN='" + YKB_BCN + "',YKB_BSN='"+YKB_BSN+"',"
								+ "YKB_CD_WL='" + YKB_CD_WL + "',YKB_MJ_WL='"+YKB_MJ_WL+"',"
								+ "YKB_CDYSNB='" + YKB_CDYSNB + "',YKB_ZDFSQY='"+YKB_ZDFSQY+"',"
								+ "XCB_CD='" + XCB_CD + "',XCB_MJ='"+XCB_MJ+"',"
								+ "XCB_FSJS='" + XCB_FSJS + "',XCB_BCN='"+XCB_BCN+"',"
								+ "XCB_BSN='" + XCB_BSN + "',XCB_CD_WL='"+XCB_CD_WL+"',"
								+ "XCB_MJ_WL='" + XCB_MJ_WL + "',XCB_CDYSNB='"+XCB_CDYSNB+"',"
								+ "XCB_ZDFSQY='" + XCB_ZDFSQY + "',XFB_CD='"+XFB_CD+"',"
								+ "XFB_MJ='" + XFB_MJ + "',XFB_FSJS='"+XFB_FSJS+"',"
								+ "XFB_BCN='" + XFB_BCN + "',XFB_BSN='"+XFB_BSN+"',"
								+ "XFB_CD_WL='" + XFB_CD_WL + "',XFB_MJ_WL='"+XFB_MJ_WL+"',"
								+ "XFB_CDYSNB='" + XFB_CDYSNB + "',XFB_ZDFSQY='"+XFB_ZDFSQY+"',"
								+ "QTBH_CD='" + QTBH_CD + "',QTBH_MJ='"+QTBH_MJ+"',"
								+ "QTBH_FSJS='" + QTBH_FSJS + "',QTBH_BCN='"+QTBH_BCN+"',"
								+ "QTBH_BSN='" + QTBH_BSN + "',QTBH_CD_WL='"+QTBH_CD_WL+"',"
								+ "QTBH_MJ_WL='" + QTBH_MJ_WL + "',QTBH_CDYSNB='"+QTBH_CDYSNB+"',"
								+ "QTBH_ZDFSQY='" + QTBH_ZDFSQY + "',QTBH_FSZB='"+QTBH_FSZB+"',"
								+ "YC_CD='" + YC_CD + "',YC_MJ='"+YC_MJ+"',"
								+ "YC_FSJS='" + YC_FSJS + "',YC_BCN='"+YC_BCN+"',"
								+ "YC_BSN='" + YC_BSN + "',YC_CD_WL='"+YC_CD_WL+"',"
								+ "YC_MJ_WL='" + YC_MJ_WL + "',YC_CDYSNB='"+YC_CDYSNB+"',"
								+ "YC_ZDFSQY='" + YC_ZDFSQY + "',ZZ_CD='"+ZZ_CD+"',"
								+ "ZZ_MJ='" + ZZ_MJ + "',ZZ_FSJS='"+ZZ_FSJS+"',"
								+ "ZZ_BCN='" + ZZ_BCN + "',ZZ_BSN='"+ZZ_BSN+"',"
								+ "ZZ_CD_WL='" + ZZ_CD_WL + "',ZZ_MJ_WL='"+ZZ_MJ_WL+"',"
								+ "ZZ_CDYSNB='" + ZZ_CDYSNB + "',ZZ_ZDFSQY='"+ZZ_ZDFSQY+"',"
								+ "XJC_CD='" + XJC_CD + "',XJC_MJ='"+XJC_MJ+"',"
								+ "XJC_FSJS='" + XJC_FSJS + "',XJC_BCN='"+XJC_BCN+"',"
								+ "XJC_BSN='" + XJC_BSN + "',XJC_CD_WL='"+XJC_CD_WL+"',"
								+ "XJC_MJ_WL='" + XJC_MJ_WL + "',XJC_CDYSNB='"+XJC_CDYSNB+"',"
								+ "XJC_ZDFSQY='" + XJC_ZDFSQY + "',YDNC_CD='"+YDNC_CD+"',"
								+ "YDNC_MJ='" + YDNC_MJ + "',YDNC_FSJS='"+YDNC_FSJS+"',"
								+ "YDNC_BCN='" + YDNC_BCN + "',YDNC_BSN='"+YDNC_BSN+"',"
								+ "YDNC_CD_WL='" + YDNC_CD_WL + "',YDNC_MJ_WL='"+YDNC_MJ_WL+"',"
								+ "YDNC_CDYSNB='" + YDNC_CDYSNB + "',YDNC_ZDFSQY='"+YDNC_ZDFSQY+"',"
								+ "DXHC_CD='" + DXHC_CD + "',DXHC_MJ='"+DXHC_MJ+"',"
								+ "DXHC_FSJS='" + DXHC_FSJS + "',DXHC_BCN='"+DXHC_BCN+"',"
								+ "DXHC_BSN='" + DXHC_BSN + "',DXHC_CD_WL='"+DXHC_CD_WL+"',"
								+ "DXHC_MJ_WL='" + DXHC_MJ_WL + "',DXHC_CDYSNB='"+DXHC_CDYSNB+"',"
								+ "DXHC_ZDFSQY='" + DXHC_ZDFSQY + "',HFS_CD='"+HFS_CD+"',"
								+ "HFS_MJ='" + HFS_MJ + "',HFS_FSJS='"+HFS_FSJS+"',"
								+ "HFS_BCN='" + HFS_BCN + "',HFS_BSN='"+HFS_BSN+"',"
								+ "HFS_CD_WL='" + HFS_CD_WL + "',HFS_MJ_WL='"+HFS_MJ_WL+"',"
								+ "HFS_CDYSNB='" + HFS_CDYSNB + "',HFS_ZDFSQY='"+HFS_ZDFSQY+"',"
								+ "TH_CD='" + TH_CD + "',TH_MJ='"+TH_MJ+"',"
								+ "TH_FSJS='" + TH_FSJS + "',TH_BCN='"+TH_BCN+"',"
								+ "TH_BSN='" + TH_BSN + "',TH_CD_WL='"+TH_CD_WL+"',"
								+ "TH_MJ_WL='" + TH_MJ_WL + "',TH_CDYSNB='"+TH_CDYSNB+"',"
								+ "TH_ZDFSQY='" + TH_ZDFSQY + "',MYF_CD='"+MYF_CD+"',"
								+ "MYF_MJ='" + MYF_MJ + "',MYF_FSJS='"+MYF_FSJS+"',"
								+ "MYF_BCN='" + MYF_BCN + "',MYF_BSN='"+MYF_BSN+"',"
								+ "MYF_CD_WL='" + MYF_CD_WL + "',MYF_MJ_WL='"+MYF_MJ_WL+"',"
								+ "MYF_CDYSNB='" + MYF_CDYSNB + "',MYF_ZDFSQY='"+MYF_ZDFSQY+"',"
								+ "MJF_CD='" + MJF_CD + "',MJF_MJ='"+MJF_MJ+"',"
								+ "MJF_FSJS='" + MJF_FSJS + "',MJF_BCN='"+MJF_BCN+"',"
								+ "MJF_BSN='" + MJF_BSN + "',MJF_CD_WL='"+MJF_CD_WL+"',"
								+ "MJF_MJ_WL='" + MJF_MJ_WL + "',MJF_CDYSNB='"+MJF_CDYSNB+"',"
								+ "MJF_ZDFSQY='" + MJF_ZDFSQY + "',QTHC_CD='"+QTHC_CD+"',"
								+ "QTHC_MJ='" + QTHC_MJ + "',QTHC_FSJS='"+QTHC_FSJS+"',"
								+ "QTHC_BCN='" + QTHC_BCN + "',QTHC_BSN='"+QTHC_BSN+"',"
								+ "QTHC_CD_WL='" + QTHC_CD_WL + "',QTHC_MJ_WL='"+QTHC_MJ_WL+"',"
								+ "QTHC_CDYSNB='" + QTHC_CDYSNB + "',QTHC_ZDFSQY='"+QTHC_ZDFSQY+"',"
								+ "QTHC_FSZB='" + QTHC_FSZB + "',"
								+ "YLM_MJBL='" + YLM_MJBL + "',BBLX='"+BBLX+"',"
								+ "ZT='" + ZT + "',"
								+ "ELM_MJBL='"+ELM_MJBL+"',DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd')  WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
				}
				//小麦病虫害跨年度趋势预报因子与预测结果统计表
				if (fwd.equals("Q007")) {
					String MD_ZZMJ =so.httpServletRequest.getParameter("MD_ZZMJ");
					String CM_ZZMJ =so.httpServletRequest.getParameter("CM_ZZMJ");
					String BZQ =so.httpServletRequest.getParameter("BZQ");
					String YLM_MJBL =so.httpServletRequest.getParameter("YLM_MJBL");
					String ELM_MJBL =so.httpServletRequest.getParameter("ELM_MJBL");
					String SLM_MJBL =so.httpServletRequest.getParameter("SLM_MJBL");
					String ZTMQYCNBJ =so.httpServletRequest.getParameter("ZTMQYCNBJ");
					String ZS =so.httpServletRequest.getParameter("ZS");
					String ZZPZKCX =so.httpServletRequest.getParameter("ZZPZKCX");
					String TXB_MJ =so.httpServletRequest.getParameter("TXB_MJ");
					String TXB_FSJS =so.httpServletRequest.getParameter("TXB_FSJS");
					String TXB_BCN =so.httpServletRequest.getParameter("TXB_BCN");
					String TXB_BSN =so.httpServletRequest.getParameter("TXB_BSN");
					String TXB_CD_WL =so.httpServletRequest.getParameter("TXB_CD_WL");
					String TXB_MJ_WL =so.httpServletRequest.getParameter("TXB_MJ_WL");
					String TXB_CDYSNB =so.httpServletRequest.getParameter("TXB_CDYSNB");
					String TXB_ZDFSQY =so.httpServletRequest.getParameter("TXB_ZDFSQY");
					String TXB_LXSQ =so.httpServletRequest.getParameter("TXB_LXSQ");
					String BFB_MJ =so.httpServletRequest.getParameter("BFB_MJ");
					String BFB_FSJS =so.httpServletRequest.getParameter("BFB_FSJS");
					String BFB_BCN =so.httpServletRequest.getParameter("BFB_BCN");
					String BFB_BSN =so.httpServletRequest.getParameter("BFB_BSN");
					String BFB_CD_WL =so.httpServletRequest.getParameter("BFB_CD_WL");
					String BFB_MJ_WL =so.httpServletRequest.getParameter("BFB_MJ_WL");
					String BFB_CDYSNB =so.httpServletRequest.getParameter("BFB_CDYSNB");
					String BFB_ZDFSQY =so.httpServletRequest.getParameter("BFB_ZDFSQY");
					String BFB_LXSQ =so.httpServletRequest.getParameter("BFB_LXSQ");
					String WKB_MJ =so.httpServletRequest.getParameter("WKB_MJ");
					String WKB_FSJS =so.httpServletRequest.getParameter("WKB_FSJS");
					String WKB_BCN =so.httpServletRequest.getParameter("WKB_BCN");
					String WKB_BSN =so.httpServletRequest.getParameter("WKB_BSN");
					String WKB_CD_WL =so.httpServletRequest.getParameter("WKB_CD_WL");
					String WKB_MJ_WL =so.httpServletRequest.getParameter("WKB_MJ_WL");
					String WKB_CDYSNB =so.httpServletRequest.getParameter("WKB_CDYSNB");
					String WKB_ZDFSQY =so.httpServletRequest.getParameter("WKB_ZDFSQY");
					String WKB_LXSQ =so.httpServletRequest.getParameter("WKB_LXSQ");
					String CMB_MJ =so.httpServletRequest.getParameter("CMB_MJ");
					String CMB_FSJS =so.httpServletRequest.getParameter("CMB_FSJS");
					String CMB_BCN =so.httpServletRequest.getParameter("CMB_BCN");
					String CMB_BSN =so.httpServletRequest.getParameter("CMB_BSN");
					String CMB_CD_WL =so.httpServletRequest.getParameter("CMB_CD_WL");
					String CMB_MJ_WL =so.httpServletRequest.getParameter("CMB_MJ_WL");
					String CMB_CDYSNB =so.httpServletRequest.getParameter("CMB_CDYSNB");
					String CMB_ZDFSQY =so.httpServletRequest.getParameter("CMB_ZDFSQY");
					String CMB_LXSQ =so.httpServletRequest.getParameter("CMB_LXSQ");
					String YXB_MJ =so.httpServletRequest.getParameter("YXB_MJ");
					String YXB_FSJS =so.httpServletRequest.getParameter("YXB_FSJS");
					String YXB_BCN =so.httpServletRequest.getParameter("YXB_BCN");
					String YXB_BSN =so.httpServletRequest.getParameter("YXB_BSN");
					String YXB_CD_WL =so.httpServletRequest.getParameter("YXB_CD_WL");
					String YXB_MJ_WL =so.httpServletRequest.getParameter("YXB_MJ_WL");
					String YXB_CDYSNB =so.httpServletRequest.getParameter("YXB_CDYSNB");
					String YXB_ZDFSQY =so.httpServletRequest.getParameter("YXB_ZDFSQY");
					String YXB_LXSQ =so.httpServletRequest.getParameter("YXB_LXSQ");
					String HSB_MJ =so.httpServletRequest.getParameter("HSB_MJ");
					String HSB_FSJS =so.httpServletRequest.getParameter("HSB_FSJS");
					String HSB_BCN =so.httpServletRequest.getParameter("HSB_BCN");
					String HSB_BSN =so.httpServletRequest.getParameter("HSB_BSN");
					String HSB_CD_WL =so.httpServletRequest.getParameter("HSB_CD_WL");
					String HSB_MJ_WL =so.httpServletRequest.getParameter("HSB_MJ_WL");
					String HSB_CDYSNB =so.httpServletRequest.getParameter("HSB_CDYSNB");
					String HSB_ZDFSQY =so.httpServletRequest.getParameter("HSB_ZDFSQY");
					String HSB_LXSQ =so.httpServletRequest.getParameter("HSB_LXSQ");
					String BBB_MJ =so.httpServletRequest.getParameter("BBB_MJ");
					String BBB_FSJS =so.httpServletRequest.getParameter("BBB_FSJS");
					String BBB_BCN =so.httpServletRequest.getParameter("BBB_BCN");
					String BBB_BSN =so.httpServletRequest.getParameter("BBB_BSN");
					String BBB_CD_WL =so.httpServletRequest.getParameter("BBB_CD_WL");
					String BBB_MJ_WL =so.httpServletRequest.getParameter("BBB_MJ_WL");
					String BBB_CDYSNB =so.httpServletRequest.getParameter("BBB_CDYSNB");
					String BBB_ZDFSQY =so.httpServletRequest.getParameter("BBB_ZDFSQY");
					String BBB_LXSQ =so.httpServletRequest.getParameter("BBB_LXSQ");
					String QSB_MJ =so.httpServletRequest.getParameter("QSB_MJ");
					String QSB_FSJS =so.httpServletRequest.getParameter("QSB_FSJS");
					String QSB_BCN =so.httpServletRequest.getParameter("QSB_BCN");
					String QSB_BSN =so.httpServletRequest.getParameter("QSB_BSN");
					String QSB_CD_WL =so.httpServletRequest.getParameter("QSB_CD_WL");
					String QSB_MJ_WL =so.httpServletRequest.getParameter("QSB_MJ_WL");
					String QSB_CDYSNB =so.httpServletRequest.getParameter("QSB_CDYSNB");
					String QSB_ZDFSQY =so.httpServletRequest.getParameter("QSB_ZDFSQY");
					String QSB_LXSQ =so.httpServletRequest.getParameter("QSB_LXSQ");
					String GFB_MJ =so.httpServletRequest.getParameter("GFB_MJ");
					String GFB_FSJS =so.httpServletRequest.getParameter("GFB_FSJS");
					String GFB_BCN =so.httpServletRequest.getParameter("GFB_BCN");
					String GFB_BSN =so.httpServletRequest.getParameter("GFB_BSN");
					String GFB_CD_WL =so.httpServletRequest.getParameter("GFB_CD_WL");
					String GFB_MJ_WL =so.httpServletRequest.getParameter("GFB_MJ_WL");
					String GFB_CDYSNB =so.httpServletRequest.getParameter("GFB_CDYSNB");
					String GFB_ZDFSQY =so.httpServletRequest.getParameter("GFB_ZDFSQY");
					String GFB_LXSQ =so.httpServletRequest.getParameter("GFB_LXSQ");
					String YKB_MJ =so.httpServletRequest.getParameter("YKB_MJ");
					String YKB_FSJS =so.httpServletRequest.getParameter("YKB_FSJS");
					String YKB_BCN =so.httpServletRequest.getParameter("YKB_BCN");
					String YKB_BSN =so.httpServletRequest.getParameter("YKB_BSN");
					String YKB_CD_WL =so.httpServletRequest.getParameter("YKB_CD_WL");
					String YKB_MJ_WL =so.httpServletRequest.getParameter("YKB_MJ_WL");
					String YKB_CDYSNB =so.httpServletRequest.getParameter("YKB_CDYSNB");
					String YKB_ZDFSQY =so.httpServletRequest.getParameter("YKB_ZDFSQY");
					String YKB_LXSQ =so.httpServletRequest.getParameter("YKB_LXSQ");
					String XCB_MJ =so.httpServletRequest.getParameter("XCB_MJ");
					String XCB_FSJS =so.httpServletRequest.getParameter("XCB_FSJS");
					String XCB_BCN =so.httpServletRequest.getParameter("XCB_BCN");
					String XCB_BSN =so.httpServletRequest.getParameter("XCB_BSN");
					String XCB_CD_WL =so.httpServletRequest.getParameter("XCB_CD_WL");
					String XCB_MJ_WL =so.httpServletRequest.getParameter("XCB_MJ_WL");
					String XCB_CDYSNB =so.httpServletRequest.getParameter("XCB_CDYSNB");
					String XCB_ZDFSQY =so.httpServletRequest.getParameter("XCB_ZDFSQY");
					String XCB_LXSQ =so.httpServletRequest.getParameter("XCB_LXSQ");
					String XFB_MJ =so.httpServletRequest.getParameter("XFB_MJ");
					String XFB_FSJS =so.httpServletRequest.getParameter("XFB_FSJS");
					String XFB_BCN =so.httpServletRequest.getParameter("XFB_BCN");
					String XFB_BSN =so.httpServletRequest.getParameter("XFB_BSN");
					String XFB_CD_WL =so.httpServletRequest.getParameter("XFB_CD_WL");
					String XFB_MJ_WL =so.httpServletRequest.getParameter("XFB_MJ_WL");
					String XFB_CDYSNB =so.httpServletRequest.getParameter("XFB_CDYSNB");
					String XFB_ZDFSQY =so.httpServletRequest.getParameter("XFB_ZDFSQY");
					String XFB_LXSQ =so.httpServletRequest.getParameter("XFB_LXSQ");
					String QTBH_MJ =so.httpServletRequest.getParameter("QTBH_MJ");
					String QTBH_FSJS =so.httpServletRequest.getParameter("QTBH_FSJS");
					String QTBH_BCN =so.httpServletRequest.getParameter("QTBH_BCN");
					String QTBH_BSN =so.httpServletRequest.getParameter("QTBH_BSN");
					String QTBH_CD_WL =so.httpServletRequest.getParameter("QTBH_CD_WL");
					String QTBH_MJ_WL =so.httpServletRequest.getParameter("QTBH_MJ_WL");
					String QTBH_CDYSNB =so.httpServletRequest.getParameter("QTBH_CDYSNB");
					String QTBH_ZDFSQY =so.httpServletRequest.getParameter("QTBH_ZDFSQY");
					String QTBH_LXSQ =so.httpServletRequest.getParameter("QTBH_LXSQ");
					String QTBH_FSZB =so.httpServletRequest.getParameter("QTBH_FSZB");
					String YC_MJ =so.httpServletRequest.getParameter("YC_MJ");
					String YC_FSJS =so.httpServletRequest.getParameter("YC_FSJS");
					String YC_BCN =so.httpServletRequest.getParameter("YC_BCN");
					String YC_BSN =so.httpServletRequest.getParameter("YC_BSN");
					String YC_CD_WL =so.httpServletRequest.getParameter("YC_CD_WL");
					String YC_MJ_WL =so.httpServletRequest.getParameter("YC_MJ_WL");
					String YC_CDYSNB =so.httpServletRequest.getParameter("YC_CDYSNB");
					String YC_ZDFSQY =so.httpServletRequest.getParameter("YC_ZDFSQY");
					String YC_LXSQ =so.httpServletRequest.getParameter("YC_LXSQ");
					String ZZ_MJ =so.httpServletRequest.getParameter("ZZ_MJ");
					String ZZ_FSJS =so.httpServletRequest.getParameter("ZZ_FSJS");
					String ZZ_BCN =so.httpServletRequest.getParameter("ZZ_BCN");
					String ZZ_BSN =so.httpServletRequest.getParameter("ZZ_BSN");
					String ZZ_CD_WL =so.httpServletRequest.getParameter("ZZ_CD_WL");
					String ZZ_MJ_WL =so.httpServletRequest.getParameter("ZZ_MJ_WL");
					String ZZ_CDYSNB =so.httpServletRequest.getParameter("ZZ_CDYSNB");
					String ZZ_ZDFSQY =so.httpServletRequest.getParameter("ZZ_ZDFSQY");
					String ZZ_LXSQ =so.httpServletRequest.getParameter("ZZ_LXSQ");
					String XJC_MJ =so.httpServletRequest.getParameter("XJC_MJ");
					String XJC_FSJS =so.httpServletRequest.getParameter("XJC_FSJS");
					String XJC_BCN =so.httpServletRequest.getParameter("XJC_BCN");
					String XJC_BSN =so.httpServletRequest.getParameter("XJC_BSN");
					String XJC_CD_WL =so.httpServletRequest.getParameter("XJC_CD_WL");
					String XJC_MJ_WL =so.httpServletRequest.getParameter("XJC_MJ_WL");
					String XJC_CDYSNB =so.httpServletRequest.getParameter("XJC_CDYSNB");
					String XJC_ZDFSQY =so.httpServletRequest.getParameter("XJC_ZDFSQY");
					String XJC_LXSQ =so.httpServletRequest.getParameter("XJC_LXSQ");
					String YDNC_MJ =so.httpServletRequest.getParameter("YDNC_MJ");
					String YDNC_FSJS =so.httpServletRequest.getParameter("YDNC_FSJS");
					String YDNC_BCN =so.httpServletRequest.getParameter("YDNC_BCN");
					String YDNC_BSN =so.httpServletRequest.getParameter("YDNC_BSN");
					String YDNC_CD_WL =so.httpServletRequest.getParameter("YDNC_CD_WL");
					String YDNC_MJ_WL =so.httpServletRequest.getParameter("YDNC_MJ_WL");
					String YDNC_CDYSNB =so.httpServletRequest.getParameter("YDNC_CDYSNB");
					String YDNC_ZDFSQY =so.httpServletRequest.getParameter("YDNC_ZDFSQY");
					String YDNC_LXSQ =so.httpServletRequest.getParameter("YDNC_LXSQ");
					String DXHC_MJ =so.httpServletRequest.getParameter("DXHC_MJ");
					String DXHC_FSJS =so.httpServletRequest.getParameter("DXHC_FSJS");
					String DXHC_BCN =so.httpServletRequest.getParameter("DXHC_BCN");
					String DXHC_BSN =so.httpServletRequest.getParameter("DXHC_BSN");
					String DXHC_CD_WL =so.httpServletRequest.getParameter("DXHC_CD_WL");
					String DXHC_MJ_WL =so.httpServletRequest.getParameter("DXHC_MJ_WL");
					String DXHC_CDYSNB =so.httpServletRequest.getParameter("DXHC_CDYSNB");
					String DXHC_ZDFSQY =so.httpServletRequest.getParameter("DXHC_ZDFSQY");
					String DXHC_LXSQ =so.httpServletRequest.getParameter("DXHC_LXSQ");
					String HFS_MJ =so.httpServletRequest.getParameter("HFS_MJ");
					String HFS_FSJS =so.httpServletRequest.getParameter("HFS_FSJS");
					String HFS_BCN =so.httpServletRequest.getParameter("HFS_BCN");
					String HFS_BSN =so.httpServletRequest.getParameter("HFS_BSN");
					String HFS_CD_WL =so.httpServletRequest.getParameter("HFS_CD_WL");
					String HFS_MJ_WL =so.httpServletRequest.getParameter("HFS_MJ_WL");
					String HFS_CDYSNB =so.httpServletRequest.getParameter("HFS_CDYSNB");
					String HFS_ZDFSQY =so.httpServletRequest.getParameter("HFS_ZDFSQY");
					String HFS_LXSQ =so.httpServletRequest.getParameter("HFS_LXSQ");
					String TH_MJ =so.httpServletRequest.getParameter("TH_MJ");
					String TH_FSJS =so.httpServletRequest.getParameter("TH_FSJS");
					String TH_BCN =so.httpServletRequest.getParameter("TH_BCN");
					String TH_BSN =so.httpServletRequest.getParameter("TH_BSN");
					String TH_CD_WL =so.httpServletRequest.getParameter("TH_CD_WL");
					String TH_MJ_WL =so.httpServletRequest.getParameter("TH_MJ_WL");
					String TH_CDYSNB =so.httpServletRequest.getParameter("TH_CDYSNB");
					String TH_ZDFSQY =so.httpServletRequest.getParameter("TH_ZDFSQY");
					String TH_LXSQ =so.httpServletRequest.getParameter("TH_LXSQ");
					String MYF_MJ =so.httpServletRequest.getParameter("MYF_MJ");
					String MYF_FSJS =so.httpServletRequest.getParameter("MYF_FSJS");
					String MYF_BCN =so.httpServletRequest.getParameter("MYF_BCN");
					String MYF_BSN =so.httpServletRequest.getParameter("MYF_BSN");
					String MYF_CD_WL =so.httpServletRequest.getParameter("MYF_CD_WL");
					String MYF_MJ_WL =so.httpServletRequest.getParameter("MYF_MJ_WL");
					String MYF_CDYSNB =so.httpServletRequest.getParameter("MYF_CDYSNB");
					String MYF_ZDFSQY =so.httpServletRequest.getParameter("MYF_ZDFSQY");
					String MYF_LXSQ =so.httpServletRequest.getParameter("MYF_LXSQ");
					String MJF_MJ =so.httpServletRequest.getParameter("MJF_MJ");
					String MJF_FSJS =so.httpServletRequest.getParameter("MJF_FSJS");
					String MJF_BCN =so.httpServletRequest.getParameter("MJF_BCN");
					String MJF_BSN =so.httpServletRequest.getParameter("MJF_BSN");
					String MJF_CD_WL =so.httpServletRequest.getParameter("MJF_CD_WL");
					String MJF_MJ_WL =so.httpServletRequest.getParameter("MJF_MJ_WL");
					String MJF_CDYSNB =so.httpServletRequest.getParameter("MJF_CDYSNB");
					String MJF_ZDFSQY =so.httpServletRequest.getParameter("MJF_ZDFSQY");
					String MJF_LXSQ =so.httpServletRequest.getParameter("MJF_LXSQ");
					String QTHC_MJ =so.httpServletRequest.getParameter("QTHC_MJ");
					String QTHC_FSJS =so.httpServletRequest.getParameter("QTHC_FSJS");
					String QTHC_BCN =so.httpServletRequest.getParameter("QTHC_BCN");
					String QTHC_BSN =so.httpServletRequest.getParameter("QTHC_BSN");
					String QTHC_CD_WL =so.httpServletRequest.getParameter("QTHC_CD_WL");
					String QTHC_MJ_WL =so.httpServletRequest.getParameter("QTHC_MJ_WL");
					String QTHC_CDYSNB =so.httpServletRequest.getParameter("QTHC_CDYSNB");
					String QTHC_ZDFSQY =so.httpServletRequest.getParameter("QTHC_ZDFSQY");
					String QTHC_FSZB =so.httpServletRequest.getParameter("QTHC_FSZB");
					String QTHC_LXSQ =so.httpServletRequest.getParameter("QTHC_LXSQ");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d007.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "MD_ZZMJ,CM_ZZMJ,BZQ,YLM_MJBL,"
								+ "SLM_MJBL,ZTMQYCNBJ,ZS,"
								+ "ZZPZKCX,TXB_LXSQ,TXB_MJ,"
								+ "TXB_FSJS,TXB_BCN,TXB_BSN,"
								+ "TXB_CD_WL,TXB_MJ_WL,TXB_CDYSNB,"
								+ "TXB_ZDFSQY,BFB_LXSQ,BFB_MJ,"
								+ "BFB_FSJS,BFB_BCN,BFB_BSN,"
								+ "BFB_CD_WL,BFB_MJ_WL,BFB_CDYSNB,"
								+ "BFB_ZDFSQY,WKB_LXSQ,WKB_MJ,"
								+ "WKB_FSJS,WKB_BCN,WKB_BSN,"
								+ "WKB_CD_WL,WKB_MJ_WL,WKB_CDYSNB,"
								+ "WKB_ZDFSQY,CMB_LXSQ,CMB_MJ,"
								+ "CMB_FSJS,CMB_BCN,CMB_BSN,"
								+ "CMB_CD_WL,CMB_MJ_WL,CMB_CDYSNB,"
								+ "CMB_ZDFSQY,YXB_LXSQ,YXB_MJ,"
								+ "YXB_FSJS,YXB_BCN,YXB_BSN,"
								+ "YXB_CD_WL,YXB_MJ_WL,YXB_CDYSNB,"
								+ "YXB_ZDFSQY,HSB_LXSQ,HSB_MJ,"
								+ "HSB_FSJS,HSB_BCN,HSB_BSN,"
								+ "HSB_CD_WL,HSB_MJ_WL,HSB_CDYSNB,"
								+ "HSB_ZDFSQY,BBB_LXSQ,BBB_MJ,"
								+ "BBB_FSJS,BBB_BCN,BBB_BSN,"
								+ "BBB_CD_WL,BBB_MJ_WL,BBB_CDYSNB,"
								+ "BBB_ZDFSQY,QSB_LXSQ,QSB_MJ,"
								+ "QSB_FSJS,QSB_BCN,QSB_BSN,"
								+ "QSB_CD_WL,QSB_MJ_WL,QSB_CDYSNB,"
								+ "QSB_ZDFSQY,GFB_LXSQ,GFB_MJ,"
								+ "GFB_FSJS,GFB_BCN,GFB_BSN,"
								+ "GFB_CD_WL,GFB_MJ_WL,GFB_CDYSNB,"
								+ "GFB_ZDFSQY,YKB_LXSQ,YKB_MJ,"
								+ "YKB_FSJS,YKB_BCN,YKB_BSN,"
								+ "YKB_CD_WL,YKB_MJ_WL,YKB_CDYSNB,"
								+ "YKB_ZDFSQY,XCB_LXSQ,XCB_MJ,"
								+ "XCB_FSJS,XCB_BCN,XCB_BSN,"
								+ "XCB_CD_WL,XCB_MJ_WL,XCB_CDYSNB,"
								+ "XCB_ZDFSQY,XFB_LXSQ,XFB_MJ,"
								+ "XFB_FSJS,XFB_BCN,XFB_BSN,"
								+ "XFB_CD_WL,XFB_MJ_WL,XFB_CDYSNB,"
								+ "XFB_ZDFSQY,QTBH_LXSQ,QTBH_MJ,"
								+ "QTBH_FSJS,QTBH_BCN,QTBH_BSN,"
								+ "QTBH_CD_WL,QTBH_MJ_WL,QTBH_CDYSNB,"
								+ "QTBH_ZDFSQY,QTBH_FSZB,YC_LXSQ,"
								+ "YC_MJ,YC_FSJS,YC_BCN,"
								+ "YC_BSN,YC_CD_WL,YC_MJ_WL,"
								+ "YC_CDYSNB,YC_ZDFSQY,ZZ_LXSQ,"
								+ "ZZ_MJ,ZZ_FSJS,ZZ_BCN,"
								+ "ZZ_BSN,ZZ_CD_WL,ZZ_MJ_WL,"
								+ "ZZ_CDYSNB,ZZ_ZDFSQY,XJC_LXSQ,"
								+ "XJC_MJ,XJC_FSJS,XJC_BCN,"
								+ "XJC_BSN,XJC_CD_WL,XJC_MJ_WL,"
								+ "XJC_CDYSNB,XJC_ZDFSQY,YDNC_LXSQ,"
								+ "YDNC_MJ,YDNC_FSJS,YDNC_BCN,"
								+ "YDNC_BSN,YDNC_CD_WL,YDNC_MJ_WL,"
								+ "YDNC_CDYSNB,YDNC_ZDFSQY,DXHC_LXSQ,"
								+ "DXHC_MJ,DXHC_FSJS,DXHC_BCN,"
								+ "DXHC_BSN,DXHC_CD_WL,DXHC_MJ_WL,"
								+ "DXHC_CDYSNB,DXHC_ZDFSQY,HFS_LXSQ,"
								+ "HFS_MJ,HFS_FSJS,HFS_BCN,"
								+ "HFS_BSN,HFS_CD_WL,HFS_MJ_WL,"
								+ "HFS_CDYSNB,HFS_ZDFSQY,TH_LXSQ,"
								+ "TH_MJ,TH_FSJS,TH_BCN,"
								+ "TH_BSN,TH_CD_WL,TH_MJ_WL,"
								+ "TH_CDYSNB,TH_ZDFSQY,MYF_LXSQ,"
								+ "MYF_MJ,MYF_FSJS,MYF_BCN,"
								+ "MYF_BSN,MYF_CD_WL,MYF_MJ_WL,"
								+ "MYF_CDYSNB,MYF_ZDFSQY,MJF_LXSQ,"
								+ "MJF_MJ,MJF_FSJS,MJF_BCN,"
								+ "MJF_BSN,MJF_CD_WL,MJF_MJ_WL,"
								+ "MJF_CDYSNB,MJF_ZDFSQY,QTHC_LXSQ,"
								+ "QTHC_MJ,QTHC_FSJS,QTHC_BCN,"
								+ "QTHC_BSN,QTHC_CD_WL,QTHC_MJ_WL,"
								+ "QTHC_CDYSNB,QTHC_ZDFSQY,QTHC_FSZB,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT,"
								+ "ELM_MJBL,DCRQ) VALUES ('" + JFID + "','"
								+ MD_ZZMJ + "','" + CM_ZZMJ + "','"+BZQ+"','"+YLM_MJBL+"','"
								+ SLM_MJBL + "','" + ZTMQYCNBJ + "','"+ZS+"','"
								+ ZZPZKCX + "','" + TXB_LXSQ + "','"+TXB_MJ+"','"
								+ TXB_FSJS + "','" + TXB_BCN + "','"+TXB_BSN+"','"
								+ TXB_CD_WL + "','" + TXB_MJ_WL + "','"+TXB_CDYSNB+"','"
								+ TXB_ZDFSQY + "','" + BFB_LXSQ + "','"+BFB_MJ+"','"
								+ BFB_FSJS + "','" + BFB_BCN + "','"+BFB_BSN+"','"
								+ BFB_CD_WL + "','" + BFB_MJ_WL + "','"+BFB_CDYSNB+"','"
								+ BFB_ZDFSQY + "','" + WKB_LXSQ + "','"+WKB_MJ+"','"
								+ WKB_FSJS + "','" + WKB_BCN + "','"+WKB_BSN+"','"
								+ WKB_CD_WL + "','" + WKB_MJ_WL + "','"+WKB_CDYSNB+"','"
								+ WKB_ZDFSQY + "','" + CMB_LXSQ + "','"+CMB_MJ+"','"
								+ CMB_FSJS + "','" + CMB_BCN + "','"+CMB_BSN+"','"
								+ CMB_CD_WL + "','" + CMB_MJ_WL + "','"+CMB_CDYSNB+"','"
								+ CMB_ZDFSQY + "','" + YXB_LXSQ + "','"+YXB_MJ+"','"
								+ YXB_FSJS + "','" + YXB_BCN + "','"+YXB_BSN+"','"
								+ YXB_CD_WL + "','" + YXB_MJ_WL + "','"+YXB_CDYSNB+"','"
								+ YXB_ZDFSQY + "','" + HSB_LXSQ + "','"+HSB_MJ+"','"
								+ HSB_FSJS + "','" + HSB_BCN + "','"+HSB_BSN+"','"
								+ HSB_CD_WL + "','" + HSB_MJ_WL + "','"+HSB_CDYSNB+"','"
								+ HSB_ZDFSQY + "','" + BBB_LXSQ + "','"+BBB_MJ+"','"
								+ BBB_FSJS + "','" + BBB_BCN + "','"+BBB_BSN+"','"
								+ BBB_CD_WL + "','" + BBB_MJ_WL + "','"+BBB_CDYSNB+"','"
								+ BBB_ZDFSQY + "','" + QSB_LXSQ+ "','"+QSB_MJ+"','"
								+ QSB_FSJS + "','" + QSB_BCN + "','"+QSB_BSN+"','"
								+ QSB_CD_WL + "','" + QSB_MJ_WL + "','"+QSB_CDYSNB+"','"
								+ QSB_ZDFSQY + "','" + GFB_LXSQ + "','"+GFB_MJ+"','"
								+ GFB_FSJS + "','" + GFB_BCN + "','"+GFB_BSN+"','"
								+ GFB_CD_WL + "','" + GFB_MJ_WL + "','"+GFB_CDYSNB+"','"
								+ GFB_ZDFSQY + "','" + YKB_LXSQ + "','"+YKB_MJ+"','"
								+ YKB_FSJS + "','" + YKB_BCN + "','"+YKB_BSN+"','"
								+ YKB_CD_WL + "','" + YKB_MJ_WL + "','"+YKB_CDYSNB +"','"
								+ YKB_ZDFSQY + "','" + XCB_LXSQ + "','"+XCB_MJ +"','"
								+ XCB_FSJS + "','" + XCB_BCN + "','"+XCB_BSN +"','"
								+ XCB_CD_WL + "','" + XCB_MJ_WL + "','"+XCB_CDYSNB +"','"
								+ XCB_ZDFSQY + "','" + XFB_LXSQ + "','"+XFB_MJ +"','"
								+ XFB_FSJS + "','" + XFB_BCN + "','"+XFB_BSN +"','"
								+ XFB_CD_WL + "','" + XFB_MJ_WL + "','"+XFB_CDYSNB +"','"
								+ XFB_ZDFSQY + "','" + QTBH_LXSQ + "','"+QTBH_MJ +"','"
								+ QTBH_FSJS + "','" + QTBH_BCN + "','"+QTBH_BSN +"','"
								+ QTBH_CD_WL + "','" + QTBH_MJ_WL + "','"+QTBH_CDYSNB +"','"
								+ QTBH_ZDFSQY + "','" + QTBH_FSZB + "','"+YC_LXSQ +"','"
								+ YC_MJ + "','" + YC_FSJS + "','"+YC_BCN +"','"
								+ YC_BSN + "','" + YC_CD_WL + "','"+YC_MJ_WL +"','"
								+ YC_CDYSNB + "','" + YC_ZDFSQY + "','"+ZZ_LXSQ +"','"
								+ ZZ_MJ + "','" + ZZ_FSJS + "','"+ZZ_BCN +"','"
								+ ZZ_BSN + "','" + ZZ_CD_WL + "','"+ZZ_MJ_WL +"','"
								+ ZZ_CDYSNB + "','" + ZZ_ZDFSQY + "','"+XJC_LXSQ +"','"
								+ XJC_MJ + "','" + XJC_FSJS + "','"+XJC_BCN +"','"
								+ XJC_BSN + "','" + XJC_CD_WL + "','"+XJC_MJ_WL +"','"
								+ XJC_CDYSNB + "','" + XJC_ZDFSQY + "','"+YDNC_LXSQ +"','"
								+ YDNC_MJ + "','" + YDNC_FSJS + "','"+YDNC_BCN +"','"
								+ YDNC_BSN + "','" + YDNC_CD_WL + "','"+YDNC_MJ_WL +"','"
								+ YDNC_CDYSNB + "','" + YDNC_ZDFSQY + "','"+DXHC_LXSQ +"','"
								+ DXHC_MJ + "','" + DXHC_FSJS + "','"+DXHC_BCN +"','"
								+ DXHC_BSN + "','" + DXHC_CD_WL + "','"+DXHC_MJ_WL +"','"
								+ DXHC_CDYSNB + "','" + DXHC_ZDFSQY + "','"+HFS_LXSQ +"','"
								+ HFS_MJ + "','" + HFS_FSJS + "','"+HFS_BCN +"','"
								+ HFS_BSN + "','" + HFS_CD_WL + "','"+HFS_MJ_WL +"','"
								+ HFS_CDYSNB + "','" + HFS_ZDFSQY + "','"+TH_LXSQ +"','"
								+ TH_MJ + "','" + TH_FSJS + "','"+TH_BCN +"','"
								+ TH_BSN + "','" + TH_CD_WL + "','"+TH_MJ_WL +"','"
								+ TH_CDYSNB + "','" + TH_ZDFSQY + "','"+MYF_LXSQ +"','"
								+ MYF_MJ + "','" + MYF_FSJS + "','"+MYF_BCN +"','"
								+ MYF_BSN + "','" + MYF_CD_WL + "','"+MYF_MJ_WL +"','"
								+ MYF_CDYSNB + "','" + MYF_ZDFSQY + "','"+MJF_LXSQ +"','"
								+ MJF_MJ + "','" + MJF_FSJS + "','"+MJF_BCN +"','"
								+ MJF_BSN + "','" + MJF_CD_WL + "','"+MJF_MJ_WL +"','"
								+ MJF_CDYSNB + "','" + MJF_ZDFSQY + "','"+QTHC_LXSQ +"','"
								+ QTHC_MJ + "','" + QTHC_FSJS + "','"+QTHC_BCN +"','"
								+ QTHC_BSN + "','" + QTHC_CD_WL + "','"+QTHC_MJ_WL +"','"
								+ QTHC_CDYSNB + "','" + QTHC_ZDFSQY + "','"+QTHC_FSZB +"','"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"','"
								+ ELM_MJBL + "',to_date('" + DCRQ + "','yyyy-MM-dd'))";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
					else
					{
						//更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "MD_ZZMJ='" + MD_ZZMJ + "',BZQ='"+BZQ+"',CM_ZZMJ='"+CM_ZZMJ+"',"
								+ "SLM_MJBL='" + SLM_MJBL + "',ZTMQYCNBJ='"+ZTMQYCNBJ+"',"
								+ "ZS='" + ZS + "',ZZPZKCX='"+ZZPZKCX+"',"
								+ "TXB_LXSQ='" + TXB_LXSQ + "',TXB_MJ='"+TXB_MJ+"',"
								+ "TXB_FSJS='" + TXB_FSJS + "',TXB_BCN='"+TXB_BCN+"',"
								+ "TXB_BSN='" + TXB_BSN + "',TXB_CD_WL='"+TXB_CD_WL+"',"
								+ "TXB_MJ_WL='" + TXB_MJ_WL + "',TXB_CDYSNB='"+TXB_CDYSNB+"',"
								+ "TXB_ZDFSQY='" + TXB_ZDFSQY + "',BFB_LXSQ='"+BFB_LXSQ+"',"
								+ "BFB_MJ='" + BFB_MJ + "',BFB_FSJS='"+BFB_FSJS+"',"
								+ "BFB_BCN='" + BFB_BCN + "',BFB_BSN='"+BFB_BSN+"',"
								+ "BFB_CD_WL='" + BFB_CD_WL + "',BFB_MJ_WL='"+BFB_MJ_WL+"',"
								+ "BFB_CDYSNB='" + BFB_CDYSNB + "',BFB_ZDFSQY='"+BFB_ZDFSQY+"',"
								+ "WKB_LXSQ='" + WKB_LXSQ + "',WKB_MJ='"+WKB_MJ+"',"
								+ "WKB_FSJS='" + WKB_FSJS + "',WKB_BCN='"+WKB_BCN+"',"
								+ "WKB_BSN='" + WKB_BSN + "',WKB_CD_WL='"+WKB_CD_WL+"',"
								+ "WKB_MJ_WL='" + WKB_MJ_WL + "',WKB_CDYSNB='"+WKB_CDYSNB+"',"
								+ "WKB_ZDFSQY='" + WKB_ZDFSQY + "',CMB_LXSQ='"+CMB_LXSQ+"',"
								+ "CMB_MJ='" + CMB_MJ + "',CMB_FSJS='"+CMB_FSJS+"',"
								+ "CMB_BCN='" + CMB_BCN + "',CMB_BSN='"+CMB_BSN+"',"
								+ "CMB_CD_WL='" + CMB_CD_WL + "',CMB_MJ_WL='"+CMB_MJ_WL+"',"
								+ "CMB_CDYSNB='" + CMB_CDYSNB + "',CMB_ZDFSQY='"+CMB_ZDFSQY+"',"
								+ "YXB_LXSQ='" + YXB_LXSQ + "',YXB_MJ='"+YXB_MJ+"',"
								+ "YXB_FSJS='" + YXB_FSJS + "',YXB_BCN='"+YXB_BCN+"',"
								+ "YXB_BSN='" + YXB_BSN + "',YXB_CD_WL='"+YXB_CD_WL+"',"
								+ "YXB_MJ_WL='" + YXB_MJ_WL + "',YXB_CDYSNB='"+YXB_CDYSNB+"',"
								+ "YXB_ZDFSQY='" + YXB_ZDFSQY + "',HSB_LXSQ='"+HSB_LXSQ+"',"
								+ "HSB_MJ='" + HSB_MJ + "',HSB_FSJS='"+HSB_FSJS+"',"
								+ "HSB_BCN='" + HSB_BCN + "',HSB_BSN='"+HSB_BSN+"',"
								+ "HSB_CD_WL='" + HSB_CD_WL + "',HSB_MJ_WL='"+HSB_MJ_WL+"',"
								+ "HSB_CDYSNB='" + HSB_CDYSNB + "',HSB_ZDFSQY='"+HSB_ZDFSQY+"',"
								+ "BBB_LXSQ='" + BBB_LXSQ + "',BBB_MJ='"+BBB_MJ+"',"
								+ "BBB_FSJS='" + BBB_FSJS + "',BBB_BCN='"+BBB_BCN+"',"
								+ "BBB_BSN='" + BBB_BSN + "',BBB_CD_WL='"+BBB_CD_WL+"',"
								+ "BBB_MJ_WL='" + BBB_MJ_WL + "',BBB_CDYSNB='"+BBB_CDYSNB+"',"
								+ "BBB_ZDFSQY='" + BBB_ZDFSQY + "',QSB_LXSQ='"+QSB_LXSQ+"',"
								+ "QSB_MJ='" + QSB_MJ + "',QSB_FSJS='"+QSB_FSJS+"',"
								+ "QSB_BCN='" + QSB_BCN + "',QSB_BSN='"+QSB_BSN+"',"
								+ "QSB_CD_WL='" + QSB_CD_WL + "',QSB_MJ_WL='"+QSB_MJ_WL+"',"
								+ "QSB_CDYSNB='" + QSB_CDYSNB + "',QSB_ZDFSQY='"+QSB_ZDFSQY+"',"
								+ "GFB_LXSQ='" + GFB_LXSQ + "',GFB_MJ='"+GFB_MJ+"',"
								+ "GFB_FSJS='" + GFB_FSJS + "',GFB_BCN='"+GFB_BCN+"',"
								+ "GFB_BSN='" + GFB_BSN + "',GFB_CD_WL='"+GFB_CD_WL+"',"
								+ "GFB_MJ_WL='" + GFB_MJ_WL + "',GFB_CDYSNB='"+GFB_CDYSNB+"',"
								+ "GFB_ZDFSQY='" + GFB_ZDFSQY + "',YKB_LXSQ='"+YKB_LXSQ+"',"
								+ "YKB_MJ='" + YKB_MJ + "',YKB_FSJS='"+YKB_FSJS+"',"
								+ "YKB_BCN='" + YKB_BCN + "',YKB_BSN='"+YKB_BSN+"',"
								+ "YKB_CD_WL='" + YKB_CD_WL + "',YKB_MJ_WL='"+YKB_MJ_WL+"',"
								+ "YKB_CDYSNB='" + YKB_CDYSNB + "',YKB_ZDFSQY='"+YKB_ZDFSQY+"',"
								+ "XCB_LXSQ='" + XCB_LXSQ + "',XCB_MJ='"+XCB_MJ+"',"
								+ "XCB_FSJS='" + XCB_FSJS + "',XCB_BCN='"+XCB_BCN+"',"
								+ "XCB_BSN='" + XCB_BSN + "',XCB_CD_WL='"+XCB_CD_WL+"',"
								+ "XCB_MJ_WL='" + XCB_MJ_WL + "',XCB_CDYSNB='"+XCB_CDYSNB+"',"
								+ "XCB_ZDFSQY='" + XCB_ZDFSQY + "',XFB_LXSQ='"+XFB_LXSQ+"',"
								+ "XFB_MJ='" + XFB_MJ + "',XFB_FSJS='"+XFB_FSJS+"',"
								+ "XFB_BCN='" + XFB_BCN + "',XFB_BSN='"+XFB_BSN+"',"
								+ "XFB_CD_WL='" + XFB_CD_WL + "',XFB_MJ_WL='"+XFB_MJ_WL+"',"
								+ "XFB_CDYSNB='" + XFB_CDYSNB + "',XFB_ZDFSQY='"+XFB_ZDFSQY+"',"
								+ "QTBH_LXSQ='" + QTBH_LXSQ + "',QTBH_MJ='"+QTBH_MJ+"',"
								+ "QTBH_FSJS='" + QTBH_FSJS + "',QTBH_BCN='"+QTBH_BCN+"',"
								+ "QTBH_BSN='" + QTBH_BSN + "',QTBH_CD_WL='"+QTBH_CD_WL+"',"
								+ "QTBH_MJ_WL='" + QTBH_MJ_WL + "',QTBH_CDYSNB='"+QTBH_CDYSNB+"',"
								+ "QTBH_ZDFSQY='" + QTBH_ZDFSQY + "',QTBH_FSZB='"+QTBH_FSZB+"',"
								+ "YC_LXSQ='" + YC_LXSQ + "',YC_MJ='"+YC_MJ+"',"
								+ "YC_FSJS='" + YC_FSJS + "',YC_BCN='"+YC_BCN+"',"
								+ "YC_BSN='" + YC_BSN + "',YC_CD_WL='"+YC_CD_WL+"',"
								+ "YC_MJ_WL='" + YC_MJ_WL + "',YC_CDYSNB='"+YC_CDYSNB+"',"
								+ "YC_ZDFSQY='" + YC_ZDFSQY + "',ZZ_LXSQ='"+ZZ_LXSQ+"',"
								+ "ZZ_MJ='" + ZZ_MJ + "',ZZ_FSJS='"+ZZ_FSJS+"',"
								+ "ZZ_BCN='" + ZZ_BCN + "',ZZ_BSN='"+ZZ_BSN+"',"
								+ "ZZ_CD_WL='" + ZZ_CD_WL + "',ZZ_MJ_WL='"+ZZ_MJ_WL+"',"
								+ "ZZ_CDYSNB='" + ZZ_CDYSNB + "',ZZ_ZDFSQY='"+ZZ_ZDFSQY+"',"
								+ "XJC_LXSQ='" + XJC_LXSQ + "',XJC_MJ='"+XJC_MJ+"',"
								+ "XJC_FSJS='" + XJC_FSJS + "',XJC_BCN='"+XJC_BCN+"',"
								+ "XJC_BSN='" + XJC_BSN + "',XJC_CD_WL='"+XJC_CD_WL+"',"
								+ "XJC_MJ_WL='" + XJC_MJ_WL + "',XJC_CDYSNB='"+XJC_CDYSNB+"',"
								+ "XJC_ZDFSQY='" + XJC_ZDFSQY + "',YDNC_LXSQ='"+YDNC_LXSQ+"',"
								+ "YDNC_MJ='" + YDNC_MJ + "',YDNC_FSJS='"+YDNC_FSJS+"',"
								+ "YDNC_BCN='" + YDNC_BCN + "',YDNC_BSN='"+YDNC_BSN+"',"
								+ "YDNC_CD_WL='" + YDNC_CD_WL + "',YDNC_MJ_WL='"+YDNC_MJ_WL+"',"
								+ "YDNC_CDYSNB='" + YDNC_CDYSNB + "',YDNC_ZDFSQY='"+YDNC_ZDFSQY+"',"
								+ "DXHC_LXSQ='" + DXHC_LXSQ + "',DXHC_MJ='"+DXHC_MJ+"',"
								+ "DXHC_FSJS='" + DXHC_FSJS + "',DXHC_BCN='"+DXHC_BCN+"',"
								+ "DXHC_BSN='" + DXHC_BSN + "',DXHC_CD_WL='"+DXHC_CD_WL+"',"
								+ "DXHC_MJ_WL='" + DXHC_MJ_WL + "',DXHC_CDYSNB='"+DXHC_CDYSNB+"',"
								+ "DXHC_ZDFSQY='" + DXHC_ZDFSQY + "',HFS_LXSQ='"+HFS_LXSQ+"',"
								+ "HFS_MJ='" + HFS_MJ + "',HFS_FSJS='"+HFS_FSJS+"',"
								+ "HFS_BCN='" + HFS_BCN + "',HFS_BSN='"+HFS_BSN+"',"
								+ "HFS_CD_WL='" + HFS_CD_WL + "',HFS_MJ_WL='"+HFS_MJ_WL+"',"
								+ "HFS_CDYSNB='" + HFS_CDYSNB + "',HFS_ZDFSQY='"+HFS_ZDFSQY+"',"
								+ "TH_LXSQ='" + TH_LXSQ + "',TH_MJ='"+TH_MJ+"',"
								+ "TH_FSJS='" + TH_FSJS + "',TH_BCN='"+TH_BCN+"',"
								+ "TH_BSN='" + TH_BSN + "',TH_CD_WL='"+TH_CD_WL+"',"
								+ "TH_MJ_WL='" + TH_MJ_WL + "',TH_CDYSNB='"+TH_CDYSNB+"',"
								+ "TH_ZDFSQY='" + TH_ZDFSQY + "',MYF_LXSQ='"+MYF_LXSQ+"',"
								+ "MYF_MJ='" + MYF_MJ + "',MYF_FSJS='"+MYF_FSJS+"',"
								+ "MYF_BCN='" + MYF_BCN + "',MYF_BSN='"+MYF_BSN+"',"
								+ "MYF_CD_WL='" + MYF_CD_WL + "',MYF_MJ_WL='"+MYF_MJ_WL+"',"
								+ "MYF_CDYSNB='" + MYF_CDYSNB + "',MYF_ZDFSQY='"+MYF_ZDFSQY+"',"
								+ "MJF_LXSQ='" + MJF_LXSQ + "',MJF_MJ='"+MJF_MJ+"',"
								+ "MJF_FSJS='" + MJF_FSJS + "',MJF_BCN='"+MJF_BCN+"',"
								+ "MJF_BSN='" + MJF_BSN + "',MJF_CD_WL='"+MJF_CD_WL+"',"
								+ "MJF_MJ_WL='" + MJF_MJ_WL + "',MJF_CDYSNB='"+MJF_CDYSNB+"',"
								+ "MJF_ZDFSQY='" + MJF_ZDFSQY + "',QTHC_LXSQ='"+QTHC_LXSQ+"',"
								+ "QTHC_MJ='" + QTHC_MJ + "',QTHC_FSJS='"+QTHC_FSJS+"',"
								+ "QTHC_BCN='" + QTHC_BCN + "',QTHC_BSN='"+QTHC_BSN+"',"
								+ "QTHC_CD_WL='" + QTHC_CD_WL + "',QTHC_MJ_WL='"+QTHC_MJ_WL+"',"
								+ "QTHC_CDYSNB='" + QTHC_CDYSNB + "',QTHC_ZDFSQY='"+QTHC_ZDFSQY+"',"
								+ "QTHC_FSZB='" + QTHC_FSZB + "',"
								+ "YLM_MJBL='" + YLM_MJBL + "',BBLX='"+BBLX+"',"
								+ "ZT='" + ZT + "',"
								+ "ELM_MJBL='"+ELM_MJBL+"',DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd')  WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
				}
				//玉米螟冬前越冬基数调查模式报表
				if (fwd.equals("Q008")) {
					String SBRQ_B =so.httpServletRequest.getParameter("SBRQ_B");
					String SBRQ_E =so.httpServletRequest.getParameter("SBRQ_E");
					String DCXZGS =so.httpServletRequest.getParameter("DCXZGS");
					String DCZGS =so.httpServletRequest.getParameter("DCZGS");
					String PJBGHCS =so.httpServletRequest.getParameter("PJBGHCS");
					String PJBGHCZGSZ =so.httpServletRequest.getParameter("PJBGHCZGSZ");
					String PJBGHCZGNF =so.httpServletRequest.getParameter("PJBGHCZGNF");
					String PJBGHCSBZGNFSLZJBL =so.httpServletRequest.getParameter("PJBGHCSBZGNFSLZJBL");
					String PJBGHCSBLNPJZZJBL =so.httpServletRequest.getParameter("PJBGHCSBLNPJZZJBL");
					String YDYCYJSJZBSWL ="";
					String YDYCYJSFJSSWL ="";
					String YDYCSWL =so.httpServletRequest.getParameter("YDYCSWL");
					String YDYCSWLBLNPJZZJBL  ="";
					String YDYCSWLBSNZJBL  ="";
					String JGCCLBLNPJZZJBL =so.httpServletRequest.getParameter("JGCCLBLNPJZZJBL");
					String YJYDYMMFSCD =so.httpServletRequest.getParameter("YJYDYMMFSCD");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d008.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "DCXZGS,DCZGS,PJBGHCS,PJBGHCZGSZ,"
								+ "PJBGHCZGNF,PJBGHCSBZGNFSLZJBL,PJBGHCSBLNPJZZJBL,"
								+ "YDYCYJSJZBSWL,YDYCYJSFJSSWL,YDYCSWL,"
								+ "YDYCSWLBLNPJZZJBL,YDYCSWLBSNZJBL,JGCCLBLNPJZZJBL,"
								+ "YJYDYMMFSCD,SBRQ_B,SBRQ_E,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ DCXZGS + "','" + DCZGS + "','"+PJBGHCS+"','"+PJBGHCZGSZ+"','"
								+ PJBGHCZGNF + "','" + PJBGHCSBZGNFSLZJBL + "','"+PJBGHCSBLNPJZZJBL+"','"
								+ YDYCYJSJZBSWL + "','" + YDYCYJSFJSSWL + "','"+YDYCSWL+"','"
								+ YDYCSWLBLNPJZZJBL + "','" + YDYCSWLBSNZJBL + "','"+JGCCLBLNPJZZJBL+"','"
								+ YJYDYMMFSCD + "',to_date('" + SBRQ_B + "','yyyy-MM-dd'),to_date('"+SBRQ_E+"','yyyy-MM-dd'),'"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"')";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
					else
					{
						//更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "DCXZGS='" + DCXZGS + "',DCZGS='"+DCZGS+"',PJBGHCS='"+PJBGHCS+"',"
								+ "PJBGHCZGSZ='" + PJBGHCZGSZ + "',PJBGHCZGNF='"+PJBGHCZGNF+"',PJBGHCSBZGNFSLZJBL='"+PJBGHCSBZGNFSLZJBL+"',"
								+ "PJBGHCSBLNPJZZJBL='" + PJBGHCSBLNPJZZJBL + "',YDYCYJSJZBSWL='"+YDYCYJSJZBSWL+"',YDYCYJSFJSSWL='"+YDYCYJSFJSSWL+"',"
								+ "YDYCSWL='" + YDYCSWL + "',YDYCSWLBLNPJZZJBL='"+YDYCSWLBLNPJZZJBL+"',YDYCSWLBSNZJBL='"+YDYCSWLBSNZJBL+"',"
								+ "JGCCLBLNPJZZJBL='" + JGCCLBLNPJZZJBL + "',YJYDYMMFSCD='"+YJYDYMMFSCD+"',SBRQ_B=to_date('" + SBRQ_B + "','yyyy-MM-dd'),SBRQ_E=to_date('" + SBRQ_E + "','yyyy-MM-dd'),"
								+ "BBLX='"+BBLX+"',"
								+ "ZT='" + ZT+"'"
								+ " WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
				}
				//玉米螟冬后基数模式报表
				if (fwd.equals("Q009")) {
					String SBRQ =so.httpServletRequest.getParameter("SBRQ");
					String CYMBZMJ =so.httpServletRequest.getParameter("CYMBZMJ");
					String YDYCSWBLBSNZJBL =so.httpServletRequest.getParameter("YDYCSWBLBSNZJBL");
					String CYMBZMJBLNPJZZJBL =so.httpServletRequest.getParameter("CYMBZMJBLNPJZZJBL");
					String PJHYL =so.httpServletRequest.getParameter("PJHYL");
					String DCXZS =so.httpServletRequest.getParameter("DCXZS");
					String YJCCYHSQKSRQ =so.httpServletRequest.getParameter("YJCCYHSQKSRQ");
					String DCZGS =so.httpServletRequest.getParameter("DCZGS");
					String YJCCYHSQJSRQ =so.httpServletRequest.getParameter("YJCCYHSQJSRQ");
					String PJBGHCS =so.httpServletRequest.getParameter("PJBGHCS");
					String CCYHGFQBLNPJZZWTS =so.httpServletRequest.getParameter("CCYHGFQBLNPJZZWTS");
					String PJBGHCSBLNPJZZJBL =so.httpServletRequest.getParameter("PJBGHCSBLNPJZZJBL");
					String YJYDFSMJBL =so.httpServletRequest.getParameter("YJYDFSMJBL");
					String PJBGHCSBSNZZJBL =so.httpServletRequest.getParameter("PJBGHCSBSNZZJBL");
					String YJYDFSCD =so.httpServletRequest.getParameter("YJYDFSCD");
					String YDYCSWL =so.httpServletRequest.getParameter("YDYCSWL");
					String YCFZSQKSRQ =so.httpServletRequest.getParameter("YCFZSQKSRQ");
					String YDYCSWLBLNPJZZJBL =so.httpServletRequest.getParameter("YDYCSWLBLNPJZZJBL");
					String YCFZSQJSRQ =so.httpServletRequest.getParameter("YCFZSQJSRQ");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d009.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "CYMBZMJ,YDYCSWBLBSNZJBL,CYMBZMJBLNPJZZJBL,PJHYL,"
								+ "DCXZS,YJCCYHSQKSRQ,DCZGS,"
								+ "YJCCYHSQJSRQ,PJBGHCS,CCYHGFQBLNPJZZWTS,"
								+ "PJBGHCSBLNPJZZJBL,YJYDFSMJBL,PJBGHCSBSNZZJBL,"
								+ "YJYDFSCD,YDYCSWL,YCFZSQKSRQ,"
								+ "YDYCSWLBLNPJZZJBL,YCFZSQJSRQ,SBRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ CYMBZMJ + "','" + YDYCSWBLBSNZJBL + "','"+CYMBZMJBLNPJZZJBL+"','"+PJHYL+"','"
								+ DCXZS + "',to_date('" + YJCCYHSQKSRQ + "','yyyy-MM-dd'),'"+DCZGS+"',to_date('"
								+ YJCCYHSQJSRQ + "','yyyy-MM-dd'),'" + PJBGHCS + "','"+CCYHGFQBLNPJZZWTS+"','"
								+ PJBGHCSBLNPJZZJBL + "','" + YJYDFSMJBL + "','"+PJBGHCSBSNZZJBL+"','"
								+ YJYDFSCD + "','" + YDYCSWL + "',to_date('"+YCFZSQKSRQ+"','yyyy-MM-dd'),'"
								+ YDYCSWLBLNPJZZJBL + "',to_date('" + YCFZSQJSRQ + "','yyyy-MM-dd'),to_date('"+SBRQ+"','yyyy-MM-dd'),'"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"')";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
					else
					{
						//更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "CYMBZMJ='" + CYMBZMJ + "',YDYCSWBLBSNZJBL='"+YDYCSWBLBSNZJBL+"',CYMBZMJBLNPJZZJBL='"+CYMBZMJBLNPJZZJBL+"',"
								+ "PJHYL='" + PJHYL + "',DCXZS='"+DCXZS+"',YJCCYHSQKSRQ=to_date('" + YJCCYHSQKSRQ + "','yyyy-MM-dd'),"
								+ "DCZGS='" + DCZGS + "',YJCCYHSQJSRQ=to_date('" + YJCCYHSQJSRQ + "','yyyy-MM-dd'),PJBGHCS='"+PJBGHCS+"',"
								+ "CCYHGFQBLNPJZZWTS='" + CCYHGFQBLNPJZZWTS + "',PJBGHCSBLNPJZZJBL='"+PJBGHCSBLNPJZZJBL+"',YJYDFSMJBL='"+YJYDFSMJBL+"',"
								+ "PJBGHCSBSNZZJBL='" + PJBGHCSBSNZZJBL + "',YJYDFSCD='"+YJYDFSCD+"',YDYCSWL='"+YDYCSWL+"',"
								+ "YCFZSQKSRQ=to_date('" + YCFZSQKSRQ + "','yyyy-MM-dd'),YDYCSWLBLNPJZZJBL='"+YDYCSWLBLNPJZZJBL+"',YCFZSQJSRQ=to_date('" + YCFZSQJSRQ + "','yyyy-MM-dd'),SBRQ=to_date('" + SBRQ + "','yyyy-MM-dd'),"
								+ "BBLX='"+BBLX+"',"
								+ "ZT='" + ZT+"'"
								+ " WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
				}
				//一代玉米螟发生情况模式报表
				if (fwd.equals("Q010")) {
					String SBRQ_B =so.httpServletRequest.getParameter("SBRQ_B");
					String SBRQ_E =so.httpServletRequest.getParameter("SBRQ_E");
					String YD =so.httpServletRequest.getParameter("YD");
					String PJBZHCS =so.httpServletRequest.getParameter("PJBZHCS");
					String DYLJCCL =so.httpServletRequest.getParameter("DYLJCCL");
					String PJBZHCSBLNPJZZJBL =so.httpServletRequest.getParameter("PJBZHCSBLNPJZZJBL");
					String DYLJCCBLNPJZBL =so.httpServletRequest.getParameter("DYLJCCBLNPJZBL");
					String PJBZHCSBSNZZJBL =so.httpServletRequest.getParameter("PJBZHCSBSNZZJBL");
					String DYLJCCLBSNZJBL =so.httpServletRequest.getParameter("DYLJCCLBSNZJBL");
					String YJHYSQ =so.httpServletRequest.getParameter("YJHYSQ");
					String CYJYCLJCCL ="";
					String HYSQBLNPJZZWTS =so.httpServletRequest.getParameter("HYSQBLNPJZZWTS");
					String CYJYCLJCCLBLNPJZZJBL  ="";
					String YJCCYHSQ =so.httpServletRequest.getParameter("YJCCYHSQ");
					String CYJYCLJCCLBSNZZBL  ="";
					String CCYHSQBLNPJZZWTS =so.httpServletRequest.getParameter("CCYHSQBLNPJZZWTS");
					String PJBZYXLKS =so.httpServletRequest.getParameter("PJBZYXLKS");
					String YJXDFSMJBL =so.httpServletRequest.getParameter("YJXDFSMJBL");
					String BZYXLKSBLNPJZZJBL =so.httpServletRequest.getParameter("BZYXLKSBLNPJZZJBL");
					String YJXDFSCD =so.httpServletRequest.getParameter("YJXDFSCD");
					String BZYXLKSBSNZJBL =so.httpServletRequest.getParameter("BZYXLKSBSNZJBL");
					String YCLGFQKSRQ =so.httpServletRequest.getParameter("YCLGFQKSRQ");
					String YCLGFQJSRQ =so.httpServletRequest.getParameter("YCLGFQJSRQ");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d010.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YD,PJBZHCS,DYLJCCL,"
								+ "PJBZHCSBLNPJZZJBL,DYLJCCBLNPJZBL,PJBZHCSBSNZZJBL,"
								+ "DYLJCCLBSNZJBL,YJHYSQ,CYJYCLJCCL,"
								+ "HYSQBLNPJZZWTS,CYJYCLJCCLBLNPJZZJBL,YJCCYHSQ,"
								+ "CYJYCLJCCLBSNZZBL,CCYHSQBLNPJZZWTS,PJBZYXLKS,"
								+ "YJXDFSMJBL,BZYXLKSBLNPJZZJBL,YJXDFSCD,"
								+ "BZYXLKSBSNZJBL,YCLGFQKSRQ,YCLGFQJSRQ,"
								+ "SBRQ_B,SBRQ_E,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ YD + "','" + PJBZHCS + "','"+DYLJCCL+"','"
								+ PJBZHCSBLNPJZZJBL + "','" + DYLJCCBLNPJZBL + "','"+PJBZHCSBSNZZJBL+"','"
								+ DYLJCCLBSNZJBL + "',to_date('"+YJHYSQ+"','yyyy-MM-dd'),'"+CYJYCLJCCL+"','"
								+ HYSQBLNPJZZWTS + "','" + CYJYCLJCCLBLNPJZZJBL + "',to_date('"+YJCCYHSQ+"','yyyy-MM-dd'),'"
								+ CYJYCLJCCLBSNZZBL + "','" + CCYHSQBLNPJZZWTS + "','"+PJBZYXLKS+"','"
								+ YJXDFSMJBL + "','" + BZYXLKSBLNPJZZJBL + "','"+YJXDFSCD+"','"
								+ BZYXLKSBSNZJBL + "',to_date('" + YCLGFQKSRQ + "','yyyy-MM-dd'),to_date('"+YCLGFQJSRQ+"','yyyy-MM-dd'),"
								+"to_date('" + SBRQ_B + "','yyyy-MM-dd'),to_date('"+SBRQ_E+"','yyyy-MM-dd'),'"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"')";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
					else
					{
						//更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "YD='" + YD + "',PJBZHCS='"+PJBZHCS+"',DYLJCCL='"+DYLJCCL+"',"
								+ "PJBZHCSBLNPJZZJBL='" + PJBZHCSBLNPJZZJBL + "',DYLJCCBLNPJZBL='"+DYLJCCBLNPJZBL+"',PJBZHCSBSNZZJBL='"+PJBZHCSBSNZZJBL+"',"
								+ "DYLJCCLBSNZJBL='" + DYLJCCLBSNZJBL + "',YJHYSQ=to_date('" + YJHYSQ + "','yyyy-MM-dd'),CYJYCLJCCL='"+CYJYCLJCCL+"',"
								+ "HYSQBLNPJZZWTS='" + HYSQBLNPJZZWTS + "',CYJYCLJCCLBLNPJZZJBL='"+CYJYCLJCCLBLNPJZZJBL+"',YJCCYHSQ=to_date('" + YJCCYHSQ + "','yyyy-MM-dd'),"
								+ "CYJYCLJCCLBSNZZBL='" + CYJYCLJCCLBSNZZBL + "',CCYHSQBLNPJZZWTS='"+CCYHSQBLNPJZZWTS+"',PJBZYXLKS='"+PJBZYXLKS+"',"
								+ "YJXDFSMJBL='" + YJXDFSMJBL + "',BZYXLKSBLNPJZZJBL='"+BZYXLKSBLNPJZZJBL+"',YJXDFSCD='"+YJXDFSCD+"',"
								+ "BZYXLKSBSNZJBL='" + BZYXLKSBSNZJBL + "',YCLGFQKSRQ=to_date('" + YCLGFQKSRQ + "','yyyy-MM-dd'),YCLGFQJSRQ=to_date('" + YCLGFQJSRQ + "','yyyy-MM-dd'),"
								+ "SBRQ_B=to_date('" + SBRQ_B + "','yyyy-MM-dd'),SBRQ_E=to_date('" + SBRQ_E + "','yyyy-MM-dd'),"
								+ "BBLX='"+BBLX+"',"
								+ "ZT='" + ZT+"'"
								+ " WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
				}
				//二代玉米螟发生情况模式报表
				if (fwd.equals("Q011")) {
					String SBRQ_B =so.httpServletRequest.getParameter("SBRQ_B");
					String SBRQ_E =so.httpServletRequest.getParameter("SBRQ_E");
					String YD =so.httpServletRequest.getParameter("YD");
					String PJBZHCS =so.httpServletRequest.getParameter("PJBZHCS");
					String DYLJCCL =so.httpServletRequest.getParameter("DYLJCCL");
					String PJBZHCSBLNPJZZJBL =so.httpServletRequest.getParameter("PJBZHCSBLNPJZZJBL");
					String DYLJCCBLNPJZBL =so.httpServletRequest.getParameter("DYLJCCBLNPJZBL");
					String PJBZHCSBSNZZJBL =so.httpServletRequest.getParameter("PJBZHCSBSNZZJBL");
					String DYLJCCLBSNZJBL =so.httpServletRequest.getParameter("DYLJCCLBSNZJBL");
					String YJHYSQ =so.httpServletRequest.getParameter("YJHYSQ");
					String CYJYCLJCCL ="";
					String HYSQBLNPJZZWTS =so.httpServletRequest.getParameter("HYSQBLNPJZZWTS");
					String CYJYCLJCCLBLNPJZZJBL  ="";
					String YJCCYHSQ =so.httpServletRequest.getParameter("YJCCYHSQ");
					String CYJYCLJCCLBSNZZBL  ="";
					String CCYHSQBLNPJZZWTS =so.httpServletRequest.getParameter("CCYHSQBLNPJZZWTS");
					String PJBZYXLKS =so.httpServletRequest.getParameter("PJBZYXLKS");
					String YJXDFSMJBL =so.httpServletRequest.getParameter("YJXDFSMJBL");
					String BZYXLKSBLNPJZZJBL =so.httpServletRequest.getParameter("BZYXLKSBLNPJZZJBL");
					String YJXDFSCD =so.httpServletRequest.getParameter("YJXDFSCD");
					String BZYXLKSBSNZJBL =so.httpServletRequest.getParameter("BZYXLKSBSNZJBL");
					String YCLGFQKSRQ =so.httpServletRequest.getParameter("YCLGFQKSRQ");
					String YCLGFQJSRQ =so.httpServletRequest.getParameter("YCLGFQJSRQ");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d011.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YD,PJBZHCS,DYLJCCL,"
								+ "PJBZHCSBLNPJZZJBL,DYLJCCBLNPJZBL,PJBZHCSBSNZZJBL,"
								+ "DYLJCCLBSNZJBL,YJHYSQ,CYJYCLJCCL,"
								+ "HYSQBLNPJZZWTS,CYJYCLJCCLBLNPJZZJBL,YJCCYHSQ,"
								+ "CYJYCLJCCLBSNZZBL,CCYHSQBLNPJZZWTS,PJBZYXLKS,"
								+ "YJXDFSMJBL,BZYXLKSBLNPJZZJBL,YJXDFSCD,"
								+ "BZYXLKSBSNZJBL,YCLGFQKSRQ,YCLGFQJSRQ,"
								+ "SBRQ_B,SBRQ_E,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ YD + "','" + PJBZHCS + "','"+DYLJCCL+"','"
								+ PJBZHCSBLNPJZZJBL + "','" + DYLJCCBLNPJZBL + "','"+PJBZHCSBSNZZJBL+"','"
								+ DYLJCCLBSNZJBL + "',to_date('"+YJHYSQ+"','yyyy-MM-dd'),'"+CYJYCLJCCL+"','"
								+ HYSQBLNPJZZWTS + "','" + CYJYCLJCCLBLNPJZZJBL + "',to_date('"+YJCCYHSQ+"','yyyy-MM-dd'),'"
								+ CYJYCLJCCLBSNZZBL + "','" + CCYHSQBLNPJZZWTS + "','"+PJBZYXLKS+"','"
								+ YJXDFSMJBL + "','" + BZYXLKSBLNPJZZJBL + "','"+YJXDFSCD+"','"
								+ BZYXLKSBSNZJBL + "',to_date('" + YCLGFQKSRQ + "','yyyy-MM-dd'),to_date('"+YCLGFQJSRQ+"','yyyy-MM-dd'),"
								+"to_date('" + SBRQ_B + "','yyyy-MM-dd'),to_date('"+SBRQ_E+"','yyyy-MM-dd'),'"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"')";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
					else
					{
						//更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "YD='" + YD + "',PJBZHCS='"+PJBZHCS+"',DYLJCCL='"+DYLJCCL+"',"
								+ "PJBZHCSBLNPJZZJBL='" + PJBZHCSBLNPJZZJBL + "',DYLJCCBLNPJZBL='"+DYLJCCBLNPJZBL+"',PJBZHCSBSNZZJBL='"+PJBZHCSBSNZZJBL+"',"
								+ "DYLJCCLBSNZJBL='" + DYLJCCLBSNZJBL + "',YJHYSQ=to_date('" + YJHYSQ + "','yyyy-MM-dd'),CYJYCLJCCL='"+CYJYCLJCCL+"',"
								+ "HYSQBLNPJZZWTS='" + HYSQBLNPJZZWTS + "',CYJYCLJCCLBLNPJZZJBL='"+CYJYCLJCCLBLNPJZZJBL+"',YJCCYHSQ=to_date('" + YJCCYHSQ + "','yyyy-MM-dd'),"
								+ "CYJYCLJCCLBSNZZBL='" + CYJYCLJCCLBSNZZBL + "',CCYHSQBLNPJZZWTS='"+CCYHSQBLNPJZZWTS+"',PJBZYXLKS='"+PJBZYXLKS+"',"
								+ "YJXDFSMJBL='" + YJXDFSMJBL + "',BZYXLKSBLNPJZZJBL='"+BZYXLKSBLNPJZZJBL+"',YJXDFSCD='"+YJXDFSCD+"',"
								+ "BZYXLKSBSNZJBL='" + BZYXLKSBSNZJBL + "',YCLGFQKSRQ=to_date('" + YCLGFQKSRQ + "','yyyy-MM-dd'),YCLGFQJSRQ=to_date('" + YCLGFQJSRQ + "','yyyy-MM-dd'),"
								+ "SBRQ_B=to_date('" + SBRQ_B + "','yyyy-MM-dd'),SBRQ_E=to_date('" + SBRQ_E + "','yyyy-MM-dd'),"
								+ "BBLX='"+BBLX+"',"
								+ "ZT='" + ZT+"'"
								+ " WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
				}
				//三代玉米螟发生情况模式报表
				if (fwd.equals("Q012")) {
					String SBRQ_B =so.httpServletRequest.getParameter("SBRQ_B");
					String SBRQ_E =so.httpServletRequest.getParameter("SBRQ_E");
					String YD =so.httpServletRequest.getParameter("YD");
					String PJBZHCS =so.httpServletRequest.getParameter("PJBZHCS");
					String DYLJCCL =so.httpServletRequest.getParameter("DYLJCCL");
					String PJBZHCSBLNPJZZJBL =so.httpServletRequest.getParameter("PJBZHCSBLNPJZZJBL");
					String DYLJCCBLNPJZBL =so.httpServletRequest.getParameter("DYLJCCBLNPJZBL");
					String PJBZHCSBSNZZJBL =so.httpServletRequest.getParameter("PJBZHCSBSNZZJBL");
					String DYLJCCLBSNZJBL =so.httpServletRequest.getParameter("DYLJCCLBSNZJBL");
					String YJHYSQ =so.httpServletRequest.getParameter("YJHYSQ");
					String CYJYCLJCCL ="";
					String HYSQBLNPJZZWTS =so.httpServletRequest.getParameter("HYSQBLNPJZZWTS");
					String CYJYCLJCCLBLNPJZZJBL  ="";
					String YJCCYHSQ =so.httpServletRequest.getParameter("YJCCYHSQ");
					String CYJYCLJCCLBSNZZBL  ="";
					String CCYHSQBLNPJZZWTS =so.httpServletRequest.getParameter("CCYHSQBLNPJZZWTS");
					String PJBZYXLKS =so.httpServletRequest.getParameter("PJBZYXLKS");
					String YJXDFSMJBL =so.httpServletRequest.getParameter("YJXDFSMJBL");
					String BZYXLKSBLNPJZZJBL =so.httpServletRequest.getParameter("BZYXLKSBLNPJZZJBL");
					String YJXDFSCD =so.httpServletRequest.getParameter("YJXDFSCD");
					String BZYXLKSBSNZJBL =so.httpServletRequest.getParameter("BZYXLKSBSNZJBL");
					String YCLGFQKSRQ =so.httpServletRequest.getParameter("YCLGFQKSRQ");
					String YCLGFQJSRQ =so.httpServletRequest.getParameter("YCLGFQJSRQ");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d012.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YD,PJBZHCS,DYLJCCL,"
								+ "PJBZHCSBLNPJZZJBL,DYLJCCBLNPJZBL,PJBZHCSBSNZZJBL,"
								+ "DYLJCCLBSNZJBL,YJHYSQ,CYJYCLJCCL,"
								+ "HYSQBLNPJZZWTS,CYJYCLJCCLBLNPJZZJBL,YJCCYHSQ,"
								+ "CYJYCLJCCLBSNZZBL,CCYHSQBLNPJZZWTS,PJBZYXLKS,"
								+ "YJXDFSMJBL,BZYXLKSBLNPJZZJBL,YJXDFSCD,"
								+ "BZYXLKSBSNZJBL,YCLGFQKSRQ,YCLGFQJSRQ,"
								+ "SBRQ_B,SBRQ_E,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ YD + "','" + PJBZHCS + "','"+DYLJCCL+"','"
								+ PJBZHCSBLNPJZZJBL + "','" + DYLJCCBLNPJZBL + "','"+PJBZHCSBSNZZJBL+"','"
								+ DYLJCCLBSNZJBL + "',to_date('"+YJHYSQ+"','yyyy-MM-dd'),'"+CYJYCLJCCL+"','"
								+ HYSQBLNPJZZWTS + "','" + CYJYCLJCCLBLNPJZZJBL + "',to_date('"+YJCCYHSQ+"','yyyy-MM-dd'),'"
								+ CYJYCLJCCLBSNZZBL + "','" + CCYHSQBLNPJZZWTS + "','"+PJBZYXLKS+"','"
								+ YJXDFSMJBL + "','" + BZYXLKSBLNPJZZJBL + "','"+YJXDFSCD+"','"
								+ BZYXLKSBSNZJBL + "',to_date('" + YCLGFQKSRQ + "','yyyy-MM-dd'),to_date('"+YCLGFQJSRQ+"','yyyy-MM-dd'),"
								+"to_date('" + SBRQ_B + "','yyyy-MM-dd'),to_date('"+SBRQ_E+"','yyyy-MM-dd'),'"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"')";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
					else
					{
						//更新数据
						String updatesql = "UPDATE D" + zbid + " SET "
								+ "YD='" + YD + "',PJBZHCS='"+PJBZHCS+"',DYLJCCL='"+DYLJCCL+"',"
								+ "PJBZHCSBLNPJZZJBL='" + PJBZHCSBLNPJZZJBL + "',DYLJCCBLNPJZBL='"+DYLJCCBLNPJZBL+"',PJBZHCSBSNZZJBL='"+PJBZHCSBSNZZJBL+"',"
								+ "DYLJCCLBSNZJBL='" + DYLJCCLBSNZJBL + "',YJHYSQ=to_date('" + YJHYSQ + "','yyyy-MM-dd'),CYJYCLJCCL='"+CYJYCLJCCL+"',"
								+ "HYSQBLNPJZZWTS='" + HYSQBLNPJZZWTS + "',CYJYCLJCCLBLNPJZZJBL='"+CYJYCLJCCLBLNPJZZJBL+"',YJCCYHSQ=to_date('" + YJCCYHSQ + "','yyyy-MM-dd'),"
								+ "CYJYCLJCCLBSNZZBL='" + CYJYCLJCCLBSNZZBL + "',CCYHSQBLNPJZZWTS='"+CCYHSQBLNPJZZWTS+"',PJBZYXLKS='"+PJBZYXLKS+"',"
								+ "YJXDFSMJBL='" + YJXDFSMJBL + "',BZYXLKSBLNPJZZJBL='"+BZYXLKSBLNPJZZJBL+"',YJXDFSCD='"+YJXDFSCD+"',"
								+ "BZYXLKSBSNZJBL='" + BZYXLKSBSNZJBL + "',YCLGFQKSRQ=to_date('" + YCLGFQKSRQ + "','yyyy-MM-dd'),YCLGFQJSRQ=to_date('" + YCLGFQJSRQ + "','yyyy-MM-dd'),"
								+ "SBRQ_B=to_date('" + SBRQ_B + "','yyyy-MM-dd'),SBRQ_E=to_date('" + SBRQ_E + "','yyyy-MM-dd'),"
								+ "BBLX='"+BBLX+"',"
								+ "ZT='" + ZT+"'"
								+ " WHERE JFID='" + JFID + "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(updatesql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
						so.httpServletRequest.setAttribute("jfid", JFID);
						so.httpServletRequest.setAttribute("bbzt", BBLX);
						so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
						so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
						so.httpServletRequest.setAttribute("lb", lb);
						so.httpServletRequest.setAttribute("zbid", zbid);
						so.httpServletRequest.setAttribute("rwid", rwid);
						so.httpServletRequest.setAttribute("rwsj", RWSJ);
					}
				}
		
				//提交状态更新任务表
				if (ZT.equals("1")) {
					String SHBZ = "";
					if (BMBM.length() == 4) {
						SHBZ = "1";
					} else {
						SHBZ = "2";
					}
					String upsql = "UPDATE DBBZB_RW SET DYID='" + JFID
							+ "',SJTBRQ=sysdate,BBZT='" + BBLX + "',SHBZ='"
							+ SHBZ + "' WHERE JFID='" + rwid + "'";
					ExecuteConnection ecup = new ExecuteConnection();
					Statement stmtup = ecup.con.createStatement();
					if (stmtup.executeUpdate(upsql) > 0) {
						ecup.con.commit();
					}
					stmtup.close();
					ecup.close();
					so.httpServletRequest.setAttribute("jfid", JFID);
					so.httpServletRequest.setAttribute("bbzt", BBLX);
					so.httpServletRequest.setAttribute("kstbrq", KSTBRQ);
					so.httpServletRequest.setAttribute("jztbrq", JZTBRQ);
					so.httpServletRequest.setAttribute("lb", lb);
					so.httpServletRequest.setAttribute("zbid", zbid);
					so.httpServletRequest.setAttribute("rwid", rwid);
					so.httpServletRequest.setAttribute("rwsj", RWSJ);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
}
