package mt.view.html.view;

import javax.servlet.http.HttpServletRequest;

import mt.view.html.Vobject;

/**
 * <p>
 * Title:能够装载表数据的标签
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

public class Vlabel extends Vobject {
	public String front() {
		String tempfront = "";
		tempfront += (new mt.tools.CustString()).nullToHtml(getValue());
		// if(tempfront.length()>20 && tempfront.indexOf("<")<0 &&
		// tempfront.indexOf(">")<0){
		// tempfront = tempfront.substring(0, 20)+"...";
		// }
		String tadle_column = this.name;
		String tadle_column_s[] = tadle_column.split(":");
		HttpServletRequest request = (HttpServletRequest) pageContext
				.getRequest();
		request.setAttribute("" + tadle_column_s[0] + ":" + tadle_column_s[1]
				+ "", tempfront);
		String ss = "" + tadle_column_s[0] + ":" + tadle_column_s[1] + "";
		String sss = tempfront;
		return tempfront;
	}

}
