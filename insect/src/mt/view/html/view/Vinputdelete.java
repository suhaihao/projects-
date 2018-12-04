package mt.view.html.view;

/**
 * 
 * <p>
 * Title:通过主键删除表记录的标签
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

public class Vinputdelete extends Vinput {

	public String other() {
		return " onclick=\"return f_Vinputdelete" + getValue() + "(this)\" "
				+ (new mt.tools.CustString()).nullToString(other) + "";
	}

	public String back() {
		String returnMessage = "";
		String act_type = "";
		if ((new mt.tools.CustString()).nullToString(getForward()).equals("")) {
			act_type = "DELETE";
		} else {
			act_type = getForward();
		}
		returnMessage += "<script language=\"javascript\" type=\"text/javascript\">\n";
		returnMessage += " function  f_Vinputdelete" + getValue() + "(obj) {\n";
		returnMessage += " if (window.confirm(\"的确需要删除此记录吗？\") == false ) { \n";
		returnMessage += "    obj.checked=false;  \n";
		returnMessage += "    return; }  \n";
		returnMessage += " var thisvalue=obj.value; \n";
		returnMessage += " window.document.location =\""
				+ (new mt.tools.CustString()).nullToString(getUrl())
				+ "?ACT_TYPE=" + act_type + "&" + this.name + "=" + getValue()
				+ "&" + getParameter() + "\";\n";
		returnMessage += "} \n";
		returnMessage += "</script>\n";
		returnMessage += "\n";
		return returnMessage;
	}

	public String forward;

	public void setForward(String forward) {
		this.forward = forward;
	}

	public String parameter;

	public void setParameter(String parameter) {
		this.parameter = parameter;
	}

	public String getParameter() {
		return parameter;
	}

	public String getForward() {
		return forward;
	}

	public String url;

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrl() {
		return url;
	}

}
