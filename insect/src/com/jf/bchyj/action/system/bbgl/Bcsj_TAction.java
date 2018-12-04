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

public class Bcsj_TAction extends InitAction {
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
		try {
				//玉米病虫中后期发生趋势预测表
				if (fwd.equals("Q013")) {
					String CXYM_ZZMJ = so.httpServletRequest.getParameter("CXYM_ZZMJ");
					String MJHJ_BCNZJ = so.httpServletRequest.getParameter("MJHJ_BCNZJ");
					String YJYMBH_BCNZJ = so.httpServletRequest.getParameter("YJYMBH_BCNZJ");
					String ZYZZQY = so.httpServletRequest.getParameter("ZYZZQY");
					String DQZTZS = so.httpServletRequest.getParameter("DQZTZS");
					String BSN = so.httpServletRequest.getParameter("BSN");
					String YDYMM_FSCD = so.httpServletRequest.getParameter("YDYMM_FSCD");
					String YDYMM_FSMJ = so.httpServletRequest.getParameter("YDYMM_FSMJ");
					String YDYMM_ZDFSQY = so.httpServletRequest.getParameter("YDYMM_ZDFSQY");
					String YDYMM_FSCD_H = "";
					String YDYMM_FSMJ_H = so.httpServletRequest.getParameter("YDYMM_FSMJ_H");
					String YDYMM_ZDFSQY_H = so.httpServletRequest.getParameter("YDYMM_ZDFSQY_H");
					String EDYMM_FSCD  = "";
					String EDYMM_FSMJ = so.httpServletRequest.getParameter("EDYMM_FSMJ");
					String EDYMM_ZDFSQY = so.httpServletRequest.getParameter("EDYMM_ZDFSQY");
					String EDYMM_FSCD_H = so.httpServletRequest.getParameter("EDYMM_FSCD_H");
					String EDYMM_FSMJ_H = so.httpServletRequest.getParameter("EDYMM_FSMJ_H");
					String EDYMM_ZDFSQY_H = so.httpServletRequest.getParameter("EDYMM_ZDFSQY_H");
					String SDYMM_FSCD  = "";
					String SDYMM_FSMJ = so.httpServletRequest.getParameter("SDYMM_FSMJ");
					String SDYMM_ZDFSQY = so.httpServletRequest.getParameter("SDYMM_ZDFSQY");
					String SDYMM_FSCD_H = so.httpServletRequest.getParameter("SDYMM_FSCD_H");
					String SDYMM_FSMJ_H = so.httpServletRequest.getParameter("SDYMM_FSMJ_H");
					String SDYMM_ZDFSQY_H = so.httpServletRequest.getParameter("SDYMM_ZDFSQY_H");
					String EDWYE_FSCD = so.httpServletRequest.getParameter("EDWYE_FSCD");
					String EDWYE_FSMJ = so.httpServletRequest.getParameter("EDWYE_FSMJ");
					String EDWYE_ZDFSQY = so.httpServletRequest.getParameter("EDWYE_ZDFSQY");
					String EDWYE_FSCD_H = so.httpServletRequest.getParameter("EDWYE_FSCD_H");
					String EDWYE_FSMJ_H = so.httpServletRequest.getParameter("EDWYE_FSMJ_H");
					String EDWYE_ZDFSQY_H = so.httpServletRequest.getParameter("EDWYE_ZDFSQY_H");
					String EDNC_FSCD = so.httpServletRequest.getParameter("EDNC_FSCD");
					String EDNC_FSMJ = so.httpServletRequest.getParameter("EDNC_FSMJ");
					String EDNC_ZDFSQY = so.httpServletRequest.getParameter("EDNC_ZDFSQY");
					String EDNC_FSCD_H = "";
					String EDNC_FSMJ_H = so.httpServletRequest.getParameter("EDNC_FSMJ_H");
					String EDNC_ZDFSQY_H = so.httpServletRequest.getParameter("EDNC_ZDFSQY_H");
					String SDNC_FSCD = "";
					String SDNC_FSMJ = so.httpServletRequest.getParameter("SDNC_FSMJ");
					String SDNC_ZDFSQY = so.httpServletRequest.getParameter("SDNC_ZDFSQY");
					String SDNC_FSCD_H = so.httpServletRequest.getParameter("SDNC_FSCD_H");
					String SDNC_FSMJ_H = so.httpServletRequest.getParameter("SDNC_FSMJ_H");
					String SDNC_ZDFSQY_H = so.httpServletRequest.getParameter("SDNC_ZDFSQY_H");
					String SDMLC_FSCD = "";
					String SDMLC_FSMJ = so.httpServletRequest.getParameter("SDMLC_FSMJ");
					String SDMLC_ZDFSQY = so.httpServletRequest.getParameter("SDMLC_ZDFSQY");
					String SDMLC_FSCD_H = so.httpServletRequest.getParameter("SDMLC_FSCD_H");
					String SDMLC_FSMJ_H = so.httpServletRequest.getParameter("SDMLC_FSMJ_H");
					String SDMLC_ZDFSQY_H = so.httpServletRequest.getParameter("SDMLC_ZDFSQY_H");
					String CDM_FSCD = so.httpServletRequest.getParameter("CDM_FSCD");
					String CDM_FSMJ = so.httpServletRequest.getParameter("CDM_FSMJ");
					String CDM_ZDFSQY = so.httpServletRequest.getParameter("CDM_ZDFSQY");
					String CDM_FSCD_H = so.httpServletRequest.getParameter("CDM_FSCD_H");
					String CDM_FSMJ_H = so.httpServletRequest.getParameter("CDM_FSMJ_H");
					String CDM_ZDFSQY_H = so.httpServletRequest.getParameter("CDM_ZDFSQY_H");
					String YC_FSCD = so.httpServletRequest.getParameter("YC_FSCD");
					String YC_FSMJ = so.httpServletRequest.getParameter("YC_FSMJ");
					String YC_ZDFSQY = so.httpServletRequest.getParameter("YC_ZDFSQY");
					String YC_FSCD_H = so.httpServletRequest.getParameter("YC_FSCD_H");
					String YC_FSMJ_H = so.httpServletRequest.getParameter("YC_FSMJ_H");
					String YC_ZDFSQY_H = so.httpServletRequest.getParameter("YC_ZDFSQY_H");
					String JM_FSCD = so.httpServletRequest.getParameter("JM_FSCD");
					String JM_FSMJ = so.httpServletRequest.getParameter("JM_FSMJ");
					String JM_ZDFSQY = so.httpServletRequest.getParameter("JM_ZDFSQY");
					String JM_FSCD_H = so.httpServletRequest.getParameter("JM_FSCD_H");
					String JM_FSMJ_H = so.httpServletRequest.getParameter("JM_FSMJ_H");
					String JM_ZDFSQY_H = so.httpServletRequest.getParameter("JM_ZDFSQY_H");
					String YM_FSCD = so.httpServletRequest.getParameter("YM_FSCD");
					String YM_FSMJ = so.httpServletRequest.getParameter("YM_FSMJ");
					String YM_ZDFSQY = so.httpServletRequest.getParameter("YM_ZDFSQY");
					String YM_FSCD_H = so.httpServletRequest.getParameter("YM_FSCD_H");
					String YM_FSMJ_H = so.httpServletRequest.getParameter("YM_FSMJ_H");
					String YM_ZDFSQY_H = so.httpServletRequest.getParameter("YM_ZDFSQY_H");
					String SBYYJ_FSCD = so.httpServletRequest.getParameter("SBYYJ_FSCD");
					String SBYYJ_FSMJ = so.httpServletRequest.getParameter("SBYYJ_FSMJ");
					String SBYYJ_ZDFSQY = so.httpServletRequest.getParameter("SBYYJ_ZDFSQY");
					String SBYYJ_FSCD_H = so.httpServletRequest.getParameter("SBYYJ_FSCD_H");
					String SBYYJ_FSMJ_H = so.httpServletRequest.getParameter("SBYYJ_FSMJ_H");
					String SBYYJ_ZDFSQY_H = so.httpServletRequest.getParameter("SBYYJ_ZDFSQY_H");
					String TH_FSCD = so.httpServletRequest.getParameter("TH_FSCD");
					String TH_FSMJ = so.httpServletRequest.getParameter("TH_FSMJ");
					String TH_ZDFSQY = so.httpServletRequest.getParameter("TH_ZDFSQY");
					String TH_FSCD_H = so.httpServletRequest.getParameter("TH_FSCD_H");
					String TH_FSMJ_H = so.httpServletRequest.getParameter("TH_FSMJ_H");
					String TH_ZDFSQY_H = so.httpServletRequest.getParameter("TH_ZDFSQY_H");
					String DXHC_FSCD = so.httpServletRequest.getParameter("DXHC_FSCD");
					String DXHC_FSMJ = so.httpServletRequest.getParameter("DXHC_FSMJ");
					String DXHC_ZDFSQY = so.httpServletRequest.getParameter("DXHC_ZDFSQY");
					String DXHC_FSCD_H = so.httpServletRequest.getParameter("DXHC_FSCD_H");
					String DXHC_FSMJ_H = so.httpServletRequest.getParameter("DXHC_FSMJ_H");
					String DXHC_ZDFSQY_H = so.httpServletRequest.getParameter("DXHC_ZDFSQY_H");
					String QTHC_FSCD = so.httpServletRequest.getParameter("QTHC_FSCD");
					String QTHC_FSMJ = so.httpServletRequest.getParameter("QTHC_FSMJ");
					String QTHC_ZDFSQY = so.httpServletRequest.getParameter("QTHC_ZDFSQY");
					String QTHC_FSCD_H = so.httpServletRequest.getParameter("QTHC_FSCD_H");
					String QTHC_FSMJ_H = so.httpServletRequest.getParameter("QTHC_FSMJ_H");
					String QTHC_ZDFSQY_H = so.httpServletRequest.getParameter("QTHC_ZDFSQY_H");
					String CHHJ_FSCD = "";
					String CHHJ_FSMJ = so.httpServletRequest.getParameter("CHHJ_FSMJ");
					String CHHJ_ZDFSQY = so.httpServletRequest.getParameter("CHHJ_ZDFSQY");
					String CHHJ_FSCD_H = "";
					String CHHJ_FSMJ_H = so.httpServletRequest.getParameter("CHHJ_FSMJ_H");
					String CHHJ_ZDFSQY_H = so.httpServletRequest.getParameter("CHHJ_ZDFSQY_H");
					String DBB_FSCD = "";
					String DBB_FSMJ = so.httpServletRequest.getParameter("DBB_FSMJ");
					String DBB_ZDFSQY = so.httpServletRequest.getParameter("DBB_ZDFSQY");
					String DBB_FSCD_H = so.httpServletRequest.getParameter("DBB_FSCD_H");
					String DBB_FSMJ_H = so.httpServletRequest.getParameter("DBB_FSMJ_H");
					String DBB_ZDFSQY_H = so.httpServletRequest.getParameter("DBB_ZDFSQY_H");
					String XBB_FSCD = "";
					String XBB_FSMJ = so.httpServletRequest.getParameter("XBB_FSMJ");
					String XBB_ZDFSQY = so.httpServletRequest.getParameter("XBB_ZDFSQY");
					String XBB_FSCD_H = so.httpServletRequest.getParameter("XBB_FSCD_H");
					String XBB_FSMJ_H = so.httpServletRequest.getParameter("XBB_FSMJ_H");
					String XBB_ZDFSQY_H = so.httpServletRequest.getParameter("XBB_ZDFSQY_H");
					String HBB_FSCD = "";
					String HBB_FSMJ = so.httpServletRequest.getParameter("HBB_FSMJ");
					String HBB_ZDFSQY = so.httpServletRequest.getParameter("HBB_ZDFSQY");
					String HBB_FSCD_H = so.httpServletRequest.getParameter("HBB_FSCD_H");
					String HBB_FSMJ_H = so.httpServletRequest.getParameter("HBB_FSMJ_H");
					String HBB_ZDFSQY_H = so.httpServletRequest.getParameter("HBB_ZDFSQY_H");
					String YMWBMYBB_FSCD = "";
					String YMWBMYBB_FSMJ = so.httpServletRequest.getParameter("YMWBMYBB_FSMJ");
					String YMWBMYBB_ZDFSQY = so.httpServletRequest.getParameter("YMWBMYBB_ZDFSQY");
					String YMWBMYBB_FSCD_H = so.httpServletRequest.getParameter("YMWBMYBB_FSCD_H");
					String YMWBMYBB_FSMJ_H = so.httpServletRequest.getParameter("YMWBMYBB_FSMJ_H");
					String YMWBMYBB_ZDFSQY_H = so.httpServletRequest.getParameter("YMWBMYBB_ZDFSQY_H");
					String WKB_FSCD = "";
					String WKB_FSMJ = so.httpServletRequest.getParameter("WKB_FSMJ");
					String WKB_ZDFSQY = so.httpServletRequest.getParameter("WKB_ZDFSQY");
					String WKB_FSCD_H = so.httpServletRequest.getParameter("WKB_FSCD_H");
					String WKB_FSMJ_H = so.httpServletRequest.getParameter("WKB_FSMJ_H");
					String WKB_ZDFSQY_H = so.httpServletRequest.getParameter("WKB_ZDFSQY_H");
					String SHSB_FSCD = "";
					String SHSB_FSMJ = so.httpServletRequest.getParameter("SHSB_FSMJ");
					String SHSB_ZDFSQY = so.httpServletRequest.getParameter("SHSB_ZDFSQY");
					String SHSB_FSCD_H = so.httpServletRequest.getParameter("SHSB_FSCD_H");
					String SHSB_FSMJ_H = so.httpServletRequest.getParameter("SHSB_FSMJ_H");
					String SHSB_ZDFSQY_H = so.httpServletRequest.getParameter("SHSB_ZDFSQY_H");
					String XB_FSCD = "";
					String XB_FSMJ = so.httpServletRequest.getParameter("XB_FSMJ");
					String XB_ZDFSQY = so.httpServletRequest.getParameter("XB_ZDFSQY");
					String XB_FSCD_H = so.httpServletRequest.getParameter("XB_FSCD_H");
					String XB_FSMJ_H = so.httpServletRequest.getParameter("XB_FSMJ_H");
					String XB_ZDFSQY_H = so.httpServletRequest.getParameter("XB_ZDFSQY_H");
					String LHFB_FSCD = "";
					String LHFB_FSMJ = so.httpServletRequest.getParameter("LHFB_FSMJ");
					String LHFB_ZDFSQY = so.httpServletRequest.getParameter("LHFB_ZDFSQY");
					String LHFB_FSCD_H = so.httpServletRequest.getParameter("LHFB_FSCD_H");
					String LHFB_FSMJ_H = so.httpServletRequest.getParameter("LHFB_FSMJ_H");
					String LHFB_ZDFSQY_H = so.httpServletRequest.getParameter("LHFB_ZDFSQY_H");
					String CSB_FSCD = "";
					String CSB_FSMJ = so.httpServletRequest.getParameter("CSB_FSMJ");
					String CSB_ZDFSQY = so.httpServletRequest.getParameter("CSB_ZDFSQY");
					String CSB_FSCD_H = so.httpServletRequest.getParameter("CSB_FSCD_H");
					String CSB_FSMJ_H = so.httpServletRequest.getParameter("CSB_FSMJ_H");
					String CSB_ZDFSQY_H = so.httpServletRequest.getParameter("CSB_ZDFSQY_H");
					String DFB_FSCD = "";
					String DFB_FSMJ = so.httpServletRequest.getParameter("DFB_FSMJ");
					String DFB_ZDFSQY = so.httpServletRequest.getParameter("DFB_ZDFSQY");
					String DFB_FSCD_H = "";
					String DFB_FSMJ_H = so.httpServletRequest.getParameter("DFB_FSMJ_H");
					String DFB_ZDFSQY_H = so.httpServletRequest.getParameter("DFB_ZDFSQY_H");
					String QTB_FSCD = "";
					String QTB_FSMJ = so.httpServletRequest.getParameter("QTB_FSMJ");
					String QTB_ZDFSQY = so.httpServletRequest.getParameter("QTB_ZDFSQY");
					String QTB_FSCD_H = so.httpServletRequest.getParameter("QTB_FSCD_H");
					String QTB_FSMJ_H = so.httpServletRequest.getParameter("QTB_FSMJ_H");
					String QTB_ZDFSQY_H = so.httpServletRequest.getParameter("QTB_ZDFSQY_H");
					String BHHJ_FSCD = "";
					String BHHJ_FSMJ = so.httpServletRequest.getParameter("BHHJ_FSMJ");
					String BHHJ_ZDFSQY = so.httpServletRequest.getParameter("BHHJ_ZDFSQY");
					String BHHJ_FSCD_H = "";
					String BHHJ_FSMJ_H = so.httpServletRequest.getParameter("BHHJ_FSMJ_H");
					String BHHJ_ZDFSQY_H = so.httpServletRequest.getParameter("BHHJ_ZDFSQY_H");
					String BCHJ_FSCD = "";
					String BCHJ_FSMJ = so.httpServletRequest.getParameter("BCHJ_FSMJ");
					String BCHJ_ZDFSQY = so.httpServletRequest.getParameter("BCHJ_ZDFSQY");
					String BCHJ_FSCD_H = "";
					String BCHJ_FSMJ_H = so.httpServletRequest.getParameter("BCHJ_FSMJ_H");
					String BCHJ_ZDFSQY_H = so.httpServletRequest.getParameter("BCHJ_ZDFSQY_H");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d013.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "CXYM_ZZMJ,MJHJ_BCNZJ,YJYMBH_BCNZJ,"
								+ "ZYZZQY,DQZTZS,BSN,"
								+ "YDYMM_FSCD,YDYMM_FSMJ,YDYMM_ZDFSQY,"
								+ "YDYMM_FSCD_H,YDYMM_FSMJ_H,YDYMM_ZDFSQY_H,"
								+ "EDYMM_FSCD,EDYMM_FSMJ,EDYMM_ZDFSQY,"
								+ "EDYMM_FSCD_H,EDYMM_FSMJ_H,EDYMM_ZDFSQY_H,"
								+ "SDYMM_FSCD,SDYMM_FSMJ,SDYMM_ZDFSQY,"
								+ "SDYMM_FSCD_H,SDYMM_FSMJ_H,SDYMM_ZDFSQY_H,"
								+ "EDWYE_FSCD,EDWYE_FSMJ,EDWYE_ZDFSQY,"
								+ "EDWYE_FSCD_H,EDWYE_FSMJ_H,EDWYE_ZDFSQY_H,"
								+ "EDNC_FSCD,EDNC_FSMJ,EDNC_ZDFSQY,"
								+ "EDNC_FSCD_H,EDNC_FSMJ_H,EDNC_ZDFSQY_H,"
								+ "SDNC_FSCD,SDNC_FSMJ,SDNC_ZDFSQY,"
								+ "SDNC_FSCD_H,SDNC_FSMJ_H,SDNC_ZDFSQY_H,"
								+ "SDMLC_FSCD,SDMLC_FSMJ,SDMLC_ZDFSQY,"
								+ "SDMLC_FSCD_H,SDMLC_FSMJ_H,SDMLC_ZDFSQY_H,"
								+ "CDM_FSCD,CDM_FSMJ,CDM_ZDFSQY,"
								+ "CDM_FSCD_H,CDM_FSMJ_H,CDM_ZDFSQY_H,"
								+ "YC_FSCD,YC_FSMJ,YC_ZDFSQY,"
								+ "YC_FSCD_H,YC_FSMJ_H,YC_ZDFSQY_H,"
								+ "JM_FSCD,JM_FSMJ,JM_ZDFSQY,"
								+ "JM_FSCD_H,JM_FSMJ_H,JM_ZDFSQY_H,"
								+ "YM_FSCD,YM_FSMJ,YM_ZDFSQY,"
								+ "YM_FSCD_H,YM_FSMJ_H,YM_ZDFSQY_H,"
								+ "SBYYJ_FSCD,SBYYJ_FSMJ,SBYYJ_ZDFSQY,"
								+ "SBYYJ_FSCD_H,SBYYJ_FSMJ_H,SBYYJ_ZDFSQY_H,"
								+ "TH_FSCD,TH_FSMJ,TH_ZDFSQY,"
								+ "TH_FSCD_H,TH_FSMJ_H,TH_ZDFSQY_H,"
								+ "DXHC_FSCD,DXHC_FSMJ,DXHC_ZDFSQY,"
								+ "DXHC_FSCD_H,DXHC_FSMJ_H,DXHC_ZDFSQY_H,"
								+ "QTHC_FSCD,QTHC_FSMJ,QTHC_ZDFSQY,"
								+ "QTHC_FSCD_H,QTHC_FSMJ_H,QTHC_ZDFSQY_H,"
								+ "CHHJ_FSCD,CHHJ_FSMJ,CHHJ_ZDFSQY,"
								+ "CHHJ_FSCD_H,CHHJ_FSMJ_H,CHHJ_ZDFSQY_H,"
								+ "DBB_FSCD,DBB_FSMJ,DBB_ZDFSQY,"
								+ "DBB_FSCD_H,DBB_FSMJ_H,DBB_ZDFSQY_H,"
								+ "XBB_FSCD,XBB_FSMJ,XBB_ZDFSQY,"
								+ "XBB_FSCD_H,XBB_FSMJ_H,XBB_ZDFSQY_H,"
								+ "HBB_FSCD,HBB_FSMJ,HBB_ZDFSQY,"
								+ "HBB_FSCD_H,HBB_FSMJ_H,HBB_ZDFSQY_H,"
								+ "YMWBMYBB_FSCD,YMWBMYBB_FSMJ,YMWBMYBB_ZDFSQY,"
								+ "YMWBMYBB_FSCD_H,YMWBMYBB_FSMJ_H,YMWBMYBB_ZDFSQY_H,"
								+ "WKB_FSCD,WKB_FSMJ,WKB_ZDFSQY,"
								+ "WKB_FSCD_H,WKB_FSMJ_H,WKB_ZDFSQY_H,"
								+ "SHSB_FSCD,SHSB_FSMJ,SHSB_ZDFSQY,"
								+ "SHSB_FSCD_H,SHSB_FSMJ_H,SHSB_ZDFSQY_H,"
								+ "XB_FSCD,XB_FSMJ,XB_ZDFSQY,"
								+ "XB_FSCD_H,XB_FSMJ_H,XB_ZDFSQY_H,"
								+ "LHFB_FSCD,LHFB_FSMJ,LHFB_ZDFSQY,"
								+ "LHFB_FSCD_H,LHFB_FSMJ_H,LHFB_ZDFSQY_H,"
								+ "CSB_FSCD,CSB_FSMJ,CSB_ZDFSQY,"
								+ "CSB_FSCD_H,CSB_FSMJ_H,CSB_ZDFSQY_H,"
								+ "DFB_FSCD,DFB_FSMJ,DFB_ZDFSQY,"
								+ "DFB_FSCD_H,DFB_FSMJ_H,DFB_ZDFSQY_H,"
								+ "QTB_FSCD,QTB_FSMJ,QTB_ZDFSQY,"
								+ "QTB_FSCD_H,QTB_FSMJ_H,QTB_ZDFSQY_H,"
								+ "BHHJ_FSCD,BHHJ_FSMJ,BHHJ_ZDFSQY,"
								+ "BHHJ_FSCD_H,BHHJ_FSMJ_H,BHHJ_ZDFSQY_H,"
								+ "BCHJ_FSCD,BCHJ_FSMJ,BCHJ_ZDFSQY,"
								+ "BCHJ_FSCD_H,BCHJ_FSMJ_H,BCHJ_ZDFSQY_H,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT,DCRQ) VALUES ('" + JFID + "','"
								+ CXYM_ZZMJ + "','" + MJHJ_BCNZJ + "','"+YJYMBH_BCNZJ+"','"
								+ ZYZZQY + "','" + DQZTZS + "','"+BSN+"','"
								+ YDYMM_FSCD + "','" + YDYMM_FSMJ + "','"+YDYMM_ZDFSQY+"','"
								+ YDYMM_FSCD_H + "','" + YDYMM_FSMJ_H + "','"+YDYMM_ZDFSQY_H+"','"
								+ EDYMM_FSCD + "','" + EDYMM_FSMJ + "','"+EDYMM_ZDFSQY+"','"
								+ EDYMM_FSCD_H + "','" + EDYMM_FSMJ_H + "','"+EDYMM_ZDFSQY_H+"','"
								+ SDYMM_FSCD + "','" + SDYMM_FSMJ + "','"+SDYMM_ZDFSQY+"','"
								+ SDYMM_FSCD_H + "','" + SDYMM_FSMJ_H + "','"+SDYMM_ZDFSQY_H+"','"
								+ EDWYE_FSCD + "','" + EDWYE_FSMJ + "','"+EDWYE_ZDFSQY+"','"
								+ EDWYE_FSCD_H + "','" + EDWYE_FSMJ_H + "','"+EDWYE_ZDFSQY_H+"','"
								+ EDNC_FSCD + "','" + EDNC_FSMJ + "','"+EDNC_ZDFSQY+"','"
								+ EDNC_FSCD_H + "','" + EDNC_FSMJ_H + "','"+EDNC_ZDFSQY_H+"','"
								+ SDNC_FSCD + "','" + SDNC_FSMJ + "','"+SDNC_ZDFSQY+"','"
								+ SDNC_FSCD_H + "','" + SDNC_FSMJ_H + "','"+SDNC_ZDFSQY_H+"','"
								+ SDMLC_FSCD + "','" + SDMLC_FSMJ + "','"+SDMLC_ZDFSQY+"','"
								+ SDMLC_FSCD_H + "','" + SDMLC_FSMJ_H + "','"+SDMLC_ZDFSQY_H+"','"
								+ CDM_FSCD + "','" + CDM_FSMJ + "','"+CDM_ZDFSQY+"','"
								+ CDM_FSCD_H + "','" + CDM_FSMJ_H + "','"+CDM_ZDFSQY_H+"','"
								+ YC_FSCD + "','" + YC_FSMJ + "','"+YC_ZDFSQY+"','"
								+ YC_FSCD_H + "','" + YC_FSMJ_H + "','"+YC_ZDFSQY_H+"','"
								+ JM_FSCD + "','" + JM_FSMJ + "','"+JM_ZDFSQY+"','"
								+ JM_FSCD_H + "','" + JM_FSMJ_H + "','"+JM_ZDFSQY_H+"','"
								+ YM_FSCD + "','" + YM_FSMJ + "','"+YM_ZDFSQY+"','"
								+ YM_FSCD_H + "','" + YM_FSMJ_H + "','"+YM_ZDFSQY_H+"','"
								+ SBYYJ_FSCD + "','" + SBYYJ_FSMJ + "','"+SBYYJ_ZDFSQY+"','"
								+ SBYYJ_FSCD_H + "','" + SBYYJ_FSMJ_H + "','"+SBYYJ_ZDFSQY_H+"','"
								+ TH_FSCD + "','" + TH_FSMJ + "','"+TH_ZDFSQY+"','"
								+ TH_FSCD_H + "','" + TH_FSMJ_H + "','"+TH_ZDFSQY_H+"','"
								+ DXHC_FSCD + "','" + DXHC_FSMJ + "','"+DXHC_ZDFSQY+"','"
								+ DXHC_FSCD_H + "','" + DXHC_FSMJ_H + "','"+DXHC_ZDFSQY_H+"','"
								+ QTHC_FSCD + "','" + QTHC_FSMJ + "','"+QTHC_ZDFSQY+"','"
								+ QTHC_FSCD_H + "','" + QTHC_FSMJ_H + "','"+QTHC_ZDFSQY_H+"','"
								+ CHHJ_FSCD + "','" + CHHJ_FSMJ + "','"+CHHJ_ZDFSQY+"','"
								+ CHHJ_FSCD_H + "','" + CHHJ_FSMJ_H + "','"+CHHJ_ZDFSQY_H+"','"
								+ DBB_FSCD + "','" + DBB_FSMJ + "','"+DBB_ZDFSQY+"','"
								+ DBB_FSCD_H + "','" + DBB_FSMJ_H + "','"+DBB_ZDFSQY_H+"','"
								+ XBB_FSCD + "','" + XBB_FSMJ + "','"+XBB_ZDFSQY+"','"
								+ XBB_FSCD_H + "','" + XBB_FSMJ_H + "','"+XBB_ZDFSQY_H+"','"
								+ HBB_FSCD + "','" + HBB_FSMJ + "','"+HBB_ZDFSQY+"','"
								+ HBB_FSCD_H + "','" + HBB_FSMJ_H + "','"+HBB_ZDFSQY_H+"','"
								+ YMWBMYBB_FSCD + "','" + YMWBMYBB_FSMJ + "','"+YMWBMYBB_ZDFSQY+"','"
								+ YMWBMYBB_FSCD_H + "','" + YMWBMYBB_FSMJ_H + "','"+YMWBMYBB_ZDFSQY_H+"','"
								+ WKB_FSCD + "','" + WKB_FSMJ + "','"+WKB_ZDFSQY+"','"
								+ WKB_FSCD_H + "','" + WKB_FSMJ_H + "','"+WKB_ZDFSQY_H+"','"
								+ SHSB_FSCD + "','" + SHSB_FSMJ + "','"+SHSB_ZDFSQY+"','"
								+ SHSB_FSCD_H + "','" + SHSB_FSMJ_H + "','"+SHSB_ZDFSQY_H+"','"
								+ XB_FSCD + "','" + XB_FSMJ + "','"+XB_ZDFSQY+"','"
								+ XB_FSCD_H + "','" + XB_FSMJ_H + "','"+XB_ZDFSQY_H+"','"
								+ LHFB_FSCD + "','" + LHFB_FSMJ + "','"+LHFB_ZDFSQY+"','"
								+ LHFB_FSCD_H + "','" + LHFB_FSMJ_H + "','"+LHFB_ZDFSQY_H+"','"
								+ CSB_FSCD + "','" + CSB_FSMJ + "','"+CSB_ZDFSQY+"','"
								+ CSB_FSCD_H + "','" + CSB_FSMJ_H + "','"+CSB_ZDFSQY_H+"','"
								+ DFB_FSCD + "','" + DFB_FSMJ + "','"+DFB_ZDFSQY+"','"
								+ DFB_FSCD_H + "','" + DFB_FSMJ_H + "','"+DFB_ZDFSQY_H+"','"
								+ QTB_FSCD + "','" + QTB_FSMJ + "','"+QTB_ZDFSQY+"','"
								+ QTB_FSCD_H + "','" + QTB_FSMJ_H + "','"+QTB_ZDFSQY_H+"','"
								+ BHHJ_FSCD + "','" + BHHJ_FSMJ + "','"+BHHJ_ZDFSQY+"','"
								+ BHHJ_FSCD_H + "','" + BHHJ_FSMJ_H + "','"+BHHJ_ZDFSQY_H+"','"
								+ BCHJ_FSCD + "','" + BCHJ_FSMJ + "','"+BCHJ_ZDFSQY+"','"
								+ BCHJ_FSCD_H + "','" + BCHJ_FSMJ_H + "','"+BCHJ_ZDFSQY_H+"','"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"',to_date('" + DCRQ + "','yyyy-MM-dd'))";
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
								+ "CXYM_ZZMJ='" + CXYM_ZZMJ + "',MJHJ_BCNZJ='"+MJHJ_BCNZJ+"',YJYMBH_BCNZJ='"+YJYMBH_BCNZJ+"',"
								+ "ZYZZQY='" + ZYZZQY + "',DQZTZS='"+DQZTZS+"',BSN='"+BSN+"',"
								+ "YDYMM_FSCD='" + YDYMM_FSCD + "',YDYMM_FSMJ='"+YDYMM_FSMJ+"',YDYMM_ZDFSQY='"+YDYMM_ZDFSQY+"',"
								+ "YDYMM_FSCD_H='" + YDYMM_FSCD_H + "',YDYMM_FSMJ_H='"+YDYMM_FSMJ_H+"',YDYMM_ZDFSQY_H='"+YDYMM_ZDFSQY_H+"',"
								+ "EDYMM_FSCD='" + EDYMM_FSCD + "',EDYMM_FSMJ='"+EDYMM_FSMJ+"',EDYMM_ZDFSQY='"+EDYMM_ZDFSQY+"',"
								+ "EDYMM_FSCD_H='" + EDYMM_FSCD_H + "',EDYMM_FSMJ_H='"+EDYMM_FSMJ_H+"',EDYMM_ZDFSQY_H='"+EDYMM_ZDFSQY_H+"',"
								+ "SDYMM_FSCD='" + SDYMM_FSCD + "',SDYMM_FSMJ='"+SDYMM_FSMJ+"',SDYMM_ZDFSQY='"+SDYMM_ZDFSQY+"',"
								+ "SDYMM_FSCD_H='" + SDYMM_FSCD_H + "',SDYMM_FSMJ_H='"+SDYMM_FSMJ_H+"',SDYMM_ZDFSQY_H='"+SDYMM_ZDFSQY_H+"',"
								+ "EDWYE_FSCD='" + EDWYE_FSCD + "',EDWYE_FSMJ='"+EDWYE_FSMJ+"',EDWYE_ZDFSQY='"+EDWYE_ZDFSQY+"',"
								+ "EDWYE_FSCD_H='" + EDWYE_FSCD_H + "',EDWYE_FSMJ_H='"+EDWYE_FSMJ_H+"',EDWYE_ZDFSQY_H='"+EDWYE_ZDFSQY_H+"',"
								+ "EDNC_FSCD='" + EDNC_FSCD + "',EDNC_FSMJ='"+EDNC_FSMJ+"',EDNC_ZDFSQY='"+EDNC_ZDFSQY+"',"
								+ "EDNC_FSCD_H='" + EDNC_FSCD_H + "',EDNC_FSMJ_H='"+EDNC_FSMJ_H+"',EDNC_ZDFSQY_H='"+EDNC_ZDFSQY_H+"',"
								+ "SDNC_FSCD='" + SDNC_FSCD + "',SDNC_FSMJ='"+SDNC_FSMJ+"',SDNC_ZDFSQY='"+SDNC_ZDFSQY+"',"
								+ "SDNC_FSCD_H='" + SDNC_FSCD_H + "',SDNC_FSMJ_H='"+SDNC_FSMJ_H+"',SDNC_ZDFSQY_H='"+SDNC_ZDFSQY_H+"',"
								+ "SDMLC_FSCD='" + SDMLC_FSCD + "',SDMLC_FSMJ='"+SDMLC_FSMJ+"',SDMLC_ZDFSQY='"+SDMLC_ZDFSQY+"',"
								+ "SDMLC_FSCD_H='" + SDMLC_FSCD_H + "',SDMLC_FSMJ_H='"+SDMLC_FSMJ_H+"',SDMLC_ZDFSQY_H='"+SDMLC_ZDFSQY_H+"',"
								+ "CDM_FSCD='" + CDM_FSCD + "',CDM_FSMJ='"+CDM_FSMJ+"',CDM_ZDFSQY='"+CDM_ZDFSQY+"',"
								+ "CDM_FSCD_H='" + CDM_FSCD_H + "',CDM_FSMJ_H='"+CDM_FSMJ_H+"',CDM_ZDFSQY_H='"+CDM_ZDFSQY_H+"',"
								+ "YC_FSCD='" + YC_FSCD + "',YC_FSMJ='"+YC_FSMJ+"',YC_ZDFSQY='"+YC_ZDFSQY+"',"
								+ "YC_FSCD_H='" + YC_FSCD_H + "',YC_FSMJ_H='"+YC_FSMJ_H+"',YC_ZDFSQY_H='"+YC_ZDFSQY_H+"',"
								+ "JM_FSCD='" + JM_FSCD + "',JM_FSMJ='"+JM_FSMJ+"',JM_ZDFSQY='"+JM_ZDFSQY+"',"
								+ "JM_FSCD_H='" + JM_FSCD_H + "',JM_FSMJ_H='"+JM_FSMJ_H+"',JM_ZDFSQY_H='"+JM_ZDFSQY_H+"',"
								+ "YM_FSCD='" + YM_FSCD + "',YM_FSMJ='"+YM_FSMJ+"',YM_ZDFSQY='"+YM_ZDFSQY+"',"
								+ "YM_FSCD_H='" + YM_FSCD_H + "',YM_FSMJ_H='"+YM_FSMJ_H+"',YM_ZDFSQY_H='"+YM_ZDFSQY_H+"',"
								+ "SBYYJ_FSCD='" + SBYYJ_FSCD + "',SBYYJ_FSMJ='"+SBYYJ_FSMJ+"',SBYYJ_ZDFSQY='"+SBYYJ_ZDFSQY+"',"
								+ "SBYYJ_FSCD_H='" + SBYYJ_FSCD_H + "',SBYYJ_FSMJ_H='"+SBYYJ_FSMJ_H+"',SBYYJ_ZDFSQY_H='"+SBYYJ_ZDFSQY_H+"',"
								+ "TH_FSCD='" + TH_FSCD + "',TH_FSMJ='"+TH_FSMJ+"',TH_ZDFSQY='"+TH_ZDFSQY+"',"
								+ "TH_FSCD_H='" + TH_FSCD_H + "',TH_FSMJ_H='"+TH_FSMJ_H+"',TH_ZDFSQY_H='"+TH_ZDFSQY_H+"',"
								+ "DXHC_FSCD='" + DXHC_FSCD + "',DXHC_FSMJ='"+DXHC_FSMJ+"',DXHC_ZDFSQY='"+DXHC_ZDFSQY+"',"
								+ "DXHC_FSCD_H='" + DXHC_FSCD_H + "',DXHC_FSMJ_H='"+DXHC_FSMJ_H+"',DXHC_ZDFSQY_H='"+DXHC_ZDFSQY_H+"',"
								+ "QTHC_FSCD='" + QTHC_FSCD + "',QTHC_FSMJ='"+QTHC_FSMJ+"',QTHC_ZDFSQY='"+QTHC_ZDFSQY+"',"
								+ "QTHC_FSCD_H='" + QTHC_FSCD_H + "',QTHC_FSMJ_H='"+QTHC_FSMJ_H+"',QTHC_ZDFSQY_H='"+QTHC_ZDFSQY_H+"',"
								+ "CHHJ_FSCD='" + CHHJ_FSCD + "',CHHJ_FSMJ='"+CHHJ_FSMJ+"',CHHJ_ZDFSQY='"+CHHJ_ZDFSQY+"',"
								+ "CHHJ_FSCD_H='" + CHHJ_FSCD_H + "',CHHJ_FSMJ_H='"+CHHJ_FSMJ_H+"',CHHJ_ZDFSQY_H='"+CHHJ_ZDFSQY_H+"',"
								+ "DBB_FSCD='" + DBB_FSCD + "',DBB_FSMJ='"+DBB_FSMJ+"',DBB_ZDFSQY='"+DBB_ZDFSQY+"',"
								+ "DBB_FSCD_H='" + DBB_FSCD_H + "',DBB_FSMJ_H='"+DBB_FSMJ_H+"',DBB_ZDFSQY_H='"+DBB_ZDFSQY_H+"',"
								+ "XBB_FSCD='" + XBB_FSCD + "',XBB_FSMJ='"+XBB_FSMJ+"',XBB_ZDFSQY='"+XBB_ZDFSQY+"',"
								+ "XBB_FSCD_H='" + XBB_FSCD_H + "',XBB_FSMJ_H='"+XBB_FSMJ_H+"',XBB_ZDFSQY_H='"+XBB_ZDFSQY_H+"',"
								+ "HBB_FSCD='" + HBB_FSCD + "',HBB_FSMJ='"+HBB_FSMJ+"',HBB_ZDFSQY='"+HBB_ZDFSQY+"',"
								+ "HBB_FSCD_H='" + HBB_FSCD_H + "',HBB_FSMJ_H='"+HBB_FSMJ_H+"',HBB_ZDFSQY_H='"+HBB_ZDFSQY_H+"',"
								+ "YMWBMYBB_FSCD='" + YMWBMYBB_FSCD + "',YMWBMYBB_FSMJ='"+YMWBMYBB_FSMJ+"',YMWBMYBB_ZDFSQY='"+YMWBMYBB_ZDFSQY+"',"
								+ "YMWBMYBB_FSCD_H='" + YMWBMYBB_FSCD_H + "',YMWBMYBB_FSMJ_H='"+YMWBMYBB_FSMJ_H+"',YMWBMYBB_ZDFSQY_H='"+YMWBMYBB_ZDFSQY_H+"',"
								+ "WKB_FSCD='" + WKB_FSCD + "',WKB_FSMJ='"+WKB_FSMJ+"',WKB_ZDFSQY='"+WKB_ZDFSQY+"',"
								+ "WKB_FSCD_H='" + WKB_FSCD_H + "',WKB_FSMJ_H='"+WKB_FSMJ_H+"',WKB_ZDFSQY_H='"+WKB_ZDFSQY_H+"',"
								+ "SHSB_FSCD='" + SHSB_FSCD + "',SHSB_FSMJ='"+SHSB_FSMJ+"',SHSB_ZDFSQY='"+SHSB_ZDFSQY+"',"
								+ "SHSB_FSCD_H='" + SHSB_FSCD_H + "',SHSB_FSMJ_H='"+SHSB_FSMJ_H+"',SHSB_ZDFSQY_H='"+SHSB_ZDFSQY_H+"',"
								+ "XB_FSCD='" + XB_FSCD + "',XB_FSMJ='"+XB_FSMJ+"',XB_ZDFSQY='"+XB_ZDFSQY+"',"
								+ "XB_FSCD_H='" + XB_FSCD_H + "',XB_FSMJ_H='"+XB_FSMJ_H+"',XB_ZDFSQY_H='"+XB_ZDFSQY_H+"',"
								+ "LHFB_FSCD='" + LHFB_FSCD + "',LHFB_FSMJ='"+LHFB_FSMJ+"',LHFB_ZDFSQY='"+LHFB_ZDFSQY+"',"
								+ "LHFB_FSCD_H='" + LHFB_FSCD_H + "',LHFB_FSMJ_H='"+LHFB_FSMJ_H+"',LHFB_ZDFSQY_H='"+LHFB_ZDFSQY_H+"',"
								+ "CSB_FSCD='" + CSB_FSCD + "',CSB_FSMJ='"+CSB_FSMJ+"',CSB_ZDFSQY='"+CSB_ZDFSQY+"',"
								+ "CSB_FSCD_H='" + CSB_FSCD_H + "',CSB_FSMJ_H='"+CSB_FSMJ_H+"',CSB_ZDFSQY_H='"+CSB_ZDFSQY_H+"',"
								+ "DFB_FSCD='" + DFB_FSCD + "',DFB_FSMJ='"+DFB_FSMJ+"',DFB_ZDFSQY='"+DFB_ZDFSQY+"',"
								+ "DFB_FSCD_H='" + DFB_FSCD_H + "',DFB_FSMJ_H='"+DFB_FSMJ_H+"',DFB_ZDFSQY_H='"+DFB_ZDFSQY_H+"',"
								+ "QTB_FSCD='" + QTB_FSCD + "',QTB_FSMJ='"+QTB_FSMJ+"',QTB_ZDFSQY='"+QTB_ZDFSQY+"',"
								+ "QTB_FSCD_H='" + QTB_FSCD_H + "',QTB_FSMJ_H='"+QTB_FSMJ_H+"',QTB_ZDFSQY_H='"+QTB_ZDFSQY_H+"',"
								+ "BHHJ_FSCD='" + BHHJ_FSCD + "',BHHJ_FSMJ='"+BHHJ_FSMJ+"',BHHJ_ZDFSQY='"+BHHJ_ZDFSQY+"',"
								+ "BHHJ_FSCD_H='" + BHHJ_FSCD_H + "',BHHJ_FSMJ_H='"+BHHJ_FSMJ_H+"',BHHJ_ZDFSQY_H='"+BHHJ_ZDFSQY_H+"',"
								+ "BCHJ_FSCD='" + BCHJ_FSCD + "',BCHJ_FSMJ='"+BCHJ_FSMJ+"',BCHJ_ZDFSQY='"+BCHJ_ZDFSQY+"',"
								+ "BCHJ_FSCD_H='" + BCHJ_FSCD_H + "',BCHJ_FSMJ_H='"+BCHJ_FSMJ_H+"',BCHJ_ZDFSQY_H='"+BCHJ_ZDFSQY_H+"',"
								+ "BBLX='"+BBLX+"',"
								+ "ZT='" + ZT+"',"
								+ "DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd')"
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
				//玉米病虫害跨年预测表
				if (fwd.equals("Q014")) {
					String YDYMM_FSCD = so.httpServletRequest.getParameter("YDYMM_FSCD");
					String YDYMM_FSMJ = so.httpServletRequest.getParameter("YDYMM_FSMJ");
					String YDYMM_ZDFSQY = so.httpServletRequest.getParameter("YDYMM_ZDFSQY");
					String YDYMM_FSCD_H = so.httpServletRequest.getParameter("YDYMM_FSCD_H");
					String YDYMM_FSMJ_H = so.httpServletRequest.getParameter("YDYMM_FSMJ_H");
					String YDYMM_ZDFSQY_H = so.httpServletRequest.getParameter("YDYMM_ZDFSQY_H");
					String EDYMM_FSCD  = so.httpServletRequest.getParameter("EDYMM_FSCD");
					String EDYMM_FSMJ = so.httpServletRequest.getParameter("EDYMM_FSMJ");
					String EDYMM_ZDFSQY = so.httpServletRequest.getParameter("EDYMM_ZDFSQY");
					String EDYMM_FSCD_H = so.httpServletRequest.getParameter("EDYMM_FSCD_H");
					String EDYMM_FSMJ_H = so.httpServletRequest.getParameter("EDYMM_FSMJ_H");
					String EDYMM_ZDFSQY_H = so.httpServletRequest.getParameter("EDYMM_ZDFSQY_H");
					String SDYMM_FSCD  = so.httpServletRequest.getParameter("SDYMM_FSCD");
					String SDYMM_FSMJ = so.httpServletRequest.getParameter("SDYMM_FSMJ");
					String SDYMM_ZDFSQY = so.httpServletRequest.getParameter("SDYMM_ZDFSQY");
					String SDYMM_FSCD_H = so.httpServletRequest.getParameter("SDYMM_FSCD_H");
					String SDYMM_FSMJ_H = so.httpServletRequest.getParameter("SDYMM_FSMJ_H");
					String SDYMM_ZDFSQY_H = so.httpServletRequest.getParameter("SDYMM_ZDFSQY_H");
					String EDWYE_FSCD = so.httpServletRequest.getParameter("EDWYE_FSCD");
					String EDWYE_FSMJ = so.httpServletRequest.getParameter("EDWYE_FSMJ");
					String EDWYE_ZDFSQY = so.httpServletRequest.getParameter("EDWYE_ZDFSQY");
					String EDWYE_FSCD_H = so.httpServletRequest.getParameter("EDWYE_FSCD_H");
					String EDWYE_FSMJ_H = so.httpServletRequest.getParameter("EDWYE_FSMJ_H");
					String EDWYE_ZDFSQY_H = so.httpServletRequest.getParameter("EDWYE_ZDFSQY_H");
					String EDNC_FSCD = so.httpServletRequest.getParameter("EDNC_FSCD");
					String EDNC_FSMJ = so.httpServletRequest.getParameter("EDNC_FSMJ");
					String EDNC_ZDFSQY = so.httpServletRequest.getParameter("EDNC_ZDFSQY");
					String EDNC_FSCD_H = so.httpServletRequest.getParameter("EDNC_FSCD_H");
					String EDNC_FSMJ_H = so.httpServletRequest.getParameter("EDNC_FSMJ_H");
					String EDNC_ZDFSQY_H = so.httpServletRequest.getParameter("EDNC_ZDFSQY_H");
					String SDNC_FSCD = so.httpServletRequest.getParameter("SDNC_FSCD");
					String SDNC_FSMJ = so.httpServletRequest.getParameter("SDNC_FSMJ");
					String SDNC_ZDFSQY = so.httpServletRequest.getParameter("SDNC_ZDFSQY");
					String SDNC_FSCD_H = so.httpServletRequest.getParameter("SDNC_FSCD_H");
					String SDNC_FSMJ_H = so.httpServletRequest.getParameter("SDNC_FSMJ_H");
					String SDNC_ZDFSQY_H = so.httpServletRequest.getParameter("SDNC_ZDFSQY_H");
					String EDMLC_FSCD = so.httpServletRequest.getParameter("EDMLC_FSCD");
					String EDMLC_FSMJ = so.httpServletRequest.getParameter("EDMLC_FSMJ");
					String EDMLC_ZDFSQY = "";
					String EDMLC_FSCD_H = so.httpServletRequest.getParameter("EDMLC_FSCD_H");
					String EDMLC_FSMJ_H = so.httpServletRequest.getParameter("EDMLC_FSMJ_H");
					String EDMLC_ZDFSQY_H = "";
					String SDMLC_FSCD = so.httpServletRequest.getParameter("SDMLC_FSCD");
					String SDMLC_FSMJ = so.httpServletRequest.getParameter("SDMLC_FSMJ");
					String SDMLC_ZDFSQY = so.httpServletRequest.getParameter("SDMLC_ZDFSQY");
					String SDMLC_FSCD_H = so.httpServletRequest.getParameter("SDMLC_FSCD_H");
					String SDMLC_FSMJ_H = so.httpServletRequest.getParameter("SDMLC_FSMJ_H");
					String SDMLC_ZDFSQY_H = so.httpServletRequest.getParameter("SDMLC_ZDFSQY_H");
					String FDMLC_FSCD = so.httpServletRequest.getParameter("FDMLC_FSCD");
					String FDMLC_FSMJ = so.httpServletRequest.getParameter("FDMLC_FSMJ");
					String FDMLC_ZDFSQY = "";
					String FDMLC_FSCD_H = so.httpServletRequest.getParameter("FDMLC_FSCD_H");
					String FDMLC_FSMJ_H = so.httpServletRequest.getParameter("FDMLC_FSMJ_H");
					String FDMLC_ZDFSQY_H = "";
					String CDM_FSCD = so.httpServletRequest.getParameter("CDM_FSCD");
					String CDM_FSMJ = so.httpServletRequest.getParameter("CDM_FSMJ");
					String CDM_ZDFSQY = "";
					String CDM_FSCD_H = so.httpServletRequest.getParameter("CDM_FSCD_H");
					String CDM_FSMJ_H = so.httpServletRequest.getParameter("CDM_FSMJ_H");
					String CDM_ZDFSQY_H = "";
					String YC_FSCD = so.httpServletRequest.getParameter("YC_FSCD");
					String YC_FSMJ = so.httpServletRequest.getParameter("YC_FSMJ");
					String YC_ZDFSQY = so.httpServletRequest.getParameter("YC_ZDFSQY");
					String YC_FSCD_H = so.httpServletRequest.getParameter("YC_FSCD_H");
					String YC_FSMJ_H = so.httpServletRequest.getParameter("YC_FSMJ_H");
					String YC_ZDFSQY_H = so.httpServletRequest.getParameter("YC_ZDFSQY_H");
					String JM_FSCD = so.httpServletRequest.getParameter("JM_FSCD");
					String JM_FSMJ = so.httpServletRequest.getParameter("JM_FSMJ");
					String JM_ZDFSQY = so.httpServletRequest.getParameter("JM_ZDFSQY");
					String JM_FSCD_H = so.httpServletRequest.getParameter("JM_FSCD_H");
					String JM_FSMJ_H = so.httpServletRequest.getParameter("JM_FSMJ_H");
					String JM_ZDFSQY_H = so.httpServletRequest.getParameter("JM_ZDFSQY_H");
					String YM_FSCD = so.httpServletRequest.getParameter("YM_FSCD");
					String YM_FSMJ = so.httpServletRequest.getParameter("YM_FSMJ");
					String YM_ZDFSQY = so.httpServletRequest.getParameter("YM_ZDFSQY");
					String YM_FSCD_H = so.httpServletRequest.getParameter("YM_FSCD_H");
					String YM_FSMJ_H = so.httpServletRequest.getParameter("YM_FSMJ_H");
					String YM_ZDFSQY_H = "";
					String SBYYJ_FSCD = so.httpServletRequest.getParameter("SBYYJ_FSCD");
					String SBYYJ_FSMJ = so.httpServletRequest.getParameter("SBYYJ_FSMJ");
					String SBYYJ_ZDFSQY = so.httpServletRequest.getParameter("SBYYJ_ZDFSQY");
					String SBYYJ_FSCD_H = so.httpServletRequest.getParameter("SBYYJ_FSCD_H");
					String SBYYJ_FSMJ_H = so.httpServletRequest.getParameter("SBYYJ_FSMJ_H");
					String SBYYJ_ZDFSQY_H = so.httpServletRequest.getParameter("SBYYJ_ZDFSQY_H");
					String TH_FSCD = so.httpServletRequest.getParameter("TH_FSCD");
					String TH_FSMJ = so.httpServletRequest.getParameter("TH_FSMJ");
					String TH_ZDFSQY = so.httpServletRequest.getParameter("TH_ZDFSQY");
					String TH_FSCD_H = so.httpServletRequest.getParameter("TH_FSCD_H");
					String TH_FSMJ_H = so.httpServletRequest.getParameter("TH_FSMJ_H");
					String TH_ZDFSQY_H = so.httpServletRequest.getParameter("TH_ZDFSQY_H");
					String DXHC_FSCD = so.httpServletRequest.getParameter("DXHC_FSCD");
					String DXHC_FSMJ = so.httpServletRequest.getParameter("DXHC_FSMJ");
					String DXHC_ZDFSQY = so.httpServletRequest.getParameter("DXHC_ZDFSQY");
					String DXHC_FSCD_H = so.httpServletRequest.getParameter("DXHC_FSCD_H");
					String DXHC_FSMJ_H = so.httpServletRequest.getParameter("DXHC_FSMJ_H");
					String DXHC_ZDFSQY_H = so.httpServletRequest.getParameter("DXHC_ZDFSQY_H");
					String QTHC_FSCD = so.httpServletRequest.getParameter("QTHC_FSCD");
					String QTHC_FSMJ = so.httpServletRequest.getParameter("QTHC_FSMJ");
					String QTHC_ZDFSQY = so.httpServletRequest.getParameter("QTHC_ZDFSQY");
					String QTHC_FSCD_H = so.httpServletRequest.getParameter("QTHC_FSCD_H");
					String QTHC_FSMJ_H = so.httpServletRequest.getParameter("QTHC_FSMJ_H");
					String QTHC_ZDFSQY_H = so.httpServletRequest.getParameter("QTHC_ZDFSQY_H");
					String CHHJ_FSCD = "";
					String CHHJ_FSMJ = so.httpServletRequest.getParameter("CHHJ_FSMJ");
					String CHHJ_ZDFSQY = so.httpServletRequest.getParameter("CHHJ_ZDFSQY");
					String CHHJ_FSCD_H ="";
					String CHHJ_FSMJ_H = so.httpServletRequest.getParameter("CHHJ_FSMJ_H");
					String CHHJ_ZDFSQY_H = so.httpServletRequest.getParameter("CHHJ_ZDFSQY_H");
					String DBB_FSCD = so.httpServletRequest.getParameter("DBB_FSCD");
					String DBB_FSMJ = so.httpServletRequest.getParameter("DBB_FSMJ");
					String DBB_ZDFSQY = so.httpServletRequest.getParameter("DBB_ZDFSQY");
					String DBB_FSCD_H = so.httpServletRequest.getParameter("DBB_FSCD_H");
					String DBB_FSMJ_H = so.httpServletRequest.getParameter("DBB_FSMJ_H");
					String DBB_ZDFSQY_H = so.httpServletRequest.getParameter("DBB_ZDFSQY_H");
					String XBB_FSCD = so.httpServletRequest.getParameter("XBB_FSCD");
					String XBB_FSMJ = so.httpServletRequest.getParameter("XBB_FSMJ");
					String XBB_ZDFSQY = so.httpServletRequest.getParameter("XBB_ZDFSQY");
					String XBB_FSCD_H = so.httpServletRequest.getParameter("XBB_FSCD_H");
					String XBB_FSMJ_H = so.httpServletRequest.getParameter("XBB_FSMJ_H");
					String XBB_ZDFSQY_H = so.httpServletRequest.getParameter("XBB_ZDFSQY_H");
					String HBB_FSCD = so.httpServletRequest.getParameter("HBB_FSCD");
					String HBB_FSMJ = so.httpServletRequest.getParameter("HBB_FSMJ");
					String HBB_ZDFSQY = so.httpServletRequest.getParameter("HBB_ZDFSQY");
					String HBB_FSCD_H = so.httpServletRequest.getParameter("HBB_FSCD_H");
					String HBB_FSMJ_H = so.httpServletRequest.getParameter("HBB_FSMJ_H");
					String HBB_ZDFSQY_H = so.httpServletRequest.getParameter("HBB_ZDFSQY_H");
					String YMWBMYBB_FSCD = so.httpServletRequest.getParameter("YMWBMYBB_FSCD");
					String YMWBMYBB_FSMJ = so.httpServletRequest.getParameter("YMWBMYBB_FSMJ");
					String YMWBMYBB_ZDFSQY = so.httpServletRequest.getParameter("YMWBMYBB_ZDFSQY");
					String YMWBMYBB_FSCD_H = so.httpServletRequest.getParameter("YMWBMYBB_FSCD_H");
					String YMWBMYBB_FSMJ_H = so.httpServletRequest.getParameter("YMWBMYBB_FSMJ_H");
					String YMWBMYBB_ZDFSQY_H = so.httpServletRequest.getParameter("YMWBMYBB_ZDFSQY_H");
					String WKB_FSCD = so.httpServletRequest.getParameter("WKB_FSCD");
					String WKB_FSMJ = so.httpServletRequest.getParameter("WKB_FSMJ");
					String WKB_ZDFSQY = so.httpServletRequest.getParameter("WKB_ZDFSQY");
					String WKB_FSCD_H = so.httpServletRequest.getParameter("WKB_FSCD_H");
					String WKB_FSMJ_H = so.httpServletRequest.getParameter("WKB_FSMJ_H");
					String WKB_ZDFSQY_H = so.httpServletRequest.getParameter("WKB_ZDFSQY_H");
					String SHSB_FSCD = so.httpServletRequest.getParameter("SHSB_FSCD");
					String SHSB_FSMJ = so.httpServletRequest.getParameter("SHSB_FSMJ");
					String SHSB_ZDFSQY = "";
					String SHSB_FSCD_H = so.httpServletRequest.getParameter("SHSB_FSCD_H");
					String SHSB_FSMJ_H = so.httpServletRequest.getParameter("SHSB_FSMJ_H");
					String SHSB_ZDFSQY_H = so.httpServletRequest.getParameter("SHSB_ZDFSQY_H");
					String XB_FSCD = so.httpServletRequest.getParameter("XB_FSCD");
					String XB_FSMJ = so.httpServletRequest.getParameter("XB_FSMJ");
					String XB_ZDFSQY = so.httpServletRequest.getParameter("XB_ZDFSQY");
					String XB_FSCD_H = so.httpServletRequest.getParameter("XB_FSCD_H");
					String XB_FSMJ_H = so.httpServletRequest.getParameter("XB_FSMJ_H");
					String XB_ZDFSQY_H = so.httpServletRequest.getParameter("XB_ZDFSQY_H");
					String LHFB_FSCD = so.httpServletRequest.getParameter("LHFB_FSCD");
					String LHFB_FSMJ = so.httpServletRequest.getParameter("LHFB_FSMJ");
					String LHFB_ZDFSQY = so.httpServletRequest.getParameter("LHFB_ZDFSQY");
					String LHFB_FSCD_H = so.httpServletRequest.getParameter("LHFB_FSCD_H");
					String LHFB_FSMJ_H = so.httpServletRequest.getParameter("LHFB_FSMJ_H");
					String LHFB_ZDFSQY_H = so.httpServletRequest.getParameter("LHFB_ZDFSQY_H");
					String CSB_FSCD = so.httpServletRequest.getParameter("CSB_FSCD");
					String CSB_FSMJ = so.httpServletRequest.getParameter("CSB_FSMJ");
					String CSB_ZDFSQY = so.httpServletRequest.getParameter("CSB_ZDFSQY");
					String CSB_FSCD_H = so.httpServletRequest.getParameter("CSB_FSCD_H");
					String CSB_FSMJ_H = so.httpServletRequest.getParameter("CSB_FSMJ_H");
					String CSB_ZDFSQY_H = so.httpServletRequest.getParameter("CSB_ZDFSQY_H");
					String DFB_FSCD = so.httpServletRequest.getParameter("DFB_FSCD");
					String DFB_FSMJ = so.httpServletRequest.getParameter("DFB_FSMJ");
					String DFB_ZDFSQY = "";
					String DFB_FSCD_H = so.httpServletRequest.getParameter("DFB_FSCD_H");
					String DFB_FSMJ_H = so.httpServletRequest.getParameter("DFB_FSMJ_H");
					String DFB_ZDFSQY_H = "";
					String QTB_FSCD = so.httpServletRequest.getParameter("QTB_FSCD");
					String QTB_FSMJ = so.httpServletRequest.getParameter("QTB_FSMJ");
					String QTB_ZDFSQY = so.httpServletRequest.getParameter("QTB_ZDFSQY");
					String QTB_FSCD_H = so.httpServletRequest.getParameter("QTB_FSCD_H");
					String QTB_FSMJ_H = so.httpServletRequest.getParameter("QTB_FSMJ_H");
					String QTB_ZDFSQY_H = so.httpServletRequest.getParameter("QTB_ZDFSQY_H");
					String BHHJ_FSCD = "";
					String BHHJ_FSMJ = so.httpServletRequest.getParameter("BHHJ_FSMJ");
					String BHHJ_ZDFSQY = so.httpServletRequest.getParameter("BHHJ_ZDFSQY");
					String BHHJ_FSCD_H = "";
					String BHHJ_FSMJ_H = so.httpServletRequest.getParameter("BHHJ_FSMJ_H");
					String BHHJ_ZDFSQY_H = so.httpServletRequest.getParameter("BHHJ_ZDFSQY_H");
					String BCHJ_FSCD = "";
					String BCHJ_FSMJ = so.httpServletRequest.getParameter("BCHJ_FSMJ");
					String BCHJ_ZDFSQY = so.httpServletRequest.getParameter("BCHJ_ZDFSQY");
					String BCHJ_FSCD_H = "";
					String BCHJ_FSMJ_H = so.httpServletRequest.getParameter("BCHJ_FSMJ_H");
					String BCHJ_ZDFSQY_H = so.httpServletRequest.getParameter("BCHJ_ZDFSQY_H");
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d014.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YDYMM_FSCD,YDYMM_FSMJ,YDYMM_ZDFSQY,"
								+ "YDYMM_FSCD_H,YDYMM_FSMJ_H,YDYMM_ZDFSQY_H,"
								+ "EDYMM_FSCD,EDYMM_FSMJ,EDYMM_ZDFSQY,"
								+ "EDYMM_FSCD_H,EDYMM_FSMJ_H,EDYMM_ZDFSQY_H,"
								+ "SDYMM_FSCD,SDYMM_FSMJ,SDYMM_ZDFSQY,"
								+ "SDYMM_FSCD_H,SDYMM_FSMJ_H,SDYMM_ZDFSQY_H,"
								+ "EDWYE_FSCD,EDWYE_FSMJ,EDWYE_ZDFSQY,"
								+ "EDWYE_FSCD_H,EDWYE_FSMJ_H,EDWYE_ZDFSQY_H,"
								+ "EDNC_FSCD,EDNC_FSMJ,EDNC_ZDFSQY,"
								+ "EDNC_FSCD_H,EDNC_FSMJ_H,EDNC_ZDFSQY_H,"
								+ "SDNC_FSCD,SDNC_FSMJ,SDNC_ZDFSQY,"
								+ "SDNC_FSCD_H,SDNC_FSMJ_H,SDNC_ZDFSQY_H,"
								+ "EDMLC_FSCD,EDMLC_FSMJ,EDMLC_ZDFSQY,"
								+ "EDMLC_FSCD_H,EDMLC_FSMJ_H,EDMLC_ZDFSQY_H,"
								+ "SDMLC_FSCD,SDMLC_FSMJ,SDMLC_ZDFSQY,"
								+ "SDMLC_FSCD_H,SDMLC_FSMJ_H,SDMLC_ZDFSQY_H,"
								+ "FDMLC_FSCD,FDMLC_FSMJ,FDMLC_ZDFSQY,"
								+ "FDMLC_FSCD_H,FDMLC_FSMJ_H,FDMLC_ZDFSQY_H,"
								+ "CDM_FSCD,CDM_FSMJ,CDM_ZDFSQY,"
								+ "CDM_FSCD_H,CDM_FSMJ_H,CDM_ZDFSQY_H,"
								+ "YC_FSCD,YC_FSMJ,YC_ZDFSQY,"
								+ "YC_FSCD_H,YC_FSMJ_H,YC_ZDFSQY_H,"
								+ "JM_FSCD,JM_FSMJ,JM_ZDFSQY,"
								+ "JM_FSCD_H,JM_FSMJ_H,JM_ZDFSQY_H,"
								+ "YM_FSCD,YM_FSMJ,YM_ZDFSQY,"
								+ "YM_FSCD_H,YM_FSMJ_H,YM_ZDFSQY_H,"
								+ "SBYYJ_FSCD,SBYYJ_FSMJ,SBYYJ_ZDFSQY,"
								+ "SBYYJ_FSCD_H,SBYYJ_FSMJ_H,SBYYJ_ZDFSQY_H,"
								+ "TH_FSCD,TH_FSMJ,TH_ZDFSQY,"
								+ "TH_FSCD_H,TH_FSMJ_H,TH_ZDFSQY_H,"
								+ "DXHC_FSCD,DXHC_FSMJ,DXHC_ZDFSQY,"
								+ "DXHC_FSCD_H,DXHC_FSMJ_H,DXHC_ZDFSQY_H,"
								+ "QTHC_FSCD,QTHC_FSMJ,QTHC_ZDFSQY,"
								+ "QTHC_FSCD_H,QTHC_FSMJ_H,QTHC_ZDFSQY_H,"
								+ "CHHJ_FSCD,CHHJ_FSMJ,CHHJ_ZDFSQY,"
								+ "CHHJ_FSCD_H,CHHJ_FSMJ_H,CHHJ_ZDFSQY_H,"
								+ "DBB_FSCD,DBB_FSMJ,DBB_ZDFSQY,"
								+ "DBB_FSCD_H,DBB_FSMJ_H,DBB_ZDFSQY_H,"
								+ "XBB_FSCD,XBB_FSMJ,XBB_ZDFSQY,"
								+ "XBB_FSCD_H,XBB_FSMJ_H,XBB_ZDFSQY_H,"
								+ "HBB_FSCD,HBB_FSMJ,HBB_ZDFSQY,"
								+ "HBB_FSCD_H,HBB_FSMJ_H,HBB_ZDFSQY_H,"
								+ "YMWBMYBB_FSCD,YMWBMYBB_FSMJ,YMWBMYBB_ZDFSQY,"
								+ "YMWBMYBB_FSCD_H,YMWBMYBB_FSMJ_H,YMWBMYBB_ZDFSQY_H,"
								+ "WKB_FSCD,WKB_FSMJ,WKB_ZDFSQY,"
								+ "WKB_FSCD_H,WKB_FSMJ_H,WKB_ZDFSQY_H,"
								+ "SHSB_FSCD,SHSB_FSMJ,SHSB_ZDFSQY,"
								+ "SHSB_FSCD_H,SHSB_FSMJ_H,SHSB_ZDFSQY_H,"
								+ "XB_FSCD,XB_FSMJ,XB_ZDFSQY,"
								+ "XB_FSCD_H,XB_FSMJ_H,XB_ZDFSQY_H,"
								+ "LHFB_FSCD,LHFB_FSMJ,LHFB_ZDFSQY,"
								+ "LHFB_FSCD_H,LHFB_FSMJ_H,LHFB_ZDFSQY_H,"
								+ "CSB_FSCD,CSB_FSMJ,CSB_ZDFSQY,"
								+ "CSB_FSCD_H,CSB_FSMJ_H,CSB_ZDFSQY_H,"
								+ "DFB_FSCD,DFB_FSMJ,DFB_ZDFSQY,"
								+ "DFB_FSCD_H,DFB_FSMJ_H,DFB_ZDFSQY_H,"
								+ "QTB_FSCD,QTB_FSMJ,QTB_ZDFSQY,"
								+ "QTB_FSCD_H,QTB_FSMJ_H,QTB_ZDFSQY_H,"
								+ "BHHJ_FSCD,BHHJ_FSMJ,BHHJ_ZDFSQY,"
								+ "BHHJ_FSCD_H,BHHJ_FSMJ_H,BHHJ_ZDFSQY_H,"
								+ "BCHJ_FSCD,BCHJ_FSMJ,BCHJ_ZDFSQY,"
								+ "BCHJ_FSCD_H,BCHJ_FSMJ_H,BCHJ_ZDFSQY_H,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT,DCRQ) VALUES ('" + JFID + "','"
								+ YDYMM_FSCD + "','" + YDYMM_FSMJ + "','"+YDYMM_ZDFSQY+"','"
								+ YDYMM_FSCD_H + "','" + YDYMM_FSMJ_H + "','"+YDYMM_ZDFSQY_H+"','"
								+ EDYMM_FSCD + "','" + EDYMM_FSMJ + "','"+EDYMM_ZDFSQY+"','"
								+ EDYMM_FSCD_H + "','" + EDYMM_FSMJ_H + "','"+EDYMM_ZDFSQY_H+"','"
								+ SDYMM_FSCD + "','" + SDYMM_FSMJ + "','"+SDYMM_ZDFSQY+"','"
								+ SDYMM_FSCD_H + "','" + SDYMM_FSMJ_H + "','"+SDYMM_ZDFSQY_H+"','"
								+ EDWYE_FSCD + "','" + EDWYE_FSMJ + "','"+EDWYE_ZDFSQY+"','"
								+ EDWYE_FSCD_H + "','" + EDWYE_FSMJ_H + "','"+EDWYE_ZDFSQY_H+"','"
								+ EDNC_FSCD + "','" + EDNC_FSMJ + "','"+EDNC_ZDFSQY+"','"
								+ EDNC_FSCD_H + "','" + EDNC_FSMJ_H + "','"+EDNC_ZDFSQY_H+"','"
								+ SDNC_FSCD + "','" + SDNC_FSMJ + "','"+SDNC_ZDFSQY+"','"
								+ SDNC_FSCD_H + "','" + SDNC_FSMJ_H + "','"+SDNC_ZDFSQY_H+"','"
								+ EDMLC_FSCD + "','" + EDMLC_FSMJ + "','"+EDMLC_ZDFSQY+"','"
								+ EDMLC_FSCD_H + "','" + EDMLC_FSMJ_H + "','"+EDMLC_ZDFSQY_H+"','"
								+ SDMLC_FSCD + "','" + SDMLC_FSMJ + "','"+SDMLC_ZDFSQY+"','"
								+ SDMLC_FSCD_H + "','" + SDMLC_FSMJ_H + "','"+SDMLC_ZDFSQY_H+"','"
								+ FDMLC_FSCD + "','" + FDMLC_FSMJ + "','"+FDMLC_ZDFSQY+"','"
								+ FDMLC_FSCD_H + "','" + FDMLC_FSMJ_H + "','"+FDMLC_ZDFSQY_H+"','"
								+ CDM_FSCD + "','" + CDM_FSMJ + "','"+CDM_ZDFSQY+"','"
								+ CDM_FSCD_H + "','" + CDM_FSMJ_H + "','"+CDM_ZDFSQY_H+"','"
								+ YC_FSCD + "','" + YC_FSMJ + "','"+YC_ZDFSQY+"','"
								+ YC_FSCD_H + "','" + YC_FSMJ_H + "','"+YC_ZDFSQY_H+"','"
								+ JM_FSCD + "','" + JM_FSMJ + "','"+JM_ZDFSQY+"','"
								+ JM_FSCD_H + "','" + JM_FSMJ_H + "','"+JM_ZDFSQY_H+"','"
								+ YM_FSCD + "','" + YM_FSMJ + "','"+YM_ZDFSQY+"','"
								+ YM_FSCD_H + "','" + YM_FSMJ_H + "','"+YM_ZDFSQY_H+"','"
								+ SBYYJ_FSCD + "','" + SBYYJ_FSMJ + "','"+SBYYJ_ZDFSQY+"','"
								+ SBYYJ_FSCD_H + "','" + SBYYJ_FSMJ_H + "','"+SBYYJ_ZDFSQY_H+"','"
								+ TH_FSCD + "','" + TH_FSMJ + "','"+TH_ZDFSQY+"','"
								+ TH_FSCD_H + "','" + TH_FSMJ_H + "','"+TH_ZDFSQY_H+"','"
								+ DXHC_FSCD + "','" + DXHC_FSMJ + "','"+DXHC_ZDFSQY+"','"
								+ DXHC_FSCD_H + "','" + DXHC_FSMJ_H + "','"+DXHC_ZDFSQY_H+"','"
								+ QTHC_FSCD + "','" + QTHC_FSMJ + "','"+QTHC_ZDFSQY+"','"
								+ QTHC_FSCD_H + "','" + QTHC_FSMJ_H + "','"+QTHC_ZDFSQY_H+"','"
								+ CHHJ_FSCD + "','" + CHHJ_FSMJ + "','"+CHHJ_ZDFSQY+"','"
								+ CHHJ_FSCD_H + "','" + CHHJ_FSMJ_H + "','"+CHHJ_ZDFSQY_H+"','"
								+ DBB_FSCD + "','" + DBB_FSMJ + "','"+DBB_ZDFSQY+"','"
								+ DBB_FSCD_H + "','" + DBB_FSMJ_H + "','"+DBB_ZDFSQY_H+"','"
								+ XBB_FSCD + "','" + XBB_FSMJ + "','"+XBB_ZDFSQY+"','"
								+ XBB_FSCD_H + "','" + XBB_FSMJ_H + "','"+XBB_ZDFSQY_H+"','"
								+ HBB_FSCD + "','" + HBB_FSMJ + "','"+HBB_ZDFSQY+"','"
								+ HBB_FSCD_H + "','" + HBB_FSMJ_H + "','"+HBB_ZDFSQY_H+"','"
								+ YMWBMYBB_FSCD + "','" + YMWBMYBB_FSMJ + "','"+YMWBMYBB_ZDFSQY+"','"
								+ YMWBMYBB_FSCD_H + "','" + YMWBMYBB_FSMJ_H + "','"+YMWBMYBB_ZDFSQY_H+"','"
								+ WKB_FSCD + "','" + WKB_FSMJ + "','"+WKB_ZDFSQY+"','"
								+ WKB_FSCD_H + "','" + WKB_FSMJ_H + "','"+WKB_ZDFSQY_H+"','"
								+ SHSB_FSCD + "','" + SHSB_FSMJ + "','"+SHSB_ZDFSQY+"','"
								+ SHSB_FSCD_H + "','" + SHSB_FSMJ_H + "','"+SHSB_ZDFSQY_H+"','"
								+ XB_FSCD + "','" + XB_FSMJ + "','"+XB_ZDFSQY+"','"
								+ XB_FSCD_H + "','" + XB_FSMJ_H + "','"+XB_ZDFSQY_H+"','"
								+ LHFB_FSCD + "','" + LHFB_FSMJ + "','"+LHFB_ZDFSQY+"','"
								+ LHFB_FSCD_H + "','" + LHFB_FSMJ_H + "','"+LHFB_ZDFSQY_H+"','"
								+ CSB_FSCD + "','" + CSB_FSMJ + "','"+CSB_ZDFSQY+"','"
								+ CSB_FSCD_H + "','" + CSB_FSMJ_H + "','"+CSB_ZDFSQY_H+"','"
								+ DFB_FSCD + "','" + DFB_FSMJ + "','"+DFB_ZDFSQY+"','"
								+ DFB_FSCD_H + "','" + DFB_FSMJ_H + "','"+DFB_ZDFSQY_H+"','"
								+ QTB_FSCD + "','" + QTB_FSMJ + "','"+QTB_ZDFSQY+"','"
								+ QTB_FSCD_H + "','" + QTB_FSMJ_H + "','"+QTB_ZDFSQY_H+"','"
								+ BHHJ_FSCD + "','" + BHHJ_FSMJ + "','"+BHHJ_ZDFSQY+"','"
								+ BHHJ_FSCD_H + "','" + BHHJ_FSMJ_H + "','"+BHHJ_ZDFSQY_H+"','"
								+ BCHJ_FSCD + "','" + BCHJ_FSMJ + "','"+BCHJ_ZDFSQY+"','"
								+ BCHJ_FSCD_H + "','" + BCHJ_FSMJ_H + "','"+BCHJ_ZDFSQY_H+"','"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"',to_date('" + DCRQ + "','yyyy-MM-dd'))";
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
								+ "YDYMM_FSCD='" + YDYMM_FSCD + "',YDYMM_FSMJ='"+YDYMM_FSMJ+"',YDYMM_ZDFSQY='"+YDYMM_ZDFSQY+"',"
								+ "YDYMM_FSCD_H='" + YDYMM_FSCD_H + "',YDYMM_FSMJ_H='"+YDYMM_FSMJ_H+"',YDYMM_ZDFSQY_H='"+YDYMM_ZDFSQY_H+"',"
								+ "EDYMM_FSCD='" + EDYMM_FSCD + "',EDYMM_FSMJ='"+EDYMM_FSMJ+"',EDYMM_ZDFSQY='"+EDYMM_ZDFSQY+"',"
								+ "EDYMM_FSCD_H='" + EDYMM_FSCD_H + "',EDYMM_FSMJ_H='"+EDYMM_FSMJ_H+"',EDYMM_ZDFSQY_H='"+EDYMM_ZDFSQY_H+"',"
								+ "SDYMM_FSCD='" + SDYMM_FSCD + "',SDYMM_FSMJ='"+SDYMM_FSMJ+"',SDYMM_ZDFSQY='"+SDYMM_ZDFSQY+"',"
								+ "SDYMM_FSCD_H='" + SDYMM_FSCD_H + "',SDYMM_FSMJ_H='"+SDYMM_FSMJ_H+"',SDYMM_ZDFSQY_H='"+SDYMM_ZDFSQY_H+"',"
								+ "EDWYE_FSCD='" + EDWYE_FSCD + "',EDWYE_FSMJ='"+EDWYE_FSMJ+"',EDWYE_ZDFSQY='"+EDWYE_ZDFSQY+"',"
								+ "EDWYE_FSCD_H='" + EDWYE_FSCD_H + "',EDWYE_FSMJ_H='"+EDWYE_FSMJ_H+"',EDWYE_ZDFSQY_H='"+EDWYE_ZDFSQY_H+"',"
								+ "EDNC_FSCD='" + EDNC_FSCD + "',EDNC_FSMJ='"+EDNC_FSMJ+"',EDNC_ZDFSQY='"+EDNC_ZDFSQY+"',"
								+ "EDNC_FSCD_H='" + EDNC_FSCD_H + "',EDNC_FSMJ_H='"+EDNC_FSMJ_H+"',EDNC_ZDFSQY_H='"+EDNC_ZDFSQY_H+"',"
								+ "SDNC_FSCD='" + SDNC_FSCD + "',SDNC_FSMJ='"+SDNC_FSMJ+"',SDNC_ZDFSQY='"+SDNC_ZDFSQY+"',"
								+ "SDNC_FSCD_H='" + SDNC_FSCD_H + "',SDNC_FSMJ_H='"+SDNC_FSMJ_H+"',SDNC_ZDFSQY_H='"+SDNC_ZDFSQY_H+"',"
								+ "EDMLC_FSCD='" + EDMLC_FSCD + "',EDMLC_FSMJ='"+EDMLC_FSMJ+"',EDMLC_ZDFSQY='"+EDMLC_ZDFSQY+"',"
								+ "EDMLC_FSCD_H='" + EDMLC_FSCD_H + "',EDMLC_FSMJ_H='"+EDMLC_FSMJ_H+"',EDMLC_ZDFSQY_H='"+EDMLC_ZDFSQY_H+"',"
								+ "SDMLC_FSCD='" + SDMLC_FSCD + "',SDMLC_FSMJ='"+SDMLC_FSMJ+"',SDMLC_ZDFSQY='"+SDMLC_ZDFSQY+"',"
								+ "SDMLC_FSCD_H='" + SDMLC_FSCD_H + "',SDMLC_FSMJ_H='"+SDMLC_FSMJ_H+"',SDMLC_ZDFSQY_H='"+SDMLC_ZDFSQY_H+"',"
								+ "FDMLC_FSCD='" + FDMLC_FSCD + "',FDMLC_FSMJ='"+FDMLC_FSMJ+"',FDMLC_ZDFSQY='"+FDMLC_ZDFSQY+"',"
								+ "FDMLC_FSCD_H='" + FDMLC_FSCD_H + "',FDMLC_FSMJ_H='"+FDMLC_FSMJ_H+"',FDMLC_ZDFSQY_H='"+FDMLC_ZDFSQY_H+"',"
								+ "CDM_FSCD='" + CDM_FSCD + "',CDM_FSMJ='"+CDM_FSMJ+"',CDM_ZDFSQY='"+CDM_ZDFSQY+"',"
								+ "CDM_FSCD_H='" + CDM_FSCD_H + "',CDM_FSMJ_H='"+CDM_FSMJ_H+"',CDM_ZDFSQY_H='"+CDM_ZDFSQY_H+"',"
								+ "YC_FSCD='" + YC_FSCD + "',YC_FSMJ='"+YC_FSMJ+"',YC_ZDFSQY='"+YC_ZDFSQY+"',"
								+ "YC_FSCD_H='" + YC_FSCD_H + "',YC_FSMJ_H='"+YC_FSMJ_H+"',YC_ZDFSQY_H='"+YC_ZDFSQY_H+"',"
								+ "JM_FSCD='" + JM_FSCD + "',JM_FSMJ='"+JM_FSMJ+"',JM_ZDFSQY='"+JM_ZDFSQY+"',"
								+ "JM_FSCD_H='" + JM_FSCD_H + "',JM_FSMJ_H='"+JM_FSMJ_H+"',JM_ZDFSQY_H='"+JM_ZDFSQY_H+"',"
								+ "YM_FSCD='" + YM_FSCD + "',YM_FSMJ='"+YM_FSMJ+"',YM_ZDFSQY='"+YM_ZDFSQY+"',"
								+ "YM_FSCD_H='" + YM_FSCD_H + "',YM_FSMJ_H='"+YM_FSMJ_H+"',YM_ZDFSQY_H='"+YM_ZDFSQY_H+"',"
								+ "SBYYJ_FSCD='" + SBYYJ_FSCD + "',SBYYJ_FSMJ='"+SBYYJ_FSMJ+"',SBYYJ_ZDFSQY='"+SBYYJ_ZDFSQY+"',"
								+ "SBYYJ_FSCD_H='" + SBYYJ_FSCD_H + "',SBYYJ_FSMJ_H='"+SBYYJ_FSMJ_H+"',SBYYJ_ZDFSQY_H='"+SBYYJ_ZDFSQY_H+"',"
								+ "TH_FSCD='" + TH_FSCD + "',TH_FSMJ='"+TH_FSMJ+"',TH_ZDFSQY='"+TH_ZDFSQY+"',"
								+ "TH_FSCD_H='" + TH_FSCD_H + "',TH_FSMJ_H='"+TH_FSMJ_H+"',TH_ZDFSQY_H='"+TH_ZDFSQY_H+"',"
								+ "DXHC_FSCD='" + DXHC_FSCD + "',DXHC_FSMJ='"+DXHC_FSMJ+"',DXHC_ZDFSQY='"+DXHC_ZDFSQY+"',"
								+ "DXHC_FSCD_H='" + DXHC_FSCD_H + "',DXHC_FSMJ_H='"+DXHC_FSMJ_H+"',DXHC_ZDFSQY_H='"+DXHC_ZDFSQY_H+"',"
								+ "QTHC_FSCD='" + QTHC_FSCD + "',QTHC_FSMJ='"+QTHC_FSMJ+"',QTHC_ZDFSQY='"+QTHC_ZDFSQY+"',"
								+ "QTHC_FSCD_H='" + QTHC_FSCD_H + "',QTHC_FSMJ_H='"+QTHC_FSMJ_H+"',QTHC_ZDFSQY_H='"+QTHC_ZDFSQY_H+"',"
								+ "CHHJ_FSCD='" + CHHJ_FSCD + "',CHHJ_FSMJ='"+CHHJ_FSMJ+"',CHHJ_ZDFSQY='"+CHHJ_ZDFSQY+"',"
								+ "CHHJ_FSCD_H='" + CHHJ_FSCD_H + "',CHHJ_FSMJ_H='"+CHHJ_FSMJ_H+"',CHHJ_ZDFSQY_H='"+CHHJ_ZDFSQY_H+"',"
								+ "DBB_FSCD='" + DBB_FSCD + "',DBB_FSMJ='"+DBB_FSMJ+"',DBB_ZDFSQY='"+DBB_ZDFSQY+"',"
								+ "DBB_FSCD_H='" + DBB_FSCD_H + "',DBB_FSMJ_H='"+DBB_FSMJ_H+"',DBB_ZDFSQY_H='"+DBB_ZDFSQY_H+"',"
								+ "XBB_FSCD='" + XBB_FSCD + "',XBB_FSMJ='"+XBB_FSMJ+"',XBB_ZDFSQY='"+XBB_ZDFSQY+"',"
								+ "XBB_FSCD_H='" + XBB_FSCD_H + "',XBB_FSMJ_H='"+XBB_FSMJ_H+"',XBB_ZDFSQY_H='"+XBB_ZDFSQY_H+"',"
								+ "HBB_FSCD='" + HBB_FSCD + "',HBB_FSMJ='"+HBB_FSMJ+"',HBB_ZDFSQY='"+HBB_ZDFSQY+"',"
								+ "HBB_FSCD_H='" + HBB_FSCD_H + "',HBB_FSMJ_H='"+HBB_FSMJ_H+"',HBB_ZDFSQY_H='"+HBB_ZDFSQY_H+"',"
								+ "YMWBMYBB_FSCD='" + YMWBMYBB_FSCD + "',YMWBMYBB_FSMJ='"+YMWBMYBB_FSMJ+"',YMWBMYBB_ZDFSQY='"+YMWBMYBB_ZDFSQY+"',"
								+ "YMWBMYBB_FSCD_H='" + YMWBMYBB_FSCD_H + "',YMWBMYBB_FSMJ_H='"+YMWBMYBB_FSMJ_H+"',YMWBMYBB_ZDFSQY_H='"+YMWBMYBB_ZDFSQY_H+"',"
								+ "WKB_FSCD='" + WKB_FSCD + "',WKB_FSMJ='"+WKB_FSMJ+"',WKB_ZDFSQY='"+WKB_ZDFSQY+"',"
								+ "WKB_FSCD_H='" + WKB_FSCD_H + "',WKB_FSMJ_H='"+WKB_FSMJ_H+"',WKB_ZDFSQY_H='"+WKB_ZDFSQY_H+"',"
								+ "SHSB_FSCD='" + SHSB_FSCD + "',SHSB_FSMJ='"+SHSB_FSMJ+"',SHSB_ZDFSQY='"+SHSB_ZDFSQY+"',"
								+ "SHSB_FSCD_H='" + SHSB_FSCD_H + "',SHSB_FSMJ_H='"+SHSB_FSMJ_H+"',SHSB_ZDFSQY_H='"+SHSB_ZDFSQY_H+"',"
								+ "XB_FSCD='" + XB_FSCD + "',XB_FSMJ='"+XB_FSMJ+"',XB_ZDFSQY='"+XB_ZDFSQY+"',"
								+ "XB_FSCD_H='" + XB_FSCD_H + "',XB_FSMJ_H='"+XB_FSMJ_H+"',XB_ZDFSQY_H='"+XB_ZDFSQY_H+"',"
								+ "LHFB_FSCD='" + LHFB_FSCD + "',LHFB_FSMJ='"+LHFB_FSMJ+"',LHFB_ZDFSQY='"+LHFB_ZDFSQY+"',"
								+ "LHFB_FSCD_H='" + LHFB_FSCD_H + "',LHFB_FSMJ_H='"+LHFB_FSMJ_H+"',LHFB_ZDFSQY_H='"+LHFB_ZDFSQY_H+"',"
								+ "CSB_FSCD='" + CSB_FSCD + "',CSB_FSMJ='"+CSB_FSMJ+"',CSB_ZDFSQY='"+CSB_ZDFSQY+"',"
								+ "CSB_FSCD_H='" + CSB_FSCD_H + "',CSB_FSMJ_H='"+CSB_FSMJ_H+"',CSB_ZDFSQY_H='"+CSB_ZDFSQY_H+"',"
								+ "DFB_FSCD='" + DFB_FSCD + "',DFB_FSMJ='"+DFB_FSMJ+"',DFB_ZDFSQY='"+DFB_ZDFSQY+"',"
								+ "DFB_FSCD_H='" + DFB_FSCD_H + "',DFB_FSMJ_H='"+DFB_FSMJ_H+"',DFB_ZDFSQY_H='"+DFB_ZDFSQY_H+"',"
								+ "QTB_FSCD='" + QTB_FSCD + "',QTB_FSMJ='"+QTB_FSMJ+"',QTB_ZDFSQY='"+QTB_ZDFSQY+"',"
								+ "QTB_FSCD_H='" + QTB_FSCD_H + "',QTB_FSMJ_H='"+QTB_FSMJ_H+"',QTB_ZDFSQY_H='"+QTB_ZDFSQY_H+"',"
								+ "BHHJ_FSCD='" + BHHJ_FSCD + "',BHHJ_FSMJ='"+BHHJ_FSMJ+"',BHHJ_ZDFSQY='"+BHHJ_ZDFSQY+"',"
								+ "BHHJ_FSCD_H='" + BHHJ_FSCD_H + "',BHHJ_FSMJ_H='"+BHHJ_FSMJ_H+"',BHHJ_ZDFSQY_H='"+BHHJ_ZDFSQY_H+"',"
								+ "BCHJ_FSCD='" + BCHJ_FSCD + "',BCHJ_FSMJ='"+BCHJ_FSMJ+"',BCHJ_ZDFSQY='"+BCHJ_ZDFSQY+"',"
								+ "BCHJ_FSCD_H='" + BCHJ_FSCD_H + "',BCHJ_FSMJ_H='"+BCHJ_FSMJ_H+"',BCHJ_ZDFSQY_H='"+BCHJ_ZDFSQY_H+"',"
								+ "BBLX='"+BBLX+"',"
								+ "ZT='" + ZT+"',"
								+ "DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd')"
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
				//草地螟越冬代成虫发生实况及一代预测模式报表
				if (fwd.equals("Q015")) {
					String SBRQ_B =so.httpServletRequest.getParameter("SBRQ_B");
					String SBRQ_E =so.httpServletRequest.getParameter("SBRQ_E");
					String CCCJQ =so.httpServletRequest.getParameter("CCCJQ");
					String ZYJZDYDDCCYDYCFSYLCD ="";
					String CCCJQBLNZW =so.httpServletRequest.getParameter("CCCJQBLNZW");
					String YJYDFSCD ="";
					String DGLJYEL =so.httpServletRequest.getParameter("DGLJYEL");
					String YJYDFSMJ =so.httpServletRequest.getParameter("YJYDFSMJ");
					String DGLJYELBLNPJZJBL =so.httpServletRequest.getParameter("DGLJYELBLNPJZJBL");
					String YJYDNTFSMJ =so.httpServletRequest.getParameter("YJYDNTFSMJ");
					String JPCERQ =so.httpServletRequest.getParameter("JPCERQ");
					String YDNTFSMJBSNZJBL =so.httpServletRequest.getParameter("YDNTFSMJBSNZJBL");
					String YEJCESZBL =so.httpServletRequest.getParameter("YEJCESZBL");
					String YJYDCCFSMJ =so.httpServletRequest.getParameter("YJYDCCFSMJ");
					String SSJCESZBL =so.httpServletRequest.getParameter("SSJCESZBL");
					String YDCCFSMJBSNZJBL =so.httpServletRequest.getParameter("YDCCFSMJBSNZJBL");
					String CCYFSMJ =so.httpServletRequest.getParameter("CCYFSMJ");
					String YJYDLDFSMJ =so.httpServletRequest.getParameter("YJYDLDFSMJ");
					String CCFSMJBLNPJZJBL =so.httpServletRequest.getParameter("CCFSMJBLNPJZJBL");
					String YDLDFSMJBSNZJBL =so.httpServletRequest.getParameter("YDLDFSMJBSNZJBL");
					String YJYDFSXSMC =so.httpServletRequest.getParameter("YJYDFSXSMC");
				
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d015.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "CCCJQ,ZYJZDYDDCCYDYCFSYLCD,CCCJQBLNZW,"
								+ "YJYDFSCD,DGLJYEL,YJYDFSMJ,"
								+ "DGLJYELBLNPJZJBL,YJYDNTFSMJ,JPCERQ,"
								+ "YDNTFSMJBSNZJBL,YEJCESZBL,YJYDCCFSMJ,"
								+ "SSJCESZBL,YDCCFSMJBSNZJBL,CCYFSMJ,"
								+ "YJYDLDFSMJ,CCFSMJBLNPJZJBL,YDLDFSMJBSNZJBL,"
								+ "SBRQ_B,SBRQ_E,YJYDFSXSMC,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "',to_date('"
								+ CCCJQ + "','yyyy-MM-dd'),'" + ZYJZDYDDCCYDYCFSYLCD + "','"+CCCJQBLNZW+"','"
								+ YJYDFSCD + "','" + DGLJYEL + "','"+YJYDFSMJ+"','"
								+ DGLJYELBLNPJZJBL + "','" + YJYDNTFSMJ + "',to_date('"+JPCERQ+"','yyyy-MM-dd'),'"
								+ YDNTFSMJBSNZJBL + "','" + YEJCESZBL + "','"+YJYDCCFSMJ+"','"
								+ SSJCESZBL + "','" + YDCCFSMJBSNZJBL + "','"+CCYFSMJ+"','"
								+ YJYDLDFSMJ + "','" + CCFSMJBLNPJZJBL + "','"+YDLDFSMJBSNZJBL+"',"
								+"to_date('" + SBRQ_B + "','yyyy-MM-dd'),to_date('"+SBRQ_E+"','yyyy-MM-dd'),'"+YJYDFSXSMC+"','"
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
								+ "CCCJQ=to_date('" + CCCJQ + "','yyyy-MM-dd'),ZYJZDYDDCCYDYCFSYLCD='"+ZYJZDYDDCCYDYCFSYLCD+"',CCCJQBLNZW='"+CCCJQBLNZW+"',"
								+ "YJYDFSCD='" + YJYDFSCD + "',DGLJYEL='"+DGLJYEL+"',YJYDFSMJ='"+YJYDFSMJ+"',"
								+ "DGLJYELBLNPJZJBL='" + DGLJYELBLNPJZJBL + "',YJYDNTFSMJ='"+YJYDNTFSMJ+"',JPCERQ=to_date('" + JPCERQ + "','yyyy-MM-dd'),"
								+ "YDNTFSMJBSNZJBL='" + YDNTFSMJBSNZJBL + "',YEJCESZBL='"+YEJCESZBL+"',YJYDCCFSMJ='"+YJYDCCFSMJ+"',"
								+ "SSJCESZBL='" + SSJCESZBL + "',YDCCFSMJBSNZJBL='"+YDCCFSMJBSNZJBL+"',CCYFSMJ='"+CCYFSMJ+"',"
								+ "YJYDLDFSMJ='" + YJYDLDFSMJ + "',CCFSMJBLNPJZJBL='"+CCFSMJBLNPJZJBL+"',YDLDFSMJBSNZJBL='"+YDLDFSMJBSNZJBL+"',"
								+ "SBRQ_B=to_date('" + SBRQ_B + "','yyyy-MM-dd'),SBRQ_E=to_date('" + SBRQ_E + "','yyyy-MM-dd'),YJYDFSXSMC='"+YJYDFSXSMC+"',"
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
				//一代草地螟发生实况及二、三代预测模式报表
				if (fwd.equals("Q016")) {
					String SBRQ_B =so.httpServletRequest.getParameter("SBRQ_B");
					String SBRQ_E =so.httpServletRequest.getParameter("SBRQ_E");
					String YDYCFSCD =so.httpServletRequest.getParameter("YDYCFSCD");
					String YDYCFSXSMC ="";
					String YDDCCNTFSMJ =so.httpServletRequest.getParameter("YDDCCNTFSMJ");
					String JZZWYLYYCD ="";
					String YDDCCNTFSMJBLNPJZJBL =so.httpServletRequest.getParameter("YDDCCNTFSMJBLNPJZJBL");
					String YJEDFSCD =so.httpServletRequest.getParameter("YJEDFSCD");
					String YDDCCCCFSMJ =so.httpServletRequest.getParameter("YDDCCCCFSMJ");
					String YJEDYCFSWHSQKSRQ =so.httpServletRequest.getParameter("YJEDYCFSWHSQKSRQ");
					String YDDCCLDFSMJ =so.httpServletRequest.getParameter("YDDCCLDFSMJ");
					String YJEDYCFSWHSQJSRQ =so.httpServletRequest.getParameter("YJEDYCFSWHSQJSRQ");
					String YDYCNTFSMJ =so.httpServletRequest.getParameter("YDYCNTFSMJ");
					String YJEDYCFSMJ =so.httpServletRequest.getParameter("YJEDYCFSMJ");
					String YDYCNTFSMJBLNPJZJBL =so.httpServletRequest.getParameter("YDYCNTFSMJBLNPJZJBL");
					String YJEDYCNTFSMJ =so.httpServletRequest.getParameter("YJEDYCNTFSMJ");
					String YDYCCCFSMJ =so.httpServletRequest.getParameter("YDYCCCFSMJ");
					String EDYCNTFSMJBSNZJBL =so.httpServletRequest.getParameter("EDYCNTFSMJBSNZJBL");
					String YDYCLDFSMJ =so.httpServletRequest.getParameter("YDYCLDFSMJ");
					String YJEDYCCCFSMJ =so.httpServletRequest.getParameter("YJEDYCCCFSMJ");
					String YDYCNTMD =so.httpServletRequest.getParameter("YDYCNTMD");
					String YJEDYCLDFSMJ =so.httpServletRequest.getParameter("YJEDYCLDFSMJ");
					String YDYCNTMDBLNPJZJBL =so.httpServletRequest.getParameter("YDYCNTMDBLNPJZJBL");
					String YJEDYCFSXSMC ="";
					String YDYCNTFZMJ =so.httpServletRequest.getParameter("YDYCNTFZMJ");
					String YJSDFSCD =so.httpServletRequest.getParameter("YJSDFSCD");
					String YDYCCCFZMJ =so.httpServletRequest.getParameter("YDYCCCFZMJ");
					String YJSDYCFSWHSQKSRQ =so.httpServletRequest.getParameter("YJSDYCFSWHSQKSRQ");
					String YDYCLDFZMJ =so.httpServletRequest.getParameter("YDYCLDFZMJ");
					String YJSDYCFSWHSQJSRQ =so.httpServletRequest.getParameter("YJSDYCFSWHSQJSRQ");
					String YDYCNTCLMJ =so.httpServletRequest.getParameter("YDYCNTCLMJ");
					String YJSDYCFSMJ =so.httpServletRequest.getParameter("YJSDYCFSMJ");
					String YDYCNTCLMJBLNPJZJBL =so.httpServletRequest.getParameter("YDYCNTCLMJBLNPJZJBL");
					String YJSDYCNTFSMJ =so.httpServletRequest.getParameter("YJSDYCNTFSMJ");
					String YDYCCCCLMJ =so.httpServletRequest.getParameter("YDYCCCCLMJ");
					String SDYCNTFSMJBSNZJBL =so.httpServletRequest.getParameter("SDYCNTFSMJBSNZJBL");
					String YDYCLDCLMJ =so.httpServletRequest.getParameter("YDYCLDCLMJ");
					String YJSDYCCCFSMJ =so.httpServletRequest.getParameter("YJSDYCCCFSMJ");
					String YDYCNTCLMD =so.httpServletRequest.getParameter("YDYCNTCLMD");
					String YJSDYCLDFSMJ =so.httpServletRequest.getParameter("YJSDYCLDFSMJ");
					String YDYCNTCLMDBLNPJZJBL =so.httpServletRequest.getParameter("YDYCNTCLMDBLNPJZJBL");
					String YJSDYCFSXSMC ="";
					
					
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d016.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YDYCFSCD,YDYCFSXSMC,YDDCCNTFSMJ,"
								+ "JZZWYLYYCD,YDDCCNTFSMJBLNPJZJBL,YJEDFSCD,"
								+ "YDDCCCCFSMJ,YJEDYCFSWHSQKSRQ,YDDCCLDFSMJ,"
								+ "YJEDYCFSWHSQJSRQ,YDYCNTFSMJ,YJEDYCFSMJ,"
								+ "YDYCNTFSMJBLNPJZJBL,YJEDYCNTFSMJ,YDYCCCFSMJ,"
								+ "EDYCNTFSMJBSNZJBL,YDYCLDFSMJ,YJEDYCCCFSMJ,"
								+ "YDYCNTMD,YJEDYCLDFSMJ,YDYCNTMDBLNPJZJBL,"
								+ "YJEDYCFSXSMC,YDYCNTFZMJ,YJSDFSCD,"
								+ "YDYCCCFZMJ,YJSDYCFSWHSQKSRQ,YDYCLDFZMJ,"
								+ "YJSDYCFSWHSQJSRQ,YDYCNTCLMJ,YJSDYCFSMJ,"
								+ "YDYCNTCLMJBLNPJZJBL,YJSDYCNTFSMJ,YDYCCCCLMJ,"
								+ "SDYCNTFSMJBSNZJBL,YDYCLDCLMJ,YJSDYCCCFSMJ,"
								+ "YDYCNTCLMD,YJSDYCLDFSMJ,YDYCNTCLMDBLNPJZJBL,"
								+ "SBRQ_B,SBRQ_E,YJSDYCFSXSMC,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ YDYCFSCD + "','" + YDYCFSXSMC + "','"+YDDCCNTFSMJ+"','"
								+ JZZWYLYYCD + "','" + YDDCCNTFSMJBLNPJZJBL + "','"+YJEDFSCD+"','"
								+ YDDCCCCFSMJ + "',to_date('" + YJEDYCFSWHSQKSRQ + "','yyyy-MM-dd'),'"+YDDCCLDFSMJ+"',to_date('"
								+ YJEDYCFSWHSQJSRQ + "','yyyy-MM-dd'),'" + YDYCNTFSMJ + "','"+YJEDYCFSMJ+"','"
								+ YDYCNTFSMJBLNPJZJBL + "','" + YJEDYCNTFSMJ + "','"+YDYCCCFSMJ+"','"
								+ EDYCNTFSMJBSNZJBL + "','" + YDYCLDFSMJ + "','"+YJEDYCCCFSMJ+"','"
								+ YDYCNTMD + "','" + YJEDYCLDFSMJ + "','"+YDYCNTMDBLNPJZJBL+"','"
								+ YJEDYCFSXSMC + "','" + YDYCNTFZMJ + "','"+YJSDFSCD+"','"
								+ YDYCCCFZMJ + "',to_date('" + YJSDYCFSWHSQKSRQ + "','yyyy-MM-dd'),'"+YDYCLDFZMJ+"',to_date('"
								+ YJSDYCFSWHSQJSRQ + "','yyyy-MM-dd'),'" + YDYCNTCLMJ + "','"+YJSDYCFSMJ+"','"
								+ YDYCNTCLMJBLNPJZJBL + "','" + YJSDYCNTFSMJ + "','"+YDYCCCCLMJ+"','"
								+ SDYCNTFSMJBSNZJBL + "','" + YDYCLDCLMJ + "','"+YJSDYCCCFSMJ+"','"
								+ YDYCNTCLMD + "','" + YJSDYCLDFSMJ + "','"+YDYCNTCLMDBLNPJZJBL+"',"
								+"to_date('" + SBRQ_B + "','yyyy-MM-dd'),to_date('"+SBRQ_E+"','yyyy-MM-dd'),'"+YJSDYCFSXSMC+"','"
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
								+ "YDYCFSCD='" + YDYCFSCD + "',YDYCFSXSMC='"+YDYCFSXSMC+"',YDDCCNTFSMJ='"+YDDCCNTFSMJ+"',"
								+ "JZZWYLYYCD='" + JZZWYLYYCD + "',YDDCCNTFSMJBLNPJZJBL='"+YDDCCNTFSMJBLNPJZJBL+"',YJEDFSCD='"+YJEDFSCD+"',"
								+ "YDDCCCCFSMJ='" + YDDCCCCFSMJ + "',YJEDYCFSWHSQKSRQ=to_date('"+YJEDYCFSWHSQKSRQ+"','yyyy-MM-dd'),YDDCCLDFSMJ='"+YDDCCLDFSMJ+"',"
								+ "YJEDYCFSWHSQJSRQ=to_date('" + YJEDYCFSWHSQJSRQ + "','yyyy-MM-dd'),YDYCNTFSMJ='"+YDYCNTFSMJ+"',YJEDYCFSMJ='"+YJEDYCFSMJ+"',"
								+ "YDYCNTFSMJBLNPJZJBL='" + YDYCNTFSMJBLNPJZJBL + "',YJEDYCNTFSMJ='"+YJEDYCNTFSMJ+"',YDYCCCFSMJ='"+YDYCCCFSMJ+"',"
								+ "EDYCNTFSMJBSNZJBL='" + EDYCNTFSMJBSNZJBL + "',YDYCLDFSMJ='"+YDYCLDFSMJ+"',YJEDYCCCFSMJ='"+YJEDYCCCFSMJ+"',"
								+ "YDYCNTMD='" + YDYCNTMD + "',YJEDYCLDFSMJ='"+YJEDYCLDFSMJ+"',YDYCNTMDBLNPJZJBL='"+YDYCNTMDBLNPJZJBL+"',"
								+ "YJEDYCFSXSMC='" + YJEDYCFSXSMC + "',YDYCNTFZMJ='"+YDYCNTFZMJ+"',YJSDFSCD='"+YJSDFSCD+"',"
								+ "YDYCCCFZMJ='" + YDYCCCFZMJ + "',YJSDYCFSWHSQKSRQ=to_date('"+YJSDYCFSWHSQKSRQ+"','yyyy-MM-dd'),YDYCLDFZMJ='"+YDYCLDFZMJ+"',"
								+ "YJSDYCFSWHSQJSRQ=to_date('" + YJSDYCFSWHSQJSRQ + "','yyyy-MM-dd'),YDYCNTCLMJ='"+YDYCNTCLMJ+"',YJSDYCFSMJ='"+YJSDYCFSMJ+"',"
								+ "YDYCNTCLMJBLNPJZJBL='" + YDYCNTCLMJBLNPJZJBL + "',YJSDYCNTFSMJ='"+YJSDYCNTFSMJ+"',YDYCCCCLMJ='"+YDYCCCCLMJ+"',"
								+ "SDYCNTFSMJBSNZJBL='" + SDYCNTFSMJBSNZJBL + "',YDYCLDCLMJ='"+YDYCLDCLMJ+"',YJSDYCCCFSMJ='"+YJSDYCCCFSMJ+"',"
								+ "YDYCNTCLMD='" + YDYCNTCLMD + "',YJSDYCLDFSMJ='"+YJSDYCLDFSMJ+"',YDYCNTCLMDBLNPJZJBL='"+YDYCNTCLMDBLNPJZJBL+"',"
								+ "SBRQ_B=to_date('" + SBRQ_B + "','yyyy-MM-dd'),SBRQ_E=to_date('" + SBRQ_E + "','yyyy-MM-dd'),YJSDYCFSXSMC='"+YJSDYCFSXSMC+"',"
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
				//草地螟越冬情况省站模式报表
				if (fwd.equals("Q017")) {
					String YDZMJ =so.httpServletRequest.getParameter("YDZMJ");
					String YDHJMD =so.httpServletRequest.getParameter("YDHJMD");
					String YDHJMDBLNPJZJBL ="";
					String YDZCL =so.httpServletRequest.getParameter("YDZCL");
					String YDZCLBSNZJBL ="";
					String SMC ="";
					String XMC ="";
					String JD ="";
					String WD ="";
					String YDZMJ_T ="";
					String YDHJMD_T ="";
					
					
					
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d017.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YDZMJ,YDHJMD,YDHJMDBLNPJZJBL,"
								+ "YDZCL,YDZCLBSNZJBL,SMC,"
								+ "XMC,JD,WD,"
								+ "YDZMJ_T,YDHJMD_T,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ YDZMJ + "','" + YDHJMD + "','"+YDHJMDBLNPJZJBL+"','"
								+ YDZCL + "','" + YDZCLBSNZJBL + "','"+SMC+"','"
								+ XMC + "','" + JD + "','"+WD+"','"
								+ YDZMJ_T + "','" + YDHJMD_T + "',"
								+"to_date('" + DCRQ + "','yyyy-MM-dd'),'"
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
								+ "YDZMJ='" + YDZMJ + "',YDHJMD='"+YDHJMD+"',YDHJMDBLNPJZJBL='"+YDHJMDBLNPJZJBL+"',"
								+ "YDZCL='" + YDZCL + "',YDZCLBSNZJBL='"+YDZCLBSNZJBL+"',SMC='"+SMC+"',"
								+ "XMC='" + XMC + "',JD='"+JD+"',WD='"+WD+"',"
								+ "YDZMJ_T='" + YDZMJ_T + "',YDHJMD_T='"+YDHJMD_T+"',"
								+ "DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd'),"
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
				//草地螟年度发生情况统计表
				if (fwd.equals("Q018")) {
					String YDDCC_NTFSMJ =so.httpServletRequest.getParameter("YDDCC_NTFSMJ");
					String EDYC_CCFSMJ =so.httpServletRequest.getParameter("EDYC_CCFSMJ");
					String YDDCC_CCFSMJ =so.httpServletRequest.getParameter("YDDCC_CCFSMJ");
					String EDYC_LDFSMJ ="";
					String YDDCC_LDFSMJ ="";
					String EDYC_FSZMJ =so.httpServletRequest.getParameter("EDYC_FSZMJ");
					String YDDCC_FSZMJ =so.httpServletRequest.getParameter("YDDCC_FSZMJ");
					String EDYC_NTPJMD =so.httpServletRequest.getParameter("EDYC_NTPJMD");
					String YDYC_NTFSMJ =so.httpServletRequest.getParameter("YDYC_NTFSMJ");
					String EDYC_NTFZMJ =so.httpServletRequest.getParameter("EDYC_NTFZMJ");
					String YDYC_CCFSMJ =so.httpServletRequest.getParameter("YDYC_CCFSMJ");
					String EDYC_CCFZMJ =so.httpServletRequest.getParameter("EDYC_CCFZMJ");
					String YDYC_LDFSMJ ="";
					String EDYC_LDFZMJ ="";
					String YDYC_FSZMJ =so.httpServletRequest.getParameter("YDYC_FSZMJ");
					String EDCC_NTFZMJ =so.httpServletRequest.getParameter("EDCC_NTFZMJ");
					String YDYC_NTPJMD =so.httpServletRequest.getParameter("YDYC_NTPJMD");
					String EDCC_CCFSMJ =so.httpServletRequest.getParameter("EDCC_CCFSMJ");
					String YDYC_NTFZMJ =so.httpServletRequest.getParameter("YDYC_NTFZMJ");
					String EDCC_LDFSMJ ="";
					String YDYC_CCFZMJ =so.httpServletRequest.getParameter("YDYC_CCFZMJ");
					String EDCC_FSZMJ =so.httpServletRequest.getParameter("EDCC_FSZMJ");
					String YDYC_LDFZMJ ="";
					String SDYC_NTFSMJ =so.httpServletRequest.getParameter("SDYC_NTFSMJ");
					String YDCC_NTFSMJ =so.httpServletRequest.getParameter("YDCC_NTFSMJ");
					String SDYC_CCFSMJ =so.httpServletRequest.getParameter("SDYC_CCFSMJ");
					String YDCC_CCFSMJ =so.httpServletRequest.getParameter("YDCC_CCFSMJ");
					String SDYC_LDFSMJ ="";
					String YDCC_LDFSMJ ="";
					String SDYC_NTPJSL =so.httpServletRequest.getParameter("SDYC_NTPJSL");
					String YDCC_FSZMJ =so.httpServletRequest.getParameter("YDCC_FSZMJ");
					String SDYC_NTFZMJ =so.httpServletRequest.getParameter("SDYC_NTFZMJ");
					String EDYC_NTFSMJ =so.httpServletRequest.getParameter("EDYC_NTFSMJ");
					String SDYC_CCFZMJ =so.httpServletRequest.getParameter("SDYC_CCFZMJ");
					String SDYC_LDFZMJ ="";
				
					
					
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d018.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YDDCC_NTFSMJ,EDYC_CCFSMJ,YDDCC_CCFSMJ,"
								+ "EDYC_LDFSMJ,YDDCC_LDFSMJ,EDYC_FSZMJ,"
								+ "YDDCC_FSZMJ,EDYC_NTPJMD,YDYC_NTFSMJ,"
								+ "EDYC_NTFZMJ,YDYC_CCFSMJ,EDYC_CCFZMJ,"
								+ "YDYC_LDFSMJ,EDYC_LDFZMJ,YDYC_FSZMJ,"
								+ "EDCC_NTFZMJ,YDYC_NTPJMD,EDCC_CCFSMJ,"
								+ "YDYC_NTFZMJ,EDCC_LDFSMJ,YDYC_CCFZMJ,"
								+ "EDCC_FSZMJ,YDYC_LDFZMJ,SDYC_NTFSMJ,"
								+ "YDCC_NTFSMJ,SDYC_CCFSMJ,YDCC_CCFSMJ,"
								+ "SDYC_LDFSMJ,YDCC_LDFSMJ,SDYC_NTPJSL,"
								+ "YDCC_FSZMJ,SDYC_NTFZMJ,EDYC_NTFSMJ,"
								+ "SDYC_CCFZMJ,SDYC_LDFZMJ,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ YDDCC_NTFSMJ + "','" + EDYC_CCFSMJ + "','"+YDDCC_CCFSMJ+"','"
								+ EDYC_LDFSMJ + "','" + YDDCC_LDFSMJ + "','"+EDYC_FSZMJ+"','"
								+ YDDCC_FSZMJ + "','" + EDYC_NTPJMD + "','"+YDYC_NTFSMJ+"','"
								+ EDYC_NTFZMJ + "','" + YDYC_CCFSMJ + "','"+EDYC_CCFZMJ+"','"
								+ YDYC_LDFSMJ + "','" + EDYC_LDFZMJ + "','"+YDYC_FSZMJ+"','"
								+ EDCC_NTFZMJ + "','" + YDYC_NTPJMD + "','"+EDCC_CCFSMJ+"','"
								+ YDYC_NTFZMJ + "','" + EDCC_LDFSMJ + "','"+YDYC_CCFZMJ+"','"
								+ EDCC_FSZMJ + "','" + YDYC_LDFZMJ + "','"+SDYC_NTFSMJ+"','"
								+ YDCC_NTFSMJ + "','" + SDYC_CCFSMJ + "','"+YDCC_CCFSMJ+"','"
								+ SDYC_LDFSMJ + "','" + YDCC_LDFSMJ + "','"+SDYC_NTPJSL+"','"
								+ YDCC_FSZMJ + "','" + SDYC_NTFZMJ + "','"+EDYC_NTFSMJ+"','"
								+ SDYC_CCFZMJ + "','" + SDYC_LDFZMJ + "',"
								+"to_date('" + DCRQ + "','yyyy-MM-dd'),'"
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
								+ "YDDCC_NTFSMJ='" + YDDCC_NTFSMJ + "',EDYC_CCFSMJ='"+EDYC_CCFSMJ+"',YDDCC_CCFSMJ='"+YDDCC_CCFSMJ+"',"
								+ "EDYC_LDFSMJ='" + EDYC_LDFSMJ + "',YDDCC_LDFSMJ='"+YDDCC_LDFSMJ+"',EDYC_FSZMJ='"+EDYC_FSZMJ+"',"
								+ "YDDCC_FSZMJ='" + YDDCC_FSZMJ + "',EDYC_NTPJMD='"+EDYC_NTPJMD+"',YDYC_NTFSMJ='"+YDYC_NTFSMJ+"',"
								+ "EDYC_NTFZMJ='" + EDYC_NTFZMJ + "',YDYC_CCFSMJ='"+YDYC_CCFSMJ+"',EDYC_CCFZMJ='"+EDYC_CCFZMJ+"',"
								+ "YDYC_LDFSMJ='" + YDYC_LDFSMJ + "',EDYC_LDFZMJ='"+EDYC_LDFZMJ+"',YDYC_FSZMJ='"+YDYC_FSZMJ+"',"
								+ "EDCC_NTFZMJ='" + EDCC_NTFZMJ + "',YDYC_NTPJMD='"+YDYC_NTPJMD+"',EDCC_CCFSMJ='"+EDCC_CCFSMJ+"',"
								+ "YDYC_NTFZMJ='" + YDYC_NTFZMJ + "',EDCC_LDFSMJ='"+EDCC_LDFSMJ+"',YDYC_CCFZMJ='"+YDYC_CCFZMJ+"',"
								+ "EDCC_FSZMJ='" + EDCC_FSZMJ + "',YDYC_LDFZMJ='"+YDYC_LDFZMJ+"',SDYC_NTFSMJ='"+SDYC_NTFSMJ+"',"
								+ "DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd'),"
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
				//	二点委夜蛾二代幼虫发生趋势预测表 
				if (fwd.equals("Q019")) {
					String XYMBQBCNZWTS =so.httpServletRequest.getParameter("XYMBQBCNZWTS");
					String YMYYCFSWHD =so.httpServletRequest.getParameter("YMYYCFSWHD");
					String XMJGHTMJB =so.httpServletRequest.getParameter("XMJGHTMJB");
					String YMTFGWHDYCNB =so.httpServletRequest.getParameter("YMTFGWHDYCNB");
					String YJFSCD =so.httpServletRequest.getParameter("YJFSCD");
					String YJFSMJ =so.httpServletRequest.getParameter("YJFSMJ");
					String YJFSQY ="";
					String BZ ="";
					
					
					
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d019.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "XYMBQBCNZWTS,YMYYCFSWHD,XMJGHTMJB,"
								+ "YMTFGWHDYCNB,YJFSCD,YJFSMJ,"
								+ "YJFSQY,BZ,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ XYMBQBCNZWTS + "','" + YMYYCFSWHD + "','"+XMJGHTMJB+"','"
								+ YMTFGWHDYCNB + "','" + YJFSCD + "','"+YJFSMJ+"','"
								+ YJFSQY + "','" + BZ + "',"
								+"to_date('" + DCRQ + "','yyyy-MM-dd'),'"
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
								+ "XYMBQBCNZWTS='" + XYMBQBCNZWTS + "',YMYYCFSWHD='"+YMYYCFSWHD+"',XMJGHTMJB='"+XMJGHTMJB+"',"
								+ "YMTFGWHDYCNB='" + YMTFGWHDYCNB + "',YJFSCD='"+YJFSCD+"',YJFSMJ='"+YJFSMJ+"',"
								+ "YJFSQY='" + YJFSQY + "',BZ='"+BZ+"',"
								+ "DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd'),"
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
				//	二点委夜蛾越冬虫源调查统计表
				if (fwd.equals("Q020")) {
					String JYDCYQY =so.httpServletRequest.getParameter("JYDCYQY");
					String GSYDMJ =so.httpServletRequest.getParameter("GSYDMJ");
					String CYFBZWZL =so.httpServletRequest.getParameter("CYFBZWZL");
					String PJCKMD =so.httpServletRequest.getParameter("PJCKMD");
					String ZGCKMD =so.httpServletRequest.getParameter("ZGCKMD");
					String ZGCKMDCXXD =so.httpServletRequest.getParameter("ZGCKMDCXXD");
					
					
					
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d020.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "JYDCYQY,GSYDMJ,CYFBZWZL,"
								+ "PJCKMD,ZGCKMD,ZGCKMDCXXD,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ JYDCYQY + "','" + GSYDMJ + "','"+CYFBZWZL+"','"
								+ PJCKMD + "','" + ZGCKMD + "','"+ZGCKMDCXXD+"',"
								+"to_date('" + DCRQ + "','yyyy-MM-dd'),'"
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
								+ "JYDCYQY='" + JYDCYQY + "',GSYDMJ='"+GSYDMJ+"',CYFBZWZL='"+CYFBZWZL+"',"
								+ "PJCKMD='" + PJCKMD + "',ZGCKMD='"+ZGCKMD+"',ZGCKMDCXXD='"+ZGCKMDCXXD+"',"
								+ "DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd'),"
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
                //粘虫年度发生与预测统计表（按代次分）
				if (fwd.equals("Q021")) {
					String YDNC_FSCD =so.httpServletRequest.getParameter("YDNC_FSCD");
					String YDNC_FSMJ =so.httpServletRequest.getParameter("YDNC_FSMJ");
					String YDNC_FZMJ =so.httpServletRequest.getParameter("YDNC_FZMJ");
					String YDNC_ZYWHZW =so.httpServletRequest.getParameter("YDNC_ZYWHZW");
					String YDNC_ZDFSQY =so.httpServletRequest.getParameter("YDNC_ZDFSQY");
					String YDNC_FSCD_H ="";
					String YDNC_FSMJ_H =so.httpServletRequest.getParameter("YDNC_FSMJ_H");
					String YDNC_ZDFSQY_H =so.httpServletRequest.getParameter("YDNC_ZDFSQY_H");
					String EDNC_FSCD =so.httpServletRequest.getParameter("EDNC_FSCD");
					String EDNC_FSMJ =so.httpServletRequest.getParameter("EDNC_FSMJ");
					String EDNC_FZMJ =so.httpServletRequest.getParameter("EDNC_FZMJ");
					String EDNC_ZYWHZW =so.httpServletRequest.getParameter("EDNC_ZYWHZW");
					String EDNC_ZDFSQY =so.httpServletRequest.getParameter("EDNC_ZDFSQY");
					String EDNC_FSCD_H =so.httpServletRequest.getParameter("EDNC_FSCD_H");
					String EDNC_FSMJ_H =so.httpServletRequest.getParameter("EDNC_FSMJ_H");
					String EDNC_ZDFSQY_H =so.httpServletRequest.getParameter("EDNC_ZDFSQY_H");
					String SDNC_FSCD =so.httpServletRequest.getParameter("SDNC_FSCD");
					String SDNC_FSMJ =so.httpServletRequest.getParameter("SDNC_FSMJ");
					String SDNC_FZMJ =so.httpServletRequest.getParameter("SDNC_FZMJ");
					String SDNC_ZYWHZW =so.httpServletRequest.getParameter("SDNC_ZYWHZW");
					String SDNC_ZDFSQY =so.httpServletRequest.getParameter("SDNC_ZDFSQY");
					String SDNC_FSCD_H =so.httpServletRequest.getParameter("SDNC_FSCD_H");
					String SDNC_FSMJ_H =so.httpServletRequest.getParameter("SDNC_FSMJ_H");
					String SDNC_ZDFSQY_H =so.httpServletRequest.getParameter("SDNC_ZDFSQY_H");
					String QTDCNC_FSCD ="";
					String QTDCNC_FSMJ =so.httpServletRequest.getParameter("QTDCNC_FSMJ");
					String QTDCNC_FZMJ =so.httpServletRequest.getParameter("QTDCNC_FZMJ");
					String QTDCNC_ZYWHZW =so.httpServletRequest.getParameter("QTDCNC_ZYWHZW");
					String QTDCNC_ZDFSQY =so.httpServletRequest.getParameter("QTDCNC_ZDFSQY");
					String QTDCNC_FSCD_H ="";
					String QTDCNC_FSMJ_H =so.httpServletRequest.getParameter("QTDCNC_FSMJ_H");
					String QTDCNC_ZDFSQY_H =so.httpServletRequest.getParameter("QTDCNC_ZDFSQY_H");
					String NCHJ_FSCD ="";
					String NCHJ_FSMJ =so.httpServletRequest.getParameter("NCHJ_FSMJ");
					String NCHJ_FZMJ =so.httpServletRequest.getParameter("NCHJ_FZMJ");
					String NCHJ_ZYWHZW =so.httpServletRequest.getParameter("NCHJ_ZYWHZW");
					String NCHJ_ZDFSQY =so.httpServletRequest.getParameter("NCHJ_ZDFSQY");
					String NCHJ_FSCD_H ="";
					String NCHJ_FSMJ_H =so.httpServletRequest.getParameter("NCHJ_FSMJ_H");
					String NCHJ_ZDFSQY_H =so.httpServletRequest.getParameter("NCHJ_ZDFSQY_H");
					
					
					
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d021.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YDNC_FSCD,YDNC_FSMJ,YDNC_FZMJ,YDNC_ZYWHZW,"
								+ "YDNC_ZDFSQY,YDNC_FSCD_H,YDNC_FSMJ_H,YDNC_ZDFSQY_H,"
								+ "EDNC_FSCD,EDNC_FSMJ,EDNC_FZMJ,EDNC_ZYWHZW,"
								+ "EDNC_ZDFSQY,EDNC_FSCD_H,EDNC_FSMJ_H,EDNC_ZDFSQY_H,"
								+ "SDNC_FSCD,SDNC_FSMJ,SDNC_FZMJ,SDNC_ZYWHZW,"
								+ "SDNC_ZDFSQY,SDNC_FSCD_H,SDNC_FSMJ_H,SDNC_ZDFSQY_H,"
								+ "QTDCNC_FSCD,QTDCNC_FSMJ,QTDCNC_FZMJ,QTDCNC_ZYWHZW,"
								+ "QTDCNC_ZDFSQY,QTDCNC_FSCD_H,QTDCNC_FSMJ_H,QTDCNC_ZDFSQY_H,"
								+ "NCHJ_FSCD,NCHJ_FSMJ,NCHJ_FZMJ,NCHJ_ZYWHZW,"
								+ "NCHJ_ZDFSQY,NCHJ_FSCD_H,NCHJ_FSMJ_H,NCHJ_ZDFSQY_H,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ YDNC_FSCD + "','" + YDNC_FSMJ + "','"+YDNC_FZMJ+"','"+YDNC_ZYWHZW+"','"
								+ YDNC_ZDFSQY + "','"+YDNC_FSCD_H+"','"+YDNC_FSMJ_H+"','"+YDNC_ZDFSQY_H+"','"
								+ EDNC_FSCD + "','" + EDNC_FSMJ + "','"+EDNC_FZMJ+"','"+EDNC_ZYWHZW+"','"
								+ EDNC_ZDFSQY + "','"+EDNC_FSCD_H+"','"+EDNC_FSMJ_H+"','"+EDNC_ZDFSQY_H+"','"
								+ SDNC_FSCD + "','" + SDNC_FSMJ + "','"+SDNC_FZMJ+"','"+SDNC_ZYWHZW+"','"
								+ SDNC_ZDFSQY + "','"+SDNC_FSCD_H+"','"+SDNC_FSMJ_H+"','"+SDNC_ZDFSQY_H+"','"
								+ QTDCNC_FSCD + "','" + QTDCNC_FSMJ + "','"+QTDCNC_FZMJ+"','"+QTDCNC_ZYWHZW+"','"
								+ QTDCNC_ZDFSQY + "','"+QTDCNC_FSCD_H+"','"+QTDCNC_FSMJ_H+"','"+QTDCNC_ZDFSQY_H+"','"
								+ NCHJ_FSCD + "','" + NCHJ_FSMJ + "','"+NCHJ_FZMJ+"','"+NCHJ_ZYWHZW+"','"
								+ NCHJ_ZDFSQY + "','"+NCHJ_FSCD_H+"','"+NCHJ_FSMJ_H+"','"+NCHJ_ZDFSQY_H+"',"
								+"to_date('" + DCRQ + "','yyyy-MM-dd'),'"
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
								+ "YDNC_FSCD='" + YDNC_FSCD + "',YDNC_FSMJ='"+YDNC_FSMJ+"',YDNC_FZMJ='"+YDNC_FZMJ+"',"
								+ "YDNC_ZYWHZW='" + YDNC_ZYWHZW + "',YDNC_ZDFSQY='"+YDNC_ZDFSQY+"',YDNC_FSCD_H='"+YDNC_FSCD_H+"',"
								+ "YDNC_FSMJ_H='" + YDNC_FSMJ_H + "',YDNC_ZDFSQY_H='"+YDNC_ZDFSQY_H+"',"
								+ "EDNC_FSCD='" + EDNC_FSCD + "',EDNC_FSMJ='"+EDNC_FSMJ+"',EDNC_FZMJ='"+EDNC_FZMJ+"',"
								+ "EDNC_ZYWHZW='" + EDNC_ZYWHZW + "',EDNC_ZDFSQY='"+EDNC_ZDFSQY+"',EDNC_FSCD_H='"+EDNC_FSCD_H+"',"
								+ "EDNC_FSMJ_H='" + EDNC_FSMJ_H + "',EDNC_ZDFSQY_H='"+EDNC_ZDFSQY_H+"',"
								+ "SDNC_FSCD='" + SDNC_FSCD + "',SDNC_FSMJ='"+SDNC_FSMJ+"',SDNC_FZMJ='"+SDNC_FZMJ+"',"
								+ "SDNC_ZYWHZW='" + SDNC_ZYWHZW + "',SDNC_ZDFSQY='"+SDNC_ZDFSQY+"',SDNC_FSCD_H='"+SDNC_FSCD_H+"',"
								+ "SDNC_FSMJ_H='" + SDNC_FSMJ_H + "',SDNC_ZDFSQY_H='"+SDNC_ZDFSQY_H+"',"
								+ "QTDCNC_FSCD='" + QTDCNC_FSCD + "',QTDCNC_FSMJ='"+QTDCNC_FSMJ+"',QTDCNC_FZMJ='"+QTDCNC_FZMJ+"',"
								+ "QTDCNC_ZYWHZW='" + QTDCNC_ZYWHZW + "',QTDCNC_ZDFSQY='"+QTDCNC_ZDFSQY+"',QTDCNC_FSCD_H='"+QTDCNC_FSCD_H+"',"
								+ "QTDCNC_FSMJ_H='" + QTDCNC_FSMJ_H + "',QTDCNC_ZDFSQY_H='"+QTDCNC_ZDFSQY_H+"',"
								+ "NCHJ_FSCD='" + NCHJ_FSCD + "',NCHJ_FSMJ='"+NCHJ_FSMJ+"',NCHJ_FZMJ='"+NCHJ_FZMJ+"',"
								+ "NCHJ_ZYWHZW='" + NCHJ_ZYWHZW + "',NCHJ_ZDFSQY='"+NCHJ_ZDFSQY+"',NCHJ_FSCD_H='"+NCHJ_FSCD_H+"',"
								+ "NCHJ_FSMJ_H='" + NCHJ_FSMJ_H + "',NCHJ_ZDFSQY_H='"+NCHJ_ZDFSQY_H+"',"
								+ "DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd'),"
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
				//粘虫年度发生与预测统计表（按作物分）
				if (fwd.equals("Q022")) {
					String SDNC_FSCD =so.httpServletRequest.getParameter("SDNC_FSCD");
					String SDNC_FSMJ =so.httpServletRequest.getParameter("SDNC_FSMJ");
					String SDNC_FZMJ =so.httpServletRequest.getParameter("SDNC_FZMJ");
					String SDNC_ZYWHZW =so.httpServletRequest.getParameter("SDNC_ZYWHZW");
					String SDNC_ZDFSQY =so.httpServletRequest.getParameter("SDNC_ZDFSQY");
					String SDNC_FSCD_H =so.httpServletRequest.getParameter("SDNC_FSCD_H");
					String SDNC_FSMJ_H =so.httpServletRequest.getParameter("SDNC_FSMJ_H");
					String SDNC_ZDFSQY_H =so.httpServletRequest.getParameter("SDNC_ZDFSQY_H");
					String XMNC_FSCD =so.httpServletRequest.getParameter("XMNC_FSCD");
					String XMNC_FSMJ =so.httpServletRequest.getParameter("XMNC_FSMJ");
					String XMNC_FZMJ =so.httpServletRequest.getParameter("XMNC_FZMJ");
					String XMNC_ZYWHZW =so.httpServletRequest.getParameter("XMNC_ZYWHZW");
					String XMNC_ZDFSQY =so.httpServletRequest.getParameter("XMNC_ZDFSQY");
					String XMNC_FSCD_H =so.httpServletRequest.getParameter("XMNC_FSCD_H");
					String XMNC_FSMJ_H =so.httpServletRequest.getParameter("XMNC_FSMJ_H");
					String XMNC_ZDFSQY_H =so.httpServletRequest.getParameter("XMNC_ZDFSQY_H");
					String YMNC_FSCD =so.httpServletRequest.getParameter("YMNC_FSCD");
					String YMNC_FSMJ =so.httpServletRequest.getParameter("YMNC_FSMJ");
					String YMNC_FZMJ =so.httpServletRequest.getParameter("YMNC_FZMJ");
					String YMNC_ZYWHZW =so.httpServletRequest.getParameter("YMNC_ZYWHZW");
					String YMNC_ZDFSQY =so.httpServletRequest.getParameter("YMNC_ZDFSQY");
					String YMNC_FSCD_H =so.httpServletRequest.getParameter("YMNC_FSCD_H");
					String YMNC_FSMJ_H =so.httpServletRequest.getParameter("YMNC_FSMJ_H");
					String YMNC_ZDFSQY_H =so.httpServletRequest.getParameter("YMNC_ZDFSQY_H");
					String QTLZNC_FSCD =so.httpServletRequest.getParameter("QTLZNC_FSCD");
					String QTLZNC_FSMJ =so.httpServletRequest.getParameter("QTLZNC_FSMJ");
					String QTLZNC_FZMJ =so.httpServletRequest.getParameter("QTLZNC_FZMJ");
					String QTLZNC_ZYWHZW =so.httpServletRequest.getParameter("QTLZNC_ZYWHZW");
					String QTLZNC_ZDFSQY =so.httpServletRequest.getParameter("QTLZNC_ZDFSQY");
					String QTLZNC_FSCD_H =so.httpServletRequest.getParameter("QTLZNC_FSCD_H");
					String QTLZNC_FSMJ_H =so.httpServletRequest.getParameter("QTLZNC_FSMJ_H");
					String QTLZNC_ZDFSQY_H =so.httpServletRequest.getParameter("QTLZNC_ZDFSQY_H");
					String NCHJ_FSCD ="";
					String NCHJ_FSMJ =so.httpServletRequest.getParameter("NCHJ_FSMJ");
					String NCHJ_FZMJ =so.httpServletRequest.getParameter("NCHJ_FZMJ");
					String NCHJ_ZYWHZW =so.httpServletRequest.getParameter("NCHJ_ZYWHZW");
					String NCHJ_ZDFSQY =so.httpServletRequest.getParameter("NCHJ_ZDFSQY");
					String NCHJ_FSCD_H ="";
					String NCHJ_FSMJ_H =so.httpServletRequest.getParameter("NCHJ_FSMJ_H");
					String NCHJ_ZDFSQY_H =so.httpServletRequest.getParameter("NCHJ_ZDFSQY_H");
					
					
					
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d022.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "SDNC_FSCD,SDNC_FSMJ,SDNC_FZMJ,SDNC_ZYWHZW,"
								+ "SDNC_ZDFSQY,SDNC_FSCD_H,SDNC_FSMJ_H,SDNC_ZDFSQY_H,"
								+ "XMNC_FSCD,XMNC_FSMJ,XMNC_FZMJ,XMNC_ZYWHZW,"
								+ "XMNC_ZDFSQY,XMNC_FSCD_H,XMNC_FSMJ_H,XMNC_ZDFSQY_H,"
								+ "YMNC_FSCD,YMNC_FSMJ,YMNC_FZMJ,YMNC_ZYWHZW,"
								+ "YMNC_ZDFSQY,YMNC_FSCD_H,YMNC_FSMJ_H,YMNC_ZDFSQY_H,"
								+ "QTLZNC_FSCD,QTLZNC_FSMJ,QTLZNC_FZMJ,QTLZNC_ZYWHZW,"
								+ "QTLZNC_ZDFSQY,QTLZNC_FSCD_H,QTLZNC_FSMJ_H,QTLZNC_ZDFSQY_H,"
								+ "NCHJ_FSCD,NCHJ_FSMJ,NCHJ_FZMJ,NCHJ_ZYWHZW,"
								+ "NCHJ_ZDFSQY,NCHJ_FSCD_H,NCHJ_FSMJ_H,NCHJ_ZDFSQY_H,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ SDNC_FSCD + "','" + SDNC_FSMJ + "','"+SDNC_FZMJ+"','"+SDNC_ZYWHZW+"','"
								+ SDNC_ZDFSQY + "','"+SDNC_FSCD_H+"','"+SDNC_FSMJ_H+"','"+SDNC_ZDFSQY_H+"','"
								+ XMNC_FSCD + "','" + XMNC_FSMJ + "','"+XMNC_FZMJ+"','"+XMNC_ZYWHZW+"','"
								+ XMNC_ZDFSQY + "','"+XMNC_FSCD_H+"','"+XMNC_FSMJ_H+"','"+XMNC_ZDFSQY_H+"','"
								+ YMNC_FSCD + "','" + YMNC_FSMJ + "','"+YMNC_FZMJ+"','"+YMNC_ZYWHZW+"','"
								+ YMNC_ZDFSQY + "','"+YMNC_FSCD_H+"','"+YMNC_FSMJ_H+"','"+YMNC_ZDFSQY_H+"','"
								+ QTLZNC_FSCD + "','" + QTLZNC_FSMJ + "','"+QTLZNC_FZMJ+"','"+QTLZNC_ZYWHZW+"','"
								+ QTLZNC_ZDFSQY + "','"+QTLZNC_FSCD_H+"','"+QTLZNC_FSMJ_H+"','"+QTLZNC_ZDFSQY_H+"','"
								+ NCHJ_FSCD + "','" + NCHJ_FSMJ + "','"+NCHJ_FZMJ+"','"+NCHJ_ZYWHZW+"','"
								+ NCHJ_ZDFSQY + "','"+NCHJ_FSCD_H+"','"+NCHJ_FSMJ_H+"','"+NCHJ_ZDFSQY_H+"',"
								+"to_date('" + DCRQ + "','yyyy-MM-dd'),'"
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
								+ "SDNC_FSCD='" + SDNC_FSCD + "',SDNC_FSMJ='"+SDNC_FSMJ+"',SDNC_FZMJ='"+SDNC_FZMJ+"',"
								+ "SDNC_ZYWHZW='" + SDNC_ZYWHZW + "',SDNC_ZDFSQY='"+SDNC_ZDFSQY+"',SDNC_FSCD_H='"+SDNC_FSCD_H+"',"
								+ "SDNC_FSMJ_H='" + SDNC_FSMJ_H + "',SDNC_ZDFSQY_H='"+SDNC_ZDFSQY_H+"',"
								+ "XMNC_FSCD='" + XMNC_FSCD + "',XMNC_FSMJ='"+XMNC_FSMJ+"',XMNC_FZMJ='"+XMNC_FZMJ+"',"
								+ "XMNC_ZYWHZW='" + XMNC_ZYWHZW + "',XMNC_ZDFSQY='"+XMNC_ZDFSQY+"',XMNC_FSCD_H='"+XMNC_FSCD_H+"',"
								+ "XMNC_FSMJ_H='" + XMNC_FSMJ_H + "',XMNC_ZDFSQY_H='"+XMNC_ZDFSQY_H+"',"
								+ "YMNC_FSCD='" + YMNC_FSCD + "',YMNC_FSMJ='"+YMNC_FSMJ+"',YMNC_FZMJ='"+YMNC_FZMJ+"',"
								+ "YMNC_ZYWHZW='" + YMNC_ZYWHZW + "',YMNC_ZDFSQY='"+YMNC_ZDFSQY+"',YMNC_FSCD_H='"+YMNC_FSCD_H+"',"
								+ "YMNC_FSMJ_H='" + YMNC_FSMJ_H + "',YMNC_ZDFSQY_H='"+YMNC_ZDFSQY_H+"',"
								+ "QTLZNC_FSCD='" + QTLZNC_FSCD + "',QTLZNC_FSMJ='"+QTLZNC_FSMJ+"',QTLZNC_FZMJ='"+QTLZNC_FZMJ+"',"
								+ "QTLZNC_ZYWHZW='" + QTLZNC_ZYWHZW + "',QTLZNC_ZDFSQY='"+QTLZNC_ZDFSQY+"',QTLZNC_FSCD_H='"+QTLZNC_FSCD_H+"',"
								+ "QTLZNC_FSMJ_H='" + QTLZNC_FSMJ_H + "',QTLZNC_ZDFSQY_H='"+QTLZNC_ZDFSQY_H+"',"
								+ "NCHJ_FSCD='" + NCHJ_FSCD + "',NCHJ_FSMJ='"+NCHJ_FSMJ+"',NCHJ_FZMJ='"+NCHJ_FZMJ+"',"
								+ "NCHJ_ZYWHZW='" + NCHJ_ZYWHZW + "',NCHJ_ZDFSQY='"+NCHJ_ZDFSQY+"',NCHJ_FSCD_H='"+NCHJ_FSCD_H+"',"
								+ "NCHJ_FSMJ_H='" + NCHJ_FSMJ_H + "',NCHJ_ZDFSQY_H='"+NCHJ_ZDFSQY_H+"',"
								+ "DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd'),"
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
				//二代粘虫省站汇报模式报表
				if (fwd.equals("Q023")) {
					String FSCD =so.httpServletRequest.getParameter("FSCD");
					String GLXTCCLBLNJZZJ =so.httpServletRequest.getParameter("GLXTCCLBLNJZZJ");
					String EDNCYCMJ =so.httpServletRequest.getParameter("EDNCYCMJ");
					String YJCCYHKSRQ =so.httpServletRequest.getParameter("YJCCYHKSRQ");
					String FZMJ =so.httpServletRequest.getParameter("FZMJ");
					String YJCCYHJSRQ =so.httpServletRequest.getParameter("YJCCYHJSRQ");
					String GLXTJQPJCCL =so.httpServletRequest.getParameter("GLXTJQPJCCL");
			
					
					
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d023.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "FSCD,GLXTCCLBLNJZZJ,EDNCYCMJ,"
								+ "YJCCYHKSRQ,FZMJ,YJCCYHJSRQ,GLXTJQPJCCL,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ FSCD + "','" + GLXTCCLBLNJZZJ + "','"+EDNCYCMJ+"',to_date('"
								+ YJCCYHKSRQ + "','yyyy-MM-dd'),'" + FZMJ + "',to_date('"+YJCCYHJSRQ+"','yyyy-MM-dd'),'"+GLXTJQPJCCL+"',"
								+"to_date('" + DCRQ + "','yyyy-MM-dd'),'"
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
								+ "FSCD='" + FSCD + "',GLXTCCLBLNJZZJ='"+GLXTCCLBLNJZZJ+"',EDNCYCMJ='"+EDNCYCMJ+"',"
								+ "YJCCYHKSRQ=to_date('" + YJCCYHKSRQ + "','yyyy-MM-dd'),FZMJ='"+FZMJ+"',YJCCYHJSRQ=to_date('" + YJCCYHJSRQ + "','yyyy-MM-dd'),GLXTJQPJCCL='"+GLXTJQPJCCL+"',"
								+ "DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd'),"
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
				//三代粘虫省站汇报模式报表
				if (fwd.equals("Q024")) {
				    String FSCD =so.httpServletRequest.getParameter("FSCD");
					String GLXTCCLBLNJZZJ =so.httpServletRequest.getParameter("GLXTCCLBLNJZZJ");
					String SDNCYCMJ =so.httpServletRequest.getParameter("SDNCYCMJ");
					String YJCCYHKSRQ =so.httpServletRequest.getParameter("YJCCYHKSRQ");
					String FZMJ =so.httpServletRequest.getParameter("FZMJ");
					String YJCCYHJSRQ =so.httpServletRequest.getParameter("YJCCYHJSRQ");
					String GLXTJQPJCCL =so.httpServletRequest.getParameter("GLXTJQPJCCL");
					
					
					
					if (JFID == null || JFID.equals("") || JFID.equals("null")) {
						// 获取ID
						ExecuteConnection ecquen = new ExecuteConnection();
						Statement stmquent = ecquen.con.createStatement();
						ResultSet rsquen = stmquent
								.executeQuery("SELECT sequ_d024.NEXTVAL FROM DUAL");
						if (rsquen.next()) {
							JFID = rsquen.getString(1);
						}
						rsquen.close();
						stmquent.close();
						ecquen.con.close();
						// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "FSCD,GLXTCCLBLNJZZJ,SDNCYCMJ,"
								+ "YJCCYHKSRQ,FZMJ,YJCCYHJSRQ,GLXTJQPJCCL,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + JFID + "','"
								+ FSCD + "','" + GLXTCCLBLNJZZJ + "','"+SDNCYCMJ+"',to_date('"
								+ YJCCYHKSRQ + "','yyyy-MM-dd'),'" + FZMJ + "',to_date('"+YJCCYHJSRQ+"','yyyy-MM-dd'),'"+GLXTJQPJCCL+"',"
								+"to_date('" + DCRQ + "','yyyy-MM-dd'),'"
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
								+ "FSCD='" + FSCD + "',GLXTCCLBLNJZZJ='"+GLXTCCLBLNJZZJ+"',SDNCYCMJ='"+SDNCYCMJ+"',"
								+ "YJCCYHKSRQ=to_date('" + YJCCYHKSRQ + "','yyyy-MM-dd'),FZMJ='"+FZMJ+"',YJCCYHJSRQ=to_date('" + YJCCYHJSRQ + "','yyyy-MM-dd'),GLXTJQPJCCL='"+GLXTJQPJCCL+"',"
								+ "DCRQ=to_date('" + DCRQ + "','yyyy-MM-dd'),"
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
