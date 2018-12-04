package mt.view.html.view;

import java.sql.*;
import java.text.*;
import java.util.Date;

import mt.database.*;
import mt.database.extend.*;
import mt.view.*;

public class DateInput
    extends BaseTag {
  private String borderColor = "#799ae1";
  public void setBorderColor(String borderColor) {
    this.borderColor = borderColor;
  }

  private String model = "0";
  private String startOrEnd;
  private String yearName;
  private String monthName;
  public void setYearName(String yearName) {
    this.yearName = yearName;
  }

  public void setMonthName(String monthName) {
    this.monthName = monthName;
  }

  public void setModel(String model) {
    this.model = model;
  }

  public void setStartOrEnd(String startOrEnd) {
    this.startOrEnd = startOrEnd;
  }

  public String front() {
    String html = "";
    if (yearName != null && !yearName.trim().equals("")) {
      Date d = new Date(System.currentTimeMillis());
      SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
      String s_date = sf.format(d);
      String year = s_date.substring(0, 4);
      String month = s_date.substring(4, 6);
      String date = s_date.substring(6);
      int i_year = Integer.parseInt(year);
      int i_month = Integer.parseInt(month);
      int i_date = Integer.parseInt(date);
      if (i_date < 26) {
        i_month--;
        if (i_month == 0) {
          i_month = 12;
          i_year--;
        }
      }
      html = "<span style=\"width:50px;border:1px solid " + borderColor +
          "\">\n";
      html += "<select name=\"" + yearName +
          "\" style='width:52px;margin:-2px'  " + other + ">\n";
      for (int i = 2005; i <= 2015; i++) {
        html += "<option";
        if (i_year == i) {
          html += " selected ";
        }
        html += ">" + i + "</option>\n";
      }
      html += "</select>\n"
          + "</span>\n"
          + "&nbsp;Äê\n";
      if (monthName == null || monthName.trim().equals("")) {
        return html;
      }
      html += "&nbsp;&nbsp;&nbsp;<span style=\"width:50px;border:1px solid " +
          borderColor +
          "\">\n"
          + "<select name=\"" + monthName +
          "\" style='width:52px;margin:-2px'  " + other + ">\n";
      for (int i = 1; i <= 12; i++) {
        html += "<option";
        if (i_month == i) {
          html += " selected ";
        }
        html += ">" + i + "</option>\n";
      }
      html += "</select>\n"
          + "</span>\n"
          + "&nbsp;ÔÂ\n";
      return html;
    }
    if (startOrEnd == null || startOrEnd.trim().equalsIgnoreCase("")) {
      Date d = new Date(System.currentTimeMillis());
      SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
      String value = sf.format(d);
      html = "<input type='text' name='" + name + "' value='" + value + "' " + (other==null?"":other) + " size=10 maxlength=10 onKeyDown='dateFormat(this)' onBlur='checkDate(this)'>";
      return html;
    }
      String sql = "select to_char(sysdate,'dd')dd, to_char(sysdate,'yyyy-mm')||'-01' nowBegin,to_char(last_day(sysdate),'yyyy-mm-dd') nowEnd,to_char(add_months(sysdate,-1),'yyyy-mm')||'01' preBegin,to_char(last_day(add_months(sysdate,-1)),'yyyy-mm-dd') preEnd from dual";
      QueryConnection qc = new QueryConnection();
      Pjdo pjdo = new Pjdo(qc);
      pjdo.executeQuery(sql);
      try {
        pjdo.rs.first();
        String dd = pjdo.rs.getString("dd");
        String nowBegin = pjdo.rs.getString("nowBegin");
        String nowEnd = pjdo.rs.getString("nowEnd");
        String preBegin = pjdo.rs.getString("preBegin");
        String preEnd = pjdo.rs.getString("preEnd");
        qc.close();
        if (startOrEnd.equalsIgnoreCase("s")) {
          if (model.equals("1") && dd.compareTo("26") < 0) {
            html = "<input type='text' name='" + name + "' value='" + preBegin + "' " + (other==null?"":other) + " size=10 maxlength=10 onKeyDown='dateFormat(this)' onBlur='checkDate(this)'>";
            return html;
          }
          html = "<input type='text' name='" + name + "' value='" + nowBegin + "' " + (other==null?"":other) + " size=10 maxlength=10 onKeyDown='dateFormat(this)' onBlur='checkDate(this)'>";
          return html;
        }
        if (startOrEnd.equalsIgnoreCase("e")) {
          if (model.equals("1") && dd.compareTo("26") < 0) {
            html = "<input type='text' name='" + name + "' value='" + preEnd + "' " + (other==null?"":other) + " size=10 maxlength=10 onKeyDown='dateFormat(this)' onBlur='checkDate(this)'>";
            return html;
          }
          html = "<input type='text' name='" + name + "' value='" + nowEnd + "' " + (other==null?"":other) + " size=10 maxlength=10 onKeyDown='dateFormat(this)' onBlur='checkDate(this)'>";
          return html;
        }
      }
      catch (SQLException ex) {
//        System.out.println("sql#  " + sql + "\n" + ex.getMessage());
        qc.close();
      }
      finally{
        qc.close();
      }
    return html;
  }

  public static void main(String[] args) {
    DateInput di = new DateInput();
    di.setName("");
    di.setMonthName("month");
//    di.setYearName("year");
    di.setModel("1");
//    di.setStartOrEnd("e");
//    System.out.println(di.front());
  }

  public String back() {
    String html = "";
    return html;
  }

}
