package com.jf.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jf.bchyj.bean.User;
import mt.database.extend.QueryConnection;

public class DrawTable {

	private String bblb = "";
	private String jfid = "";
	
	public void setJfid(String jfid) {
		this.jfid = jfid;
	}

	/**
	 * @param zbid
	 * @param cs
	  	cs=1Ԥ��ģʽ
      	cs=0����ģʽ
      	cs=2�޸�ģʽ
      	cs=3��ӡģʽ
	 * @return
	 */
	public String draw_table(String zbid, String cs, HttpServletRequest request) {
		String html = "";
		bblb = zbid; // jfid of dbbzb
		html += titlePreview(cs, request); // draw table title
		html += headPreview(cs); // draw table head
		html += bodyPreview(cs, request);// draw table body
		html += endPreview(cs, request); // draw table end
		html += "";
		return html;
	}
	
	public String titlePreview(String cs, HttpServletRequest request) {
		String html = "";
		String xx_head = "", xx_subhead = "", xx_input = "";
		String table_name = "D" + bblb + "_HEAD";
		String cur_row = ""; // ��ǰ��
	    List<String> list = data_imp("0"); // װ����
	    if ("1".equals(cs)) {
	    	html += "<table border=1 cellpadding=0 cellspacing=0 align=center>";
	    } else {
	    	html += "<table border=0 cellpadding=0 cellspacing=0 align=center>";
	    }
	    for (int i = 0; list != null && i < list.size(); i++) {
	    	String[] item = cStr(list.get(i)).split("###");
	    	if (!cur_row.equals(cStr(item[5]))) { // item[5]:����˳��
	    		if (i == 0) {
	    			html += "<tr>";
	    		} else {
	    			html += "</tr><tr>";
	    		}
	    	}
	    	if ("0".equals(cStr(item[6]))) { // ��label    // �б�ʶ(0:�̶�;1:¼���ֶ�;2:����ֶ�)
	    		if ("1".equals(cStr(item[4])) && "1".equals(cStr(item[5]))) { // ����
	    			xx_head ="<td colspan=" + item[2];
	                xx_head =xx_head + " rowspan=" + item[3];
	                xx_head =xx_head + " " + item[7];
	                xx_head =xx_head + " style='text-align:center;font-size=" + item[13];
	                xx_head =xx_head + ";width:" + item[18];
	                xx_head =xx_head + ";height:" + item[19];
	                xx_head =xx_head + "'>";
	                html += xx_head;
	                if ("1".equals(cStr(item[8]))) html += "<b>";
	    		} else { // ������
	    			xx_subhead = "<td colspan=" + item[2];
	                xx_subhead =xx_subhead + " rowspan=";
	                xx_subhead =xx_subhead + item[3];
	                xx_subhead =xx_subhead + " " + item[7];
	                xx_subhead =xx_subhead + " style='font-size:";
	                xx_subhead =xx_subhead + item[14];
	                xx_subhead =xx_subhead + ";width:" + item[18];
	                xx_subhead =xx_subhead + ";height:" + item[19];
	                xx_subhead =xx_subhead + "'>";
	                html += xx_subhead;
	                if ("1".equals(cStr(item[9]))) html += "<b>";
	    		}
	    		if(i==0)
	    		{
	    		html += item[0]+"(<%=rwsj %>)";
	    		}
	    		else
	    		{
	    			html += item[0];
	    		}
	    		if ("1".equals(cStr(item[4])) && "1".equals(cStr(item[5]))) { // ����
	    			if ("1".equals(cStr(item[8]))) html += "</b>";
	    			html += "<br><br>";
	    		} else { // ������
	    			if ("1".equals(cStr(item[9]))) html += "</b>";
	    		}
	    		html += "</td>";
	    	} else { // ��input
	    		html += "<td colspan=" + item[2] + " rowspan=" + item[3] + ">";
	    		
	    		if (" ".equals(item[23])) { // jfcolmeans is null
	    			xx_input ="<input type=\"text\" name=\"" + table_name + ":" + item[1] + ":" 
	            		+ fieldType(item[20]) + "\"";
	    		} else {
	    			xx_input ="<input type=\"text\" readonly=\"readonly\" ";
	    			html += "<input type=\"hidden\" name=\"" + table_name + ":" + item[1] + ":" 
	            		+ fieldType(item[20]) + "\" value=\"" + valueHidden(item[1], request) + "\"/>";
	    		}
	            xx_input =xx_input + item[7];
	            xx_input =xx_input + " style=\"border:0;border-bottom:1px solid #000000;width:";
	            xx_input =xx_input + item[18];
	            xx_input =xx_input + ";height:";
	            xx_input =xx_input + item[19];
	            xx_input =xx_input + "\" value=\"" + valueHtml(item[1], request) + "\" />";
	            
	            html += xx_input + "</td>";
	    	}
	    	cur_row = item[5];
	    }
	    html += "</tr></table>";
	    return html;
	}
	
