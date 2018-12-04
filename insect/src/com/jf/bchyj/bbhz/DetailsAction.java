package com.jf.bchyj.bbhz;





import mt.controller.InitAction;
import mt.controller.base.ServletObject;

public class DetailsAction extends InitAction {

	protected void actionQuery(ServletObject so) {
		String where=so.httpServletRequest.getParameter("where");
		String bodyTable=so.httpServletRequest.getParameter("bodyTable");
		String headTable=so.httpServletRequest.getParameter("headTable");
		String clickwhere=so.httpServletRequest.getParameter("clickwhere");
		String DCRQ=so.httpServletRequest.getParameter("DCRQ");
		String BMBM=so.httpServletRequest.getParameter("BMBM");
		String XZ=so.httpServletRequest.getParameter("XZ");
		String Y01=so.httpServletRequest.getParameter("Y01");
		String Y02=so.httpServletRequest.getParameter("Y02");
		String sjpd=so.httpServletRequest.getParameter("sjpd");
		System.out.println();
		if(DCRQ!=null)
		{
			so.httpServletRequest.setAttribute("DCRQ", DCRQ);
		}
		if(BMBM!=null)
		{
			so.httpServletRequest.setAttribute("BMBM", BMBM);
		}
		if(XZ!=null)
		{
			so.httpServletRequest.setAttribute("XZ", XZ);
		}
		if(Y01!=null)
		{
			so.httpServletRequest.setAttribute("Y01", Y01);
		}
		if(Y02!=null)
		{
			so.httpServletRequest.setAttribute("Y02", Y02);
		}
		if(sjpd!=null&&!sjpd.equals(""))
		{
			so.httpServletRequest.setAttribute("sjpd", sjpd);
		}
		so.httpServletRequest.setAttribute("where", where);
		so.httpServletRequest.setAttribute("bodyTable", bodyTable);
		so.httpServletRequest.setAttribute("headTable", headTable); 
		so.httpServletRequest.setAttribute("clickwhere", clickwhere);
	}

}
