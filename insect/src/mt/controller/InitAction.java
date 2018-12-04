package mt.controller;

/**
 * <p>Title:�ḻ����BaseAction</p>
 * <p>Description:��������action���̳У�Ҳֻ�ǿ�ܣ��Ƿḻ�˻���BaseAction��
 * </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
//java ��չ��
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import mt.controller.base.BaseAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ContainUpdateSql;
import mt.controller.base.ServletObject;

public class InitAction extends BaseAction {
	// ���ڴ�ӡ���ܣ���ѯ�е�ֵ���е�����
	static String LISTFORWARD = "QUERY";

	// insert��������Ҫ�����ǲ������ݲ��ر�ҳ�棬����ʵ����dc.dataInDataBase�����У��Ǹ��ݲ�������ʵ�֣�
	protected void insert(ServletObject servletObject) {
		if (servletObject.dc.dataInDataBase(servletObject.formData, 'I') > 0) {
			servletObject.dc.ec.commit();
		}
		pageClose(servletObject);
	}

	// �ر�ҳ�棬���û��ָ����תҳ�棬�͹رմ�ҳ��
	protected void pageClose(ServletObject servletObject) {
		try {
			servletObject.httpServletResponse.getOutputStream().print(
					"<script language javascript>");
			servletObject.httpServletResponse.getOutputStream().print(
					"window.close();");
			servletObject.httpServletResponse.getOutputStream().print(
					"</script>");
		} catch (Exception Ioe) {
			new mt.tools.customException(Ioe, this.toString());
		}

	}

	// update��������Ҫ�������޸����ݲ��ر�ҳ�棬����ʵ����dc.dataInDataBase�����У��Ǹ��ݲ�������ʵ�֣�
	protected void update(ServletObject servletObject) {
		if (servletObject.dc.dataInDataBase(servletObject.formData, 'U') > 0) {
			servletObject.dc.ec.commit();
		}
		pageClose(servletObject);
	}

	// delete��������Ҫ������ɾ�����ݣ�����ʵ����dc.dataInDataBase�����У��Ǹ��ݲ�������ʵ�֣�
	protected void delete(ServletObject servletObject) {
		if (servletObject.dc.dataInDataBase(servletObject.formData, 'D') > 0) {
			servletObject.dc.ec.commit();
		}

	}

	// query��������Ҫ�����ǲ�ѯ���ݣ�����ʵ����dc.dataInDataBase�����У��Ǹ��ݲ�������ʵ�֣�
	// װ��tag sheet��Ҫ��sql
	protected void query(ServletObject servletObject) {
		actionQuery(servletObject);
	}

	// querySingle��������Ҫ�����ǲ�ѯ���ݣ�����ʵ����dc.dataInDataBase�����У��Ǹ��ݲ�������ʵ�֣�
	// װ��tag mastersheet��Ҫ��sql
	protected void querySingle(ServletObject servletObject) {
		actionSingleQuery(servletObject);
	}

	// divPage��������Ҫ�����ǲ�ѯ��ҳ������ʵ����actionDivPage�����У��Ǹ��ݲ�������ʵ�֣�
	protected void divPage(ServletObject servletObject) {
		actionDivPage(servletObject);
	}

	// printPage��������Ҫ�����Ǵ�ӡ��ѯ��ҳ������ʵ����actionPrintPage�����У���ܣ�
	protected void printPage(ServletObject servletObject) {
		actionPrintPage(servletObject);
	}

	// printPage��������Ҫ�����Ǵ�ӡ��ѯ��ҳ������ʵ����actionPrintPage������ ������ʵ�֣�
	// printPage������Դ��
	protected void actionPrintPage(ServletObject servletObject) {
		// ����,�ǰѴ�query��ȡ����sql��Ϣװ�صĴ�ӡҳ�棬�����ô�ӡҳ����õ�sql��Ϣ
		ContainDivPage cdp = null;
		// ��query�еõ�sql��Ϣ
		cdp = (ContainDivPage) servletObject.getSession().getAttribute(
				servletObject.actionMapping.findForward(LISTFORWARD).getPath()
						+ "_sql");
		// �Ѵ�query�еõ�sql��Ϣ��ֵ����ӡҳ��
		servletObject.getSession().setAttribute(
				servletObject.actionMapping.findForward(
						switchForward(servletObject.getActForward())).getPath()
						+ "_sql", cdp);
	}

	// actionSingleQuery��������Ҫ�����ǲ�ѯ���ݣ�����ʵ�֣�
	// ���ڲ�ѯ����������޸ĵ�ҳ��
	protected void actionSingleQuery(ServletObject servletObject) {
		// ��������װ��masterSheet����Ҫ��sql,���ڿ���֧��6��sql,����Ҫʱ������������
		ContainUpdateSql cus = new ContainUpdateSql();
		// ȱʡʱ����sql�������Ҫ����sqlʱ�����������������ش˷��������Զ�θ�ֵ
		cus.masteSql = servletObject.dc
				.getQuerySql(servletObject.formData, 'Q');
		// ָ����ת�ķ��򣬴��������е����ݣ����崦����������ҳ���д���
		String localPath = "";
		localPath = servletObject.actionMapping.findForward(
				switchForward(servletObject.getActForward())).getPath();
		servletObject.getSession().setAttribute(localPath + "_updatesql", cus);

	}

	protected void actionQuery(ServletObject servletObject) {
		// ��������װ�ط�ҳ����Ҫ��sql��Ϣ�����Դ���sql��һЩ������Ϣ����������Ϣ
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlWhole = servletObject.dc
				.getQuerySql(servletObject.formData, 'Q');
		cdp.sqlsort = servletObject.dc.sqlorder;
		cdp.sqlselect = servletObject.dc.sqlselect;
		// ָ����ת����ͬʱ���������е�sql��Ϣ
		servletObject.getSession().setAttribute(
				servletObject.actionMapping.findForward(
						switchForward(servletObject.getActForward())).getPath()
						+ "_sql", cdp);
	}

	// actionDivPage��������Ҫ�����ǲ�ѯ��ҳ���ݣ�Ҳ���Դ���������Ϣ��������Ϣ
	protected void actionDivPage(ServletObject servletObject) {
		// �������õ�װ����Ϣ������ֵ��cdp.sqlselect
		String sql = "";
		String order = "";
		ContainDivPage cdp = null;
		cdp = (ContainDivPage) servletObject.getSession().getAttribute(
				servletObject.actionMapping.findForward(
						switchForward(servletObject.getActForward())).getPath()
						+ "_sql");
		sql = cdp.sqlselect;
		// �ж�������Ϣ������ֵ��cdp.sqlsort
		if ((new mt.tools.CustString()).nullToString(
				servletObject.httpServletRequest.getParameter("sort")).trim()
				.length() > 0) {
			order = servletObject.httpServletRequest.getParameter("sort");
			cdp.sqlsort = order;
		} else if ((new mt.tools.CustString()).nullToString(cdp.sqlsort).trim()
				.length() > 0) {
			order = cdp.sqlsort;
		}
		// �ж�������Ϣ����ƴװorder��Ϣ����ֵ��cdp.sqlWhole
		// ָ����ת����ͬʱ���������е�sql��Ϣ
		if (order.trim().length() > 0) {
			sql += "  order by " + order;
		}
		cdp.sqlWhole = sql;
		servletObject.getSession().setAttribute(
				servletObject.actionMapping.findForward(
						switchForward(servletObject.getActForward())).getPath()
						+ "_sql", cdp);
	}
	
	/**
	 * ��ñ������
	 * @param tableName ����
	 * @return
	 */
	protected String getSequence(ServletObject so, String tableName) {
		String sequence = "";
		try {
			so.dc.pjdo.executeQuery("SELECT SEQU_" + tableName.toUpperCase() + ".NEXTVAL FROM DUAL");
			if (so.dc.pjdo.rs.next())
			sequence = so.dc.pjdo.rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sequence;
	}
}
