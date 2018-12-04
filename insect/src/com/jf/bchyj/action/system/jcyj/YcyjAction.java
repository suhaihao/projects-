package com.jf.bchyj.action.system.jcyj;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mt.controller.InitAction;
import mt.controller.base.ServletObject;
import mt.database.extend.QueryConnection;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.jspsmart.upload.SmartUpload;

public class YcyjAction extends InitAction {

	public void insert(ServletObject so) {
		ServletConfig servletConfig = getServlet();
		HttpServletRequest request = so.httpServletRequest;
		HttpServletResponse response = so.httpServletResponse;
		Workbook wb =null;
		Sheet sheet = null;
        Row row = null;
        String cellData = null;
        List<List<String>> list = new ArrayList<List<String>>();
        String year="";
        String ksrq="";
        String chong="";
        long time=0;
		Random rdm = new Random(System.currentTimeMillis());// 获得随机种子
		SmartUpload mySmartUpload = new SmartUpload();
		try {
			mySmartUpload.initialize(servletConfig, request, response);
			mySmartUpload.upload();
			for (int i = 0; i < mySmartUpload.getFiles().getCount(); i++) {
				// 唯一文件名
			    time = Math.abs(rdm.nextInt()) % 1000000000;
				// 获取文件
				com.jspsmart.upload.File myfile = mySmartUpload.getFiles()
						.getFile(i);
				myfile.saveAs("/file/" + time + ".xlsx");
				year = mySmartUpload.getRequest().getParameter("year");
				ksrq = mySmartUpload.getRequest().getParameter("ksrq");
				chong = mySmartUpload.getRequest().getParameter("chong");
			}
			wb = getData(request.getRealPath("") + "/file/" +time+ ".xlsx");
			if(wb!=null){
				 //获取第一个sheet
	            sheet = wb.getSheetAt(0);
	            //获取最大行数
	            int rownum = sheet.getPhysicalNumberOfRows();
	            //获取第一行
	            row = sheet.getRow(0);
	            //获取最大列数
	            int colnum = row.getPhysicalNumberOfCells();
	            for (int j = 1; j<rownum; j++) {
	                List<String> colnumlist = new ArrayList<String>();
	                row = sheet.getRow(j);
	                if(row !=null){
	                    for (int k=0;k<colnum;k++){
	                        cellData = (String) getCellFormatValue(row.getCell(k));
	                        if(cellData!=null&&!cellData.equals("")){
	                        colnumlist.add(cellData);
	                        }
	                    }
	                }else{
	                    break;
	                }
	                if(colnumlist.size()>=1){
	                list.add(colnumlist);
	                }
	            }
	            int size=0;
	            Map<String,String> map=new TreeMap<String, String>();
	            String date="";
	            double pjqw=0.00;
	            double zgqw=0.00;
	            double zdqw=0.00;
	            double pjsd=0.00;
	            double y=0.00;
	            if(chong!=null&&!chong.equals("")){
	            	y=Double.parseDouble(chong);
	            }
	            for (int i = 0; i < list.size(); i++) {
	            	if(list.get(i).get(0)==null||list.get(i).get(0).equals("null")){
	            		break;
	            	}
	            	if(size==0){
	            		date=list.get(i).get(0);
	            	}
	            	pjqw=pjqw+Double.parseDouble(list.get(i).get(1));
	            	zgqw=zgqw+Double.parseDouble(list.get(i).get(2));
	            	zdqw=zdqw+Double.parseDouble(list.get(i).get(3));
	            	pjsd=pjsd+Double.parseDouble(list.get(i).get(4));
	            	if(size==4){
	            		y=-767.3+y*1.765+pjqw/5*35.67+(zgqw/5*-4.851)+zdqw/5*15.33+pjsd/5*4.607;
	            		if(y<0){
	            			y=0;
	            		}else{
	            			BigDecimal b = new BigDecimal(y);
	            			y=b.setScale(2, BigDecimal.ROUND_DOWN).doubleValue();  
	            		}
	            		map.put(date,y+"");
	            	}
	            	size++;
	              	if(size==5){
	            		size=0;
	            	}
				}
	            if(size!=0){
	            	if(list.size()%5==1){
	            		 y=-767.3+y*1.765+pjqw/1*35.67+(zgqw/size*-4.851)+zdqw/1*15.33+pjsd/1*4.607;
	            	}else{
	            		y=-767.3+y*1.765+pjqw/size*35.67+(zgqw/size*-4.851)+zdqw/size*15.33+pjsd/size*4.607;
	            	}
	            }
	            if(y<0){
        			y=0;
        		}else{
        			BigDecimal b = new BigDecimal(y);
        			y=b.setScale(2, BigDecimal.ROUND_DOWN).doubleValue();  
        		}
	            map.put(date, y+"");
	            
	            String sql="select nvl(sum(b.y09),0),to_char(a.rwsj,'yyyy-mm-dd') rwsj from D849_HEAD a,D849_body b where a.jfid=b.jfdyid and a.rwsj is not null "
	            		+" and a.rwsj>= to_date('"+year+ksrq+"','yyyy-mm-dd') "
                        +" and a.rwsj<= to_date ('"+year+"-05-30','yyyy-mm-dd') "
                       +" group by to_char(a.rwsj,'yyyy-mm-dd')";
	            Map<String,String> mapsj=new TreeMap<String, String>();
	            QueryConnection qcsj = new QueryConnection();
	            Statement stmtsj = qcsj.con.createStatement();
	            ResultSet rssj = stmtsj.executeQuery(sql);
	            while(rssj.next())
	            {
	            	mapsj.put(rssj.getString(2), rssj.getString(1));
	            }
	            for (String key:map.keySet()) {
	            	if(mapsj.get(year+key.substring(4, key.length()))==null){
	            		mapsj.put(year+key.substring(4, key.length()), "0.0");
	            	}
				}
	            request.setAttribute("mapy", map);
	            request.setAttribute("maps", mapsj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 public Object getCellFormatValue(Cell cell){
	        Object value = null;
	        if(cell!=null){
	            //判断cell类型
	            switch(cell.getCellType()){
	            case Cell.CELL_TYPE_STRING:
                    value = cell.getStringCellValue();
                    break;

                case Cell.CELL_TYPE_NUMERIC:

                    if (HSSFDateUtil.isCellDateFormatted(cell)) {
                       Date date = cell.getDateCellValue();
                       if (date != null) {
                           value = new SimpleDateFormat("yyyy-MM-dd").format(date);
                       } else {
                           value = "";
                       }
                    } else {
                       value = new DecimalFormat("0").format(cell.getNumericCellValue());
                    }

                    break;

                case Cell.CELL_TYPE_FORMULA:
                    // 导入时如果为公式生成的数据则无值
                    if (!cell.getStringCellValue().equals("")) {
                       value = cell.getStringCellValue();
                    } else {
                       value = cell.getNumericCellValue() + "";
                    }
                    break;
                case Cell.CELL_TYPE_BLANK:
                    break;
                case Cell.CELL_TYPE_ERROR:
                    value = "";
                    break;
                case Cell.CELL_TYPE_BOOLEAN:
                    value = (cell.getBooleanCellValue() == true ? "Y": "N");
                    break;
	            }
	        }else{
	        	value = "";
	        }
	        return value;
	    }
	
	
	public Workbook getData(String filePath) throws FileNotFoundException,
			IOException {
		Workbook wb = null;
		if (filePath == null) {
			return null;
		}
		String extString = filePath.substring(filePath.lastIndexOf("."));
		InputStream is = null;
		try {
			is = new FileInputStream(filePath);
			if (".xls".equals(extString)) {
				return wb = new HSSFWorkbook(is);
			} else if (".xlsx".equals(extString)) {
				return wb = new XSSFWorkbook(is);
			} else {
				return wb = null;
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return wb;
	}
}
