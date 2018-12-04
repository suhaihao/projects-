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
			returnMessage += "�ܼ�:&nbsp;" + pc.rowcount + "����¼&nbsp;&nbsp";
			returnMessage += "ÿҳ<input style=\"width:30px;\" maxlength=\"4\" value=\"" 
				+ getPer() + "\" onkeydown=\"return per_onkeydown(this)\">��";
			returnMessage += "&nbsp;&nbsp;<label id='pagecursum' name='pagecursum'>��" 
				+ pc.currentpage + "/" + pc.pagecount + "</label>ҳ&nbsp;&nbsp";

			temp = "&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"?&ACT_TYPE=DIVPAGE&CURPAGE="
					+ pc.currentpage;
			disabledtemp = "&nbsp;&nbsp;&nbsp;&nbsp;<a disabled ";
			returnMessage += temp + "&PAGE=FIRST&p=" + getPer() + "\">��ҳ</a>";

			if (pc.currentpage != 1) {
				returnMessage += temp + "&PAGE=UP&p=" + getPer() + "\">��һҳ</a>";
			} else {
				returnMessage += disabledtemp + ">��һҳ</a>";
			}
			if (pc.currentpage != pc.pagecount) {
				returnMessage += temp + "&PAGE=DOWN&p=" + getPer() + "&l=" + pc.pagecount + "\">��һҳ</a>";
			} else {
				returnMessage += disabledtemp + ">��һҳ</a>";
			}
			if (pc.currentpage != pc.pagecount) {
				returnMessage += temp + "&PAGE=LAST&p=" + getPer() + "&l=" + pc.pagecount + "\">ĩҳ</a>";
			} else {
				returnMessage += disabledtemp + ">ĩҳ</a>";
			}

			returnMessage += "&nbsp;&nbsp;&nbsp;&nbsp;ת";
			returnMessage += "<input style='width:40px' type=page_div onkeydown=\"return page_div_onkeydown(this)\">ҳ";
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