	public String headPreview(String cs) {
		String html = "";
		String xx_label = "";
		//String table_name = "D" + bblb + "_HEAD";
		String cur_row = "";
		String hTitle = "";
		List<String> list_h = data_imp_h(); // װ������
	    List<String> list = data_imp("1"); // װ����
	    if (list_h.size() > 0) {
	    	hTitle = "<td><input type=\"hidden\" id=\"hbs\" name=\"hbs\" value=\"1\" /></td>";
	    }
	    if ("3".equals(cs)) {
	    	html += "<table border=1 borderColorDark=black borderColorLight=white cellpadding=0 cellspacing=0 align=center id=zg name=zg>";
	    } else {
	    	html += "<table border=1 borderColorDark=black borderColorLight=white cellpadding=1 cellspacing=1 align=center id=zg name=zg>";
	    }
	    for (int i = 0; list != null && i < list.size(); i++) {
	    	String[] item = cStr(list.get(i)).split("###");
	    	if (!cur_row.equals(cStr(item[5]))) { // item[5]:����˳��
	    		if (i == 0) {
	    			html += "<tbody id=\"zg_head\"><tr>" + hTitle;
	    		} else {
	    			html += "</tr><tr>" + hTitle;
	    		}
	    	}
	    	/*if (!cur_row.equals(cStr(item[5]))) {
	    		if ("0".equals(head_state)) {
	    			html += "<tbody id=zg_head><tr>";
	    			head_state = "1";
	    		} else {
		    		html += "<tr>";
	    		}
	    	}*/
	    	if ("0".equals(cStr(item[6]))) { // ��label
	    		xx_label="<td colspan=" + item[2];
	            xx_label=xx_label + " rowspan=" + item[3];
	            xx_label=xx_label + " " + item[7];
	            xx_label=xx_label + " style='word-break: break-all;text-align:center; font-size:";
	            xx_label=xx_label + item[15];
	            xx_label=xx_label + ";width:";
	            xx_label=xx_label + item[18];
	            xx_label=xx_label + ";height:";
	            xx_label=xx_label + item[19];
	            xx_label=xx_label + "'>";
	            html += xx_label;
	            if ("1".equals(cStr(item[10]))) html += "<b>"; // ��ͷ�������(1:��;0:��)
	            html += item[0];
	            if ("1".equals(cStr(item[9]))) html += "</b>"; // �������ּ���(1:��;0:��)
	            html += "</td>";
	    	} /*else { // ��input
	    		if (!"".equals(cStr(item[24]))) {
	    			html += "<script language=javascript>";
	    			html += " jsgs[jsgs.length]=\"" + item[24] + "\";";
	    			html += " gsjg[gsjg.length]=\"" + item[1] + "\";";
	    			html += "</script>";
	    		}
	    		html += "<td align=left style='height:25px' colspan=" + item[2] + " rowspan=" + item[3] + ">";
	    		xx_input="";
	            xx_input=xx_input + " id ='" + item[1] + "' ";
	            xx_input=xx_input + " onfocusin='return td_c(this)' ";
	            xx_input=xx_input + " " + item[7];
	            xx_input=xx_input + " style='width:" + item[18];
	            xx_input=xx_input + ";font-size:" + item[15];
	            xx_input=xx_input + ";height:" + item[19];
	            xx_input=xx_input + "' ";
	            //Response.Write element_type(ditem_sper,xx_input,"1","",cs)
	            html += "</td>";
	    	}*/
	    	cur_row = item[5];
	    }
	    html += "</tr></tbody>";
	    return html;
	}
	
	public String bodyPreview(String cs, HttpServletRequest request) {
		String html = "";
		String xx_label = "", rec_state = "0";
		String table_name = "D" + bblb + "_BODY";
		String cur_row = "";
	    List<String> list_h = data_imp_h(); // װ������
	    List<String> list = data_imp("2"); // װ����
	    html += "<tbody id=\"zg_body\">";
	    html += "<mt:sheet pagesize=\"20\">";
	    if (list_h.size() > 0) {
	    	for (int j = 0; j < list_h.size(); j++) {
	    		String[] item_h = cStr(list_h.get(j)).split("###");
	    		if (!"2".equals(cs) && !"3".equals(cs)) {
		    		html += "<tr onclick=\"focusTR(this)\"><input name=\"delid\" type=\"hidden\" value=\"<mt:vlabel name=\""+table_name+":JFDYID:str:S\" />\"/><td>";
		    		html += item_h[1] + "<input type=\"hidden\" value=\"" + item_h[0] + "\" name=\"" + table_name + ":HMC:S\" /></td>";
	    		}
			    for (int i = 0; list != null && i < list.size(); i++) {
			    	String[] item = cStr(list.get(i)).split("###");
			    	if (!cur_row.equals(cStr(item[5]))) { // item[5]:����˳��
			    		// �������ݣ��������
			    		if ("1".equals(cStr(item[6]))) {
			    			if ("2".equals(cs) || "3".equals(cs)) {
			    				html += data_imp_coltype("2", request);
				    			cur_row = item[5];
			                    rec_state = "1";
			    			}
			    		}
			    	}
			    	if ("0".equals(rec_state)) {//û�����ݣ����ݽṹ�͸�ʽ���һ�п���
				    	if ("0".equals(cStr(item[6]))) { // ��label
				    		xx_label="<td colspan=" + item[2];
			                xx_label=xx_label + " rowspan=" + item[3];
			                xx_label=xx_label + " " + item[7];
			                xx_label=xx_label + " style='text-align:center;font-size:";
			                xx_label=xx_label + item[15];
			                xx_label=xx_label + ";width:";
			                xx_label=xx_label + item[18];
			                xx_label=xx_label + ";height:";
			                xx_label=xx_label + item[19];
			                xx_label=xx_label + "'>";
			                html += xx_label;
			                if ("1".equals(cStr(item[10]))) html += "<b>"; // ��ͷ�������(1:��;0:��)
				            html += item[0];
				            if ("1".equals(cStr(item[9]))) html += "</b>"; // �������ּ���(1:��;0:��)
				            html += "</td>";
				    	} else { // ��input
				    		html += "<td align=left style='height:25px' colspan=" + item[2] + " rowspan=" + item[3] + ">";
			                html += typeHtml(table_name, item, "", request);
				    		if (!"".equals(item[24]) && !" ".equals(item[24])) { // �м����ϵ
				    			html += "<script type=\"text/javascript\">";
				    			html += "jsgs[jsgs.length]=\"" + item[24] + "\";";//�����ϵ
				    			html += "gsjg[gsjg.length]=\"" + item[1] + "\";";//�б��룬�����б���ÿ�е�������
				    			html += "</script>";
				    		}
				    		if ("0".equals(cs) || "2".equals(cs)) {
					    		if (!"".equals(item[26]) && !" ".equals(item[26])) { // ��У���ϵ
					    			html += "<script type=\"text/javascript\">";
					    			html += "jygx[jygx.length]=\"" + item[26] + "\";";
					    			html += "jyts[jyts.length]=\"" + item[27] + "\";";
					    			//html += "jyjg[jyjg.length]=\"" + item[1] + "\";";
					    			html += "</script>";
					    		}
				    		}
				    		html += "</td>";
				    	}
			    	}
			    	cur_row = item[5];
			    }
			    if (!"2".equals(cs) && !"3".equals(cs)) {
			    	html += "</tr>";
			    }
	    	}
	    } else {
		    for (int i = 0; list != null && i < list.size(); i++) {
		    	String[] item = cStr(list.get(i)).split("###");
		    	if (!cur_row.equals(cStr(item[5]))) { // item[5]:����˳��
		    		// �������ݣ��������
		    		if ("1".equals(cStr(item[6]))) {
		    			if ("2".equals(cs) || "3".equals(cs)) {
		    				html += data_imp_coltype("2", request);
			    			cur_row = item[5];
		                    rec_state = "1";
		    			}
		    		}
		    		if (i == 0) {
		    			html += "<tr onclick=\"focusTR(this)\"><input name=\"delid\" type=\"hidden\" value=\"<mt:vlabel name=\""+table_name+":JFDYID:str:S\" />\"/>";
		    		} else {
		    			html += "</tr><tr onclick=\"focusTR(this)\"><input name=\"delid\" type=\"hidden\" value=\"<mt:vlabel name=\""+table_name+":JFDYID:str:S\" />\"/>";
		    		}
		    	}
		    	if ("0".equals(rec_state)) {//���û����һ�пյ�
			    	if ("0".equals(cStr(item[6]))) { // ��label
			    		xx_label="<td colspan=" + item[2];
		                xx_label=xx_label + " rowspan=" + item[3];
		                xx_label=xx_label + " " + item[7];
		                xx_label=xx_label + " style='text-align:center;font-size:";
		                xx_label=xx_label + item[15];
		                xx_label=xx_label + ";width:";
		                xx_label=xx_label + item[18];
		                xx_label=xx_label + ";height:";
		                xx_label=xx_label + item[19];
		                xx_label=xx_label + "'>";
		                html += xx_label;
		                if ("1".equals(cStr(item[10]))) html += "<b>"; // ��ͷ�������(1:��;0:��)
			            html += item[0];
			            if ("1".equals(cStr(item[9]))) html += "</b>"; // �������ּ���(1:��;0:��)
			            html += "</td>";
			    	} else { // ��input
			    		html += "<td align=left style='height:25px' colspan=" + item[2] + " rowspan=" + item[3] + ">";
		                html +=typeHtml(table_name, item, "", request);
			    		if (!"".equals(item[24]) && !" ".equals(item[24])) {
			    			html += "<script type=\"text/javascript\">";
			    			html += "jsgs[jsgs.length]=\"" + item[24] + "\";";
			    			html += "gsjg[gsjg.length]=\"" + item[1] + "\";";
			    			html += "</script>";
			    		}
			    		html += "</td>";
			    	}
		    	}
		    	cur_row = item[5];
		    }
		    html += "</tr>";
	    }
	    html += "</mt:sheet>";
	    html += "</tbody>";
	    if ("3".equals(cs)) {
	    	html += "<tr><td colspan=100 align='center'> ";
		    html += " <input type=button value='��ӡ'>&nbsp;&nbsp; ";
		    html += "</td></tr>";
	    } else if ("1".equals(cs)) {
	    	html += "<tr><td colspan=100 align='center'> ";
	    	if (list_h.size() <= 0) {
			    html += " <input type=button value='����'>&nbsp;&nbsp; ";
			    html += " <input type=button value='ɾ��'>&nbsp;&nbsp; ";
	    	}
		    html += " <input type=button value='����'>&nbsp;&nbsp; ";
		    html += " <input type=button value='�ύ'> ";
		    html += "</td></tr>";
	    } else if ("0".equals(cs) || "2".equals(cs)) {
	    	html += "<tr><td colspan=100 align='center'> ";
	    	html+="<%if(~bbzt.equals('2')&&~bbzt.equals('3')&&~bbzt.equals('4')){%>";
	    	if (list_h.size() <= 0) {
			    html += " <input type=button value='����' id=\"btnAddRow\" />&nbsp;&nbsp; ";
			    html += " <input type=button value='ɾ��' id=\"btnDel\" />&nbsp;&nbsp; ";
	    	}
		    html += " <input type=button value='����' id=\"btnUpload\" />&nbsp;&nbsp; ";
		    html += " <input type=button value='����' id=\"btnSave\" />&nbsp;&nbsp; ";
		    html += " <input type=button value='�ύ' id=\"btnSubmit\" /> ";
		    html +="<%}else{";
		    html +="if(shbz.equals('1')){" +
		    		"%>" +
		    		"<input type=button value='����' id='btnAddRow' />"+
					"&nbsp;&nbsp;"+
					"<input type=button value='ɾ��' id='btnDel' />"+
					"&nbsp;&nbsp;"+
		    		"<input type=button value='�ύ' id='btnSubmit' />" +
		    		"<%}" +
		    		"%>";
		    html += " <input type=button value='����Excel' id=\"btnExport\" onclick=\"scexcel(<%=zbid %>,<%=jfid %>)\"/> ";
		    html +="<a id='mb' href='' />";
		    html +="<%}%>";
		    html += "</td></tr>";
	    }
	    html += "</table>";
	    return html;
	}
	
