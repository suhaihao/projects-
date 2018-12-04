package mt.view.html;

import java.sql.ResultSet;
import java.util.ArrayList;

import mt.database.JavaDataObject;
import mt.database.extend.QueryConnection;
import mt.view.BaseTag;

public class MenuLeft extends BaseTag {

    protected String bm;
    public void setBm(String bm)
    {
        this.bm = bm;
    }
    public String front() {

        QueryConnection qc = new QueryConnection();
        JavaDataObject jdo = new JavaDataObject(qc);
        StringBuffer strbufContent = new StringBuffer("");
        StringBuffer strbufItems = new StringBuffer("");

        ArrayList menuList = new ArrayList();
        ArrayList itemList = new ArrayList();
        try {
            jdo.executeQuery(getSql());
            ResultSet res = jdo.rs;
            Menu curMenu = null;
            while (res.next()) {
                String strBm = res.getString(1);
                String strLb = res.getString(2);
                String strMc = res.getString(3);
                String strPath = res.getString(4);
                if (strLb.equals("0")) {
                    curMenu = new Menu(strMc, strBm, strPath);
                    menuList.add(curMenu);
                } else if (strLb.equals("1") && curMenu != null &&
                           strBm.startsWith(curMenu.GetBm())) {
                    MenuItem item = new MenuItem(strMc, strBm, strPath);
                    curMenu.AddItem(item);
                }
            }

        } catch (Exception sqlx) {
            sqlx.printStackTrace();
        } finally {
            qc.close();
            jdo.close();
        }
        if (menuList.isEmpty()) {
            return "";
        }

        int i = 0;
        while (!menuList.isEmpty())
        {
            i ++;
            String strNo;
            strNo = "" + i;
            Menu menu = (Menu)menuList.remove(0);


            strbufContent.append("	<div class=\"left\" style=\"width:180px;margin:0\">\n");
            strbufContent.append("	   <div class=\"cur_pos\" style=\"width:180px;margin:0\"><b>您当前的位置&gt;&gt;");
            strbufContent.append(menu.GetMc());
            strbufContent.append("</b></div>\n");
            strbufContent.append("		<div class=\"wrapper\" style=\"width:180px;margin:0\">\n");
            strbufContent.append("			<div class=\"left_mnu\" style=\"width:180px;margin:0\">\n");
            strbufContent.append("			   <ul>\n");

            while (!menu.m_listItem.isEmpty())
            {
//              strbufContent.append("				<li><a href=\"#\">业内信息</a></li>\n");
                MenuItem item = (MenuItem)menu.m_listItem.remove(0);
                //strbufContent.append("				<li><a href=\"javascript:leftMenuOpen('");
                strbufContent.append("				<li><a href=\"###\" onclick=\"leftMenuOpen('");
                strbufContent.append(item.GetBm());
                strbufContent.append("','");
                strbufContent.append(item.GetPath());
                strbufContent.append("')\">");
                strbufContent.append(item.GetMc());
                strbufContent.append("</a></li>\n");
            }

            strbufContent.append("			   </ul>\n");
            strbufContent.append("			</div>\n");
            strbufContent.append("		</div>\n");
            strbufContent.append("	</div>\n");
            break;
        }


        return strbufContent.toString();
    }

    private String getSql() {
    	String strSQL = "select bm,decode(length(trim(bm)),1,0,1)lb,hzmc,nvl(bz2,' ') from dsys11 where bmlb='SYLM' AND BZ0='1' AND BM LIKE '" + bm.substring(0,1) + "%' ORDER BY BM";
    	if (bm.startsWith("G") || bm.startsWith("J")) {
    		strSQL = "select bm,decode(length(trim(bm)),1,0,1)lb,hzmc,nvl(bz2,' ') from dsys11 where bmlb='SYLM' AND BM LIKE '" + bm.substring(0,1) + "%' ORDER BY BM";
    	}
        return strSQL;
    }
}
