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
     fr=new FileReader(filename);//����FileReader���󣬲�ʵ����Ϊfr
     br=new BufferedReader(fr);//����BufferedReader���󣬲�ʵ����Ϊbr
     String Line=br.readLine();//���ļ���ȡһ���ַ���
     while(Line!=null){
        this.pageContext.getOut().println(Line+"<br>");
        Line=br.readLine();
      }
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      try {
        br.close(); //�ر�BufferedReader����
        fr.close(); //�ر��ļ�
      }  catch(Exception e){
      e.printStackTrace();
    }

    }
     return SKIP_BODY;
   }
}
