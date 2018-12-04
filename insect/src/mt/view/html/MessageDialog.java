package mt.view.html;

import mt.view.BaseTag;
import mt.tools.CustString;

public class MessageDialog extends BaseTag {

	public String front() {
		String tempfront = "";
		String message = "";
		message = new CustString().nullToString((String) this.pageContext
				.getRequest().getAttribute("Message"));
		if (!message.trim().equals("")) {
			tempfront = "<script language=javascript> \n";
			tempfront += "alert(\"" + message + "\") \n";
			tempfront += "</script> \n";
		}
		this.pageContext.getRequest().removeAttribute("Message");
		return tempfront;
	}
}
