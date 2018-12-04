package mt.controller;

/**
 * <p>Title:丰富基类BaseAction</p>
 * <p>Description:用于其它action来继承（也只是框架，是丰富了基类BaseAction）
 * </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */
//java 扩展包
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import mt.controller.base.BaseAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ContainUpdateSql;
import mt.controller.base.ServletObject;

public class InitAction extends BaseAction {
	// 用于打印功能（查询中的值）中的内容
	static String LISTFORWARD = "QUERY";

	// insert方法，主要功能是插入数据并关闭页面，具体实现在dc.dataInDataBase方法中（是根据参数具体实现）
	protected void insert(ServletObject servletObject) {
		if (servletObject.dc.dataInDataBase(servletObject.formData, 'I') > 0) {
			servletObject.dc.ec.commit();
		}
		pageClose(servletObject);
	}

	// 关闭页面，如果没有指定跳转页面，就关闭此页面
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

	// update方法，主要功能是修改数据并关闭页面，具体实现在dc.dataInDataBase方法中（是根据参数具体实现）
	protected void update(ServletObject servletObject) {
		if (servletObject.dc.dataInDataBase(servletObject.formData, 'U') > 0) {
			servletObject.dc.ec.commit();
		}
		pageClose(servletObject);
	}

	// delete方法，主要功能是删除数据，具体实现在dc.dataInDataBase方法中（是根据参数具体实现）
	protected void delete(ServletObject servletObject) {
		if (servletObject.dc.dataInDataBase(servletObject.formData, 'D') > 0) {
			servletObject.dc.ec.commit();
		}

	}

	// query方法，主要功能是查询数据，具体实现在dc.dataInDataBase方法中（是根据参数具体实现）
	// 装载tag sheet需要的sql
	protected void query(ServletObject servletObject) {
		actionQuery(servletObject);
	}

	// querySingle方法，主要功能是查询数据，具体实现在dc.dataInDataBase方法中（是根据参数具体实现）
	// 装载tag mastersheet需要的sql
	protected void querySingle(ServletObject servletObject) {
		actionSingleQuery(servletObject);
	}

	// divPage方法，主要功能是查询分页，具体实现在actionDivPage方法中（是根据参数具体实现）
	protected void divPage(ServletObject servletObject) {
		actionDivPage(servletObject);
	}

	// printPage方法，主要功能是打印查询分页，具体实现在actionPrintPage方法中（框架）
	protected void printPage(ServletObject servletObject) {
		actionPrintPage(servletObject);
	}

	// printPage方法，主要功能是打印查询分页，具体实现在actionPrintPage方法中 （具体实现）
	// printPage方法的源码
	protected void actionPrintPage(ServletObject servletObject) {
		// 容器,是把从query中取到的sql信息装载的打印页面，可以让打印页面里得到sql信息
		ContainDivPage cdp = null;
		// 从query中得到sql信息
		cdp = (ContainDivPage) servletObject.getSession().getAttribute(
				servletObject.actionMapping.findForward(LISTFORWARD).getPath()
						+ "_sql");
		// 把从query中得到sql信息赋值给打印页面
		servletObject.getSession().setAttribute(
				servletObject.actionMapping.findForward(
						switchForward(servletObject.getActForward())).getPath()
						+ "_sql", cdp);
	}

	// actionSingleQuery方法，主要功能是查询数据（具体实现）
	// 用于查询出来后可以修改的页面
	protected void actionSingleQuery(ServletObject servletObject) {
		// 容器，是装载masterSheet所需要的sql,现在可以支持6条sql,如需要时，可以在扩充
		ContainUpdateSql cus = new ContainUpdateSql();
		// 缺省时单条sql，如果需要多条sql时，可以在子类中重载此方法，可以多次赋值
		cus.masteSql = servletObject.dc
				.getQuerySql(servletObject.formData, 'Q');
		// 指明跳转的方向，带走容器中的数据，具体处理在所到的页面中处理
		String localPath = "";
		localPath = servletObject.actionMapping.findForward(
				switchForward(servletObject.getActForward())).getPath();
		servletObject.getSession().setAttribute(localPath + "_updatesql", cus);

	}

	protected void actionQuery(ServletObject servletObject) {
		// 容器，是装载分页所需要的sql信息，可以带走sql的一些属性信息，如排序信息
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlWhole = servletObject.dc
				.getQuerySql(servletObject.formData, 'Q');
		cdp.sqlsort = servletObject.dc.sqlorder;
		cdp.sqlselect = servletObject.dc.sqlselect;
		// 指明跳转方向，同时带走容器中的sql信息
		servletObject.getSession().setAttribute(
				servletObject.actionMapping.findForward(
						switchForward(servletObject.getActForward())).getPath()
						+ "_sql", cdp);
	}

	// actionDivPage方法，主要功能是查询分页数据，也可以处理排序信息，条件信息
	protected void actionDivPage(ServletObject servletObject) {
		// 声明并得到装载信息，并赋值给cdp.sqlselect
		String sql = "";
		String order = "";
		ContainDivPage cdp = null;
		cdp = (ContainDivPage) servletObject.getSession().getAttribute(
				servletObject.actionMapping.findForward(
						switchForward(servletObject.getActForward())).getPath()
						+ "_sql");
		sql = cdp.sqlselect;
		// 判断排序信息，并赋值给cdp.sqlsort
		if ((new mt.tools.CustString()).nullToString(
				servletObject.httpServletRequest.getParameter("sort")).trim()
				.length() > 0) {
			order = servletObject.httpServletRequest.getParameter("sort");
			cdp.sqlsort = order;
		} else if ((new mt.tools.CustString()).nullToString(cdp.sqlsort).trim()
				.length() > 0) {
			order = cdp.sqlsort;
		}
		// 判断排序信息，并拼装order信息，赋值给cdp.sqlWhole
		// 指明跳转方向，同时带走容器中的sql信息
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
	 * 获得表的序列
	 * @param tableName 表名
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
