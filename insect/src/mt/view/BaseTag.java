package mt.view;

import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
/**
 * 
 * @author Administrator
 *
 */
public class BaseTag extends TagSupport {

	protected String name;

	public String id() {
		return (new mt.tools.CustString()).nullToString(getId()).equals("") ? ""
				: "id=\"" + (new mt.tools.CustString()).nullToString(getId())
						+ "\"";
	}

	public String name() {
		return (new mt.tools.CustString()).nullToString(name).equals("") ? ""
				: "name=\"" + (new mt.tools.CustString()).nullToString(name)
						+ "\"";
	}

	public String getName() {
		return name;
	}

	public String other() {
		return (new mt.tools.CustString()).nullToString(other).equals("") ? ""
				: "" + (new mt.tools.CustString()).nullToString(other) + "";
	}

	public void setName(String name) {
		this.name = name;
	}

	protected String other;

	public void setOther(String other) {
		this.other = other;
	}

	public int doStartTag() {
		printStart();
		return SKIP_BODY;
	}

	public int doEndTag() {
		printEnd();
		return EVAL_PAGE;
	}

	public void printStart() {
		print(front());
	}

	public void printEnd() {
		print(back());
	}

	public String front() {
		return "";
	}

	public String back() {
		return "";
	}

	public void print(String str) {
		try {
			pageContext.getOut().print(str);
		} catch (IOException e) {
			new mt.tools.customException(e, this.toString());
		}
	}

	protected String getAllAttribute() {
		String tempStr = " ";
		tempStr += id() + " ";
		tempStr += name() + " ";
		tempStr += this.other();
		return tempStr;
	}
}
