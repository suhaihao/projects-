package mt.view.html;

import mt.tools.CustString;
import mt.view.BaseTag;

public class SuccessAndRefreshOpener extends BaseTag {
	private String successMes = "³É¹¦";

	public void setSuccessMes(String mes) {
		this.successMes = mes;
	}

	public String front() {
		String tempfront = "";
		String message = "";

		message = new CustString().nullToString((String) this.pageContext
				.getRequest().getAttribute("Message"));
		if (!message.trim().equals("")) {
			tempfront = "<script language=\"javascript\">\n";
			tempfront += "   alert(\"" + message + "\");\n";
			tempfront += "   f_refreshOpener();\n";
			if (message.equals(successMes)) {
				tempfront += "   window.close();\n";
			}
			tempfront += "</script>\n";
		}
		this.pageContext.getRequest().removeAttribute("Message");
		return tempfront;
	}

}