	public String endPreview(String cs, HttpServletRequest request) {
		String html = "";
		String xx_label = "", xx_input = "";
		String table_name = "D" + bblb + "_HEAD";
		String cur_row = "";
	    List<String> list = data_imp("3"); // װ����
	    if ("1".equals(cs)) {
	    	html += "<table border=2 cellpadding=0 cellspacing=0 align=center>";
	    } else {
	    	html += "<table border=0 cellpadding=0 cellspacing=0 align=center>";
	    }
	    for (int i = 0; list != null && i < list.size(); i++) {
	    	String[] item = cStr(list.get(i)).split("###");
	    	if (!cur_row.equals(cStr(item[5]))) { // item[5]:����˳��
	    		if (i == 0) {
	    			html += "<tr>";
	    		} else {
	    			html += "</tr><tr>";
	    		}
	    	}
	    	if ("0".equals(cStr(item[6]))) { // ��label
	    		xx_label="<td colspan=" + item[2];
	            xx_label=xx_label + " rowspan=" + item[3];
	            xx_label=xx_label + " " + item[7];
	            xx_label=xx_label + " style='word-break: break-all;text-align:center; font-size:";
	            xx_label=xx_label + item[17];
	            xx_label=xx_label + ";width:";
	            xx_label=xx_label + item[18];
	            xx_label=xx_label + ";height:";
	            xx_label=xx_label + item[19];
	            xx_label=xx_label + "'>";
	            html += xx_label;
	            if ("1".equals(cStr(item[12]))) html += "<b>"; // ��β�������(1:��;0:��)
	            html += item[0];
	            if ("1".equals(cStr(item[12]))) html += "</b>";
	            html += "</td>";
	    	} else { // ��input
	    		html += "<td colspan=" + item[2] + " rowspan=" + item[3] + ">";
	    		/*if (" ".equals(item[23])) { // jfcolmeans is null
	    			xx_input ="<input type=\"text\" ";
	    		} else {
	    			xx_input ="<input type=\"text\" readonly=\"readonly\" ";
	    		}*/
	    		if (" ".equals(item[23])) { // jfcolmeans is null
	    			xx_input ="<input type=\"text\" name=\"" + table_name + ":" + item[1] + ":" 
	            		+ fieldType(item[20]) + "\"";
	    		} else {
	    			xx_input ="<input type=\"text\" readonly=\"readonly\" ";
	    			html += "<input type=\"hidden\" name=\"" + table_name + ":" + item[1] + ":" 
	            		+ fieldType(item[20]) + "\" value=\"" + valueHidden(item[1], request) + "\"/>";
	    		}
	            xx_input =xx_input + item[7];
	            xx_input =xx_input + " style=\"border:0;border-bottom:1px solid #000000;width:";
	            xx_input =xx_input + item[18];
	            xx_input =xx_input + ";height:";
	            xx_input =xx_input + item[19];
	            xx_input =xx_input + ";font-size:";
	            xx_input =xx_input + item[17];
	            if(item[0].equals("������"))
	            {
	            	xx_input =xx_input + "\" value=\"<%=request.getAttribute(\"jbr\") %>\" />";
	            }
	            else
	            {
	            	xx_input =xx_input + "\" value=\"" + valueHtml(item[1], request) + "\" />";
	            }
	            //html += "<input type=\"hidden\" name=\"" + table_name + ":" + item[1] + ":" 
            		//+ fieldType(item[20]) + "\" value=\"" + valueHidden(item[1], request) + "\"/>";
	            html += xx_input + "</td>";
	    	}
	    	cur_row = item[5];
	    }
	    html += "</tr></table>";
	    return html;
	}
	
