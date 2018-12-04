package mt.view.html.view;

import mt.view.BaseTag;
import mt.view.html.PageCollection;

public class PageExp extends BaseTag {
	int per;

	public int getPer() {
		return per;
	}

	public void setPer(int per) {
		this.per = per;
	}

	public String front() {
		String tempfront = "";
		tempfront += getMessage();
		return tempfront;
	}

	private String getMessage() {
		String returnMessage = "";
		String temp = "";
		String disabledtemp = "";
		try {
			PageCollection pc = (PageCollection) this.pageContext.getRequest().getAttribute(
							((javax.servlet.http.HttpServletRequest) this.pageContext
									.getRequest()).getServletPath() + "_pc");
			if (pc.pagecount == 0) {
				pc.pagecount = 1;
			}
			javax.servlet.http.HttpSession session = this.pageContext.getSession();
			session.setAttribute(
					((javax.servlet.http.HttpServletRequest) this.pageContext
							.getRequest()).getServletPath()
							+ "_curpage", Integer.toString(pc.currentpage));
			returnMessage += "\n";
			returnMessage += "<div style='text-align:right'><nobr>";
			returnMessage += "总计:&nbsp;" + pc.rowcount + "条记录&nbsp;&nbsp";
			returnMessage += "每页<input style=\"width:30px;\" maxlength=\"4\" value=\"" 
				+ getPer() + "\" onkeydown=\"return per_onkeydown(this)\">条";
			returnMessage += "&nbsp;&nbsp;<label id='pagecursum' name='pagecursum'>第" 
				+ pc.currentpage + "/" + pc.pagecount + "</label>页&nbsp;&nbsp";

			temp = "&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"?&ACT_TYPE=DIVPAGE&CURPAGE="
					+ pc.currentpage;
			disabledtemp = "&nbsp;&nbsp;&nbsp;&nbsp;<a disabled ";
			returnMessage += temp + "&PAGE=FIRST&p=" + getPer() + "\">首页</a>";

			if (pc.currentpage != 1) {
				returnMessage += temp + "&PAGE=UP&p=" + getPer() + "\">上一页</a>";
			} else {
				returnMessage += disabledtemp + ">上一页</a>";
			}
			if (pc.currentpage != pc.pagecount) {
				returnMessage += temp + "&PAGE=DOWN&p=" + getPer() + "&l=" + pc.pagecount + "\">下一页</a>";
			} else {
				returnMessage += disabledtemp + ">下一页</a>";
			}
			if (pc.currentpage != pc.pagecount) {
				returnMessage += temp + "&PAGE=LAST&p=" + getPer() + "&l=" + pc.pagecount + "\">末页</a>";
			} else {
				returnMessage += disabledtemp + ">末页</a>";
			}

			returnMessage += "&nbsp;&nbsp;&nbsp;&nbsp;转";
			returnMessage += "<input style='width:40px' type=page_div onkeydown=\"return page_div_onkeydown(this)\">页";
			returnMessage += "</nobr></div>";
			returnMessage += "<script language=javascript>\n";
			returnMessage += "function  page_div_onkeydown(obj){\n";
			returnMessage += "  var thisvalue=obj.value;";
			returnMessage += "  if (longint(thisvalue)==false) { return } \n";
			returnMessage += "  if (event.keyCode==13 && thisvalue.length > 0) {";
			returnMessage += "    window.document.location =\"?ACT_TYPE=DIVPAGE&CURPAGE=" + pc.currentpage;
			returnMessage += "&PAGETO=\" + obj.value + \"&p=" + getPer() + "\";";
			returnMessage += "  }";
			returnMessage += "} \n";
			returnMessage += "function per_onkeydown(obj){";
			returnMessage += "  var thisvalue=obj.value;";
			returnMessage += "  if (longint(thisvalue)==false) { return } \n";
			returnMessage += "  if (parseInt(thisvalue)>1000) { obj.value='1000';return; } \n";
			returnMessage += "  if (event.keyCode==13 && thisvalue.length > 0) {";
			returnMessage += "    window.document.location =\"?ACT_TYPE=DIVPAGE&p=\" + obj.value;";
			returnMessage += "  }";
			returnMessage += "} \n";
			returnMessage += "</script>\n";
			returnMessage += "\n";
		} catch (Exception e) {
			new mt.tools.customException(e, this.toString());
		}
		return returnMessage;
	}
}
