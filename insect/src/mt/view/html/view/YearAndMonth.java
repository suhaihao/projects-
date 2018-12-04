package mt.view.html.view;

import java.util.Date;
import mt.view.BaseTag;
import java.text.SimpleDateFormat;
import java.sql.*;
import mt.model.*;

public class YearAndMonth extends BaseTag{
  private String borderColor = "#799ae1";
  public void setBorderColor(String borderColor){
    this.borderColor = borderColor;
  }
  private String yearName;
  private String monthName;
  public void setYearName(String yearName){
    this.yearName = yearName;
  }
  public void setMonthName(String monthName){
    this.monthName = monthName;
  }
  public String front(){
  Date d = new Date(System.currentTimeMillis());
    SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
    String s_date = sf.format(d);
    String year = s_date.substring(0,4);
    String month = s_date.substring(4,6);
    String date = s_date.substring(6);
    int i_year = Integer.parseInt(year);
    int i_month = Integer.parseInt(month);
    int i_date = Integer.parseInt(date);
    if(i_date < 26){
      i_month --;
      if(i_month == 0){
        i_month = 12;
        i_year --;
      }
    }
    String html = "<span style=\"width:50px;border:1px solid " + borderColor + "\">\n";
    html += "<select name=\"" + yearName + "\" style='width:52px;margin:-2px'>\n";
    for(int i = 2005;i <=2015;i ++){
      html += "<option";
      if(i_year == i){
        html += " selected ";
      }
      html += ">" + i + "</option>\n";
    }
    html += "</select>\n"
        + "</span>\n"
        + "&nbsp;Äê\n&nbsp;&nbsp;&nbsp;";
    html += "<span style=\"width:50px;border:1px solid " + borderColor + "\">\n"
        + "<select name=\"" + monthName + "\" style='width:52px;margin:-2px'>\n";
    for(int i = 1;i <=12;i ++){
      html += "<option";
      if(i_month == i){
        html += " selected ";
      }
      html += ">" + i + "</option>\n";
    }
    html += "</select>\n"
        + "</span>\n"
        + "&nbsp;ÔÂ\n";
    return html;
  }
  public static void main(String[] args){
    SimpleDateFormat sf = new SimpleDateFormat("yyyyMM");
    String s_date = sf.format(new Date(System.currentTimeMillis()));
    String year = s_date.substring(0,4);
    String month = s_date.substring(4);
//    System.out.println(year+":"+month);
  }

  public String back() {
    String html = "";
    return html;
  }

}
