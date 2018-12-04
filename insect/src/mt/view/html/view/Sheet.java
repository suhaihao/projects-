package mt.view.html.view;

import mt.view.html.PageCollection;

public class Sheet extends InitSheet {

	public int doStartTag() {
		int curpage;
		String page;
		String pageto;
		String temp = "";
		// ////////////////////////////////////////////////////////////////////
		super.printStart();
		try {
			session = this.pageContext.getSession();
			initdivPage();
			curpage = Integer.parseInt(this.pageContext.getRequest()
					.getParameter("CURPAGE") == null ? "0" : this.pageContext
					.getRequest().getParameter("CURPAGE"));
			page = (new mt.tools.CustString()).nullToString(this.pageContext
					.getRequest().getParameter("PAGE"));
			pageto = (new mt.tools.CustString()).nullToString(this.pageContext
					.getRequest().getParameter("PAGETO"));
			if (curpage == 0 && (pageto == null || pageto.equals(""))) {
				curpage = 1;
				temp = (String) session
						.getAttribute(((javax.servlet.http.HttpServletRequest) this.pageContext
								.getRequest()).getServletPath()
								+ "_curpage");
				if (temp != null) {
					temp = pjdo.getPageCount() < Integer.parseInt(temp) ? String
							.valueOf(pjdo.getPageCount())
							: temp;
				}
				curpage = (temp == null || temp.equals("")) ? 1 : Integer
						.parseInt(temp);
			} else if (page.equals("FIRST")) {
				curpage = 1;
			} else if (page.equals("UP")) {
				curpage = curpage - 1;
			} else if (page.equals("DOWN")) {
				curpage = curpage + 1;
			} else if (page.equals("LAST")) {
				curpage = pjdo.getPageCount();
			} else if (page.equals("")) {
				if (Integer.parseInt(pageto) < 0) {
					pageto = "1";
				}
				if (pjdo.getPageCount() < Integer.parseInt(pageto)) {
					curpage = pjdo.getPageCount();
				} else {
					curpage = Integer.parseInt(pageto);
				}
			}

			pjdo.move(this.pagesize * (curpage - 1));
			if (pjdo.getRow() > 0) {
				return EVAL_BODY_INCLUDE;
			}
			saveDivPage();
		} catch (Exception e) {
			e.printStackTrace();
			if (qc != null) {
				qc.close();
			}
		}
		if (qc != null) {
			qc.close();
		}
		return SKIP_BODY;
	}

	public int doAfterBody() {
		try {
			if (pjdo.next()) {
				return EVAL_BODY_AGAIN;
			}
			saveDivPage();
			pjdo.close();
			qc.close();
		} catch (Exception e) {
			qc.close();
			new mt.tools.customException(e, this.toString());
		}
		qc.close();
		return SKIP_BODY;
	}

	private void saveDivPage() {
		PageCollection pc = new PageCollection(pjdo.getRowCount(), pjdo
				.getPageCount(), pjdo.getRow(), pjdo.getCurrentPage());

		this.pageContext.getRequest().setAttribute(
				((javax.servlet.http.HttpServletRequest) this.pageContext
						.getRequest()).getServletPath()
						+ "_pc", pc);

	}

}
