package com.jf.util;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import mt.database.extend.ExecuteConnection;
import mt.database.extend.QueryConnection;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddress;

public class ExcelOperate {
	String zbid="";
	String path="";
	String jfid="";
	private  HSSFWorkbook wb;
	private  String JFNO;
	private String KSTBRQ ;
	private String JZTBRQ ;
	private String RWSJ ;
	private String BBLX ;
	private String LRRY ;
	private String BMBM ;
	private String DCRQ;
	private String rwid ;
	private String ZT="0";
	public ExcelOperate(String path,String zbid,String jfid)
	{
		this.path=path;
		this.zbid=zbid;
		this.jfid=jfid;
	}
	/**
	 * id不为空时
	 * @return
	 */
    public  String exupload(){
       File file = new File(path);
       String[][] result;
       try {
    		 //查询字段
			String sql="select JFCOLID,JFCOLSTYLE,JFCOLVEST  from DBBZB_JG t where jfdbbzb_id="+zbid+" and JFCOLVEST=2 order by JFCOLID";
			 QueryConnection qcbody = new QueryConnection();
			 String zdm="";
			 String syl="";
			    Statement stmtbody = null;
			    ResultSet rsbody = null;
				    stmtbody = qcbody.con.createStatement();
				    rsbody = stmtbody.executeQuery(sql);
				    while (rsbody.next()) {
				    	zdm +=rsbody.getString("JFCOLID")+",";
				    	syl +=rsbody.getString("JFCOLSTYLE")+",";
				    }
	   zdm=zdm.substring(0,zdm.length()-1);
	   syl=syl.substring(0,syl.length()-1);
	   ExecuteConnection ec = new ExecuteConnection();
	   String[] zdms=zdm.split(",");
	   String[] syls=syl.split(",");
	   result = getData(file, 1);
       int rowLength = result.length;
       String zd="";
       String value="";
       for(int i=0;i<rowLength;i++) {
    	   sql="";
    	   zd="";
    	   value="";
           for(int j=0;j<zdms.length;j++) {
        	   if(syls[j].equals("1"))
        	   {
        		   value +="to_date('"+result[i][j]+"','yyyy-mm-dd'),";
        	   }
        	   else if(syls[j].equals("2"))
        	   {
        		   value +="'"+result[i][j]+"'"+",";
        	   }
        	   else
        	   {
        		   value +=result[i][j]+",";
        	   }
        	   zd+=zdms[j]+",";
           }
           value=value.substring(0, value.length()-1);
           zd=zd.substring(0, zd.length()-1);
           sql+="INSERT INTO D"+zbid+"_BODY (JFID,JFDYID,"+zd+") VALUES (SEQU_D"+zbid+"_BODY.NEXTVAL,"+jfid+","+value+")";
           Statement stmt = ec.con.createStatement();
           stmt.executeUpdate(sql);
           ec.con.commit();
       }
	} catch (Exception e) {
		e.printStackTrace();
		 return "erro";
	}
       return "SUCCESS";
    }
    //特殊表特殊处理
    public  String exupload_n(){
    	File file=new File(path);
    	String[][] result;
    	int ignoreRows=0;
    		try {
    			if(zbid.equals("001"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("002"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("003"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("004"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("005"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("006"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("007"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("008"))
    			{
    				ignoreRows=2;
    			}
    			if(zbid.equals("009"))
    			{
    				ignoreRows=2;
    			}
    			if(zbid.equals("010"))
    			{
    				ignoreRows=2;
    			}
    			if(zbid.equals("011"))
    			{
    				ignoreRows=2;
    			}
    			if(zbid.equals("012"))
    			{
    				ignoreRows=2;
    			}
    			if(zbid.equals("013"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("014"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("015"))
    			{
    				ignoreRows=2;
    			}
    			if(zbid.equals("016"))
    			{
    				ignoreRows=2;
    			}
    			if(zbid.equals("017"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("018"))
    			{
    				ignoreRows=2;
    			}
    			if(zbid.equals("019"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("020"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("021"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("022"))
    			{
    				ignoreRows=3;
    			}
    			if(zbid.equals("023"))
    			{
    				ignoreRows=2;
    			}
    			if(zbid.equals("024"))
    			{
    				ignoreRows=2;
    			}
    			 result=getData(file,ignoreRows);
				  if(zbid.equals("001")){
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
								+ jfid + "','" + result[1][1] + "','" + result[1][2]
								+ "','" + result[1][3] + "','" + result[1][4] + "','"
								+ result[1][5] + "','" + result[1][6] + "','"
								+ result[1][7] + "','" + result[1][8] + "','"
								+ result[1][9] + "','" + result[1][10] + "','"
								+ result[1][11] + "','" + result[1][12] + "','"
								+ result[1][13] + "','" + result[1][14] + "','"
								+ result[1][15] + "','" + result[1][17] + "','" + result[1][18]
								+ "','" + result[1][19] + "','" + result[2][1] + "','"
								+ result[2][2] + "','" + result[2][3] + "','"
								+ result[2][4] + "','" + result[2][5] + "','"
								+ result[2][6] + "','" + result[2][7] + "','"
								+ result[2][8] + "','" + result[2][9] + "','"
								+ result[2][10] + "','" + result[2][11] + "','"
								+ result[2][12] + "','" + result[2][13] + "','"
								+ result[2][14] + "','" + result[2][15] + "','"
								+ result[2][19] + "','" + result[3][1] + "','"
								+ result[3][2] + "','" + result[3][3] + "','"
								+ result[3][4] + "','" + result[3][5] + "','"
								+ result[3][6] + "','" + result[3][7] + "','"
								+ result[3][8] + "','" + result[3][9] + "','"
								+ result[3][10] + "','" + result[3][11] + "','"
								+ result[3][12] + "','" + result[3][13] + "','"
								+ result[3][14] + "','" + result[3][15] + "','"
								+ result[3][17] + "','" + result[3][18] + "','"
								+ result[3][19] + "','" + result[4][1] + "','"
								+ result[4][2] + "','" + result[4][5] + "','"
								+ result[4][6] + "','" + result[4][7] + "','"
								+ result[4][8] + "','" + result[4][9] + "','"
								+ result[4][10] + "','" + result[4][11] + "','"
								+ result[4][12] + "','" + result[4][13] + "','"
								+ result[4][14] + "','" + result[4][15] + "','"
								+ result[4][17] + "','" + result[4][18] + "','"
								+ result[4][19] + "','" + result[5][1] + "','"
								+ result[5][2] + "','" + result[5][3] + "','"
								+ result[5][4] + "','" + result[5][5] + "','"
								+ result[5][6] + "','" + result[5][7] + "','"
								+ result[5][8] + "','" + result[5][9] + "','"
								+ result[5][10] + "','" + result[5][11] + "','"
								+ result[5][12] + "','" + result[5][13] + "','"
								+ result[5][14] + "','" + result[5][15] + "','"
								+ result[5][17] + "','" + result[5][18] + "','"
								+ result[5][19] + "','" + result[6][1] + "','"
								+ result[6][2] + "','" + result[6][3] + "','"
								+ result[6][4] + "','" + result[6][5] + "','"
								+ result[6][6] + "','" + result[6][7] + "','"
								+ result[6][8] + "','" + result[6][9] + "','"
								+ result[6][10] + "','" + result[6][11] + "','"
								+ result[6][12] + "','" + result[6][13] + "','"
								+ result[6][14] + "','" + result[6][15] + "','"
								+ result[6][17] + "','" + result[6][18] + "','"
								+ result[6][19] + "','" + result[7][1] + "','"
								+ result[7][2] + "','" + result[7][3] + "','"
								+ result[7][4] + "','" + result[7][5] + "','"
								+ result[7][6] + "','" + result[7][7] + "','"
								+ result[7][8] + "','" + result[7][9] + "','"
								+ result[7][10] + "','" + result[7][11] + "','"
								+ result[7][12] + "','" + result[7][13] + "','"
								+ result[7][14] + "','" + result[7][15] + "','"
								+ result[7][17] + "','" + result[7][18] + "','"
								+ result[7][19] + "','" + result[8][1] + "','" + result[9][1] + "','"
								+ result[10][1] + "','" + result[11][1] + "','" + result[0][1] + "','"
								+ result[0][2] + "','" + result[0][3] + "','"
								+ result[0][4] + "','" + result[0][5] + "','"
								+ result[0][6] + "','" + result[0][7] + "','"
								+ result[0][8] + "','" + result[0][9] + "','"
								+ result[0][10] + "','" + result[0][11] + "','"
								+ result[0][12] + "','" + result[0][13] + "','"
								+ result[0][14] + "','" + result[0][15] + "','" + result[0][16]
								+ "','" + result[0][17] + "','" + result[0][18] + "','"
								+ JFNO + "',to_date('" + KSTBRQ
								+ "','yyyy-MM-dd HH24:mi:ss'),to_date('"
								+ JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'" + LRRY
								+ "',to_date('" + RWSJ
								+ "','yyyy-MM-dd HH24:mi:ss'),to_date('" + DCRQ
								+ "','yyyy-MM-dd'),'" + result[2][17] + "','"
								+ result[2][18] + "','" + wb.getSheetAt(0).getRow(7).getCell(17) + "','"
								+ wb.getSheetAt(0).getRow(7).getCell(18) + "','" + wb.getSheetAt(0).getRow(8).getCell(17) + "','"
								+ wb.getSheetAt(0).getRow(8).getCell(18) + "','" + result[4][3] + "','"
								+ result[4][4] + "','" + wb.getSheetAt(0).getRow(9).getCell(17) + "','"
								+ wb.getSheetAt(0).getRow(9).getCell(18) + "')";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				 	   }
				  if(zbid.equals("002")){
					  String sql = "INSERT INTO D" + zbid + " ("
								+ "JFID,YDYMM_DQFS,YDYMM_DQTB_FS,YDYMM_BZFS,"
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
								+ "XB_FSQY,SYQ,FSQK,FKQK,FKFX,HJ_DQFS,"
								+ "HJ_DQTB_FS,HJ_BZFS,HJ_LJFS,"
								+ "HJ_LJTB_SQ,HJ_LJTB_SZ,HJ_DQFZ,"
								+ "HJ_DQTB_FZ,HJ_BZWC,HJ_LJFZ,"
								+ "HJ_LJTB_FZ,HJ_FZXG,HJ_RXFZ,"
								+ "HJ_PJMD,HJ_ZGMD,HJ_FSQY,"
								+ "JFNO,KSTBRQ,JZTBRQ,BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,"
								+ "DCRQ,YDYMM_PJMD_BZ,YDYMM_ZGMD_BZ,"
								+ "EDYMM_PJMD_BZ,EDYMM_ZGMD_BZ,SDYMM_PJMD_BZ,"
								+ "SDYMM_ZGMD_BZ) VALUES ('" + jfid
								+ "','" + result[1][3] + "','" + result[1][4]+"','"+result[1][5]
								+ "','" + result[1][6] + "','" + result[1][7]
								+ "','" + result[1][8] + "','" + result[1][9]
								+ "','" + result[1][10] + "','" + result[1][11]
								+ "','" + result[1][12] + "','" + result[1][13]
								+ "','" + result[1][14] + "','" + result[1][15]
								+ "','" + result[1][17] + "','" + result[1][18]
								+ "','" + result[1][19] + "','" + result[2][3]
								+ "','" + result[2][4] + "','" + result[2][5]
								+ "','" + result[2][6] + "','" + result[2][7]
								+ "','" + result[2][8] + "','" + result[2][9]
								+ "','" + result[2][10] + "','" + result[2][1]
								+ "','" + result[1][2] + "','" + result[2][11]
								+ "','" + result[2][12] + "','" + result[2][13]
								+ "','" + result[2][14] + "','" + result[2][15]
								+ "','" + result[2][17] + "','" + result[2][18]
								+ "','" + result[2][19] + "','" + result[3][1]
								+ "','" + result[3][2] + "','" + result[3][3]
								+ "','" + result[3][4] + "','" + result[3][5]
								+ "','" + result[3][6] + "','" + result[3][7]
								+ "','" + result[3][8] + "','" + result[3][9]
								+ "','" + result[3][10] + "','" + result[3][11]
								+ "','" + result[3][12] + "','" + result[3][13]
								+ "','" + result[3][14] + "','" + result[3][15]
								+ "','" + result[3][17] + "','" + result[3][18]
								+ "','" + result[3][19] + "','" + result[4][1]
								+ "','" + result[4][2] + "','" + result[4][3] + "','"
								+ result[4][4] + "','" + result[4][5] + "','"
								+ result[4][6] + "','" + result[4][7] + "','"
								+ result[4][8] + "','" + result[4][9] + "','"
								+ result[4][10] + "','" + result[4][11] + "','"
								+ result[4][12] + "','" + result[4][13] + "','"
								+ result[4][19] + "','" + result[5][1] + "','"
								+ result[5][2] + "','" + result[5][3] + "','"
								+ result[5][4] + "','" + result[5][5] + "','"
								+ result[5][6] + "','" + result[5][7] + "','"
								+ result[5][8] + "','" + result[5][9] + "','"
								+ result[5][10] + "','" + result[5][11] + "','"
								+ result[5][12] + "','" + result[5][13] + "','"
								+ result[5][19] + "','" + result[6][1] + "','" + result[6][2]
								+ "','" + result[6][3] + "','" + result[6][4] + "','"
								+ result[6][5] + "','" + result[6][6] + "','"
								+ result[6][7] + "','" + result[6][8] + "','"
								+ result[6][9] + "','" + result[6][10] + "','"
								+ result[6][11] + "','" + result[6][12] + "','"
								+ result[6][13] + "','" + result[6][19] + "','"
								+ result[7][1] + "','" + result[7][2] + "','"
								+ result[7][3] + "','" + result[7][4] + "','"
								+ result[7][5] + "','" + result[7][6] + "','"
								+ result[7][7] + "','" + result[7][8] + "','"
								+ result[7][9] + "','" + result[7][10] + "','"
								+ result[7][11] + "','" + result[7][12] + "','"
								+ result[7][13] + "','" + result[7][19] + "','"
								+ result[8][19] + "','" + result[9][19] + "','"
								+ result[10][19] + "','" + result[11][19] + "','"
								+ result[12][19] + "','" + result[13][19] + "','" + result[14][1]
								+ "','" + result[15][1] + "','" + result[16][1] + "','" + result[17][1]
								+ "','" + result[0][3] + "','" + result[0][4] + "','"
								+ result[0][5] + "','" + result[0][6] + "','"
								+ result[0][7] + "','" + result[0][8] + "','"
								+ result[0][9] + "','" + result[0][10] + "','"
								+ result[0][11] + "','" + result[0][12] + "','"
								+ result[0][13] + "','" + result[0][14] + "','"
								+ result[0][15] + "','" + result[0][16] + "','" + result[0][18]
								+ "','" + result[0][19] + "','" + JFNO
								+ "',to_date('" + KSTBRQ
								+ "','yyyy-MM-dd HH24:mi:ss'),to_date('"
								+ JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'" + LRRY
								+ "',to_date('" + RWSJ
								+ "','yyyy-MM-dd HH24:mi:ss'),"
								+ "to_date('" + DCRQ + "','yyyy-MM-dd'),'"
								+ wb.getSheetAt(0).getRow(6).getCell(17) + "','" + wb.getSheetAt(0).getRow(6).getCell(18) + "','"
								+ wb.getSheetAt(0).getRow(8).getCell(17) + "','" + wb.getSheetAt(0).getRow(8).getCell(17) + "','"
								+ wb.getSheetAt(0).getRow(10).getCell(17) + "','"
								+ wb.getSheetAt(0).getRow(10).getCell(17) + "')";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("003")){
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
								+ "YDD_DQTB_FS,DCRQ) VALUES ('" + jfid + "','"
								+ result[1][1] + "','" + result[1][2] + "','"
								+ result[1][3] + "','" + result[1][5] + "','"
								+ result[1][6] + "','" + result[1][7] + "','"
								+ result[1][8] + "','" + result[1][9] + "','"
								+ result[1][10] + "','" + result[1][11] + "','"
								+ result[1][12] + "','" + result[1][13] + "','"
								+ result[1][14] + "','" + result[1][15] + "','"
								+ result[1][17] + "','" + result[1][18] + "','"
								+ result[1][19] + "','" + result[2][1] + "','" + result[2][2]
								+ "','" + result[2][3] + "','" + result[2][4] + "','"
								+ result[2][5] + "','" + result[2][6] + "','"
								+ result[2][7] + "','" + result[2][8] + "','"
								+ result[2][9] + "','" + result[2][10] + "','"
								+ result[2][11] + "','" + result[2][12] + "','"
								+ result[2][13] + "','" + result[2][14] + "','"
								+ result[2][15] + "','" + result[2][17] + "','" + result[2][18]
								+ "','" + result[2][19] + "','" + result[3][1] + "','"
								+ result[3][2] + "','" + result[3][3] + "','"
								+ result[3][4] + "','" + result[3][5] + "','"
								+ result[3][6] + "','" + result[3][7] + "','"
								+ result[3][8] + "','" + result[3][9] + "','"
								+ result[3][10] + "','" + result[3][11] + "','"
								+ result[3][12] + "','" + result[3][13] + "','"
								+ result[3][14] + "','" + result[3][15] + "','" + result[3][17]
								+ "','" + result[3][18] + "','" + result[3][19] + "','"
								+ result[4][1] + "','" + result[4][2] + "','"
								+ result[4][3] + "','" + result[4][4] + "','"
								+ result[4][5] + "','" + result[4][6] + "','"
								+ result[4][7] + "','" + result[4][8] + "','"
								+ result[4][9] + "','" + result[4][10] + "','"
								+ result[4][11] + "','" + result[4][12] + "','"
								+ result[4][13] + "','" + result[4][14] + "','"
								+ result[4][15] + "','" + result[4][17] + "','"
								+ result[4][18] + "','" + result[4][19] + "','"
								+ result[5][1] + "','" + result[5][2] + "','"
								+ result[5][3] + "','" + result[5][4] + "','"
								+ result[5][5] + "','" + result[5][6] + "','"
								+ result[5][7] + "','" + result[5][8] + "','"
								+ result[5][9] + "','" + result[5][10] + "','"
								+ result[5][11] + "','" + result[5][12] + "','"
								+ result[5][13] + "','" + result[5][14] + "','"
								+ result[5][15] + "','" + result[5][17] + "','"
								+ result[5][18] + "','" + result[5][19] + "','" + result[6][1]
								+ "','" + result[7][1] + "','" + result[8][1] + "','" + result[9][1]
								+ "','" + result[0][3] + "','" + result[0][4] + "','"
								+ result[0][5] + "','" + result[0][6] + "','"
								+ result[0][7] + "','" + result[0][8] + "','"
								+ result[0][9] + "','" + result[0][10] + "','"
								+ result[0][11] + "','" + result[0][12] + "','"
								+ result[0][13] + "','" + result[0][14] + "','"
								+ result[0][15] + "','" + result[0][16] + "','" + result[0][18]
								+ "','" + result[0][19] + "','" + JFNO
								+ "',to_date('" + KSTBRQ
								+ "','yyyy-MM-dd HH24:mi:ss'),to_date('"
								+ JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'" + LRRY
								+ "',to_date('" + RWSJ
								+ "','yyyy-MM-dd HH24:mi:ss'),'" + ZT + "','"
								+ result[1][4] + "',to_date('" + DCRQ
								+ "','yyyy-MM-dd'))";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("004")){
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
								+ "MY_SJSS,DCRQ) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[0][2] + "','"+result[0][3]+"','"
								+ result[0][5] + "','" + result[1][1] + "','"+result[1][2]+"','"
								+ result[1][3] + "','" + result[1][4] + "','"+result[1][5]+"','"
								+ result[2][1] + "','" + result[2][2] + "','"+result[2][3]+"','"
								+ result[2][4] + "','" + result[2][5] + "','"+result[3][1]+"','"
								+ result[3][2] + "','" + result[3][3] + "','"+result[3][4]+"','"
								+ result[3][5] + "','" + result[4][1] + "','"+result[4][2]+"','"
								+ result[4][3] + "','" + result[4][4] + "','"+result[4][5]+"','"
								+ result[5][1] + "','" + result[5][2] + "','"+result[5][3]+"','"
								+ result[5][4] + "','" + result[5][5] + "','"+result[6][1]+"','"
								+ result[6][2] + "','" + result[6][3] + "','"+result[6][4]+"','"
								+ result[6][5] + "','" + result[7][1] + "','"+result[7][2]+"','"
								+ result[7][3] + "','" + result[7][4] + "','"+result[7][5]+"','"
								+ result[8][1] + "','" + result[8][2] + "','"+result[8][3]+"','"
								+ result[8][4] + "','" + result[8][5] + "','"+result[9][1]+"','"
								+ result[9][2] + "','" + result[9][3] + "','"+result[9][4]+"','"
								+ result[9][5] + "','" + result[10][1] + "','"+result[10][2]+"','"
								+ result[10][3] + "','" + result[10][4] + "','"+result[10][5]+"','"
								+ result[11][1] + "','" + result[11][2] + "','"+result[11][3]+"','"
								+ result[11][4] + "','" + result[11][5] + "','"+result[12][1]+"','"
								+ result[12][2] + "','" + result[12][3] + "','"+result[12][4]+"','"
								+ result[12][5] + "','" + result[13][1] + "','"+result[13][2]+"','"
								+ result[13][3] + "','" + result[13][4] + "','"+result[13][5]+"','"
								+ result[13][1] + "','" + result[13][2] + "','"+result[13][3]+"','"
								+ result[13][4] + "','" + result[13][5] + "','"+result[14][1]+"','"
								+ result[14][2] + "','" + result[14][3] + "','"+result[14][4]+"','"
								+ result[14][5] + "','" + result[15][1] + "','"+result[15][2]+"','"
								+ result[15][3] + "','" + result[15][4] + "','"+result[15][5]+"','"
								+ result[16][1] + "','" + result[16][2] + "','"+result[16][3]+"','"
								+ result[16][4] + "','" + result[16][5] + "','"+result[17][1]+"','"
								+ result[17][2] + "','" + result[17][3] + "','"+result[17][4]+"','"
								+ result[17][5] + "','" + result[18][1] + "','"+result[18][2]+"','"
								+ result[18][3] + "','" + result[18][4] + "','"+result[18][5]+"','"
								+ result[19][1] + "','" + result[19][2] + "','"+result[19][3]+"','"
								+ result[19][4] + "','" + result[19][5] + "','"+result[20][1]+"','"
								+ result[20][2] + "','" + result[20][3] + "','"+result[20][4]+"','"
								+ result[20][5] + "','" + result[21][1] + "','"+result[21][2]+"','"
								+ result[21][3] + "','" + result[21][4] + "','"+result[21][5]+"','"
								+ result[22][1] + "','" + result[22][2] + "','"+result[22][3]+"','"
								+ result[22][4] + "','" + result[22][5] + "','"+result[23][1]+"','"
								+ result[23][2] + "','" + result[23][3] + "','"+result[23][4]+"','"
								+ result[23][5] + "','" + result[24][1] + "','"+result[24][2]+"','"
								+ result[24][3] + "','" + result[24][4] + "','"+result[24][5]+"','"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"','"
								+ result[0][4] + "',to_date('" + DCRQ + "','yyyy-MM-dd'))";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("005")){
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
								+ "YDYMM_SJSS,DCRQ) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[0][2] + "','"+result[0][3]+"','"
								+ result[0][5] + "','" + result[0][6] + "',to_date('"+result[0][7]+"','yyyy-MM-dd'),'"
								+ result[0][8] + "','" + result[1][1] + "','"+result[1][2]+"','"
								+ result[1][3] + "','" + result[1][4] + "','"+result[1][5]+"','"
								+ result[1][6] + "',to_date('" + result[1][7] + "','yyyy-MM-dd'),'"+result[1][8]+"','"
								+ result[2][1] + "','" + result[2][2] + "','"+result[2][3]+"','"
								+ result[2][4] + "','" + result[2][5] + "','"+result[2][6]+"',to_date('"
								+ result[2][7] + "','yyyy-MM-dd'),'" + result[2][8] + "','"+result[3][1]+"','"
								+ result[3][2] + "','" + result[3][3] + "','"+result[3][4]+"','"
								+ result[3][5] + "','" + result[3][6] + "',to_date('"+result[3][7]+"','yyyy-MM-dd'),'"
								+ result[3][8] + "','" + result[4][1] + "','"+result[4][2]+"','"
								+ result[4][3] + "','" + result[4][4] + "','"+result[4][5]+"','"
								+ result[4][6] + "',to_date('" + result[4][7] + "','yyyy-MM-dd'),'"+result[4][8]+"','"
								+ result[5][1] + "','" + result[5][2] + "','"+result[5][3]+"','"
								+ result[5][4] + "','" + result[5][5] + "','"+result[5][6]+"',to_date('"
								+ result[5][7] + "','yyyy-MM-dd'),'" + result[5][8] + "','"+result[6][1]+"','"
								+ result[6][2] + "','" + result[6][3] + "','"+result[6][4]+"','"
								+ result[6][5] + "','" + result[6][6] + "',to_date('"+result[6][7]+"','yyyy-MM-dd'),'"
								+ result[6][8] + "','" + result[7][1] + "','"+result[7][2]+"','"
								+ result[7][3] + "','" + result[7][4] + "','"+result[7][5]+"','"
								+ result[7][6] + "',to_date('" + result[7][7] + "','yyyy-MM-dd'),'"+result[7][8]+"','"
								+ result[8][1] + "','" + result[8][2] + "','"+result[8][3]+"','"
								+ result[8][4] + "','" + result[8][5] + "','"+result[8][6]+"',to_date('"
								+ result[8][7] + "','yyyy-MM-dd'),'" + result[8][8] + "','"+result[9][1]+"','"
								+ result[9][2] + "','" + result[9][3] + "','"+result[9][4]+"','"
								+ result[9][5] + "','" + result[9][6] + "',to_date('"+result[9][7]+"','yyyy-MM-dd'),'"
								+ result[9][8] + "','" + result[10][1] + "','"+result[10][2]+"','"
								+ result[10][3] + "','" + result[10][4] + "','"+result[10][5]+"','"
								+ result[10][6] + "',to_date('" + result[10][7] + "','yyyy-MM-dd'),'"+result[10][8]+"','"
								+ result[11][1] + "','" + result[11][2] + "','"+result[11][3]+"','"
								+ result[11][4] + "','" + result[11][5] + "','"+result[11][6]+"',to_date('"
								+ result[11][7] + "','yyyy-MM-dd'),'" + result[11][8] + "','"+result[12][1]+"','"
								+ result[12][2] + "','" + result[12][3] + "','"+result[12][4]+"','"
								+ result[12][5] + "','" + result[12][6] + "',to_date('"+result[12][7]+"','yyyy-MM-dd'),'"
								+ result[12][8] + "','" + result[13][1] + "','"+result[13][2] +"','"
								+ result[13][3]  + "','" + result[13][4]  + "','"+result[13][5] +"','"
								+ result[13][6]  + "',to_date('" + result[13][7]  + "','yyyy-MM-dd'),'"+result[13][8] +"','"
								+ result[14][1] + "','" + result[14][2] + "','"+result[14][3]+"','"
								+ result[14][4] + "','" + result[14][5] + "','"+result[14][6]+"',to_date('"
								+ result[14][7] + "','yyyy-MM-dd'),'" + result[14][8] + "','"+result[15][1]+"','"
								+ result[15][2] + "','" + result[15][3] + "','"+result[15][4]+"','"
								+ result[15][5] + "','" + result[15][6] + "',to_date('"+result[15][7]+"','yyyy-MM-dd'),'"
								+ result[15][8] + "','" + result[16][1] + "','"+result[16][2]+"','"
								+ result[16][3] + "','" + result[16][4] + "','"+result[16][5]+"','"
								+ result[16][6] + "',to_date('" + result[16][7] + "','yyyy-MM-dd'),'"+result[16][8]+"','"
								+ result[17][2] + "','"+result[17][3]+"','"
								+ result[17][4] + "','" + result[17][5] + "','"+result[17][6]+"',to_date('"
								+ result[17][7] + "','yyyy-MM-dd'),'" + result[17][8] + "','"+result[18][1]+"','"
								+ result[18][2] + "','" + result[18][3] + "','"+result[18][4]+"','"
								+ result[18][5] + "','" + result[18][6] + "',to_date('"+result[18][7]+"','yyyy-MM-dd'),'"
								+ result[18][8] + "','" + result[19][1] + "','"+result[19][2]+"','"
								+ result[19][3] + "','" + result[19][4] + "','"+result[19][5]+"','"
								+ result[19][6] + "',to_date('" + result[19][7] + "','yyyy-MM-dd'),'"+result[19][8]+"','"
								+ result[20][1] + "','" + result[20][2] + "','"+result[20][3]+"','"
								+ result[20][4] + "','" + result[20][5] + "','"+result[20][6]+"',to_date('"
								+ result[20][7] + "','yyyy-MM-dd'),'" + result[20][8] + "','"+result[21][1]+"','"
								+ result[21][2] + "','" + result[21][3] + "','"+result[21][4]+"','"
								+ result[21][5] + "','" + result[21][6] + "',to_date('"+result[21][7]+"','yyyy-MM-dd'),'"
								+ result[21][8] + "','" + result[22][1] + "','"+result[22][2]+"','"
								+ result[22][3] + "','" + result[22][4] + "','"+result[22][5]+"','"
								+ result[22][6] + "',to_date('" + result[22][7] + "','yyyy-MM-dd'),'"+result[22][8]+"','"
								+ result[23][1] + "','" + result[23][2] + "','"+result[23][3]+"','"
								+ result[23][4] + "','" + result[23][5] + "','"+result[23][6]+"',to_date('"
								+ result[23][7] + "','yyyy-MM-dd'),'" + result[23][8] + "','"+result[24][1]+"','"
								+ result[24][2] + "','" + result[24][3] + "','"+result[24][4]+"','"
								+ result[24][5] + "','" + result[24][6] + "',to_date('"+result[24][7]+"','yyyy-MM-dd'),'"
								+ result[24][8] + "','" + result[25][1] + "','"+result[25][2]+"','"
								+ result[25][3] + "','" + result[25][4] + "','"+result[25][5]+"','"
								+ result[25][6] + "',to_date('" + result[25][7] + "','yyyy-MM-dd'),'"+result[25][8]+"','"
								+ result[26][1] + "','" + result[26][2] + "','"+result[26][3]+"','"
								+ result[26][4] + "','" + result[26][5] + "','"+result[26][6]+"',to_date('"
								+ result[26][7] + "','yyyy-MM-dd'),'" + result[26][8] + "','"+result[27][1]+"','"
								+ result[27][2] + "','" + result[27][3] + "','"+result[27][4]+"','"
								+ result[27][5] + "','" + result[27][6] + "',to_date('"+result[27][7]+"','yyyy-MM-dd'),'"
								+ result[27][8] + "','" + result[28][1] + "','"+result[28][2]+"','"
								+ result[28][3] + "','" + result[28][4] + "','"+result[28][5]+"','"
								+ result[28][6] + "',to_date('" + result[28][7] + "','yyyy-MM-dd'),'"+result[28][8]+"','"
							    + result[29][2] + "','"+result[29][3]+"','"
								+ result[29][4] + "','" + result[29][5] + "','"+result[29][6]+"',to_date('"
								+ result[29][7] + "','yyyy-MM-dd'),'" + result[29][8] + "','"
								+ result[30][2] + "','" + result[30][3] + "','"+result[30][4]+"','"
								+ result[30][5] + "','" + result[30][6] + "',to_date('"+result[30][7]+"','yyyy-MM-dd'),'"
								+ result[30][8] + "','"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"','"
								+ result[0][4] + "',to_date('" + DCRQ + "','yyyy-MM-dd'))";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("006")){
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
								+ "ELM_MJBL,DCRQ) VALUES ('" + jfid + "','"
								+ result[0][0] + "','" + result[0][3] + "','"+result[0][4]+"','"
								+ result[0][6] + "','" + result[0][7] + "','"+result[0][9]+"','"
								+ result[0][10] + "','" + result[2][1] + "','"+result[2][2]+"','"
								+ result[2][4] + "','" + result[2][5] + "','"+result[2][6]+"','"
								+ result[2][7] + "','" + result[2][8] + "','"+result[2][9]+"','"
								+ result[2][10] + "','" + result[3][1] + "','"+result[3][2]+"','"
								+ result[3][4] + "','" + result[3][5] + "','"+result[3][6]+"','"
								+ result[3][7] + "','" + result[3][8] + "','"+result[3][9]+"','"
								+ result[3][10] + "','" + result[4][1] + "','"+result[4][2]+"','"
								+ result[4][4] + "','" + result[4][5] + "','"+result[4][6]+"','"
								+ result[4][7] + "','" + result[4][8] + "','"+result[4][9]+"','"
								+ result[4][10] + "','" + result[5][1] + "','"+result[5][2]+"','"
								+ result[5][4] + "','" + result[5][5] + "','"+result[5][6]+"','"
								+ result[5][7] + "','" + result[5][8] + "','"+result[5][9]+"','"
								+ result[5][10] + "','" + result[6][1] + "','"+result[6][2]+"','"
								+ result[6][4] + "','" + result[6][5] + "','"+result[6][6]+"','"
								+ result[6][7] + "','" + result[6][8] + "','"+result[6][9]+"','"
								+ result[6][10] + "','" + result[7][1] + "','"+result[7][2]+"','"
								+ result[7][4] + "','" + result[7][5] + "','"+result[7][6]+"','"
								+ result[7][7] + "','" + result[7][8] + "','"+result[7][9]+"','"
								+ result[7][10] + "','" + result[8][1] + "','"+result[8][2]+"','"
								+ result[8][4] + "','" + result[8][5] + "','"+result[8][6]+"','"
								+ result[8][7] + "','" + result[8][8] + "','"+result[8][9]+"','"
								+ result[8][10] + "','" + result[9][1] + "','"+result[9][2]+"','"
								+ result[9][4] + "','" + result[9][5] + "','"+result[9][6]+"','"
								+ result[9][7] + "','" + result[9][8] + "','"+result[9][9]+"','"
								+ result[9][10] + "','" + result[10][1] + "','"+result[10][2]+"','"
								+ result[10][4] + "','" + result[10][5] + "','"+result[10][6]+"','"
								+ result[10][7] + "','" + result[10][8] + "','"+result[10][9]+"','"
								+ result[10][10] + "','" + result[11][1] + "','"+result[11][2]+"','"
								+ result[11][4] + "','" + result[11][5] + "','"+result[11][6]+"','"
								+ result[11][7] + "','" + result[11][8] + "','"+result[11][9] +"','"
								+ result[11][10] + "','" + result[12][1] + "','"+result[12][2] +"','"
								+ result[12][4] + "','" + result[12][5] + "','"+result[12][6] +"','"
								+ result[12][7] + "','" + result[12][8] + "','"+result[12][9] +"','"
								+ result[12][10] + "','" + result[13][1] + "','"+result[13][2] +"','"
								+ result[13][4] + "','" + result[13][5] + "','"+result[13][6] +"','"
								+ result[13][7] + "','" + result[13][8] + "','"+result[13][9] +"','"
								+ result[13][10] + "','" + result[14][1] + "','"+result[14][2] +"','"
								+ result[14][4] + "','" + result[14][5] + "','"+result[14][6] +"','"
								+ result[14][7] + "','" + result[14][8] + "','"+result[14][9] +"','"
								+ result[14][10] + "','" + result[14][3] + "','"+result[15][1] +"','"
								+ result[15][2] + "','" + result[15][4] + "','"+result[15][5] +"','"
								+ result[15][6] + "','" + result[15][7] + "','"+result[15][8] +"','"
								+ result[15][9] + "','" + result[15][10] + "','"+result[16][1] +"','"
								+ result[16][2] + "','" + result[16][4] + "','"+result[16][5] +"','"
								+ result[16][6] + "','" + result[16][7] + "','"+result[16][8] +"','"
								+ result[16][9] + "','" + result[16][10] + "','"+result[17][1] +"','"
								+ result[17][2] + "','" + result[17][4] + "','"+result[17][5] +"','"
								+ result[17][6] + "','" + result[17][7] + "','"+result[17][8] +"','"
								+ result[17][9] + "','" + result[17][10] + "','"+result[18][1] +"','"
								+ result[18][2] + "','" + result[18][4] + "','"+result[18][5] +"','"
								+ result[18][6] + "','" + result[18][7] + "','"+result[18][8] +"','"
								+ result[18][9] + "','" + result[18][10] + "','"+result[19][1] +"','"
								+ result[19][2] + "','" + result[19][4] + "','"+result[19][5] +"','"
								+ result[19][6] + "','" + result[19][7] + "','"+result[19][8] +"','"
								+ result[19][9] + "','" + result[19][10] + "','"+result[20][1] +"','"
								+ result[20][2] + "','" + result[20][4] + "','"+result[20][5] +"','"
								+ result[20][6] + "','" + result[20][7] + "','"+result[20][8] +"','"
								+ result[20][9] + "','" + result[20][10] + "','"+result[21][1] +"','"
								+ result[21][2] + "','" + result[21][4] + "','"+result[21][5] +"','"
								+ result[21][6] + "','" + result[21][7] + "','"+result[21][8] +"','"
								+ result[21][9] + "','" + result[21][10] + "','"+result[22][1] +"','"
								+ result[22][2] + "','" + result[22][4] + "','"+result[22][5] +"','"
								+ result[22][6] + "','" + result[22][7] + "','"+result[22][8] +"','"
								+ result[22][9] + "','" + result[22][10] + "','"+result[23][1] +"','"
								+ result[23][2] + "','" + result[23][4] + "','"+result[23][5] +"','"
								+ result[23][6] + "','" + result[23][7] + "','"+result[23][8] +"','"
								+ result[23][9] + "','" + result[23][10] + "','"+result[24][1] +"','"
								+ result[24][2] + "','" + result[24][4] + "','"+result[24][5] +"','"
								+ result[24][6] + "','" + result[24][7] + "','"+result[24][8] +"','"
								+ result[24][9] + "','" + result[24][10] + "','"+result[24][3] +"','"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"','"
								+ result[0][5] + "',to_date('" + DCRQ + "','yyyy-MM-dd'))";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("007")){
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
								+ "ELM_MJBL,DCRQ) VALUES ('" + jfid + "','"
								+ result[0][0] + "','" + result[0][2] + "','"+result[0][3]+"','"+result[0][4]+"','"
								+ result[0][6] + "','" + result[0][7] + "','"+result[0][8]+"','"
								+ result[0][9] + "','" + result[2][10] + "','"+result[2][1]+"','"
								+ result[2][3] + "','" + result[2][4] + "','"+result[2][5]+"','"
								+ result[2][6] + "','" + result[2][7] + "','"+result[2][8]+"','"
								+ result[2][9] + "','" + result[3][10] + "','"+result[3][1]+"','"
								+ result[3][3] + "','" + result[3][4] + "','"+result[3][5]+"','"
								+ result[3][6] + "','" + result[3][7] + "','"+result[3][8]+"','"
								+ result[3][9] + "','" + result[4][10] + "','"+result[4][1]+"','"
								+ result[4][3] + "','" + result[4][4] + "','"+result[4][5]+"','"
								+ result[4][6] + "','" + result[4][7] + "','"+result[4][8]+"','"
								+ result[4][9] + "','" + result[5][10] + "','"+result[5][1]+"','"
								+ result[5][3] + "','" + result[5][4] + "','"+result[5][5]+"','"
								+ result[5][6] + "','" + result[5][7] + "','"+result[5][8]+"','"
								+ result[5][9] + "','" + result[6][10] + "','"+result[6][1]+"','"
								+ result[6][3] + "','" + result[6][4] + "','"+result[6][5]+"','"
								+ result[6][6] + "','" + result[6][7] + "','"+result[6][8]+"','"
								+ result[6][9] + "','" + result[7][10] + "','"+result[7][1]+"','"
								+ result[7][3] + "','" + result[7][4] + "','"+result[7][5]+"','"
								+ result[7][6] + "','" + result[7][7] + "','"+result[7][8]+"','"
								+ result[7][9] + "','" + result[8][10] + "','"+result[8][1]+"','"
								+ result[8][3] + "','" + result[8][4] + "','"+result[8][5]+"','"
								+ result[8][6] + "','" + result[8][7] + "','"+result[8][8]+"','"
								+ result[8][9] + "','" + result[9][10]+ "','"+result[9][1]+"','"
								+ result[9][3] + "','" + result[9][4] + "','"+result[9][5]+"','"
								+ result[9][6] + "','" + result[9][7] + "','"+result[9][8]+"','"
								+ result[9][9] + "','" + result[10][10] + "','"+result[10][1]+"','"
								+ result[10][3] + "','" + result[10][4] + "','"+result[10][5]+"','"
								+ result[10][6] + "','" + result[10][7] + "','"+result[10][8]+"','"
								+ result[10][9] + "','" + result[10][10] + "','"+result[10][1]+"','"
								+ result[10][3] + "','" + result[10][4] + "','"+result[10][5]+"','"
								+ result[10][6] + "','" + result[10][7] + "','"+result[10][8] +"','"
								+ result[10][9] + "','" + result[11][10] + "','"+result[11][1] +"','"
								+ result[11][3] + "','" + result[11][4] + "','"+result[11][5] +"','"
								+ result[11][6] + "','" + result[11][7] + "','"+result[11][8] +"','"
								+ result[11][9] + "','" + result[12][10] + "','"+result[12][1] +"','"
								+ result[12][3] + "','" + result[12][4] + "','"+result[12][5] +"','"
								+ result[12][6] + "','" + result[12][7] + "','"+result[12][8] +"','"
								+ result[12][9] + "','" + result[13][10] + "','"+result[13][1] +"','"
								+ result[13][3] + "','" + result[13][4] + "','"+result[13][5] +"','"
								+ result[13][6] + "','" + result[13][7] + "','"+result[13][8] +"','"
								+ result[13][9] + "','" + result[13][2] + "','"+result[14][10] +"','"
								+ result[14][1] + "','" + result[14][3] + "','"+result[14][4] +"','"
								+ result[14][5] + "','" + result[14][6] + "','"+result[14][7] +"','"
								+ result[14][8] + "','" + result[14][9] + "','"+result[15][10] +"','"
								+ result[15][1] + "','" + result[15][3] + "','"+result[15][4] +"','"
								+ result[15][5] + "','" + result[15][6] + "','"+result[15][7] +"','"
								+ result[15][8] + "','" + result[15][9] + "','"+result[16][10] +"','"
								+ result[16][1] + "','" + result[16][3] + "','"+result[16][4] +"','"
								+ result[16][5] + "','" + result[16][6] + "','"+result[16][7] +"','"
								+ result[16][8] + "','" + result[16][9] + "','"+result[17][10] +"','"
								+ result[17][1] + "','" + result[17][3] + "','"+result[17][4] +"','"
								+ result[17][5] + "','" + result[17][6] + "','"+result[17][7] +"','"
								+ result[17][8] + "','" + result[17][9] + "','"+result[18][10] +"','"
								+ result[18][1] + "','" + result[18][3] + "','"+result[18][4] +"','"
								+ result[18][5] + "','" + result[18][6] + "','"+result[18][7] +"','"
								+ result[18][8] + "','" + result[18][9] + "','"+result[19][10] +"','"
								+ result[19][1] + "','" + result[19][3] + "','"+result[19][4] +"','"
								+ result[19][5] + "','" + result[19][6] + "','"+result[19][7] +"','"
								+ result[19][8] + "','" + result[19][9] + "','"+result[20][10] +"','"
								+ result[20][1] + "','" + result[20][3] + "','"+result[20][4] +"','"
								+ result[20][5] + "','" + result[20][6] + "','"+result[20][7] +"','"
								+ result[20][8] + "','" + result[20][9] + "','"+result[21][10] +"','"
								+ result[21][1] + "','" + result[21][3] + "','"+result[21][4] +"','"
								+ result[21][5] + "','" + result[21][6] + "','"+result[21][7] +"','"
								+ result[21][8] + "','" + result[21][9] + "','"+result[22][10] +"','"
								+ result[22][1] + "','" + result[22][3] + "','"+result[22][4] +"','"
								+ result[22][5] + "','" + result[22][6] + "','"+result[22][7] +"','"
								+ result[22][8] + "','" + result[22][9] + "','"+result[23][10] +"','"
								+ result[23][1] + "','" + result[23][3] + "','"+result[23][4] +"','"
								+ result[23][5] + "','" + result[23][6] + "','"+result[23][7] +"','"
								+ result[23][8] + "','" + result[23][9] + "','"+result[23][2] +"','"
								+ JFNO + "',to_date('" + KSTBRQ + "','yyyy-MM-dd HH24:mi:ss'),to_date('" + JZTBRQ + "','yyyy-MM-dd HH24:mi:ss'),'"
								+ BBLX + "','" + BMBM + "',sysdate,'"
								+ LRRY + "',to_date('" + RWSJ + "','yyyy-MM-dd HH24:mi:ss'),'"+ZT+"','"
								+ result[0][5] + "',to_date('" + DCRQ + "','yyyy-MM-dd'))";
						ExecuteConnection ec = new ExecuteConnection();
						Statement stmt = ec.con.createStatement();
						if (stmt.executeUpdate(sql) > 0) {
							ec.con.commit();
						}
						stmt.close();
						ec.close();
						//更新任务表
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("008")){
					// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "DCXZGS,DCZGS,PJBGHCS,PJBGHCZGSZ,"
								+ "PJBGHCZGNF,PJBGHCSBZGNFSLZJBL,PJBGHCSBLNPJZZJBL,"
								+ "YDYCYJSJZBSWL,YDYCYJSFJSSWL,YDYCSWL,"
								+ "YDYCSWLBLNPJZZJBL,YDYCSWLBSNZJBL,JGCCLBLNPJZZJBL,"
								+ "YJYDYMMFSCD,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[1][1]  + "','"+result[2][1]+"','"+result[3][1]+"','"
								+ result[4][1] + "','" + result[5][1] + "','"+result[6][1]+"','"
								+ result[0][3] + "','" + result[1][3] + "','"+result[2][3]+"','"
								+ result[3][3] + "','" + result[4][3] + "','"+result[5][3]+"','"
								+ result[6][3] + "','"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("009")){
					  String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "CYMBZMJ,YDYCSWBLBSNZJBL,CYMBZMJBLNPJZZJBL,PJHYL,"
								+ "DCXZS,YJCCYHSQKSRQ,DCZGS,"
								+ "YJCCYHSQJSRQ,PJBGHCS,CCYHGFQBLNPJZZWTS,"
								+ "PJBGHCSBLNPJZZJBL,YJYDFSMJBL,PJBGHCSBSNZZJBL,"
								+ "YJYDFSCD,YDYCSWL,YCFZSQKSRQ,"
								+ "YDYCSWLBLNPJZZJBL,YCFZSQJSRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[0][3] + "','"+result[1][1]+"','"+result[1][3]+"','"
								+ result[2][1] + "',to_date('" + result[2][3] + "','yyyy-MM-dd'),'"+result[3][1]+"',to_date('"
								+ result[3][3] + "','yyyy-MM-dd'),'" + result[4][1] + "','"+result[4][3]+"','"
								+ result[5][1] + "','" + result[5][3] + "','"+result[6][1]+"','"
								+ result[6][3] + "','" + result[7][1] + "',to_date('"+result[7][3]+"','yyyy-MM-dd'),'"
								+ result[8][1] + "',to_date('" + result[8][3] + "','yyyy-MM-dd'),'"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("010")){
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YD,PJBZHCS,DYLJCCL,"
								+ "PJBZHCSBLNPJZZJBL,DYLJCCBLNPJZBL,PJBZHCSBSNZZJBL,"
								+ "DYLJCCLBSNZJBL,YJHYSQ,CYJYCLJCCL,"
								+ "HYSQBLNPJZZWTS,CYJYCLJCCLBLNPJZZJBL,YJCCYHSQ,"
								+ "CYJYCLJCCLBSNZZBL,CCYHSQBLNPJZZWTS,PJBZYXLKS,"
								+ "YJXDFSMJBL,BZYXLKSBLNPJZZJBL,YJXDFSCD,"
								+ "BZYXLKSBSNZJBL,YCLGFQKSRQ,YCLGFQJSRQ,"
								+ ""
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[0][3] + "','"+result[1][1]+"','"
								+ result[1][3] + "','" + result[2][1] + "','"+result[2][3]+"','"
								+ result[3][1] + "',to_date('"+result[3][3]+"','yyyy-MM-dd'),'"+result[4][1]+"','"
								+ result[4][3] + "','" + result[5][1] + "',to_date('"+result[5][3]+"','yyyy-MM-dd'),'"
								+ result[6][1] + "','" + result[6][3] + "','"+result[7][1]+"','"
								+ result[7][3] + "','" + result[8][1] + "','"+result[8][3]+"','"
								+ result[9][1] + "',to_date('" + result[9][3] + "','yyyy-MM-dd'),to_date('"+new SimpleDateFormat("yyyy-MM-dd").format(wb.getSheetAt(0).getRow(12).getCell(3).getDateCellValue())+"','yyyy-MM-dd'),"
								+"'"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("011")){
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YD,PJBZHCS,DYLJCCL,"
								+ "PJBZHCSBLNPJZZJBL,DYLJCCBLNPJZBL,PJBZHCSBSNZZJBL,"
								+ "DYLJCCLBSNZJBL,YJHYSQ,CYJYCLJCCL,"
								+ "HYSQBLNPJZZWTS,CYJYCLJCCLBLNPJZZJBL,YJCCYHSQ,"
								+ "CYJYCLJCCLBSNZZBL,CCYHSQBLNPJZZWTS,PJBZYXLKS,"
								+ "YJXDFSMJBL,BZYXLKSBLNPJZZJBL,YJXDFSCD,"
								+ "BZYXLKSBSNZJBL,YCLGFQKSRQ,YCLGFQJSRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[0][3] + "','"+result[1][1]+"','"
								+ result[1][3] + "','" + result[2][1] + "','"+result[2][3]+"','"
								+ result[3][1] + "',to_date('"+result[3][3]+"','yyyy-MM-dd'),'"+result[4][1]+"','"
								+ result[4][3] + "','" + result[5][1] + "',to_date('"+result[5][3]+"','yyyy-MM-dd'),'"
								+ result[6][1] + "','" + result[6][3] + "','"+result[7][1]+"','"
								+ result[7][3] + "','" + result[8][1] + "','"+result[8][3]+"','"
								+ result[9][1] + "',to_date('" + result[9][3] + "','yyyy-MM-dd'),to_date('"+new SimpleDateFormat("yyyy-MM-dd").format(wb.getSheetAt(0).getRow(12).getCell(3).getDateCellValue())+"','yyyy-MM-dd'),"
								+"'"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("012")){
					// 插入数据
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YD,PJBZHCS,DYLJCCL,"
								+ "PJBZHCSBLNPJZZJBL,DYLJCCBLNPJZBL,PJBZHCSBSNZZJBL,"
								+ "DYLJCCLBSNZJBL,YJHYSQ,CYJYCLJCCL,"
								+ "HYSQBLNPJZZWTS,CYJYCLJCCLBLNPJZZJBL,YJCCYHSQ,"
								+ "CYJYCLJCCLBSNZZBL,CCYHSQBLNPJZZWTS,PJBZYXLKS,"
								+ "YJXDFSMJBL,BZYXLKSBLNPJZZJBL,YJXDFSCD,"
								+ "BZYXLKSBSNZJBL,YCLGFQKSRQ,YCLGFQJSRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[0][3] + "','"+result[1][1]+"','"
								+ result[1][3] + "','" + result[2][1] + "','"+result[2][3]+"','"
								+ result[3][1] + "',to_date('"+result[3][3]+"','yyyy-MM-dd'),'"+result[4][1]+"','"
								+ result[4][3] + "','" + result[5][1] + "',to_date('"+result[5][3]+"','yyyy-MM-dd'),'"
								+ result[6][1] + "','" + result[6][3] + "','"+result[7][1]+"','"
								+ result[7][3] + "','" + result[8][1] + "','"+result[8][3]+"','"
								+ result[9][1] + "',to_date('" + result[9][3] + "','yyyy-MM-dd'),to_date('"+new SimpleDateFormat("yyyy-MM-dd").format(wb.getSheetAt(0).getRow(12).getCell(3).getDateCellValue())+"','yyyy-MM-dd'),"
								+"'"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("013")){
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
								+ "LRRY,RWSJ,ZT,DCRQ) VALUES ('" + jfid + "','"
								+ result[0][0] + "','" + result[0][1] + "','"+result[0][2]+"','"
								+ result[0][3] + "','" + result[0][4] + "','"+result[0][5]+"','"
								+ result[2][1] + "','" + result[2][2] + "','"+result[2][3]+"','"
								+ result[2][4] + "','" + result[2][5] + "','"+result[2][6]+"','"
								+ result[3][1] + "','" + result[3][2] + "','"+result[3][3]+"','"
								+ result[3][4] + "','" + result[3][5] + "','"+result[3][6]+"','"
								+ result[4][1] + "','" + result[4][2] + "','"+result[4][3]+"','"
								+ result[4][4] + "','" + result[4][5] + "','"+result[4][6]+"','"
								+ result[5][1] + "','" + result[5][2] + "','"+result[5][3]+"','"
								+ result[5][4] + "','" + result[5][5] + "','"+result[5][6]+"','"
								+ result[6][1] + "','" + result[6][2] + "','"+result[6][3]+"','"
								+ result[6][4] + "','" + result[6][5] + "','"+result[6][6]+"','"
								+ result[7][1] + "','" + result[7][2] + "','"+result[7][3]+"','"
								+ result[7][4] + "','" + result[7][5] + "','"+result[7][6]+"','"
								+ result[8][1] + "','" + result[8][2] + "','"+result[8][3]+"','"
								+ result[8][4] + "','" + result[8][5] + "','"+result[8][6]+"','"
								+ result[9][1] + "','" + result[9][2] + "','"+result[9][3]+"','"
								+ result[9][4] + "','" + result[9][5] + "','"+result[9][6]+"','"
								+ result[10][1] + "','" + result[10][2] + "','"+result[10][3]+"','"
								+ result[10][4] + "','" + result[10][5] + "','"+result[10][6]+"','"
								+ result[11][1] + "','" + result[11][2] + "','"+result[11][3]+"','"
								+ result[11][4] + "','" + result[11][5] + "','"+result[11][6]+"','"
								+ result[12][1] + "','" + result[12][2] + "','"+result[12][3]+"','"
								+ result[12][4] + "','" + result[12][5] + "','"+result[12][6]+"','"
								+ result[13][1] + "','" + result[13][2] + "','"+result[13][3]+"','"
								+ result[13][4] + "','" + result[13][5] + "','"+result[13][6]+"','"
								+ result[14][1] + "','" + result[14][2] + "','"+result[14][3]+"','"
								+ result[14][4] + "','" + result[14][5] + "','"+result[14][6]+"','"
								+ result[15][1] + "','" + result[15][2] + "','"+result[15][3]+"','"
								+ result[15][4] + "','" + result[15][5] + "','"+result[15][6]+"','"
								+ result[16][1] + "','" + result[16][2] + "','"+result[16][3]+"','"
								+ result[16][4] + "','" + result[16][5] + "','"+result[16][6]+"','"
								+ result[17][1] + "','" + result[17][2] + "','"+result[17][3]+"','"
								+ result[17][4] + "','" + result[17][5] + "','"+result[17][6]+"','"
								+ result[18][1] + "','" + result[18][2] + "','"+result[18][3]+"','"
								+ result[18][4] + "','" + result[18][5] + "','"+result[18][6]+"','"
								+ result[19][1] + "','" + result[19][2] + "','"+result[19][3]+"','"
								+ result[19][4] + "','" + result[19][5] + "','"+result[19][6]+"','"
								+ result[20][1] + "','" + result[20][2] + "','"+result[20][3]+"','"
								+ result[20][4] + "','" + result[20][5] + "','"+result[20][6]+"','"
								+ result[21][1] + "','" + result[21][2] + "','"+result[21][3]+"','"
								+ result[21][4] + "','" + result[21][5] + "','"+result[21][6]+"','"
								+ result[22][1] + "','" + result[22][2] + "','"+result[22][3]+"','"
								+ result[22][4] + "','" + result[22][5] + "','"+result[22][6]+"','"
								+ result[23][1] + "','" + result[23][2] + "','"+result[23][3]+"','"
								+ result[23][4] + "','" + result[23][5] + "','"+result[23][6]+"','"
								+ result[24][1] + "','" + result[24][2] + "','"+result[24][3]+"','"
								+ result[24][4] + "','" + result[24][5] + "','"+result[24][6]+"','"
								+ result[25][1] + "','" + result[25][2] + "','"+result[25][3]+"','"
								+ result[25][4] + "','" + result[25][5] + "','"+result[25][6]+"','"
								+ result[26][1] + "','" + result[26][2] + "','"+result[26][3]+"','"
								+ result[26][4] + "','" + result[26][5] + "','"+result[26][6]+"','"
								+ result[27][1] + "','" + result[27][2] + "','"+result[27][3]+"','"
								+ result[27][4] + "','" + result[27][5] + "','"+result[27][6]+"','"
								+ result[28][1] + "','" + result[28][2] + "','"+result[28][3]+"','"
								+ result[28][4] + "','" + result[28][5] + "','"+result[28][6]+"','"
								+ result[29][1] + "','" + result[29][2] + "','"+result[29][3]+"','"
								+ result[29][4] + "','" + result[29][5] + "','"+result[29][6]+"','"
								+ result[30][1] + "','" + result[30][2] + "','"+result[30][3]+"','"
								+ result[30][4] + "','" + result[30][5] + "','"+result[30][6]+"','"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("014")){
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
								+ "LRRY,RWSJ,ZT,DCRQ) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[0][2] + "','"+result[0][3]+"','"
								+ result[0][4] + "','" + result[0][5] + "','"+result[0][6]+"','"
								+ result[1][1] + "','" + result[1][2] + "','"+result[1][3]+"','"
								+ result[1][4] + "','" + result[1][5] + "','"+result[1][6]+"','"
								+ result[2][1] + "','" + result[2][2] + "','"+result[2][3]+"','"
								+ result[2][4] + "','" + result[2][5] + "','"+result[2][6]+"','"
								+ result[3][1] + "','" + result[3][2] + "','"+result[3][3]+"','"
								+ result[3][4] + "','" + result[3][5] + "','"+result[3][6]+"','"
								+ result[4][1] + "','" + result[4][2] + "','"+result[4][3]+"','"
								+ result[4][4] + "','" + result[4][5] + "','"+result[4][6]+"','"
								+ result[5][1] + "','" + result[5][2] + "','"+result[5][3]+"','"
								+ result[5][4] + "','" + result[5][5] + "','"+result[5][6]+"','"
								+ result[6][1] + "','" + result[6][2] + "','"+result[6][3]+"','"
								+ result[6][4] + "','" + result[6][5] + "','"+result[6][6]+"','"
								+ result[7][1] + "','" + result[7][2] + "','"+result[7][3]+"','"
								+ result[7][4] + "','" + result[7][5] + "','"+result[7][6]+"','"
								+ result[8][1] + "','" + result[8][2] + "','"+result[8][3]+"','"
								+ result[8][4] + "','" + result[8][5] + "','"+result[8][6]+"','"
								+ result[9][1] + "','" + result[9][2] + "','"+result[9][3]+"','"
								+ result[9][4] + "','" + result[9][5] + "','"+result[9][6]+"','"
								+ result[10][1] + "','" + result[10][2] + "','"+result[10][3]+"','"
								+ result[10][4] + "','" + result[10][5] + "','"+result[10][6]+"','"
								+ result[11][1] + "','" + result[11][2] + "','"+result[11][3]+"','"
								+ result[11][4] + "','" + result[11][5] + "','"+result[11][6]+"','"
								+ result[12][1] + "','" + result[12][2] + "','"+result[12][3]+"','"
								+ result[12][4] + "','" + result[12][5] + "','"+result[12][6]+"','"
								+ result[13][1] + "','" + result[13][2] + "','"+result[13][3]+"','"
								+ result[13][4] + "','" + result[13][5] + "','"+result[13][6]+"','"
								+ result[14][1] + "','" + result[14][2] + "','"+result[14][3]+"','"
								+ result[14][4] + "','" + result[14][5] + "','"+result[14][6]+"','"
								+ result[15][1] + "','" + result[15][2] + "','"+result[15][3]+"','"
								+ result[15][4] + "','" + result[15][5] + "','"+result[15][6]+"','"
								+ result[16][1] + "','" + result[16][2] + "','"+result[16][3]+"','"
								+ result[16][4] + "','" + result[16][5] + "','"+result[16][6]+"','"
								+ result[17][1] + "','" + result[17][2] + "','"+result[17][3]+"','"
								+ result[17][4] + "','" + result[17][5] + "','"+result[17][6]+"','"
								+ result[18][1] + "','" + result[18][2] + "','"+result[18][3]+"','"
								+ result[18][4] + "','" + result[18][5] + "','"+result[18][6]+"','"
								+ result[19][1] + "','" + result[19][2] + "','"+result[19][3]+"','"
								+ result[19][4] + "','" + result[19][5] + "','"+result[19][6]+"','"
								+ result[20][1] + "','" + result[20][2] + "','"+result[20][3]+"','"
								+ result[20][4] + "','" + result[20][5] + "','"+result[20][6]+"','"
								+ result[21][1] + "','" + result[21][2] + "','"+result[21][3]+"','"
								+ result[21][4] + "','" + result[21][5] + "','"+result[21][6]+"','"
								+ result[22][1] + "','" + result[22][2] + "','"+result[22][3]+"','"
								+ result[22][4] + "','" + result[22][5] + "','"+result[22][6]+"','"
								+ result[23][1] + "','" + result[23][2] + "','"+result[23][3]+"','"
								+ result[23][4] + "','" + result[23][5] + "','"+result[23][6]+"','"
								+ result[24][1] + "','" + result[24][2] + "','"+result[24][3]+"','"
								+ result[24][4] + "','" + result[24][5] + "','"+result[24][6]+"','"
								+ result[25][1] + "','" + result[25][2] + "','"+result[25][3]+"','"
								+ result[25][4] + "','" + result[25][5] + "','"+result[25][6]+"','"
								+ result[26][1] + "','" + result[26][2] + "','"+result[26][3]+"','"
								+ result[26][4] + "','" + result[26][5] + "','"+result[26][6]+"','"
								+ result[27][1] + "','" + result[27][2] + "','"+result[27][3]+"','"
								+ result[27][4] + "','" + result[27][5] + "','"+result[27][6]+"','"
								+ result[28][1] + "','" + result[28][2] + "','"+result[28][3]+"','"
								+ result[28][4] + "','" + result[28][5] + "','"+result[28][6]+"','"
								+ result[29][1] + "','" + result[29][2] + "','"+result[29][3]+"','"
								+ result[29][4] + "','" + result[29][5] + "','"+result[29][6]+"','"
								+ result[30][1] + "','" + result[30][2] + "','"+result[30][3]+"','"
								+ result[30][4] + "','" + result[30][5] + "','"+result[30][6]+"','"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("015")){
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "CCCJQ,ZYJZDYDDCCYDYCFSYLCD,CCCJQBLNZW,"
								+ "YJYDFSCD,DGLJYEL,YJYDFSMJ,"
								+ "DGLJYELBLNPJZJBL,YJYDNTFSMJ,JPCERQ,"
								+ "YDNTFSMJBSNZJBL,YEJCESZBL,YJYDCCFSMJ,"
								+ "SSJCESZBL,YDCCFSMJBSNZJBL,CCYFSMJ,"
								+ "YJYDLDFSMJ,CCFSMJBLNPJZJBL,YDLDFSMJBSNZJBL,"
								+ "YJYDFSXSMC,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "',to_date('"
								+ result[0][1] + "','yyyy-MM-dd'),'" + result[0][3] + "','"+result[1][1]+"','"
								+ result[1][3] + "','" + result[2][1] + "','"+result[2][3]+"','"
								+ result[3][1] + "','" + result[3][3] + "',to_date('"+result[4][1]+"','yyyy-MM-dd'),'"
								+ result[4][3] + "','" + result[5][1] + "','"+result[5][3]+"','"
								+ result[6][1] + "','" + result[6][3] + "','"+result[7][1]+"','"
								+ result[7][3] + "','" + result[8][1] + "','"+result[8][3]+"',"
								+"'"+result[9][1]+"','"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("016")){
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
								+ "YJSDYCFSXSMC,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[0][3] + "','"+result[1][1]+"','"
								+ result[1][3] + "','" + result[2][1] + "','"+result[2][3]+"','"
								+ result[3][1] + "',to_date('" + result[3][3] + "','yyyy-MM-dd'),'"+result[4][1]+"',to_date('"
								+ result[4][3] + "','yyyy-MM-dd'),'" + result[5][1] + "','"+result[5][3]+"','"
								+ result[6][1] + "','" + result[6][3] + "','"+result[7][1]+"','"
								+ result[7][3] + "','" + result[8][1] + "','"+result[8][3]+"','"
								+ result[9][1] + "','" + result[9][3] + "','"+result[10][1]+"','"
								+ result[10][3] + "','" + result[11][1] + "','"+result[11][3]+"','"
								+ result[12][1] + "',to_date('" + result[12][3] + "','yyyy-MM-dd'),'"+result[13][1]+"',to_date('"
								+ result[13][3] + "','yyyy-MM-dd'),'" + result[14][1] + "','"+result[14][3]+"','"
								+ result[15][1] + "','" + result[15][3] + "','"+result[16][1]+"','"
								+ result[16][3] + "','" + result[17][1] + "','"+result[17][3]+"','"
								+ result[18][1] + "','" + result[18][3] + "','"+result[19][1]+"',"
								+"'"+result[19][3]+"','"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("017")){
					  String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "YDZMJ,YDHJMD,YDHJMDBLNPJZJBL,"
								+ "YDZCL,YDZCLBSNZJBL,SMC,"
								+ "XMC,JD,WD,"
								+ "YDZMJ_T,YDHJMD_T,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][0] + "','" + result[0][1] + "','"+result[0][2]+"','"
								+ result[0][4] + "','" + result[1][1] + "','"+result[1][2]+"','"
								+ result[1][3] + "','" + result[1][4] + "','"+result[1][5]+"','"
								+ result[0][3] + "','" + result[0][5] + "',"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("018")){
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
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[0][3] + "','"+result[1][1]+"','"
								+ result[1][3] + "','" + result[2][1] + "','"+result[2][3]+"','"
								+ result[3][1] + "','" + result[3][3] + "','"+result[4][1]+"','"
								+ result[4][3] + "','" + result[5][1] + "','"+result[5][3]+"','"
								+ result[6][1] + "','" + result[6][3] + "','"+result[7][1]+"','"
								+ result[7][3] + "','" + result[8][1] + "','"+result[8][3]+"','"
								+ result[9][1] + "','" + result[9][3] + "','"+result[10][1]+"','"
								+ result[10][3] + "','" + result[11][1] + "','"+result[11][3]+"','"
								+ result[12][1] + "','" + result[12][3] + "','"+result[13][1]+"','"
								+ result[13][3] + "','" + result[14][1] + "','"+result[14][3]+"','"
								+ result[15][1] + "','" + result[15][3] + "','"+result[16][1]+"','"
								+ result[16][3] + "','" + "" + "',"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("019")){
					  String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "XYMBQBCNZWTS,YMYYCFSWHD,XMJGHTMJB,"
								+ "YMTFGWHDYCNB,YJFSCD,YJFSMJ,"
								+ "YJFSQY,BZ,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][0] + "','" + result[0][1] + "','"+result[0][2]+"','"
								+ result[0][3] + "','" + result[0][4] + "','"+result[0][5]+"','"
								+ result[0][6] + "','" + result[0][7] + "',"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("020")){
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "JYDCYQY,GSYDMJ,CYFBZWZL,"
								+ "PJCKMD,ZGCKMD,ZGCKMDCXXD,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][0] + "','" + result[0][1] + "','"+result[0][2]+"','"
								+ result[0][3] + "','" + result[0][4] + "','"+result[0][5]+"',"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("021")){
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
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][2] + "','" + result[0][3] + "','"+result[0][4]+"','"+result[0][5]+"','"
								+ result[0][6] + "','"+result[0][7]+"','"+result[0][8]+"','"+result[0][9]+"','"
								+ result[1][2] + "','" + result[1][3] + "','"+result[1][4]+"','"+result[1][5]+"','"
								+ result[1][6] + "','"+result[1][7]+"','"+result[1][8]+"','"+result[1][9]+"','"
								+ result[2][2] + "','" + result[2][3] + "','"+result[2][4]+"','"+result[2][5]+"','"
								+ result[2][6] + "','"+result[2][7]+"','"+result[2][8]+"','"+result[2][9]+"','"
								+ result[3][2] + "','" + result[3][3] + "','"+result[3][4]+"','"+result[3][5]+"','"
								+ result[3][6] + "','"+result[3][7]+"','"+result[3][8]+"','"+result[3][9]+"','"
								+ result[4][2] + "','" + result[4][3] + "','"+result[4][4]+"','"+result[4][5]+"','"
								+ result[4][6] + "','"+result[4][7]+"','"+result[4][8]+"','"+result[4][9]+"',"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("022")){
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
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][2] + "','" + result[0][3] + "','"+result[0][4]+"','"+result[0][5]+"','"
								+ result[0][6] + "','"+result[0][7]+"','"+result[0][8]+"','"+result[0][9]+"','"
								+ result[1][2] + "','" + result[1][3] + "','"+result[1][4]+"','"+result[1][5]+"','"
								+ result[1][6] + "','"+result[1][7]+"','"+result[1][8]+"','"+result[1][9]+"','"
								+ result[2][2] + "','" + result[2][3] + "','"+result[2][4]+"','"+result[2][5]+"','"
								+ result[2][6] + "','"+result[2][7]+"','"+result[2][8]+"','"+result[2][9]+"','"
								+ result[3][2] + "','" + result[3][3] + "','"+result[3][4]+"','"+result[3][5]+"','"
								+ result[3][6] + "','"+result[3][7]+"','"+result[3][8]+"','"+result[3][9]+"','"
								+ result[4][2] + "','" + result[4][3] + "','"+result[4][4]+"','"+result[4][5]+"','"
								+ result[4][6] + "','"+result[4][7]+"','"+result[4][8]+"','"+result[4][9]+"',"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("023")){
						String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "FSCD,GLXTCCLBLNJZZJ,EDNCYCMJ,"
								+ "YJCCYHKSRQ,FZMJ,YJCCYHJSRQ,GLXTJQPJCCL,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[0][3] + "','"+result[1][1]+"',to_date('"
								+ result[1][3] + "','yyyy-MM-dd'),'" + result[2][1] + "',to_date('"+result[2][3]+"','yyyy-MM-dd'),'"+result[3][1]+"',"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
				  if(zbid.equals("024")){
					  String sql = "INSERT INTO D" + zbid + " (JFID,"
								+ "FSCD,GLXTCCLBLNJZZJ,SDNCYCMJ,"
								+ "YJCCYHKSRQ,FZMJ,YJCCYHJSRQ,GLXTJQPJCCL,"
								+ "DCRQ,"
								+ "JFNO,KSTBRQ,JZTBRQ,"
								+ "BBLX,BMBM,LRRQ,"
								+ "LRRY,RWSJ,ZT) VALUES ('" + jfid + "','"
								+ result[0][1] + "','" + result[0][3] + "','"+result[1][1]+"',to_date('"
								+ result[1][3] + "','yyyy-MM-dd'),'" + result[2][1] + "',to_date('"+result[2][3]+"','yyyy-MM-dd'),'"+result[3][1]+"',"
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
						String upsql = "UPDATE DBBZB_RW SET DYID='" + jfid
								+ "',BBZT='" + BBLX + "' WHERE JFID='" + rwid
								+ "'";
						ExecuteConnection ecup = new ExecuteConnection();
						Statement stmtup = ecup.con.createStatement();
						if (stmtup.executeUpdate(upsql) > 0) {
							ecup.con.commit();
						}
						stmtup.close();
						ecup.close();
				  }
			} catch (Exception e) {
				e.printStackTrace();
				return "erro";
			}
    	return "SUCCESS";
    }
   
  
    /**
     * 当id为空时
     */
    public String exinsert()
    {
    	return "SUCCESS";
    }
    /**
     * 读取Excel的内容，第一维数组存储的是一行中格列的值，二维数组存储的是多少个行
     * @param file 读取数据的源Excel
     * @param ignoreRows 读取数据忽略的行数，比喻行头不需要读入 忽略的行数为1
     * @return 读出的Excel中数据的内容
     * @throws FileNotFoundException
     * @throws IOException
     */
    public String[][] getData(File file, int ignoreRows)
           throws FileNotFoundException, IOException {
       List<String[]> result = new ArrayList<String[]>();
       int rowSize = 0;
       BufferedInputStream in = new BufferedInputStream(new FileInputStream(
              file));
       // 打开HSSFWorkbook
       POIFSFileSystem fs = new POIFSFileSystem(in);
       wb = new HSSFWorkbook(fs);
       HSSFCell cell = null;
       for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
           HSSFSheet st = wb.getSheetAt(sheetIndex);
           // 第一行为标题，不取
           for (int rowIndex = ignoreRows; rowIndex <= st.getLastRowNum(); rowIndex++) {
              HSSFRow row = st.getRow(rowIndex);
              if (row == null) {
                  continue;
              }
              int tempRowSize = row.getLastCellNum() + 1;
              if (tempRowSize > rowSize) {
                  rowSize = tempRowSize;
              }
              String[] values = new String[rowSize];
              Arrays.fill(values, "");
              boolean hasValue = false;
              for (short columnIndex = 0; columnIndex <= row.getLastCellNum(); columnIndex++) {
                  String value = "";
                  cell = row.getCell(columnIndex);
                  if (cell != null) {
                     // 注意：一定要设成这个，否则可能会出现乱码
                    // cell.setEncoding(HSSFCell.ENCODING_UTF_16);
                     switch (cell.getCellType()) {
                     case HSSFCell.CELL_TYPE_STRING:
                    	 if(!cell.getStringCellValue().equals("\\"))
                    	 {
                         value = cell.getStringCellValue();
                    	 }
                    	 else
                    	 {
                    		 value="";
                    	 }
                         break;
                     case HSSFCell.CELL_TYPE_NUMERIC:
                         if (HSSFDateUtil.isCellDateFormatted(cell)) {
                            Date date = cell.getDateCellValue();
                            if (date != null) {
                                value = new SimpleDateFormat("yyyy-MM-dd")
                                       .format(date);
                            } else {
                                value = "";
                            }
                         } else {
                            value =cell.getNumericCellValue()+"";
                            if(value.substring(value.indexOf(".")+1, value.length()).equals("0"))
                            {
                            	value=value.substring(0, value.indexOf("."));
                            }
                         }
                         break;
                     case HSSFCell.CELL_TYPE_FORMULA:
                         // 导入时如果为公式生成的数据则无值
                         if (!cell.getStringCellValue().equals("")) {
                            value = cell.getStringCellValue();
                         } else {
                            value = cell.getNumericCellValue() + "";
                         }
                         break;
                     case HSSFCell.CELL_TYPE_BLANK:
                         break;
                     case HSSFCell.CELL_TYPE_ERROR:
                         value = "";
                         break;
                     case HSSFCell.CELL_TYPE_BOOLEAN:
                         value = (cell.getBooleanCellValue() == true ? "Y"
                                : "N");
                         break;
                     default:
                         value = "";
                     }
                  }
                  if (columnIndex == 0 && value.trim().equals("")) {
                     break;
                  }
                  values[columnIndex] = rightTrim(value);
                  hasValue = true;
              }

              if (hasValue) {
                  result.add(values);
              }
           }
       }
       in.close();
       String[][] returnArray = new String[result.size()][rowSize];
       for (int i = 0; i < returnArray.length; i++) {
           returnArray[i] = (String[]) result.get(i);
       }
       return returnArray;
    }
    
  
    
    /**
     * 去掉字符串右边的空格
     * @param str 要处理的字符串
     * @return 处理后的字符串
     */
     private  String rightTrim(String str) {
       if (str == null) {
           return "";
       }
       int length = str.length();
       for (int i = length - 1; i >= 0; i--) {
           if (str.charAt(i) != 0x20) {
              break;
           }
           length--;
       }
       return str.substring(0, length);
    }
	public String getJFNO() {
		return JFNO;
	}
	public void setJFNO(String jFNO) {
		JFNO = jFNO;
	}
	public String getKSTBRQ() {
		return KSTBRQ;
	}
	public void setKSTBRQ(String kSTBRQ) {
		KSTBRQ = kSTBRQ;
	}
	public String getJZTBRQ() {
		return JZTBRQ;
	}
	public void setJZTBRQ(String jZTBRQ) {
		JZTBRQ = jZTBRQ;
	}
	public String getRWSJ() {
		return RWSJ;
	}
	public void setRWSJ(String rWSJ) {
		RWSJ = rWSJ;
	}
	public String getBBLX() {
		return BBLX;
	}
	public void setBBLX(String bBLX) {
		BBLX = bBLX;
	}
	public String getLRRY() {
		return LRRY;
	}
	public void setLRRY(String lRRY) {
		LRRY = lRRY;
	}
	public String getBMBM() {
		return BMBM;
	}
	public void setBMBM(String bMBM) {
		BMBM = bMBM;
	}
	public String getDCRQ() {
		return DCRQ;
	}
	public void setDCRQ(String dCRQ) {
		DCRQ = dCRQ;
	}
	public String getRwid() {
		return rwid;
	}
	public void setRwid(String rwid) {
		this.rwid = rwid;
	}
     
}