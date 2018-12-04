package mt.view.html.view;

import mt.view.BaseTag;

/**
 * <p>Title:显示表头标签 </p>
 *
 * <p>Description: </p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: </p>
 *
 * @author not attributable
 * @version 1.0
 */
public class VcolumnHead extends BaseTag {
	
	public String front() {
		String tempfront = "";
		String temp = "", name = "";
		tempfront += "<a " + " ";
		tempfront += super.getAllAttribute() + " ";
		tempfront += href();
		tempfront += ">";
		tempfront += value();
		temp = (new mt.tools.CustString()).nullToString(this.pageContext
				.getRequest().getParameter("sort"));
		name = (new mt.tools.CustString()).nullToString(this.getName());
		if (temp.trim().toLowerCase().indexOf(" asc") > 0) {
			if (temp.trim().toLowerCase().indexOf((name.trim()).toLowerCase()) > -1) {
				tempfront += " ↑";
			}
		} else if (temp.trim().toLowerCase().indexOf(" desc") > 0) {
			if (temp.trim().toLowerCase().indexOf((name.trim()).toLowerCase()) > -1) {
				tempfront += " ↓";
			}
		} else {
			tempfront += "";
		}
		tempfront += "</a>";
		return tempfront;
	}

	public String href() {
		String temp = "";
		String order = "";
		temp = (new mt.tools.CustString()).nullToString(this.pageContext
				.getRequest().getParameter("sort"));
		if (temp.trim().toLowerCase().indexOf(" asc") > 0) {
			order = " desc ";
		} else {
			order = " asc";
		}
		String sort = (new mt.tools.CustString()).nullToString(this.getName()) + " " + order;
		String name = (new mt.tools.CustString()).nullToString(this.getName());
		if (name.contains(",")) {
			sort = "";
			String[] zds = name.split(",");
			for (int i=0; i<zds.length; i++) {
				sort += zds[i].trim() + " " + order;
				if (i < zds.length-1) {
					sort += ",";
				}
			}
		}
		return "href=\"?ACT_TYPE=DIVPAGE&sort=" + sort + "\"";
	}

	private String value;

	public String value() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
