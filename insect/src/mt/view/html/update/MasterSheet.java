package mt.view.html.update;

import mt.controller.base.ContainUpdateSql;
import mt.database.JavaDataObject;
import mt.database.extend.JdbcQueryConnection;
import mt.database.extend.QueryConnection;
import mt.view.BaseBodyTag;

public class MasterSheet extends BaseBodyTag {
	public QueryConnection qc;
	public JavaDataObject jdo;

	public int doStartTag() {

		super.printStart();
		try {
			ContainUpdateSql cus = null;
			javax.servlet.http.HttpSession session = this.pageContext
					.getSession();
			String localPath = "";
			localPath = ((javax.servlet.http.HttpServletRequest) this.pageContext
					.getRequest()).getServletPath();
			cus = (ContainUpdateSql) session.getAttribute(localPath
					+ "_updatesql");

			if (connectmode.equals("1")) {// jdbc连接模式,autocommit方式
				qc = new QueryConnection("1", "0");
			} else if (connectmode.equals("3")) {
				qc = new JdbcQueryConnection();
			} else {
				qc = new QueryConnection();
			}
			jdo = new JavaDataObject(qc);
			jdo.executeQuery(getSql(cus));
			if (jdo.rs.next()) {
				return EVAL_BODY_INCLUDE;
			}
		} catch (Exception e) {
			if (qc != null) {
				qc.close();
			}
			e.printStackTrace();
		}
		if (qc != null)
			qc.close();
		return SKIP_BODY;
	}

	protected String getSql(ContainUpdateSql cus) {
		// 如果有datasource,以datasource优先考虑
		if (!new mt.tools.CustString().nullToString(this.datasource).equals("")) {
			return this.datasource;
		}

		if (detailindex == null) {
			return cus.masteSql;
		}
		switch (detailindex.charAt(0)) {
		case '0':
			return cus.masteSql;
		case '1':
			return cus.detail1Sql;
		case '2':
			return cus.detail2Sql;
		case '3':
			return cus.detail3Sql;
		case '4':
			return cus.detail4Sql;
		case '5':
			return cus.detail5Sql;
		case '6':
			// return cus.detail6Sql;
		default:
			return cus.masteSql;
		}
	}

	private String detailindex;

	public void setDetailindex(String detailindex) {
		this.detailindex = detailindex;
	}

	protected String datasource;

	public void setDatasource(String datasource) {
		this.datasource = datasource;
	}
	protected String id;
	
	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public String connectmode = "0";

	public String getConnectmode() {
		return this.connectmode;
	}

	public void setConnectmode(String connectmode) {
		this.connectmode = connectmode;
	}

	public String front() {
		if (!"".equals(this.id) && !"null".equals(this.id) && this.id != null) {
			return "<tbody id=\"" + this.getId() + "\">";
		}
		return "<tbody id=\"tbodyData"
				+ new mt.tools.CustString().nullToString(detailindex) + "\">";
	}

	public String back() {
		return "</tbody>";
	}

	public int doAfterBody() {
		try {
			if (jdo.rs.next()) {
				return EVAL_BODY_AGAIN;
			}
			jdo.close();
			qc.close();
		} catch (Exception e) {
			qc.close();
			new mt.tools.customException(e, this.toString());
		}
		qc.close();
		return SKIP_BODY;
	}
}
