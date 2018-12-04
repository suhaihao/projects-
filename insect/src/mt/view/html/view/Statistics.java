package mt.view.html.view;

import mt.view.*;
import mt.model.DataChannel;
import java.sql.*;
import java.math.BigDecimal;

public class Statistics
    extends BaseTag {
  private DataChannel dc;
  private Connection conn;
  private Statement stmt;
  private ResultSet rs;
  private String sql;
  private String tblHead;
  private String manageOrg;
  private String declareTime_b = "";
  private String declareTime_e = "";
  private String printed = "";
  private int taxCount;
  private int[] sum;
  public void init() {
    javax.servlet.http.HttpSession session = this.pageContext.getSession();
    String localPath = "";
    localPath = ( (javax.servlet.http.HttpServletRequest)this.pageContext.
                 getRequest()).getServletPath();
    sql = (String) session.getAttribute(localPath + "_sql");
    tblHead = (String) session.getAttribute(localPath + "_tblHead");
    manageOrg = (String) session.getAttribute(localPath + "_manageOrg");
    taxCount = ( (Integer) session.getAttribute(localPath + "_taxCountInt")).
        intValue();
    declareTime_b = (String) session.getAttribute(localPath + "_declareTime_b");
    declareTime_e = (String) session.getAttribute(localPath + "_declareTime_e");
    printed = (String) session.getAttribute(localPath + "_printed");
    if(printed==null)printed = "";
    if(printed.equals("1"))printed=" （已打印）";
    else if(printed.equals("0"))printed=" （未打印）";
    else printed="";
    session.removeAttribute(localPath + "_sql");
    session.removeAttribute(localPath + "_tblHead");
    session.removeAttribute(localPath + "_manageOrg");
    session.removeAttribute(localPath + "_taxCountInt");
    session.removeAttribute(localPath + "_declareTime_b");
    session.removeAttribute(localPath + "_declareTime_e");
    session.removeAttribute(localPath + "_printed");
    dc = new DataChannel();
    conn = dc.ec.con;
  }

  private String tblTitle = "";
  private int rowCountPerPage = 20;
  public void setTblTitle(String tblTitle) {
    this.tblTitle = tblTitle;
  }

  public void setRowCountPerPage(String rowCountPerPage) {
    this.rowCountPerPage = Integer.parseInt(rowCountPerPage);
  }

  public String front() {
    init();
    String html = "";
    String html2 = "";
    String html3 = "";
    html = "<table width=\"100%\" border=\"0\" align=\"center\">\n"
        + "<tr>\n"
        + "  <td align=\"center\" colspan=\"5\"><h1><font size=\"+2\">" +
        tblTitle + printed + "</h1></font></td>\n"
        + "</tr>\n"
        + "<tr>\n"
        + "  <td align=\"left\" style=\"font-size:15px\" width=\"10%\" valign=\"top\">管理机关：</td>\n"
        +
        "  <td align=\"left\" style=\"font-size:15px\" width=\"20%\" valign=\"top\">" +
        manageOrg + "</td>\n"
        +
        "  <td align=\"left\" style=\"font-size:15px\" width=\"5%\">&nbsp;</td>\n"
        + "  <td align=\"left\" style=\"font-size:15px\" width=\"40%\" valign=\"top\">时间： " +
        declareTime_b + " 至 " + declareTime_e + "</td>\n"
        + "<td align=\"right\" style=\"font-size:15px\" width=\"25%\" valign=\"top\">金额单位：元</td>\n"
        + "</tr>\n"
        + "<tr>\n"
        + "<td colspan=\"5\">\n"
        + "<table id=\"myPrint\" class=\"tableborder\" width=\"100%\" border=\"1\" style=\"width:100%\">\n"
        + "<tr>\n"
        + "<td rowspan=\"2\" style=\"width:100px;text-align:center\">项目</td>\n"
        + "<td style=\"text-align:center\" colspan=\"" + taxCount + "\">税款金额</td>\n"
        + "<td rowspan=\"2\" style=\"width:50px;text-align:center\">合计</td>\n"
        + "</tr>\n"
        + "<tr>\n"
        ;
    String[] tblHeadFields = tblHead.split("\\|");
    sum = new int[taxCount + 1];
    for (int i = 0; i < taxCount; i++) {
      html += "<td style=\"text-align:left\" valign=\"top\">" + tblHeadFields[i] + "</td>\n";
    }
    html += "</tr>\n"
        + "<tr>\n"
        + "<td style=\"text-align:center\">合计</td>\n"
        ;
    /*
         + "<td style=\"width:100px;text-align:center\">项目</td>\n";
         String[] tblHeadFields = tblHead.split("\\|");
         sum = new int[taxCount + 1];
         for (int i = 0; i < taxCount ; i++) {
     html += "<td style=\"text-align:center\">" + tblHeadFields[i] + "</td>\n";
         }
         html += "<td style=\"width:50px;text-align:center\">合计</td>\n"
        + "</tr>\n"
        + "<tr>\n"
        + "<td style=\"text-align:center\">合计</td>\n"
        ;
     */


    html3 = "</tr>";
    try {
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
      while (rs.next()) {
        html3 += "<tr>";
        html3 += "<td style=\"text-align:left\">" + rs.getString(1) + "</td>";
        for (int i = 0; i <= taxCount; i++) {
          double dbl = rs.getDouble(i + 3);
          int i_temp = kit.doubleToInt(rs.getDouble(i + 3));
          String s_temp = new Integer(i_temp).toString();
          int i_len = s_temp.length();
          if (i_len <= 2) {
            s_temp = ("00" + s_temp);
            s_temp = s_temp.substring(s_temp.length() - 2);
            s_temp = "0." + s_temp;
          }
          else {
            s_temp = s_temp.substring(0, i_len - 2) + "." +
                s_temp.substring(i_len - 2);
          }
          html3 += "<td style=\"text-align:right\">" + s_temp + "</td>";
          sum[i] += i_temp;
        }
        html3 += "</tr>";
      }
      html3 += "</table>\n"
          + "</td>\n"
          + "</tr>\n"
          + "</table>\n"
          ;
      for (int i = 0; i <= taxCount; i++) {
        String s_temp = new Integer(sum[i]).toString();
        int i_len = s_temp.length();
        if (i_len <= 2) {
          s_temp = ("00" + s_temp);
          s_temp = s_temp.substring(s_temp.length() - 2);
          s_temp = "0." + s_temp;
        }
        else {
          s_temp = s_temp.substring(0, i_len - 2) + "." +
              s_temp.substring(i_len - 2);
        }

        html2 += "<td style=\"text-align:right\">" + s_temp + "</td>";
      }
      html = html + html2 + html3;
      conn.close();
    }
    catch (SQLException ex) {
//      System.out.println(ex.getMessage()+":"+ex.getErrorCode()+":"+ex.toString());
      html = ex.getMessage();
    }
    catch (Exception ex){
//      System.out.println(ex.getMessage()+ex.toString());
      html = ex.getMessage();
    }
    finally {
      conn = null;
      if (dc != null) {
        dc.close();
      }
      return html;
    }
  }

  public String back() {
    String html = "";
    return html;
  }
}
class kit {
  static int doubleToInt(double val) {
    BigDecimal bd = new BigDecimal(Double.toString(val));
    BigDecimal bd100 = new BigDecimal(Double.toString(100d));
    return bd.multiply(bd100).intValue();
  }
}

