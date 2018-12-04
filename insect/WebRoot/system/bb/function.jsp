<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%!
// 发布
public String fb(String zbid) {
	String djg_count = "", dgs_count = "", sql_xx = "", state_xx = "", msg = "";
	ExecuteConnection ec = new ExecuteConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		sql_xx = "SELECT JFSTATE FROM DBBZB WHERE JFID='" + zbid + "'";
		pstmt = ec.con.prepareStatement(sql_xx);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			state_xx = rs.getString(1);
		}
		if (!"0".equals(state_xx)) {
			msg = "此报表已经发布！";
			return msg;
		}
		sql_xx = "SELECT COUNT(*) FROM DBBZB_JG WHERE JFDBBZB_ID='" + zbid + "' AND UPPER(JFCOLID) IN ('ZT','BMBM','LRRY','LRRQ')";
		pstmt = ec.con.prepareStatement(sql_xx);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			djg_count = rs.getString(1);
		}
		if (!"4".equals(djg_count)) {
			msg = "请确认报表标题或表尾中含有状态[ZT],调查单位[BMBM],录入日期[LRRQ],录入人员[LRRY]字段！";
			return msg;
		}
		sql_xx = "SELECT COUNT(*) FROM DBBZB_GS WHERE JFDBBZB_ID='" + zbid + "'";
		pstmt = ec.con.prepareStatement(sql_xx);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			dgs_count = rs.getString(1);
		}
		if (!"0".equals(djg_count) && !"0".equals(dgs_count)) {
			// 创建表头数据表
			sql_xx = getTableSql(zbid, "0", ec.con);
			pstmt.executeUpdate(sql_xx);
			sql_xx = getSequenceSql("d" + zbid + "_head");
			pstmt.executeUpdate(sql_xx);
			// 创建表体数据表
			sql_xx = getTableSql(zbid, "2", ec.con);
			pstmt.executeUpdate(sql_xx);
			sql_xx = getSequenceSql("d" + zbid + "_body");
			pstmt.executeUpdate(sql_xx);
			sql_xx = "UPDATE DBBZB SET JFSTATE='1' WHERE JFID='" + zbid + "'";
			pstmt.executeUpdate(sql_xx);
			msg = "SUCCESS";
		} else {
			msg = "请在发布之前先录入报表结构和格式信息";
		}
		return msg;
	} catch (Exception e) {
		e.printStackTrace();
		msg = "操作失败，发现异常。请稍后重试！";
		return msg;
	} finally {
		try {
			if (rs != null) { rs.close(); }
			if (pstmt != null) { pstmt.close(); }
			if (ec.con != null) { ec.con.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
// 取消发布
public String qxfb(String zbid) {
	String msg = "";
	ExecuteConnection ec = new ExecuteConnection();
	Statement stmt = null;
	dropTable(zbid, "0", ec.con);
	dropTable(zbid, "1", ec.con);
	try {
		stmt = ec.con.createStatement();
		if (stmt.executeUpdate("update dbbzb set jfstate='0' where jfid='" + zbid  + "'") > 0) {
			msg = "SUCCESS";
		} else {
			msg = "ERROR";
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (stmt != null) { stmt.close(); }
			if (ec.con != null) { ec.con.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	return msg;
}
// 归档
public String gd(String zbid) {
	String msg = "";
	ExecuteConnection ec = new ExecuteConnection();
	Statement stmt = null;
	try {
		stmt = ec.con.createStatement();
		if (stmt.executeUpdate("update dbbzb set jfstate='2' where jfid='" + zbid  + "'") > 0) {
			msg = "SUCCESS";
		} else {
			msg = "ERROR";
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (stmt != null) { stmt.close(); }
			if (ec.con != null) { ec.con.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	return msg;
}
// 删除表、Sequence
public void dropTable(String zbid, String table_lb, Connection conn) {
	String ls_bz = "0",table_name = "";
	if ("0".equals(table_lb)) {
		table_name = "D" + zbid + "_HEAD";
	} else {
		table_name = "D" + zbid + "_BODY";
	}
	try {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM " + table_name);
		if (rs.next()) {
			ls_bz = "1";
		}
		rs.close();
		if ("1".equals(ls_bz)) {
			stmt.executeUpdate("DROP TABLE " + table_name);
			stmt.executeUpdate("DROP SEQUENCE SEQU_" + table_name);
		}
		stmt.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
// 生成创建表语句  table_lb  0:表头,表尾;2:表体
public String getTableSql(String zbid, String table_lb, Connection conn) {
	String sql_head = "", sql_body = "", sql_xx = "";
	try {
		sql_xx = "SELECT JFCOLID,JFCOLLENGTH,NVL(JFDECINUM,0),JFCOLSTYLE FROM DBBZB_JG WHERE JFDBBZB_ID='" + zbid + "' ";
		if ("2".equals(table_lb)) {
			sql_xx = sql_xx + " AND JFCOLVEST='2' ";
			sql_head = " CREATE TABLE D" + zbid + "_BODY ( JFID VARCHAR(20) NOT NULL,JFDYID VARCHAR(20) NOT NULL,HMC VARCHAR(20) ";
		} else {
			sql_xx = sql_xx + " AND JFCOLVEST IN ('0','1','3') ";
			sql_head = " CREATE TABLE D" + zbid + "_HEAD ( JFID VARCHAR(20) NOT NULL,JFNO VARCHAR(30),KSTBRQ DATE,JZTBRQ DATE ";
		}
		sql_xx = sql_xx + " ORDER BY JFCOLID ";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql_xx);
		while (rs.next()) {
			sql_body = sql_body + "," + rs.getString(1);
			if ("1".equals(rs.getString(4))) { // 日期
				sql_body = sql_body + " DATE ";
			} else if ("2".equals(rs.getString(4))) { // 字符
				sql_body = sql_body + " VARCHAR2(" + rs.getString(2) + ") ";
			} else if ("3".equals(rs.getString(4))) { // 数字
				sql_body = sql_body + " NUMBER(" + rs.getString(2) + "," + rs.getString(3) + ") ";
			}
		}
		rs.close();
		stmt.close();
		if ("".equals(sql_body)) {
			sql_xx = sql_head + ")";
		} else {
			sql_xx = sql_head + sql_body + ")";
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
//	System.out.println(sql_xx);
	return sql_xx;
}
//生成创建Sequence语句
public String getSequenceSql(String table_name) {
	return "CREATE SEQUENCE SEQU_" + table_name + " INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999999 MINVALUE 1";
}
// 获取sequence下一个值
public String getMaxSequence(String sequ_name) {
	String sequence = "";
	ExecuteConnection ec = new ExecuteConnection();
	try {
		Statement stmt = ec.con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT " + sequ_name + ".NEXTVAL FROM DUAL");
		if (rs.next()) {
			sequence = rs.getString(1);
		}
		rs.close();
		stmt.close();
		ec.con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return sequence;
}
// 解析表单，获取所有参数（key:字段名;value:字段值(日期类型已做处理)）
public Map analysisForm(HttpServletRequest req) {
	Map<String, String[]> map = new HashMap<String, String[]>();
	Map m = req.getParameterMap();
	String[] values = new String[0];
	for (Iterator it = m.keySet().iterator();it.hasNext();) {
		String key = (String) it.next();
		Object valueObj = m.get(key);
		if (valueObj instanceof String[]) {
			values = (String[]) valueObj;
		}
		String[] k = key.split(":");
		if (k != null && k.length > 2) {
			for (int i = 0; i < values.length; i++) {
				if ("D".equalsIgnoreCase(k[2])) {
				if(values[i].equals(" "))
				{
					values[i] = "TO_DATE('','YYYY-MM-DD HH24:MI:SS')";
				}
				else
				{
					values[i] = "TO_DATE('" + values[i] + "','YYYY-MM-DD HH24:MI:SS')";
				}
				
				} else {
					values[i] = "'" + values[i] + "'";
				}
			}
		}
		map.put(key, values);
	}
	return map;
}
// 插入
public String insert(HttpServletRequest req) {
	String msg = "SUCCESS";
	try {
		Map<String, String[]> map = analysisForm(req);
		ExecuteConnection ec = new ExecuteConnection();
		Statement stmt = ec.con.createStatement();
		ec.con.setAutoCommit(false);
		String column1 = "", column2 = "";
		String _key1 = "", _key2 = "";
		String table_name1 = "", table_name2 = "";
		String jfid1 = "", jfid2 = "";
		int arrCount1 = 0, arrCount2 = 0;
		for (Iterator<String> it = map.keySet().iterator(); it.hasNext();) {
			String key = it.next();
			String[] keys = key.split(":");
			if (keys[0].contains("HEAD")) {
				arrCount1++;
				_key1 = key;
			} else if (key.contains("BODY")) {
				arrCount2++;
				_key2 = key;
			}
		}
		String[] keyArr1 = new String[arrCount1];
		String[] keyArr2 = new String[arrCount2];
		int _i1 = 0, _i2 = 0;
		for (Iterator<String> it = map.keySet().iterator(); it.hasNext();) {
			String key = it.next();
			String[] keys = key.split(":");
			if (keys[0].contains("HEAD")) {
				column1 += keys[1] + ",";
				table_name1 = keys[0];
				keyArr1[_i1] = key;
				_i1++;
			} else if (key.contains("BODY")) {
				column2 += keys[1] + ",";
				table_name2 = keys[0];
				keyArr2[_i2] = key;
				_i2++;
			}
		}
		column1 = column1.substring(0, column1.length() - 1);
		column1+=",RWSJ";
		column2 = column2.substring(0, column2.length() - 1);
		String[] values1 = map.get(_key1);
		String[] values2 = map.get(_key2);
		Calendar c = Calendar.getInstance();
		String zbid = req.getParameter("zbid"); // 主表id
		String lb = req.getParameter("tblb"); // 类别（chb:重报；lb:漏报；cb:催报；zc:正常）
		String rwid = req.getParameter("rwid"); // DBBZB_RW.JFID
		String bbzt = req.getParameter("bbzt"); // bbzt,bc:保存;tj:提交
		//3.15修改
		String usebm = ((User) req.getSession().getAttribute("user")).getBmbm();
		String shbz="";
		String bblx="";
		if(usebm.trim().length()==4)
		{
		 bblx="1";
		 shbz="1";
		}
		else
		{
		 bblx="0";
		 shbz="2";
		}
		
		String rw = req.getParameter("rw"); // 任务时间
		String rwsj=rw.substring(0,10);
		rw=rw.substring(0,rw.length()-2);
		rw="TO_DATE('"+rw+"','YYYY-MM-DD HH24:MI:SS'),";
		String jfno = c.get(Calendar.YEAR) + "" + (c.get(Calendar.MONTH)+1) + zbid;
		for (int i = 0; values1 != null && i < values1.length; i++) {
			jfid1 = getMaxSequence("SEQU_" + table_name1);
			jfno = jfno + "_" + jfid1;
			String sql = "INSERT INTO " + table_name1 + " (JFID,JFNO," + column1 + ") VALUES ('" + jfid1 + "','" + jfno + "',";
			for (Object key : keyArr1) {
				sql += map.get(key)[i] + ",";
			}
			sql+=rw;
			sql = sql.substring(0, sql.length() - 1);
			sql += ")";
			if (stmt.executeUpdate(sql) <= 0) {
				msg = "ERROR";
				break;
			}
		}
	
		boolean tj=false;
		if ("SUCCESS".equals(msg)) {
			String sql_rw = "UPDATE DBBZB_RW SET JFID=JFID WHERE 1=2"; // 回改任务表的sql
			String sql_hd = "UPDATE " + table_name1 + " SET JFID=JFID WHERE 1=2"; // 提交后要修改主表的填报时间
			if ("chb".equals(lb)) {
				if ("bc".equals(bbzt)) {
					sql_rw = "UPDATE DBBZB_RW SET THBZ='1',DYID='" + jfid1 + "' WHERE JFID='" + rwid + "'";
				} else {
				    //12.12
				    if(bbzt.equals("tj"))
				    {
				    tj=true;
				    }
					sql_rw = "UPDATE DBBZB_RW SET THBZ='0',DYID='" + jfid1 + "',SHBZ='"+shbz+"' WHERE JFID='" + rwid + "'";
				}
			} else if ("lb".equals(lb)) {
				if ("bc".equals(bbzt)) {
					sql_rw = "UPDATE DBBZB_RW SET LBJHBZ='1',DYID='" + jfid1 + "' WHERE JFID='" + rwid + "'";
				} else {
				    //12.12
				    if(bbzt.equals("tj"))
				    {
				    tj=true;
				    }
					sql_hd = "UPDATE " + table_name1 + " A SET (A.KSTBRQ,A.JZTBRQ)=(SELECT TO_DATE(TO_CHAR(B.TBRQ-B.KSTBTS,'YYYY-MM-DD'),'YYYY-MM-DD'),TO_DATE(TO_CHAR(B.TBRQ+B.JZTBTS,'YYYY-MM-DD'),'YYYY-MM-DD') FROM DBBZB_RW B WHERE B.JFID='" + rwid + "') WHERE A.JFID='" + jfid1 + "'";
					sql_rw = "UPDATE DBBZB_RW SET LBJHBZ='0',DYID='" + jfid1 + "',SHBZ='"+shbz+"' WHERE JFID='" + rwid + "'";
				}
			} else if ("cb".equals(lb)) {
				if ("bc".equals(bbzt)) {
					sql_rw = "UPDATE DBBZB_RW SET DYID='" + jfid1 + "',BBZT='1' WHERE JFID='" + rwid + "'";
				} else {
				    //12.12
				    if(bbzt.equals("tj"))
				    {
				    tj=true;
				    }
					sql_hd = "UPDATE " + table_name1 + " A SET (A.KSTBRQ,A.JZTBRQ)=(SELECT TO_DATE(TO_CHAR(B.TBRQ-B.KSTBTS,'YYYY-MM-DD'),'YYYY-MM-DD'),TO_DATE(TO_CHAR(B.TBRQ+B.JZTBTS,'YYYY-MM-DD'),'YYYY-MM-DD') FROM DBBZB_RW B WHERE B.JFID='" + rwid + "') WHERE A.JFID='" + jfid1 + "'";
					sql_rw = "UPDATE DBBZB_RW SET DYID='" + jfid1 + "',SJTBRQ=SYSDATE,BBZT='3',SHBZ='"+shbz+"' WHERE JFID='" + rwid + "'";
				}
			} else if ("zc".equals(lb)) {
				if ("bc".equals(bbzt)) {
					sql_rw = "UPDATE DBBZB_RW SET DYID='" + jfid1 + "',BBZT='1' WHERE JFID='" + rwid + "'";
				} else if ("tj".equals(bbzt)) {
				    //12.12
				    if(bbzt.equals("tj"))
				    {
				    tj=true;
				    }
					sql_hd = "UPDATE " + table_name1 + " A SET (A.KSTBRQ,A.JZTBRQ)=(SELECT TO_DATE(TO_CHAR(B.TBRQ-B.KSTBTS,'YYYY-MM-DD'),'YYYY-MM-DD'),TO_DATE(TO_CHAR(B.TBRQ+B.JZTBTS,'YYYY-MM-DD'),'YYYY-MM-DD') FROM DBBZB_RW B WHERE B.JFID='" + rwid + "') WHERE A.JFID='" + jfid1 + "'";
					sql_rw = "UPDATE DBBZB_RW SET DYID='" + jfid1 + "',SJTBRQ=SYSDATE,BBZT='2',SHBZ='"+shbz+"' WHERE JFID='" + rwid + "'";
				}
			}
			//插入body
			for (int i = 0; values2 != null && i < values2.length; i++) {
				jfid2 = getMaxSequence("SEQU_" + table_name2);
				String bodys="";
				String sql = "INSERT INTO " + table_name2 + " (JFID,JFDYID," + column2 + ") VALUES ('" + jfid2 + "','" + jfid1 + "',";
				for (Object key : keyArr2) {
					sql += map.get(key)[i] + ",";
					bodys+= map.get(key)[i] + "~";
				}
				sql = sql.substring(0, sql.length() - 1);
				sql += ")";
				if (stmt.executeUpdate(sql) <= 0) {
					msg = "ERROR";
					break;
				}
				//掉过程
				if(tj)
				{
				String[] zds=column2.split(",");
				String[] bdys=bodys.split("~");
				String psoReturn="";
		        String psoReason="";
		        String psi_cs1=table_name1;
		        String psi_cs2=jfid1;
		        String psi_cs3=jfid2;
		        String psi_cs4="";
		        String psi_cs5="";
		        double psi_cs6=0.00;
		        double psi_cs7=0.00;
		        double psi_cs8=0.00;
		        String psi_cs9=rwsj;
		        String bmbm = ((User)req.getSession().getAttribute("user")).getBmbm();
		        String psi_cs10=bmbm;
				if(table_name1.equals("D905_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y04"))
				 {
				   psi_cs4= bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y09"))
				 {
				   psi_cs5=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y12"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				 if(zds[j].equals("Y21"))
				 {
				   psi_cs7=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
	             
				}
				else if(table_name1.equals("D897_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y04"))
				 {
				   psi_cs4=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y09"))
				 {
				   psi_cs5=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y12"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				 if(zds[j].equals("Y15"))
				 {
				   psi_cs7=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
				
				}
				else if(table_name1.equals("D909_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y04"))
				 {
				   psi_cs4=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y09"))
				 {
				   psi_cs5=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y14"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				 if(zds[j].equals("Y18"))
				 {
				   psi_cs7=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
				
				}
				else if(table_name1.equals("D902_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y04"))
				 {
				   psi_cs4=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y09"))
				 {
				   psi_cs5=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y12"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				 if(zds[j].equals("Y16"))
				 {
				   psi_cs7=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
				
				}
				else if(table_name1.equals("D903_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y05"))
				 {
				   psi_cs4=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y10"))
				 {
				   psi_cs5=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y13"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				 if(zds[j].equals("Y16"))
				 {
				   psi_cs7=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				 if(zds[j].equals("Y22"))
				 {
				   psi_cs8=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
				
				}
				else if(table_name1.equals("D890_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y05"))
				 {
				   psi_cs4=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y10"))
				 {
				   psi_cs5=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y13"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				 if(zds[j].equals("Y16"))
				 {
				   psi_cs7=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
				
				}
				else if(table_name1.equals("D908_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y05"))
				 {
				   psi_cs4=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y10"))
				 {
				   psi_cs5=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y13"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				 if(zds[j].equals("Y15"))
				 {
				   psi_cs7=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
				
				}
				else if(table_name1.equals("D899_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y05"))
				 {
				   psi_cs4=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y10"))
				 {
				   psi_cs5=bdys[j].substring(1,bdys[j].length()-1);
				 }
				 if(zds[j].equals("Y13"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				 if(zds[j].equals("Y15"))
				 {
				   psi_cs7=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
				
				}
				else if(table_name1.equals("D849_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y09"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
				
				}
				else if(table_name1.equals("D854_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y05"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
				
				}
				else if(table_name1.equals("D858_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y18"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
				
				}
				else if(table_name1.equals("D860_HEAD"))
				{
				for(int j=0;j<zds.length;j++)
				{
				 if(zds[j].equals("Y18"))
				 {
				   psi_cs6=Double.parseDouble(bdys[j].substring(1,bdys[j].length()-1));
				 }
				}
		        CallableStatement  cs=ec.con.prepareCall("{call p_tj_bbyj(?,?,?,?,?,?,?,?,?,?,?,?)}");
		        cs.registerOutParameter(11,12);
                cs.registerOutParameter(12,12);
		        cs.setString(1,psi_cs1);
		        cs.setString(2,psi_cs2);
		        cs.setString(3,psi_cs3);
		        cs.setString(4,psi_cs4);
		        cs.setString(5,psi_cs5);
		        cs.setDouble(6,psi_cs6);
		        cs.setDouble(7,psi_cs7);
		        cs.setDouble(8,psi_cs8);
		        cs.setString(9,psi_cs9);
		        cs.setString(10,psi_cs10);
		        cs.setString(11,psoReturn);
		        cs.setString(12,psoReason);
		        cs.execute();
		        psoReturn = cs.getString(11);
	            psoReason = cs.getString(12);
	            if(psoReturn.trim().equals("0")){
	        	ec.commit();
	            }
	            else
	            {
	        	ec.rollback();
	        	msg = "ERROR";
			    break;
	            }
				
				}
				}
			}
			if (stmt.executeUpdate(sql_rw) <= 0) {
				msg = "ERROR";
			}
			if ("SUCCESS".equals(msg)) {
				ec.commit();
				msg = msg + "@" + jfid1 + "@" + rwid + "@" + lb + "@" + bbzt;
				stmt.executeUpdate(sql_hd);
				ec.commit();
				//3.15修改更新头字段
				stmt.executeUpdate("UPDATE "+table_name1+" SET BBLX='"+bblx+"' where jfid="+jfid1);
				ec.commit();
			} else {
				ec.rollback();
				msg = "操作失败，请稍后重试!";
			}
		} else {
			ec.rollback();
			msg = "操作失败，请稍后重试!";
		}
		stmt.close();
		ec.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	return msg;
}
//修改
public String update(HttpServletRequest req,String jfid) {
	String zbid = req.getParameter("zbid");
	String msg = "SUCCESS";
	String table_name = "D" + zbid + "_";
	String sql1 = "DELETE FROM " + table_name + "HEAD WHERE JFID='" + jfid + "'";
	String sql2 = "DELETE FROM " + table_name + "BODY WHERE JFDYID='" + jfid + "'";
	try {
		ExecuteConnection ec = new ExecuteConnection();
		Statement stmt = ec.con.createStatement();
		ec.con.setAutoCommit(false);
		if(jfid.equals("null")||jfid.equals("")||jfid==null)
		{
		  msg = insert(req);
		}
		else
		{
		if (stmt.executeUpdate(sql1) <= 0) {
			msg = "ERROR";
		}
		if ("SUCCESS".equals(msg)) {
			if (stmt.executeUpdate(sql2) <= 0) {
				msg = "ERROR";
			}
			if ("SUCCESS".equals(msg)) {
				msg = insert(req);
				if (msg.contains("SUCCESS")) {
					ec.commit();
				} else {
					ec.rollback();
					msg = "操作失败，请稍后重试!";
				}
			} else {
				ec.rollback();
				msg = "操作失败，请稍后重试!";
			}
		} else {
			ec.rollback();
			msg = "操作失败，请稍后重试!";
		}
		}
		stmt.close();
		ec.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	return msg;
}
public String cStr(String str) {
	if ("".equals(str) || str == null) {
		return "";
	}
	return str;
}
public String cBlank(String str) {
	if ("".equals(str) || str == null) {
		return " ";
	}
	return str;
}
%>