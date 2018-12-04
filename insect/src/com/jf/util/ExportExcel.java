package com.jf.util;
import java.io.File;
import java.util.List;  
import javax.servlet.http.HttpServletResponse;  


  
import jxl.Workbook;  
import jxl.format.Alignment;  
import jxl.format.Border;  
import jxl.format.BorderLineStyle;  
import jxl.format.VerticalAlignment;  
import jxl.write.Label;  
import jxl.write.WritableCellFormat;  
import jxl.write.WritableFont;  
import jxl.write.WritableSheet;  
import jxl.write.WritableWorkbook;  
public class ExportExcel {
	/*************************************************************************** 
	  * @param fileName EXCEL�ļ����� 
	  * @param listTitle EXCEL�ļ���һ���б��⼯�� 
	  * @param listContent EXCEL�ļ��������ݼ��� 
	  * @return 
	  */  
	 public  final static String exportExcel(String fileName,String[] Title, List<String> listContent,HttpServletResponse resp,String path) {  
	  String result="ϵͳ��ʾ��Excel�ļ������ɹ���";  
	  // ���¿�ʼ�����EXCEL  
	  try {      
	   //������������Ա�򿪱���Ի���______________________begin  
	   HttpServletResponse response=resp;  
	   //response.reset();// ��������        
	  // response.setHeader("Content-disposition", "attachment; filename="+ new String(fileName.getBytes("GB2312"),"ISO8859-1"));  
	   // �趨����ļ�ͷ        
	  // response.setContentType("application/msexcel");// �����������      
	   //������������Ա�򿪱���Ի���_______________________end  
	  
	   /** **********����������************ */  
	   WritableWorkbook workbook = Workbook.createWorkbook(new File(path+"\\"+fileName));  
	  
	   /** **********����������************ */  
	  
	   WritableSheet sheet = workbook.createSheet("Sheet1", 0);  
	  
	   /** **********�����ݺ��ӡ��Ĭ��Ϊ�ݴ򣩡���ӡֽ***************** */  
	   jxl.SheetSettings sheetset = sheet.getSettings();  
	   sheetset.setProtected(false);  
	  
	  
	   /** ************���õ�Ԫ������************** */  
	   WritableFont NormalFont = new WritableFont(WritableFont.ARIAL, 10);  
	   WritableFont BoldFont = new WritableFont(WritableFont.ARIAL, 10,WritableFont.BOLD);  
	  
	   /** ************�����������ֵ�Ԫ����ʽ������************ */  
	   // ���ڱ������  
	   WritableCellFormat wcf_center = new WritableCellFormat(BoldFont);  
	   wcf_center.setBorder(Border.ALL, BorderLineStyle.THIN); // ����  
	   wcf_center.setVerticalAlignment(VerticalAlignment.CENTRE); // ���ִ�ֱ����  
	   wcf_center.setAlignment(Alignment.CENTRE); // ����ˮƽ����  
	   wcf_center.setWrap(true); // �����Ƿ���  
	     
	   // �������ľ���  
	   WritableCellFormat wcf_left = new WritableCellFormat(NormalFont);  
	   wcf_left.setBorder(Border.NONE, BorderLineStyle.THIN); // ����  
	   wcf_left.setVerticalAlignment(VerticalAlignment.CENTRE); // ���ִ�ֱ����  
	   wcf_left.setAlignment(Alignment.LEFT); // ����ˮƽ����  
	   wcf_left.setWrap(true); // �����Ƿ���
	   
	  
	   /** ***************������EXCEL��ͷ����⣬��ʱʡ��********************* */  
	   //sheet.mergeCells(0, 0, colWidth, 0);  
	   //sheet.addCell(new Label(0, 0, "XX����", wcf_center));  
	   /** ***************������EXCEL��һ���б���********************* */  
	   for (int i = 0; i < Title.length; i++) {  
	    sheet.addCell(new Label(i, 0,Title[i],wcf_center));  
	   }     
	   /** ***************������EXCEL��������********************* */  
	   String zu="";
	   String[] zus=null;
	   for (int i = 0; i <listContent.size(); i++) {
		   zu=listContent.get(i);
		   zus=zu.split(",");
		   for (int j = 0; j <zus.length; j++) {
			   sheet.addCell(new Label(j, i+1,zus[j],wcf_left));  
		   }
	   }
	   /** **********�����ϻ����е�����д��EXCEL�ļ���******** */  
	   workbook.write();  
	   /** *********�ر��ļ�************* */  
	   workbook.close();
	  } catch (Exception e) {  
	   result="ϵͳ��ʾ��Excel�ļ�����ʧ�ܣ�ԭ��"+ e.toString();  
	   e.printStackTrace();  
	  }  
	  return result;  
	 }
}
