package com.jf.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import mt.database.extend.QueryConnection;

/**
 * 操作Excel表格的功能类
 */
public class ExcelReader {
	private String zbid;

	public void setZbid(String zbid) {
		this.zbid = zbid;
	}

	/**
	 * 读取Excel数据内容
	 * 
	 * @param InputStream
	 * @return Map 包含单元格数据内容的Map对象
	 */
	public Map<Integer, String> readExcelContent(InputStream is) {
		Map<Integer, String> content = new HashMap<Integer, String>();
		String str = ""; // map.value (separated by @)
		Workbook rwb = null;
		
		try {
			rwb = Workbook.getWorkbook(is);
			Sheet sheet = rwb.getSheets()[0];
			
			int rowNum = sheet.getRows(); // 得到总行数
			int colNum = sheet.getColumns(); // 得到总列数
			int rowIdx = getBodyIndex(); // row index of content
			int mapIdx = 0; // map.key
			for (int i=rowIdx; i<rowNum; i++) {
				Cell[] cells = sheet.getRow(i);
				for (int j=0; j<colNum; j++) {
					str += getCellFormatValue(cells[j]) + "@";
				}
				str = str.substring(0, str.length()-1);
				content.put(mapIdx++, str);
				str = "";
			}
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return content;
	}
	
	/**
	 * 读取Excel数据内容(针对行定义报表)
	 * 
	 * @param InputStream
	 * @return Map 包含单元格数据内容的Map对象
	 */
	public Map<Integer, String> readExcelContentR(InputStream is) {
		Map<Integer, String> content = new HashMap<Integer, String>();
		String str = ""; // map.value (separated by @)
		Workbook rwb = null;
		try {
			rwb = Workbook.getWorkbook(is);
			Sheet sheet = rwb.getSheets()[0];
			
			int rowNum = sheet.getRows(); // 得到总行数
			int rowIdx = getBodyIndex(); // row index of content
			int mapIdx = 0; // map.key
			for (int i=rowIdx; i<rowNum; i++) {
				Cell[] cells = sheet.getRow(i);
				for (int j=1; j<cells.length; j++) {
					str += getCellFormatValue(cells[j]) + "@";
				}
				str = str.substring(0, str.length()-1);
				content.put(mapIdx++, str);
				str = "";
			}
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return content;
	}
	
	/**
	 * 根据Cell类型设置数据
	 * 
	 * @param cell cell object
	 * @return formatted data
	 */
	private String getCellFormatValue(Cell cell) {
		String cellvalue = "";
		if (cell.getType() == CellType.DATE) { // 判断当前的cell是否为Date
        	DateCell dc = (DateCell) cell;
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        	cellvalue = "TO_DATE('" + sdf.format(dc.getDate()) + "','YYYY-MM-DD')";
        } else {
        	cellvalue = "'" + cell.getContents() + "'";
        }
		return cellvalue;
	}

	/**
	 * get total lines of title
	 */
	public int getBodyIndex() {
		int index = -1;
		String sql = "SELECT (\n" +
			"(SELECT MAX(JFCOLROWORD) FROM DBBZB_GS WHERE JFDBBZB_ID='" + zbid + "' AND JFCOLVEST='0')\n" + 
			"+\n" + 
			"(SELECT MAX(JFCOLROWORD) FROM DBBZB_GS WHERE JFDBBZB_ID='" + zbid + "' AND JFCOLVEST='1')\n" + 
			") FROM DUAL";
		QueryConnection qc = new QueryConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = qc.con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				index = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			qc.close();
		}
		return index;
	}
	
	/**
	 * @param zbid dbbzb.jfid
	 * @return list of content field
	 */
	public List<String> getBodyFields() {
		List<String> list = new ArrayList<String>();
		String sql = "SELECT JFCOLCODE FROM DBBZB_GS WHERE JFDBBZB_ID='" + zbid + "' AND JFCOLVEST='2' ORDER BY JFCOLORDER";
		QueryConnection qc = new QueryConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = qc.con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			qc.close();
		}
		return list;
	}
	
	public static void main(String[] args) throws Exception {
		ExcelReader er = new ExcelReader();
		er.setZbid("853");
		InputStream is = new FileInputStream(new File("C:\\Users\\Admin\\Desktop\\2003_hhh.xls"));
		Workbook rwb = null;
	
		rwb = Workbook.getWorkbook(is);
		Sheet sheet = rwb.getSheets()[0];
		
		int rowNum = sheet.getRows(); // 得到总行数
		int rowIdx = er.getBodyIndex();
		for (int i=rowIdx; i<rowNum; i++) {
			Cell[] cells = sheet.getRow(i);
			for (int j=1; j<cells.length; j++) {
				System.out.print(cells[j].getContents()  + "@");
			}
			System.out.println();
		}
	}
}