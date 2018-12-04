package com.jf.util;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import mt.database.extend.QueryConnection;

public class Binary2File {

	public static void main(String[] args) throws Exception {
		read();
	}

	/**
	 * 数据库图片导出到文件
	 * 
	 * @throws SQLException
	 * @throws IOException
	 */
	private static void read() throws SQLException, IOException {
		String file = "";
		String path = "D:\\img_temp\\"; // 要创建的目录
		java.sql.Statement stmt = null;
		java.sql.ResultSet rs = null;
		QueryConnection qc = new QueryConnection();
		String sql = "select a.jfinsectname,t.jfimage from dbch_img t,dbch a where t.jfdbch_id=a.jfid";
		stmt = qc.con.createStatement();
		rs = stmt.executeQuery(sql);
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		while (rs.next()) {
			file = path + rs.getString(1) + ".jpg";
			java.io.InputStream is = rs.getBinaryStream(2);
			java.io.FileOutputStream fos = new java.io.FileOutputStream(file);
			int i = 0;
			while ((i = is.read()) != -1) {
				fos.write(i);
			}
			if (fos != null) {
				fos.close();
			}
			if (is != null) {
				is.close();
			}
		}
	}
}
