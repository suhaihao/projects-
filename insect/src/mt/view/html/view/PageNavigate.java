package mt.view.html.view;

import javax.servlet.http.HttpServletRequest;

import mt.view.BaseTag;
import mt.view.html.PageCollection;

/**
 * <p>
 * Title:分页标签
 * </p>
 * 
 * <p>
 * Description:
 * </p>
 * 
 * <p>
 * Copyright: Copyright (c) 2005
 * </p>
 * 
 * <p>
 * Company:
 * </p>
 * 
 * @author not attributable
 * @version 1.0
 */
public class PageNavigate extends BaseTag {
	public String front() {
		String tempfront = "";
		tempfront += getMessage();
		return tempfront;
	}

	private String getMessage() {
		String returnMessage = "";
		String forward = "";
		String temp = "";
		String disabledtemp = "";
		try {
			PageCollection pc = (PageCollection) this.pageContext
					.getRequest()
					.getAttribute(
							((javax.servlet.http.HttpServletRequest) this.pageContext
									.getRequest()).getServletPath()
									+ "_pc");
			if (pc.pagecount == 0) {
				pc.pagecount = 1;
			}
			javax.servlet.http.HttpSession session = this.pageContext
					.getSession();
			session.setAttribute(
					((javax.servlet.http.HttpServletRequest) this.pageContext
							.getRequest()).getServletPath()
							+ "_curpage", Integer.toString(pc.currentpage));
			returnMessage += "\n";
			returnMessage += "<div style='text-align:right;font-size:10pt;line-height:12px;'><nobr>";
			returnMessage += "总计:&nbsp;" + pc.rowcount + "条记录&nbsp;&nbsp";
			HttpServletRequest request = (HttpServletRequest) pageContext
					.getRequest();
			request.setAttribute("session_rowcount", String
					.valueOf(pc.rowcount));
			returnMessage += "<label id='pagecursum' name='pagecursum'>"
					+ pc.currentpage + "/" + pc.pagecount
					+ "</label>页<span id=\"overall_page\">";
			temp = "&nbsp;&nbsp;&nbsp;<a href=\"?ACT_TYPE=DIVPAGE&CURPAGE="
					+ pc.currentpage;
			/*temp += "&" + Constants.TOKEN_KEY + "="
					+ new Token((javax.servlet.http.HttpServletRequest) this.pageContext
									.getRequest()).getToken();*/
			disabledtemp = "&nbsp;&nbsp;&nbsp;<a disabled ";
			returnMessage += temp
					+ "&PAGE=FIRST\" id=\"head_page\" onclick=\"\" >首页</a>";
			if (pc.currentpage != 1) {
				returnMessage += temp
						+ "&PAGE=UP\" id=\"up_page\" onclick=\"\" >上一页</a>";
			} else {
				returnMessage += disabledtemp + " id=\"up_page\" >上一页</a>";
			}
			if (pc.currentpage != pc.pagecount) {
				returnMessage += temp
						+ "&PAGE=DOWN\" id=\"down_page\" onclick=\"\" >下一页</a>";
			} else {
				returnMessage += disabledtemp + " id=\"down_page\" >下一页</a>";
			}
			if (pc.currentpage != pc.pagecount) {
				returnMessage += temp
						+ "&PAGE=LAST\" id=\"end_page\" onclick=\"\" >末页</a>";
			} else {
				returnMessage += disabledtemp + " id=\"end_page\" >末页</a>";
			}
			returnMessage += "</span>&nbsp;&nbsp;&nbsp;转";
			returnMessage += "<input id=\"custom_page\" style='width:30px;text-align:center;BACKGROUND-COLOR:transparent;border-top-width:0;border-bottom-width:1px;border-left-width:0;border-right-width:0;border-bottom-COLOR:#000000;  ' type=page_div ";
			if (pc.rowcount == 0) {
				returnMessage += " disabled ";
			}
			returnMessage += " onkeyup=\"return page_div_onkeydown(this);\">页 <input type='button' value='GO' class='button_style_go' onclick=\"return page_div_onkeydown(custom_page,'go');\">";
			returnMessage += "</nobr></div>";
			returnMessage += "<script type=\"text/javascript\">\n";
			returnMessage += " function  page_div_onkeydown(obj,flag){\n";
			returnMessage += "   var thisvalue=obj.value; \n";
			returnMessage += "   if(isNaN(thisvalue)==true){ \n";
			returnMessage += "     obj.value=\"\"; \n";
			returnMessage += "     return; \n";
			returnMessage += "   } \n";
			returnMessage += "   if(longint(thisvalue)==false){ return; } \n";
			returnMessage += "   if(flag=='go'){ event.keyCode=13; } \n";
			returnMessage += "   if(event.keyCode==13 && thisvalue.length > 0 ){ ";
			returnMessage += "     window.document.location=\"?ACT_TYPE=DIVPAGE&CURPAGE="
					+ pc.currentpage;
			returnMessage += "&PAGETO=\"+obj.value";
			returnMessage += " } ";
			returnMessage += "} \n";
			returnMessage += "</script>\n";
			returnMessage += "\n";
		} catch (Exception e) {
			new mt.tools.customException(e, this.toString());
		}
		return returnMessage;
	}
}
