package mt.view.html;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import mt.database.JavaDataObject;
import mt.database.extend.QueryConnection;
import mt.view.BaseTag;

import com.jf.bchyj.bean.User;

public class MenuView extends BaseTag {
	private static final long serialVersionUID = 1L;

    public String front() {
    	QueryConnection qc = new QueryConnection();
		JavaDataObject jdo = new JavaDataObject(qc);
		StringBuffer sb = new StringBuffer("");
		String menu = "";
		try {
			jdo.executeQuery(getSql());
			ResultSet rs = jdo.rs;
			String item_name = ""; // module name
			String item_path = ""; // module path
			String menu_id = ""; // menu id
			String item_id = ""; // module id
			Map<String, String> map = new HashMap<String, String>(); // data for breadcrumb
			int fstmnuidx = 0; // first menu index(for menu.jsp)
			while (rs.next()) {
				item_name = rs.getString("item_name");
				item_path = rs.getString("item_path");
				menu_id = rs.getString("menu_id");
				item_id = rs.getString("item_id");
				// item_path = (item_path == null) ? "javascript:;" : item_path;
				
				if ("0".equals(menu_id)) {
				    sb.append("@<h3>" + item_name + "</h3>#");
					map.put("-" + item_id, "" + fstmnuidx++);
				}else{
            		//sb.append("<li><a href=\"javascript:jump('" + item_id + "','" + item_path + "')\">" + item_name + "</a></li>");
            		if (item_path != null && item_path.indexOf("?") > 0) {
            			sb.append("<li><a href=\"" + item_path + "&c=" + item_id + "\">" + item_name + "</a></li>");
            		} else {
            			sb.append("<li><a href=\"" + item_path + "?c=" + item_id + "\">" + item_name + "</a></li>");
            		}
				}
				map.put(item_id, item_name);
			}
			sb.deleteCharAt(0);
			sb.append("@");
			menu = sb.toString();
			// menu = menu.replaceAll("#@", ""); // for no submenu items
			menu = menu.replaceAll("#", "<div><ul>");
			menu = menu.replaceAll("@", "</ul></div>");
			
			this.pageContext.getSession().setAttribute("BREADCRUMB", map);
		} catch (Exception sqlx) {
			sqlx.printStackTrace();
		} finally {
			qc.close();
			jdo.close();
		}
		return menu;
    }

    private String getSql() {
        javax.servlet.http.HttpSession session = this.pageContext.getSession();
        User user = (User) session.getAttribute("user");
        String strSQL =
                "select distinct item_name,item_path,item_id,menu_id" +
                " from dsys01,dsys02_n,dsys20,dsys02_n_20,dsys01_dsys03 \n" +
                " where dsys01.jfid=dsys01_dsys03.dsys01_jfid and dsys01_dsys03.dsys20_jfid = dsys20.jfid\n" +
                " and dsys20.jfid = dsys02_n_20.DSYS20_JFID\n" +
                " and dsys02_n_20.DSYS02N_ITEMID = dsys02_n.item_id\n" +
                " and dsys01.jfuserid='" + user.getUserid() + "'\n" +
                " and dsys01.JFPASSWORD='" + user.getPassword() + "'\n" +
                " and nvl(dsys02_n_20.JFPOPEDOM,'0') <>'0' " +
                " and nvl(sf_noshow,'0') <> '1' " +
                " order by item_id";
        return strSQL;
    }
    
}
