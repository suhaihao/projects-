package mt.project.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mt.controller.InitAction;
import mt.controller.base.ContainDivPage;
import mt.controller.base.ServletObject;

public class RoleMenuListAction extends InitAction {
	protected void actionQuery(ServletObject servletObject) {
		String sqlSelect = "";
		String sqlWhere = "";
		String sqlSort = "";
		String dsys03_jfid = "", menu1_id = "";
		dsys03_jfid = servletObject.httpServletRequest.getParameter("jfid");

		// select app_name, item_name, jfid, dsys03_jfid, b.qx, c.qx sys_qx
		// from dsys02, (
		// select qx, dsys02_jfid, dsys03_jfid
		// from dsys02_dsys03 where dsys03_jfid = '2'
		// ) b,
		// (select dsys02_jfid, qx from dsys02_dsys03 where dsys03_jfid = '0') c
		// where dsys02.jfid = b.dsys02_jfid( +) and dsys02.menu1_id < > '0'
		// and dsys02.jfid = c.dsys02_jfid( +)
		// order by menu1_id, menu2_id

		sqlSelect = " select a.item_id dsys02n_itemid,decode(length(a.item_id),2,'--'||a.item_name,4,'----'||a.item_name,6,'------'||a.item_name) item_name,nvl(b.jfpopedom,'0') jfpopedom,'"
				+ dsys03_jfid
				+ "' dsys20_jfid from dsys02_n a,dsys02_n_20 b  \n";
		sqlWhere = "  a.item_id=b.dsys02n_itemid(+)  \n";
		sqlWhere += "and b.dsys20_jfid(+)='" + dsys03_jfid + "'";
		sqlSort = " a.item_id ";
		servletObject.httpServletRequest.setAttribute("dsys20_jfid",
				dsys03_jfid);
		javax.servlet.http.HttpSession session = servletObject.httpServletRequest
				.getSession(true);
		ContainDivPage cdp = new ContainDivPage();
		cdp.sqlWhole = sqlSelect + " where " + sqlWhere + "  order by "
				+ sqlSort;
		cdp.sqlsort = sqlSort;
		cdp.sqlselect = sqlSelect + " where " + sqlWhere;
		// System.out.println(cdp.sqlWhole);
		session.setAttribute(
				servletObject.actionMapping.findForward(
						switchForward(servletObject.actForward)).getPath()
						+ "_sql", cdp);
	}

	protected void insert(ServletObject so) {
		HttpServletRequest req = so.httpServletRequest;
		// String dsys02_jfid = "";
		String dsys20_jfid = "";

		// dsys02_jfid = req.getParameter("dsys02_dsys03:dsys02_jfid:str:M");
		dsys20_jfid = req.getParameter("dsys20_jfid");
		String sqlTemp = "";
		sqlTemp = " DELETE FROM dsys02_n_20 WHERE dsys20_jfid='" + dsys20_jfid
				+ "' ";

		so.dc.pjdo.execute(sqlTemp);
		HttpServletResponse resp = so.httpServletResponse;
		resp.setContentType("text/html;charset=GBK");
		String[] jfpopedom = so.httpServletRequest
				.getParameterValues("dsys02_n_20:jfpopedom:str:M");
		String[] dsys02n_itemid = so.httpServletRequest
				.getParameterValues("dsys02_n_20:dsys02n_itemid:str:P");
		String sql = "";
		int count = 0;
		for (int i = 0; i < dsys02n_itemid.length; i++) {
			sql = "insert into dsys02_n_20 (DSYS02N_ITEMID,DSYS20_JFID,JFPOPEDOM)values('"
					+ dsys02n_itemid[i]
					+ "','"
					+ dsys20_jfid
					+ "','"
					+ jfpopedom[i] + "')";
			if (so.dc.pjdo.execute(sql) >= 0) {
				count = 1;
			} else {
				count = 0;
				break;
			}
		} 
		if(count==1)
		{
			so.dc.ec.commit();
			 try {
				 resp.getWriter().print("<script type=\"text/javascript\">window.alert(\"操作成功\");window.close()</script>");
				 resp.getWriter().flush();
				 resp.getWriter().close();
				 } catch (IOException Ioe) {
				 new mt.tools.customException(Ioe, this.toString());
				 }
		}
		else
		{
			so.dc.ec.rollback();
			 try {
				 resp.getWriter().print("<script type=\"text/javascript\">window.alert(\"操作失败\");window.close()</script>");
				 resp.getWriter().flush();
				 resp.getWriter().close();
				 } catch (IOException Ioe) {
				 new mt.tools.customException(Ioe, this.toString());
				 }
		}
        // if (so.dc.dataInDataBase(so.formData, 'I') >= 0) {
		// so.dc.ec.commit();
		
		// } else {
	
		// }
	}

}
