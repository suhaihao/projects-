package mt.view.html.view;
import mt.view.*;
import java.io.*;
public class VLog extends BaseTag {
  public String filename;
  public String getFilename(){
        return this.filename;
  }
  public void setFilename(String filename){
        this.filename=filename;
  }

  public int doStartTag() {
    FileReader fr=null;
    BufferedReader br=null;
    try {
     String filename=getFilename();
     fr=new FileReader(filename);//建立FileReader对象，并实例化为fr
     br=new BufferedReader(fr);//建立BufferedReader对象，并实例化为br
     String Line=br.readLine();//从文件读取一行字符串
     while(Line!=null){
        this.pageContext.getOut().println(Line+"<br>");
        Line=br.readLine();
      }
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      try {
        br.close(); //关闭BufferedReader对象
        fr.close(); //关闭文件
      }  catch(Exception e){
      e.printStackTrace();
    }

    }
     return SKIP_BODY;
   }
}
