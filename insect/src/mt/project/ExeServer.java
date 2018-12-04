package mt.project;
import java.net.URLConnection;
import javax.swing.text.Document;
import java.net.URLConnection;
import java.net.URL;
import java.io.*;



public class ExeServer {
  public ExeServer() {
  }

  public static void main(String[] args) {
    try{
     URL url = new URL("http://localhost:8001/struts/startclientcall");
     URLConnection urlconn = url.openConnection();
     BufferedReader stdIn = null;
     String strHtml="";
    try {
         InputStream inStream = url.openStream();
         stdIn = new BufferedReader(new InputStreamReader(url.openStream()));

         while((strHtml = stdIn.readLine())!=null) {
//                  System.out.println(strHtml);
         }
         inStream.close();
        } catch (Exception e) {
//            System.out.print("Can't get the string:"+e.toString());
         }
      } catch (Exception e){
//         System.out.print("Problem accessing the response text."+e.toString());
      }

  }

}
