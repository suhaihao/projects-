package mt.tools;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Formater {
 private String formatValue ;
 private DecimalFormat df;
 private SimpleDateFormat sf;


  public Formater(String numberValue) {
    this.formatValue =numberValue;
  }

  public String getNumValue(){
    String numValue="";
    df=new DecimalFormat("###,###,###,###");
    numValue=df.format(Long.parseLong(formatValue));
    return numValue;
 }

 public String getDecValue(){
    String numValue="";
    DecimalFormat df=new DecimalFormat("###,###,###,###,###.00");

    numValue=df.format(Double.valueOf(formatValue));
    return numValue;
 }

 public String getDateValue(){
    String numValue="";
    sf=new SimpleDateFormat("yyyy-mm-dd");
    Date date = new Date(Long.parseLong(formatValue));
    numValue=sf.format(date);
    return numValue;
 }

 public String getCusDateValue(String datePattern ){
   String numValue="";
    sf=new SimpleDateFormat(datePattern);
    Date date = new Date(Long.parseLong(formatValue));
    numValue=sf.format(date);
    return numValue;
 }

 public String getCusNumValue(String numPattern ){
   String numValue="";
    DecimalFormat df=new DecimalFormat(numPattern);
    numValue=df.format(Double.valueOf(formatValue));
    return numValue;
 }

}
