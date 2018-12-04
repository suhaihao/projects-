package mt.view.html;

import java.sql.ResultSet;
import java.util.ArrayList;

import mt.database.JavaDataObject;
import mt.database.extend.QueryConnection;
import mt.view.BaseTag;

class MenuItem {
    String m_strMc;
    String m_strBm;
    String m_strPath;
    public MenuItem(String strMc, String strBm, String strPath) {
        m_strMc = strMc;
        m_strBm = strBm;
        m_strPath = strPath;
    }

    public String GetBm() {
        return m_strBm;
    }

    public String GetMc() {
        return m_strMc;
    }

    public String GetPath() {
            return m_strPath;
    }

    public String toString()
    {
        return m_strMc;
    }
}


class Menu{
    String m_strMc;
    String m_strBm;
    String m_strPath;


    public ArrayList m_listItem;
    public Menu(String strMc, String strBm, String strPath) {
        m_strMc = strMc;
        m_strBm = strBm;
        m_strPath = strPath;
        m_listItem = new ArrayList();
    }

    public void AddItem(MenuItem item) {
        m_listItem.add(item);
    }

    public String GetPath() {

        if (m_strPath.trim().length() > 0) {
            return m_strPath;
        }
        return ((MenuItem)m_listItem.get(0)).GetPath();
    }

    public String GetBm() {
        return m_strBm;
    }

    public String GetMc() {
        return m_strMc;
    }
}

public class MenuTitle extends BaseTag {

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
        strbufContent.append("<div id=\"main_nav\">\n");
        strbufContent.append("    <div class=\"chromestyle\" id=\"chromemenu\">\n");
        strbufContent.append("      <ul>\n");
//        strbufContent.append("        <li><a href=\"../index.jsp\" class=\"nav_first\">首页</a></li>\n");
        int i = 0;
        while (!menuList.isEmpty())
        {
            i ++;
            String strNo;
            strNo = "" + i;
            Menu menu = (Menu)menuList.remove(0);
            //strbufContent
            //<li><a href="#" rel="dropmenu1">协会概况</a></li>
            strbufContent.append("        <li><a href=\"#\" onclick=\"menuGo('");
            strbufContent.append(menu.GetBm());
            strbufContent.append("','");
            strbufContent.append(menu.GetPath());
            strbufContent.append("')\"");
            if(!menu.m_listItem.isEmpty())
            {
                strbufContent.append(" rel=\"dropmenu");
                strbufContent.append(strNo);
                strbufContent.append("\"");
            }
            strbufContent.append(">");
            strbufContent.append(menu.GetMc());
            strbufContent.append("</a></li><li class=\"nav_divide\"></li>\n");

            if (menu.m_listItem.isEmpty())
            {
                continue;
            }

            //strbufItems
            //<div id="dropmenu$i" class="dropmenudiv">
            strbufItems.append("    <div id=\"dropmenu");
            strbufItems.append(strNo);
            strbufItems.append("\" class=\"dropmenudiv\">\n");
            //<a href="#" class="drop_first">协会简章</a>
            int j = 0;
            while (!menu.m_listItem.isEmpty())
            {
                MenuItem item = (MenuItem)menu.m_listItem.remove(0);
                strbufItems.append("      <a href=\"#\" onclick=\"menuGo('");
                strbufItems.append(item.GetBm());
                strbufItems.append("','");
                strbufItems.append(item.GetPath());
                strbufItems.append("')\"");
                if (j == 0)
                {
                    strbufItems.append(" class=\"drop_first\" ");
                }
                strbufItems.append(">");
                strbufItems.append(item.GetMc());
                strbufItems.append("</a>\n");
                j ++;
            }
            //</div>
            strbufItems.append("    </div>\n");

        }
        strbufContent = new StringBuffer(strbufContent.substring(0, strbufContent.lastIndexOf("<li class=\"nav_divide\"></li>")));
        strbufContent.append("      </ul>\n");
        strbufContent.append("    </div>\n");
        strbufContent.append(strbufItems);
        strbufContent.append("</div>\n");
        //javascript
        strbufContent.append("<script type=\"text/javascript\">");
        strbufContent.append("        cssdropdown.startchrome(\"chromemenu\");\n");
        strbufContent.append("		</script>\n");


        return strbufContent.toString();
    }

    private String getSql() {
        String strSQL = "select bm,decode(length(trim(bm)),1,0,1)lb,hzmc,nvl(bz2,' ') from dsys11 where bmlb='SYLM' AND BZ0='1'ORDER BY BM";
        return strSQL;
    }
}