	// draw table of export
	public String draw_table_export(String zbid, String cs, HttpServletRequest request) {
		String html = "";
		bblb = zbid;
		// title data
		String xx_head = "", xx_subhead = "";
		String cur_row = ""; // ��ǰ��
	    List<String> list_title = data_imp("0"); // װ����
	    if ("1".equals(cs)) {
	    	html += "<table border=1 cellpadding=0 cellspacing=0 align=center>";
	    } else {
	    	html += "<table border=0 cellpadding=0 cellspacing=0 align=center>";
	    }
	    for (int i = 0; list_title != null && i < list_title.size(); i++) {
	    	String[] item = cStr(list_title.get(i)).split("###");
	    	if (!cur_row.equals(cStr(item[5]))) { // item[5]:����˳��
	    		if (i == 0) {
	    			html += "<tr>";
	    		} else {
	    			html += "</tr><tr>";
	    		}
	    	}
	    	if ("0".equals(cStr(item[6]))) { // ��label    // �б�ʶ(0:�̶�;1:¼���ֶ�;2:����ֶ�)
	    		if ("1".equals(cStr(item[4])) && "1".equals(cStr(item[5]))) { // ����
	    			xx_head ="<td colspan=" + item[2];
	                xx_head =xx_head + " rowspan=" + item[3];
	                xx_head =xx_head + " " + item[7];
	                xx_head =xx_head + " style='text-align:center;font-size=" + item[13];
	                xx_head =xx_head + ";width:" + item[18];
	                xx_head =xx_head + ";height:" + item[19];
	                xx_head =xx_head + "'>";
	                html += xx_head;
	                if ("1".equals(cStr(item[8]))) html += "<b>";
	    		} else { // ������
	    			xx_subhead = "<td colspan=" + item[2];
	                xx_subhead =xx_subhead + " rowspan=";
	                xx_subhead =xx_subhead + item[3];
	                xx_subhead =xx_subhead + " " + item[7];
	                xx_subhead =xx_subhead + " style='font-size:";
	                xx_subhead =xx_subhead + item[14];
	                xx_subhead =xx_subhead + ";width:" + item[18];
	                xx_subhead =xx_subhead + ";height:" + item[19];
	                xx_subhead =xx_subhead + "'>";
	                html += xx_subhead;
	                if ("1".equals(cStr(item[9]))) html += "<b>";
	    		}
	    		html += item[0];
	    		if ("1".equals(cStr(item[4])) && "1".equals(cStr(item[5]))) { // ����
	    			if ("1".equals(cStr(item[8]))) html += "</b>";
	    		} else { // ������
	    			if ("1".equals(cStr(item[9]))) html += "</b>";
	    		}
	    		html += "</td>";
	    	} else { // ��input
	    		html += "<td colspan=" + item[2] + " rowspan=" + item[3] + ">";
	            html += valueHtml(item[1], request) + "</td>";
	    	}
	    	cur_row = item[5];
	    }
	    html += "</tr></table>";
		
		
		html += headPreview(cs); // table head
		// table body data
		cur_row = "";
	    List<String> list_h = data_imp_h(); // װ������
	    List<String> list = data_imp("2"); // װ����
	    html += "<tbody id=\"zg_body\">";
	    if (list_h.size() > 0) {
	    	for (int j = 0; j < list_h.size(); j++) {
	    		String[] item_h = cStr(list_h.get(j)).split("###");
	    		if (!"2".equals(cs) && !"3".equals(cs)) {
		    		html += "<tr><td>" + item_h[1] + "</td>";
	    		}
			    for (int i = 0; list != null && i < list.size(); i++) {
			    	String[] item = cStr(list.get(i)).split("###");
			    	if (!cur_row.equals(cStr(item[5]))) { // item[5]:����˳��
			    		// �������ݣ��������
			    		if ("1".equals(cStr(item[6]))) {
			    			if ("2".equals(cs) || "3".equals(cs)) {
			    				html += data_imp_coltype_export("2", request);
				    			cur_row = item[5];
			    			}
			    		}
			    	}
			    	cur_row = item[5];
			    }
			    if (!"2".equals(cs) && !"3".equals(cs)) {
			    	html += "</tr>";
			    }
	    	}
	    } else {
		    for (int i = 0; list != null && i < list.size(); i++) {
		    	String[] item = cStr(list.get(i)).split("###");
		    	if (!cur_row.equals(cStr(item[5]))) { // item[5]:����˳��
		    		// �������ݣ��������
		    		if ("1".equals(cStr(item[6]))) {
		    			if ("2".equals(cs) || "3".equals(cs)) {
		    				html += data_imp_coltype_export("2", request);
			    			cur_row = item[5];
		    			}
		    		}
		    	}
		    	cur_row = item[5];
		    }
	    }
	    html += "</tbody></table>";
		return html;
	}
	
