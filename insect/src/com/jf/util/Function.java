package com.jf.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

/**
 * common functions
 *
 */
public class Function {

	public static String f_state_return(String para1, String para2) {
		String returnValue = "";
		if ("dbbzb_cx_jfattribute".equals(para1)) {//报表自定义查询-查询类别
			if ("0".equals(para2)) {
				
			}
		} else if ("dbbzb_cx_jfoperation".equals(para1)) {// 报表自定义查询-运算关系
			if ("1".equals(para2)) {
				returnValue = "like";
			} else if ("2".equals(para2)) {
				returnValue = "=";
			} else if ("3".equals(para2)) {
				returnValue = ">";
			} else if ("4".equals(para2)) {
				returnValue = "≥";
			} else if ("5".equals(para2)) {
				returnValue = "<";
			} else if ("6".equals(para2)) {
				returnValue = "≤";
			}
		} else if ("dbbzb_cx_px_jfdownup".equals(para1)) {// 报表自定义查询-排序－升降序
			if ("down".equals(para2)) {
				returnValue = "降";
			} else if ("up".equals(para2)) {
				returnValue = "升";
			}
		}
		return returnValue;
	}
	
	public static String f_select_return(Connection conn, String jfsort, String defaultValue) {
		String str_option = "";
		String sql="";
		if(jfsort.equals("DCDD"))
		{
			 sql = "select jfregcode,jfregname from dsys06 where jc='3' and jfstate ='1' ORDER BY nlssort(jfregname, 'NLS_SORT=SCHINESE_PINYIN_M')";
		}
		else
		{
			 sql = "select jfcode,jfcodename from dsys11 where jfsort='" + jfsort + "' order by jfcode";
		}
		Statement stmt = null;
		ResultSet rs = null;
		str_option = str_option + "<option></option>";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				if (rs.getString(1).equals(defaultValue)) {
					str_option = str_option + " <option selected value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>";
				} else {
					str_option = str_option + " <option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return str_option;
	}
	
	public static String f_select_ts_return(Connection conn, String select, String table, String where, String order, String defaultValue) {
		String str_option = "";
		String sql = " select " + select + " from " + table;
		if (!"".equals(where) && where != null) {
			sql += " where " + where;
		}
		if (!"".equals(order) && order != null) {
			sql += " order by " + order;
		}
		Statement stmt = null;
		ResultSet rs = null;
		str_option = str_option + "<option></option>";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				if (rs.getString(1).equals(defaultValue)) {
					str_option = str_option + " <option selected value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>";
				} else {
					str_option = str_option + " <option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return str_option;
	}
	
	/**
	 * 获取部门名称(dsys05)
	 * 
	 * @param conn 数据库连接
	 * @param deptCode 部门编码
	 * @return
	 */
	public static String deptName(Connection conn, String deptCode) {
		String jfdeptname = "";
		String sql = "select nvl(f_get_mc('DEPT',jfdeptname),'全部') from dsys05 where jfdeptcode='" + deptCode + "'";
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				jfdeptname = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return jfdeptname;
	}
	
	/**
	 * 获取乡镇名称(dsys06)
	 * 
	 * @param conn 数据库连接
	 * @param code 部门编码
	 * @return
	 */
	public static String vallageName(Connection conn, String code) {
		String jfvname = "";
		String sql = "select jfregname from dsys06 where jfregcode='" + code + "'";
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				jfvname = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return jfvname;
	}
	
	/**
	 * 通过代码类别和代码编码到代码名称(dsys11)
	 * 
	 * @param conn 数据库连接
	 * @param code 部门编码
	 * @return
	 */
	public static String codeName(Connection conn, String sort, String code) {
		String jfcodename = "";
		String sql = "select jfcodename from dsys11 where jfsort='" + sort + "' and jfcode='" + code + "'";
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				jfcodename = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return jfcodename;
	}
	
	/**
	 * 通过用户id号得到用户名称(dsys01)
	 * 
	 * @param conn 数据库连接
	 * @param code 部门编码
	 * @return
	 */
	public static String userName(Connection conn, String jfid) {
		String jfname = "";
		String sql = "select jfname from dsys01 where jfid='" + jfid + "'";
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				jfname = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return jfname;
	}
	
	public static String f_dbb_query(HttpServletRequest request, String cs) {
		String sqlStr = "", tableName = "";
		Enumeration<?> e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String paramName = (String) e.nextElement();
			String[] strArray = paramName.split(":");
			if (request.getParameter(paramName) == null || "".equals(request.getParameter(paramName)) || strArray.length <3){
			}else {
				String[] paramValues = request.getParameterValues(paramName);
				if(strArray[2].equals("≤"))
				{
					strArray[2]="<=";
				}
				if(strArray[2].equals("≥"))
				{
					strArray[2]=">=";
				}
				if (paramValues.length == 1) {
					String paramValue = paramValues[0];
					//if (paramValue.length() != 0) {
						if ("2".equals(strArray[0])) { // 类归属（0：标题；1：表头；2：表体，3：表尾）
							if(strArray[1].equals("DCRQ"))
							{
								tableName = "D" + cs + "_head";
							}
							else
							{
								tableName = "D" + cs + "_body";
							}
						} else {
							tableName = "D" + cs + "_head";
						}
						if ("1".equals(strArray[3]) && "=".equals(strArray[2])) {
							sqlStr = sqlStr + " and to_number(to_char(" + tableName + "." + strArray[1] + ",'" + strArray[4] + "')) " + strArray[2];
						} else {
							if(strArray[1].equals("DCRQ"))
							{
								sqlStr = sqlStr + " and " + tableName + ".RWSJ " + strArray[2];
							}
							else
							{
								sqlStr = sqlStr + " and " + tableName + "." + strArray[1] + " " + strArray[2];
							}
						}
						if ("1".equals(strArray[3])) { // 字段类型 日期
							if ("like".equals(strArray[2])) {
								sqlStr = "";
							} else if ("=".equals(strArray[2])) {
								sqlStr = sqlStr + "to_number('" + paramValue + "')";
							} else {
								sqlStr = sqlStr + "to_date('" + paramValue + "','" + strArray[4] + "')";
							}
						} else if ("2".equals(strArray[3])) { // 字符
							if ("like".equals(strArray[2])) {
								sqlStr = sqlStr + "'%" + paramValue + "%'";
							} else {
								sqlStr = sqlStr + "'" + paramValue + "'";
							}
						} else if ("3".equals(strArray[3])) { // 数字
							if ("like".equals(strArray[2])) {
								sqlStr = "";
							} else {
								sqlStr = sqlStr + paramValue;
							}
						}
					//}
				}
			}
		}
		return sqlStr;
	}
	
}
