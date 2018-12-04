package com.jf.bchyj.action.system.bbcx;


import com.jf.util.DrawTable;

import net.sf.json.JSONObject;

import mt.controller.InitAction;
import mt.controller.base.ServletObject;

public class TextSuDuAction extends InitAction {
	
	protected void actionQuery(ServletObject so) {
		String code=so.httpServletRequest.getParameter("code");
		try {
		DrawTable dt = new DrawTable();
		long starTime=System.currentTimeMillis();
		String html;
	    html = dt.draw_table(code, "0", so.httpServletRequest);
		long endTime=System.currentTimeMillis();
		System.out.println(endTime-starTime);
		JSONObject jsonObj=JSONObject.fromObject(html);
		so.httpServletResponse.getWriter().print(jsonObj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