	// ȡ�ж��������
	private List<String> data_imp(String table_lb) {
		String sql_xx=" select dbbzb_gs.jfcolname ,jfcolcode, jfcolnumber, jfcolrows, jfcolorder, jfcolroword,"; //1-6(0-5)
		sql_xx=sql_xx + " dbbzb_gs.jfcolid,jfcolattr,jftitleweight,jfsubheadweight,jftabheadweight,jftabbodyweight,jftabendweight, "; //7-13(6-12)
		sql_xx=sql_xx + " jftitlesize,jfsubheadsize,jftabheadsize,jftabbodysize,jftabendsize,"; //14-18(13-17)
		sql_xx=sql_xx + " jfcolwidth,jfcolheight, ";  //19-20(18-19)
		sql_xx=sql_xx + " jfcolstyle,jfcollength,jfcolfashion,jfcolmeans,jfcolcount,dbbzb_jg.jfnull "; //21-26(20-25)
		sql_xx=sql_xx + " ,JFCOLJYGX,JFCOLJYTS,DY_JL_COL "; //27-28(26-27)
		sql_xx=sql_xx + " from dbbzb_gs,dbbzb,dbbzb_jg ";
		//jftitleweight 	varchar2(1),		--���������Ƿ���أ�0����1���ǣ�
		//jfsubheadweight	varchar2(1),		--�����������Ƿ���أ�0����1���ǣ�
		//jftabheadweight	varchar2(1),		--��ͷ�����Ƿ���أ�0����1���ǣ�
		//jftabbodyweight	varchar2(1),		--���������Ƿ���أ�0����1���ǣ�
		//jftabendweight 	varchar2(1),		--��β�����Ƿ���أ�0����1���ǣ�
		//jftitlesize 		number(3,0),		--���������С
		//jfsubheadsize 	number(3,0),		--�����������С
		//jftabheadsize 	number(3,0),		--��ͷ�����С
		//jftabbodysize 	number(3,0),		--���������С
		//jftabendsize 		number(3,0),		--��β�����С
		//jfcolstyle    ������
		//jfcollength   �г���
		//jfcolfashion  �д���ʽ
		//jfcolmeans    �д�����
		//jfcolcount    �м����ϵ
		//jfnull        ���Ƿ�Ϊ��
		sql_xx=sql_xx + " where dbbzb_gs.jfdbbzb_id = dbbzb.jfid ";
	    sql_xx=sql_xx + " and  (dbbzb_jg.jfdbbzb_id = dbbzb.jfid  or dbbzb_jg.jfdbbzb_id is null  ) ";
	    sql_xx=sql_xx + " and  dbbzb_jg.jfcolid(+)= dbbzb_gs.jfcolcode ";
	    sql_xx=sql_xx + " and dbbzb_gs.jfdbbzb_id='" + bblb + "' ";
	    sql_xx=sql_xx + " and dbbzb_gs.jfcolvest ='" + table_lb + "' ";
	    sql_xx=sql_xx + " order by jfcolroword,jfcolorder,dbbzb_gs.jfcolid";
	    List<String> list = new ArrayList<String>();
	    QueryConnection qc = new QueryConnection();
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
		    String item = "";
		    stmt = qc.con.createStatement();
		    rs = stmt.executeQuery(sql_xx);
		    while (rs.next()) {
		    	item=cBlank(rs.getString(1)) + "###" + cBlank(rs.getString(2)) + "###" + cBlank(rs.getString(3))
		    		+ "###" + cBlank(rs.getString(4))  + "###" + cBlank(rs.getString(5))  + "###" + cBlank(rs.getString(6));
		    	item=item + "###" + cBlank(rs.getString(7)) + "###" + cBlank(rs.getString(8)) + "###" + cBlank(rs.getString(9)) 
		    		+ "###" + cBlank(rs.getString(10)) + "###" + cBlank(rs.getString(11)) + "###" + cBlank(rs.getString(12));
		    	item=item + "###" + cBlank(rs.getString(13)) + "###" + cBlank(rs.getString(14)) + "###" + cBlank(rs.getString(15)) 
		    		+ "###" + cBlank(rs.getString(16)) + "###" + cBlank(rs.getString(17));
		        item=item + "###" + cBlank(rs.getString(18)) + "###" + cBlank(rs.getString(19));
		        item=item + "###" + cBlank(rs.getString(20)) + "###" + cBlank(rs.getString(21)) + "###" + cBlank(rs.getString(22)) + "###" 
		        	+ cBlank(rs.getString(23)) + "###" + cBlank(rs.getString(24)) + "###" + cBlank(rs.getString(25)) + "###" + cBlank(rs.getString(26));
		        item=item + "###" + cBlank(rs.getString(27)) + "###" + cBlank(rs.getString(28))+"###" + cBlank(rs.getString(29));
		        list.add(item);
		    }
	    } catch(SQLException e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (rs != null ) rs.close();
	        	if (stmt != null ) stmt.close();
	    	    qc.con.close();
	    	} catch (SQLException ex) {
	    		ex.printStackTrace();
	    	}
	    }
	    return list;
	}
	
	// ȡ�ж�������ݣ��ʱ���ж����HMC�������DBBZB_GS_H�е�jfid
	private List<String> data_imp_h() {
		List<String> list = new ArrayList<String>();
	    QueryConnection qc = new QueryConnection();
	    Statement stmt = null;
	    ResultSet rs = null;
	    String sql_xx = "SELECT JFID,JFCOLNAME FROM DBBZB_GS_H WHERE JFDBBZB_ID='" + bblb + "' ORDER BY JFCOLORDER";
	    try {
		    String item = "";
		    stmt = qc.con.createStatement();
		    rs = stmt.executeQuery(sql_xx);
		    while (rs.next()) {
		    	item = cBlank(rs.getString(1)) + "###" + cBlank(rs.getString(2));
		        list.add(item);
		    }
	    } catch(SQLException e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (rs != null ) rs.close();
	        	if (stmt != null ) stmt.close();
	    	    qc.con.close();
	    	} catch (SQLException ex) {
	    		ex.printStackTrace();
	    	}
	    }
		return list;
	}
	
	// ȡ��ʽ��������  table_lb 1 ����
	private String data_imp_coltype(String table_lb, HttpServletRequest request) {
		String xx_head = "", xx_td = "", xx_input = "", ret_xx = "";
		String table_name = "D" + bblb + "_BODY";
		List<String> list_h = data_imp_h(); // װ������
		List<String> list = data_imp(table_lb);
		String sql = "SELECT * FROM " + table_name + " WHERE JFDYID='" + jfid + "'";
		QueryConnection qc = new QueryConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String td_h = "";
		int index_h = 0;
		try {
			stmt = qc.con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				StringBuffer s = new StringBuffer();
				xx_td = "";
				xx_input = "";
				for (int i = 0; list != null && i < list.size(); i++) {
					String[] item = cStr(list.get(i)).split("###");
					xx_head = "<td align=left colspan=" + item[2] + " rowspan=" + item[3] + ">";
					/*xx_input = " name='" + table_name + ":" + item[1] + ":" + fieldType(item[20]) + "' ";
					xx_input = xx_input + " id =\"" + item[1] + "\" ";
					// if cs<> "3" then
					// xx_input=xx_input&" onfocusin='return td_c(this)' "
					xx_input = xx_input + " " + item[7];
					xx_input = xx_input + "  value='" + rs.getString(item[1]) + "' ";
					xx_input = xx_input + "  style='width:" + item[18];
					xx_input = xx_input + ";font-size:" + item[15];
					xx_input = xx_input + ";height:" + item[19];
					xx_input = xx_input + "' ";*/
					String _v = "";
					Object o = rs.getObject(item[1]);
					if (o == null) {
					} else if (o instanceof java.util.Date) {
						DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						_v = df.format(o);
					} else {
						_v = o.toString();
					}
					xx_input = typeHtml(table_name, item, _v, request);
					// xx_input=xx_input + data_type(ditem_sper,"1",cs );// ��������
					// xx_input=element_type(ditem_sper,xx_input,"2",datasource.rs1.fields(item[1]),cs);
					if (!"".equals(item[24]) && !" ".equals(item[24])) {
						s.append( "<script type=\"text/javascript\">");
						s.append( "jsgs[jsgs.length]=\"" + item[24] + "\";");
						s.append( "gsjg[gsjg.length]=\"" + item[1] + "\";");
						s.append( "</script>");
					}
					s.append( xx_head + xx_input + "</td>");
				}
				if (list_h.size() > 0) {
					String _h = list_h.get(index_h);
					String[] _sh = _h.split("###");
					td_h = "<td>" + _sh[1] + "<input type=\"hidden\" value=\"" + _sh[0] + "\" name=\"" + table_name + ":HMC:S\" /></td>";
				}
				index_h++;
				ret_xx = ret_xx + "<tr onclick=\"focusTR(this)\">" + td_h + s + "</tr>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				qc.con.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return ret_xx;
	}
	
	// ȡ��ʽ��������  table_lb 1 ���� use for export
	private String data_imp_coltype_export(String table_lb, HttpServletRequest request) {
		String xx_head = "", xx_td = "", xx_input = "", ret_xx = "";
		String table_name = "D" + bblb + "_BODY";
	    List<String> list_h = data_imp_h(); // װ������
		List<String> list = data_imp(table_lb);
		String sql = "SELECT * FROM " + table_name + " WHERE JFDYID='" + jfid + "'";
		QueryConnection qc = new QueryConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String td_h = "";
		int index_h = 0;
		try {
			stmt = qc.con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				xx_td = "";
				xx_input = "";
				for (int i = 0; list != null && i < list.size(); i++) {
					String[] item = cStr(list.get(i)).split("###");
					xx_head = "<td align=left colspan=" + item[2] + " rowspan=" + item[3] + ">";
					String _v = "";
					Object o = rs.getObject(item[1]);
					if (o == null) {
					} else if (o instanceof java.util.Date) {
						DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						_v = df.format(o);
					} else {
						_v = o.toString();
					}
					xx_input = typeHtml_export(table_name, item, _v, request);
					xx_td = xx_td + xx_head + xx_input + "</td>";
				}
				if (list_h.size() > 0) {
					String _h = list_h.get(index_h);
					String[] _sh = _h.split("###");
					td_h = "<td>" + _sh[1] + "</td>";
				}
				index_h++;
				ret_xx = ret_xx + "<tr>" + td_h + xx_td + "</tr>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				qc.con.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return ret_xx;
	}
	
	public String typeHtml(String table_name, String[] data, String value, HttpServletRequest request) {
		String eleHtml = "";
		// data[22] 1:�ı���;2:������;3:��ѡ��;4:��ѡ��;5:�����ı���
		// data[23] ȡ����
		String sql = getSql(data[23], request);
		QueryConnection qc = new QueryConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			if ("1".equals(cStr(data[22]))) {
				if ("1".equals(data[20])) { // ���ڡ�
					if("1".equals(data[25]))
					{
						eleHtml = "<input type=\"text\" id=\"" + data[1] + "\" name=\"" + table_name 
						+ ":" + data[1] + ":" + fieldType(data[20]) + "\" style=\"width:" + data[18] 
						+ ";height:" + data[19] + ";font-size:" + data[16] + "\" value=\" <mt:vlabel name=\""+ table_name 
						+ ":" + data[1] + ":str:" + fieldType(data[20]) +"\" />\" class=\"Wdate\" onFocus=\"WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })\" onkeyup=\"changeiput(this)\" chname=\""+data[0]+"\" nullable=\"no\"/>";
					}
					else
					{
						eleHtml = "<input type=\"text\" id=\"" + data[1] + "\" name=\"" + table_name 
						+ ":" + data[1] + ":" + fieldType(data[20]) + "\" style=\"width:" + data[18] 
						+ ";height:" + data[19] + ";font-size:" + data[16] + "\" value=\" <mt:vlabel name=\""+ table_name 
						+ ":" + data[1] + ":str:" + fieldType(data[20]) +"\" />\" class=\"Wdate\" onFocus=\"WdatePicker({skin:'whyGreen', maxDate: '%y-%M-%d' })\" onkeyup=\"changeiput(this)\" />";
					}
					
				} else { // ��ͨ�ı���
					if("1".equals(data[25]))
					{
						eleHtml = "<input type=\"text\" id=\"" + data[1] + "\" name=\"" + table_name 
						+ ":" + data[1] + ":" + fieldType(data[20]) + "\" style=\"width:" + data[18] 
						+ ";height:" + data[19] + ";font-size:" + data[16] + "\" value=\"<mt:vlabel name=\""+ table_name 
						+ ":" + data[1] + ":str:" + fieldType(data[20]) +"\" />\" chname=\""+data[0]+"\" nullable=\"no\"/>";
					}
					else
					{
					    eleHtml = "<input type=\"text\" id=\"" + data[1] + "\" name=\"" + table_name 
						+ ":" + data[1] + ":" + fieldType(data[20]) + "\" style=\"width:" + data[18] 
						+ ";height:" + data[19] + ";font-size:" + data[16] + "\" value=\"<mt:vlabel name=\""+ table_name 
						+ ":" + data[1] + ":str:" + fieldType(data[20]) +"\" />\" />";
					}
				}
			} else if ("2".equals(cStr(data[22]))||"6".equals(cStr(data[22]))||"7".equals(cStr(data[22]))) { // �����б�
				//String jfid=request.getParameter("code");
//				eleHtml = "<select id=\"" + data[1] + "\" name=\"" + table_name + ":" + data[1] + ":" + fieldType(data[20]) + "\">";
//				stmt = qc.con.createStatement();
//				rs = stmt.executeQuery(sql);
//				while (rs.next()) {
//					if (value.indexOf(".") > 0) value = value.substring(0, value.lastIndexOf("."));
//					if (!"".equals(value) && value.equals(rs.getString(1))) {
//						eleHtml += "<option value=\"" + rs.getString(1) + "\" selected=\"selected\">" + rs.getString(2) + "</option>";
//					}
//					eleHtml += "<option value=\"" + rs.getString(1) + "\">" + rs.getString(2) + "</option>";
//				}
//				eleHtml += "</select>";
				String cznr=sql.substring(sql.indexOf("select")+6, sql.indexOf("from"));
				String bm=sql.substring(sql.indexOf("from")+4, sql.indexOf("where"));
				String tj=sql.substring(sql.indexOf("where")+5,sql.length())+" and jfstate='1' ";
				tj=tj.replace("'", "^");
				//��
				if("1".equals(data[25]))
				{
					//�жϷǿյ�
					if("6".equals(cStr(data[22]))){
						eleHtml="<mt:vselect id=\"" + data[1] + "\" other=\"onchange=^xuanze(this)^ fu=^"+data[28]+"^ chname=^"+data[0]+"^ nullable=^no^\" name=\""+ table_name 
						+ ":" + data[1] + ":str:" + fieldType(data[20]) +"\" datamember=\""+bm+"\" select=\""+cznr+"\" where=\""+tj+"\" >"+
						"</mt:vselect>";
					}
					else
					{
						if("7".equals(cStr(data[22])))
						{
						    //��
							eleHtml="<mt:vselect id=\"" + data[1] + "\" other=\"zi=^"+data[28]+"^ chname=^"+data[0]+"^ nullable=^no^\" name=\""+ table_name 
							+ ":" + data[1] + ":str:" + fieldType(data[20]) +"\" datamember=\""+bm+"\" select=\""+cznr+"\" where=\""+tj+"\" >"+
							"</mt:vselect>";
						}
						else
						{
							//��ͨ
							eleHtml="<mt:vselect id=\"" + data[1] + "\" other=\"chname=^"+data[0]+"^ nullable=^no^\" name=\""+ table_name 
							+ ":" + data[1] + ":str:" + fieldType(data[20]) +"\" datamember=\""+bm+"\" select=\""+cznr+"\" where=\""+tj+"\" >"+
							"</mt:vselect>";
						}
					}
				}else{
				if("6".equals(cStr(data[22]))){
					eleHtml="<mt:vselect id=\"" + data[1] + "\" other=\"onchange=^xuanze(this)^ fu=^"+data[28]+"^\" name=\""+ table_name 
					+ ":" + data[1] + ":str:" + fieldType(data[20]) +"\" datamember=\""+bm+"\" select=\""+cznr+"\" where=\""+tj+"\" >"+
					"</mt:vselect>";
				}
				else
				{
					if("7".equals(cStr(data[22])))
					{
					    //��
						eleHtml="<mt:vselect id=\"" + data[1] + "\" other=\"zi=^"+data[28]+"^\" name=\""+ table_name 
						+ ":" + data[1] + ":str:" + fieldType(data[20]) +"\" datamember=\""+bm+"\" select=\""+cznr+"\" where=\""+tj+"\" >"+
						"</mt:vselect>";
					}
					else
					{
						//��ͨ
						eleHtml="<mt:vselect id=\"" + data[1] + "\" name=\""+ table_name 
						+ ":" + data[1] + ":str:" + fieldType(data[20]) +"\" datamember=\""+bm+"\" select=\""+cznr+"\" where=\""+tj+"\" >"+
						"</mt:vselect>";
					}
				}
			  }
			} else if ("3".equals(cStr(data[22]))) {
				eleHtml = "<input type=\"checkbox\" />��1";
				eleHtml += "<input type=\"checkbox\" />��2";// style=\"width:" + data[18] + ";height:" + data[19] + ";font-size:" + data[16] + "\"
			} else if ("4".equals(cStr(data[22]))) {
				eleHtml = "<input name=\"" + table_name + ":" + data[1] + ":" + fieldType(data[20]) + "\" value=\"" + value + "\" type=\"radio\" />��1";
				eleHtml += "<input name=\"" + table_name + ":" + data[1] + ":" + fieldType(data[20]) + "\" value=\"" + value + "\" type=\"radio\" />��2";
			} else if ("5".equals(cStr(data[22]))) {
				eleHtml = "<textarea name=\"" + table_name + ":" + data[1] + ":" + fieldType(data[20]) 
					+ "\" style=\"width:" + data[18] + ";height:" + data[19] + ";font-size:" + data[16] + "\">" + value + "</textarea>";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (!qc.con.isClosed()) qc.con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return eleHtml;
	}
	
	public String typeHtml_export(String table_name, String[] data, String value, HttpServletRequest request) {
		String eleHtml = "";
		// data[22] 1:�ı���;2:������;3:��ѡ��;4:��ѡ��;5:�����ı���
		// data[23] ȡ����
		String sql = getSql(data[23], request);
		QueryConnection qc = new QueryConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			if ("1".equals(cStr(data[22])) || "5".equals(cStr(data[22]))) {
				eleHtml = value;
			} else if ("2".equals(cStr(data[22]))) { // �����б�
				stmt = qc.con.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					if (!"".equals(value) && value.equals(rs.getString(1))) {
						eleHtml += rs.getString(2);
						break;
					}
				}
			} else if ("3".equals(cStr(data[22]))) {
				eleHtml = "<input type=\"checkbox\" />��1";
				eleHtml += "<input type=\"checkbox\" />��2";// style=\"width:" + data[18] + ";height:" + data[19] + ";font-size:" + data[16] + "\"
			} else if ("4".equals(cStr(data[22]))) {
				eleHtml = "<input name=\"" + table_name + ":" + data[1] + ":" + fieldType(data[20]) + "\" value=\"" + value + "\" type=\"radio\" />��1";
				eleHtml += "<input name=\"" + table_name + ":" + data[1] + ":" + fieldType(data[20]) + "\" value=\"" + value + "\" type=\"radio\" />��2";
			} else {
				eleHtml = "";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (!qc.con.isClosed()) qc.con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return eleHtml;
	}
	
	public String valueHtml(String bm, HttpServletRequest request) {
		String valHtml = "";
		User user = (User) request.getSession().getAttribute("user");
		if ("BMBM".equalsIgnoreCase(bm)) {
			valHtml ="<%=bmmc%>";
		} else if ("LRRY".equalsIgnoreCase(bm)) {
			valHtml ="<%=username%>";
		} else if ("LRRQ".equalsIgnoreCase(bm)) {
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			valHtml ="<%=time%>";
		} else if ("ZT".equalsIgnoreCase(bm)) {
			if (request.getAttribute("BBZT") != null && "tj".equals(request.getAttribute("BBZT").toString())) {
				valHtml = "<%=zt %>";
			} else {
				valHtml = "<%=zt %>";
			}
		} else {
			if (jfid != null && !"".equals(jfid)) {
				QueryConnection qc = new QueryConnection();
			    Statement stmt = null;
			    ResultSet rs = null;
			    try {
				    stmt = qc.con.createStatement();
				    rs = stmt.executeQuery("SELECT * FROM D" + bblb + "_HEAD WHERE JFID='" + jfid + "'");
				    while (rs.next()) {
				    	valHtml = cBlank(rs.getString(bm));
				    }
			    } catch(SQLException e) {
			    	e.printStackTrace();
			    } finally {
			    	try {
			    		if (rs != null ) rs.close();
			        	if (stmt != null ) stmt.close();
			    	    qc.close();
			    	} catch (SQLException ex) {
			    		ex.printStackTrace();
			    	}
			    }
			}
		}
		return valHtml;
	}
	
	public String valueHidden(String bm, HttpServletRequest request) {
		String valHtml = "";
		User user = (User) request.getSession().getAttribute("user");
		if ("BMBM".equalsIgnoreCase(bm)) {
			valHtml ="<%=userbmbm%>";
		} else if ("LRRY".equalsIgnoreCase(bm)) {
			valHtml ="<%=userid%>";
		} else if ("LRRQ".equalsIgnoreCase(bm)) {
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			valHtml ="<%=time%>";
		} else if ("ZT".equalsIgnoreCase(bm)) {
			valHtml = "0";
		}
		return valHtml;
	}
	
	public String fieldType(String field) {
		String type = "S"; // 2
		if ("1".equals(field)) {
			type = "D";
		} else if ("3".equals(field)) {
			type = "N";
		}
		return type;
	}
	
	public String getSql(String bmlb, HttpServletRequest request) {
		String sql = "";
		if ("BBSSXZ".equals(bmlb)) { // ��������
			sql = "select jfregcode,jfregname from dsys06 where ${usebm} and jc='2' order by jfregcode";
		}else if("DCDD".equals(bmlb)){
			sql = "select jfregcode,jfregname from dsys06 where ${usecun} and jc='3' order by jfregcode";
		} else {
			sql = "select jfcode,jfcodename from dsys11 where jfsort='" + bmlb + "' order by jfcode";
		}
		return sql;
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
	
	private List<String> data_imp_head(String cs) {
		String sql_xx=" select jfcolname,jfcolcode,jfcolwidth,jfcolheight,"; //1-4(0-3)
		sql_xx=sql_xx + " jfcolnumber,jfcolrows,jfcolorder,jfcolroword, "; //5-8(4-7)
		sql_xx=sql_xx + " jfcolid,jfcolattr"; //9-10(8-9)
		sql_xx=sql_xx + " from dbbtjbt ";
		sql_xx=sql_xx + " where jfdbbzb_id='" + cs + "' ";
		sql_xx=sql_xx + " order by jfcolroword,jfcolorder,jfcolid ";
	    List<String> list = new ArrayList<String>();
	    QueryConnection qc = new QueryConnection();
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
		    String item = "";
		    stmt = qc.con.createStatement();
		    rs = stmt.executeQuery(sql_xx);
		    while (rs.next()) {
		    	item=cBlank(rs.getString(1)) + "###" + cBlank(rs.getString(2)) + "###" + cBlank(rs.getString(3))
		    		+ "###" + cBlank(rs.getString(4))  + "###" + cBlank(rs.getString(5))  + "###" + cBlank(rs.getString(6));
		    	item=item + "###" + cBlank(rs.getString(7)) + "###" + cBlank(rs.getString(8)) + "###" + cBlank(rs.getString(9)) 
		    		+ "###" + cBlank(rs.getString(10));
		        list.add(item);
		    }
	    } catch(SQLException e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (rs != null ) rs.close();
	        	if (stmt != null ) stmt.close();
	    	    qc.close();
	    	} catch (SQLException ex) {
	    		ex.printStackTrace();
	    	}
	    }
	    return list;
	}
	
	//cs1 ����ID,cs0 ��ʾ��ʽ
	public String draw_table_head(String cs1, String cs0) {
		List<String> list = data_imp_head(cs1);
		String cur_row = "", outerHtml = "", xx_label = "";
		if ("0".equals(cs0)) {
			outerHtml = "<table border=1 borderColorDark=black borderColorLight=white cellpadding=0 cellspacing=0 align=center id=zg name=zg><tr>";
		}
		for (int i = 0; list != null && i < list.size(); i++) {
			String[] item = cStr(list.get(i)).split("###");
			if (!cur_row.equals(cStr(item[7]))) {
				if (!"".equals(cur_row)) {
					outerHtml = outerHtml + "<tr>";
				}
				// tablehead_rowcount = tablehead_rowcount + 1;
				xx_label = "<td colspan=" + item[4];
				xx_label = xx_label + " rowspan=" + item[5];
				xx_label = xx_label + " " + item[9];
				xx_label = xx_label + " style='WORD-BREAK: break-all;text-align:center";
				xx_label = xx_label + ";width:";
				xx_label = xx_label + item[2];
				xx_label = xx_label + ";height:";
				xx_label = xx_label + item[3];
				xx_label = xx_label + "'>";
				outerHtml = outerHtml + xx_label;

				outerHtml = outerHtml + "<nobr>" + item[0] + "<nobr>";
				outerHtml = outerHtml + "</td>";
				cur_row = item[7];
			}
		}
		if ("0".equals(cs0)) {
			outerHtml = outerHtml + "</tr></table>";
		}
		return outerHtml;
	}
}
