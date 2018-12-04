package mt.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
/**
 * <p>Title: ���ڴ����ļ�����</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class FileUpload
{
  private static final String FILEHEAD="Content-Disposition: form-data; name=\"";//�ļ������ֶ�����ʼ��־

  private static final String FIELDEND="\r\n-----------------------------";//�ֶ�����ŵ����ݽ�����־

  private static final String FILENAME="filename=\"";//�ϴ��ļ����ļ�����ʼ��־

  private static final String ENCODE="ISO8859_1";//ISO8859_1Ӣ�ı��뷽ʽ

  public String singlefilename=""; //�ļ���(������·��)
  private static final  int BUFFERUNIT=1024;//��������С(1024byte)
  HttpServletRequest request;
  public FileUpload(HttpServletRequest httpServletRequest)
  {
    request=httpServletRequest;
  }

  /**���ڽ�ҳ������д��user.dir\\upload\\temp�ļ���*/
  public void savefile()
  {
    int byteread=0;
    int arraylength=BUFFERUNIT * 100;        //buffer����100K
    byte[] buffer =new byte[arraylength];
    FileOutputStream fos=null;

    try
    {
      String path=System.getProperty("user.dir")+"\\upload";  //ȡ�ô���ϴ��ļ����ļ��е�·��
      CreateDirectory(path);
      fos= new FileOutputStream(path+"\\temp");

      //��ҳ�����ݴ�ŵ�user.dir\\upload\\temp (�ϴ��ļ�������Ҳ������ҳ���У�һ���ŵ����ļ���)
      while ( (byteread = request.getInputStream().read(buffer)) != -1)
      {
        fos.write(buffer,0,byteread);
      }

      request.getInputStream().close();
      fos.close();
    }
    catch(IOException e)
    {
      e.printStackTrace();
    }
  }

  //��·�������ļ����� ���·�������ڽ�����·��
  private void CreateDirectory(String dirName)
  {
    File f1=new File(dirName);
    if (!f1.isDirectory())
    {
      f1.mkdirs() ;
    }
  }

  /**�õ�fildnameָ�����ֶε�ֵ*/
  public String getFieldName(String fieldname)
  {
    int arraylength=BUFFERUNIT;  //��������С1K(1024byte)
    byte[] buffer =new byte[arraylength];
    String fieldvalue="";
    try
    {
      String curString="";    //��ű��ζ��������
      String beforeString=""; //����ϴζ��������
      String bothString="";   //����ϴζ�������(curString) + ���ζ�������(beforeString)
      int state=0;            //��¼Ѱ��pos3ʧ�ܵĴ���
      int pos=-1;             //��¼�������filename��ָ�ֶζ�Ӧ���ݵĿ�ʼ
      int pos2=-1;            //��¼���"\r\n\r\n"��λ�ã�"\r\n\r\n"����������Ǹ��ֶε�����
      int pos3=-1;            //��¼�ֶ����ݽ�����λ��
      String bString="";      //�ֶ�����ʼ��־+�ֶ���

      InputStream inStream=new FileInputStream(System.getProperty("user.dir")+"\\upload\\temp");
      bString=FILEHEAD + fieldname;

      //ѭ����ȡuser.dir\\upload\\temp�е����ݲ���filename�ֶε�����
      zhj:   while( ( inStream.read(buffer) )!=-1 )
      {
        curString = new String(buffer,ENCODE); //��buffer�б��ζ��벿��ת���ַ���
        bothString =beforeString +  curString; //ÿ��ֻ���ϴ����ݺͱ�������(2K)

        if (pos==-1)
        {//�����û���ҵ�"�ֶ�����ʼ��־+�ֶ���"��λ�� ������bothString�в�����λ��
          pos = bothString.indexOf(bString);
        }

        if (pos!=-1 && pos2==-1)
        {
          //����ҵ���"�ֶ�����ʼ��־+�ֶ���"��λ�ò���û���ҵ�"\r\n\r\n"��λ�� ����������λ��
          pos2=bothString.indexOf("\r\n\r\n",  pos );

          if (pos2==-1)
          {
            //���û���ҵ�"\r\n\r\n"��λ�ö�"�ֶ�����ʼ��־+�ֶ���"��λ��>1K
            //���´�bothString���ݱ仯ʱ"�ֶ�����ʼ��־+�ֶ���"��λ��ҲҪ�仯
            pos=  ( pos >= BUFFERUNIT ? pos - BUFFERUNIT : pos );
          }
        }

        if (pos2!=-1 && pos3==-1)
        {
          //����ҵ���"\r\n\r\n"��λ�ã�����û���ҵ��ֶ����ݽ�����־��������
          switch (state)
          {
            case 0:
              //�����ֶ����ݽ�����־ʧ�ܴ���Ϊ0��˵���ǵ�һ�β���
              //���β��������ҵ���"\r\n\r\n"��λ�ú�����Ž��еģ���һ��ѭ�����棬��pos2��ָλ�ò��ص���
              //��(pos2 + 4)��ʼ����ԭ����pos2��"\r\n\r\n"��λ�ã�(pos2+4)�������ݿ�ʼλ��
              pos3 = bothString.indexOf(FIELDEND,pos2 + 4);
              break;
            case 1:
              //�����ֶ����ݽ�����־ʧ�ܴ���Ϊ1��˵���ǵڶ��β���
              //bothString���ݷ����仯����Ҫ����pos2��ָλ��
              pos2=  (pos2 >= BUFFERUNIT?pos2 - BUFFERUNIT :pos2);
              pos3 = bothString.indexOf(FIELDEND,pos2 + 4);
              break;
            default:
              //�����ֶ����ݽ�����־ʧ�ܴ��������μ��������ϣ�Ҫ��bothString��ʼ����
              //ʧ�����μ���������˵���ֶ����ݴ���2K����ǰ�����ݴ���fieldvalue����
              pos3 = bothString.indexOf(FIELDEND,0);
              break;
          }


          if (pos3==-1)
          {
            //û���ҵ��ֶ����ݽ�����־����bothString�仯ʱ�������������������ֶ����ݴ�����
            switch (state)
            {
              case 0:
                //�����ֶ����ݽ�����־ʧ�ܴ���Ϊ0��˵���ǵ�һ�β��ң�bothString�仯ʱ�������ֶ����ݱ�����
                break;
              case 1:
                //bothString�仯ʱ�������������������ֶ�������<pos+4>�󣬵�<BUFFERUNIT>������
                fieldvalue+=bothString.substring(pos2+4,BUFFERUNIT);
                break;
              default:
                //bothString�仯ʱ�������������������ֶ������Ǵӿ�ʼ��BUFFERUNIT(1024byte)������
                fieldvalue+=bothString.substring(0,BUFFERUNIT);
                break;
            }
          }
          else
          {
            //����ҵ����ֶ����ݽ�����־�����ֶ����ݼ���
            switch (state)
            {
              case 0:
              case 1:
                //�����ֶ����ݽ�����־ʧ�ܴ���Ϊ0��1 �ֶ�����ΪbothString�д�(pos2+4)��pos3������
                fieldvalue+=bothString.substring(pos2+4,pos3);
                break;
              default:
                //�����ֶ����ݽ�����־ʧ�ܴ���Ϊ2������
                //�ֶ�����Ϊ��ǰ����ı�bothString������������(Ҳ�Ǵ����fieldvalue��) + bothString�ӿ�ʼ��pos3����
                fieldvalue+=bothString.substring(0,pos3);
            }
            break zhj; //�õ����ֶ����ݣ�����ѭ��zhj
          }
          state=state +1;//�ۼӲ����ֶ����ݽ�����־ʧ�ܴ���
        }
        beforeString=curString;
      }

      //��fieldvalue�ı��뷽ʽתΪ��gb2312
      //��Ϊ��ʼ�ı��뷽ʽΪ8859_1(Ӣ�ı��뷽ʽ)����������ı���ת������������
      fieldvalue=new String(fieldvalue.getBytes(ENCODE),"gb2312");
    }
    catch(IOException e)
    {
      e.printStackTrace();
    }

    return fieldvalue; //�����ֶ�����

  }//getFiledName over

  /**
   * ����filename�õ��ϴ��ļ����ļ�����
   * ���ҽ����ļ����ݴ�user.dir\\upload\\temp�ļ��ж�����
   * д��user.dir\\upload\\����Ӧ���ļ��У���Ϊ�����ݿ��ϴ����ļ���<br>
   * ע��filename�ֶε�����Ϊ�ϴ��ļ����ļ����Լ��ϴ��ļ������� ��ʽΪ "�ļ���"\r\n\r\n�ļ�����
   * filename�ֶε�����ǰ����(FILEHEAD+filename+"\"; filename=")��
   */
  public String getFileName(String filename)
  {
    int arraylength=BUFFERUNIT;          //��������С(1K)
    byte[] buffer =new byte[arraylength];//������
    String upfilename="";                //�ϴ��ļ����ļ���
    String xgupfilename="";              //�޸ĺ���ϴ��ļ����ļ���
    try
    {
      String curString="";               //���ζ�������
      String beforeString="";            //�ϴζ�������
      String bothString="";              //���ζ�������֮��bothString=curString+beforeString

      int state=0;           //��¼Ѱ��pos3ʧ�ܵĴ���
      int pos=-1;            //bString��λ��
      int pos1=-1;           //�ļ�������λ��
      int pos2=-1;           //bString��"\r\n\r\n"λ�� pos2+4Ϊ�ļ����ݿ�ʼλ��
      int pos3=-1;           //�ļ����ݽ���λ��
      String bString="";     //�ļ���ʼ��־+filename+�ļ�����ʼ��־
      FileOutputStream fos=null;

      InputStream inStream=new FileInputStream(System.getProperty("user.dir")+"\\upload\\temp");
      bString=FILEHEAD+filename+"\"; filename=";

      //ѭ����ȡuser.dir\\upload\\temp�е����ݲ���filename��Ӧ�����ݣ�
      //ȡ���ϴ��ļ����ļ����������ļ����ݶ���д����Ӧ���ļ�
      while (inStream.read(buffer)!=-1)
      {
        curString = new String(buffer,ENCODE);   //ȡ�ñ��ζ��������
        bothString =beforeString +  curString;   //�ϲ��ϴζ��������뱾�ζ�������

        if (pos==-1)
        {
          //���û���ҵ�bStringλ��,��������
          pos = bothString.indexOf(bString);
        }

        if (pos !=-1 && pos1==-1)
        {
          //����ҵ���bStringλ�ã���û�ҵ��ļ���������־����������
          //bothString��< pos +  bString.length() + 1 >��ʼ����һ��<">��֮�������Ϊ�ϴ��ļ����ļ���
          pos1=bothString.indexOf("\"",  pos +  bString.length() + 1 );
          if (pos1==-1)
          {
            //û���ҵ��ļ�������������posλ�ã�����ӦbothString�ı仯
            pos=  (pos >= BUFFERUNIT?pos - BUFFERUNIT :pos);
          }
        }

        if (pos1!=-1 && pos2==-1   )
        {
          //�ҵ����ļ�������λ�õ���û�ҵ��ļ����ݿ�ʼ��־
          if (upfilename.equals(""))
          {
              //���ļ������������ҵ�pos1���Ǵ�ѭ��
              upfilename = bothString.substring(pos + bString.length() + 1, pos1);//ȡ���ϴ��ļ��Ŀͻ���·��
              upfilename = upfilename.substring(upfilename.lastIndexOf("\\") + 1);//ȡ���ļ���

              if (upfilename == null || upfilename.trim().equals("")) {
                return "";
              }
              singlefilename = upfilename;

              upfilename = System.getProperty("user.dir") + "\\upload\\" + upfilename;//ȡ���ļ��ķ�������·��
              upfilename = new String(upfilename.getBytes(ENCODE), "gb2312");//��·��תΪ���ı��뷽ʽ
              singlefilename = new String(singlefilename.getBytes(ENCODE),"gb2312");//���ļ���תΪ���ı��뷽ʽ
              fos = new FileOutputStream(upfilename);
            }

            pos2=bothString.indexOf("\r\n\r\n",pos1);//�ļ����ݿ�ʼ
            if (pos2==-1)
            {
              //û���ҵ��ļ����ݿ�ʼ������pos1����ӦbothString�ı仯
              pos1 = (pos1 >= BUFFERUNIT ? pos1 - BUFFERUNIT : pos1);
            }
          }

          if (pos2!=-1 && pos3==-1)
          {
            //�ҵ����ļ���ʼ��û�ҵ��ļ����ݽ���
            switch (state)
            {
              case 0:
                //�����ļ����ݽ�����־ʧ�ܴ���Ϊ0��˵���ǵ�һ�β���
                //���β��������ҵ����ļ���ʼ��λ�ú�����Ž��еģ���һ��ѭ�����棬��pos2��ָλ�ò��ص���
                //��(pos2 + 4)��ʼ����ԭ����pos2��"\r\n\r\n"��λ�ã�(pos2+4)�������ݿ�ʼλ��
                pos3 = bothString.indexOf(FIELDEND,pos2 + 4);    //
                break;
              case 1:
                //�����ļ����ݽ�����־ʧ�ܴ���Ϊ1��˵���ǵڶ��β���
                //bothString���ݿ��ܷ����仯����Ҫ����pos2��ָλ��
                pos2 = ( pos2 >= BUFFERUNIT ? pos2 - BUFFERUNIT : pos2 );
                pos3 = bothString.indexOf( FIELDEND, pos2 + 4 );
                break;
              default:
                //�����ļ����ݽ�����־ʧ�ܴ��������μ��������ϣ�Ҫ��bothString��ʼ����
                //ʧ�����μ���������˵���ļ����ݴ���2K����ǰ�����ݴ�����Ӧ���ļ�����
                pos3 = bothString.indexOf(FIELDEND,0);
                break;
            }

            if (pos3==-1)
            {
              //û���ҵ��ļ�������־
              //���Ҳ��ҵ�ͬʱ��bothString���������ݴ����ļ���
              switch (state)
              {
                case 0:
                  //�����ļ����ݽ�����־ʧ�ܴ���Ϊ0��
                  //˵���ǵ�һ�β��ң�bothString�仯ʱ�������ļ����ݱ�����
                  break;
                case 1:
                  //bothString�仯ʱ�������������������ļ����ݵ���<pos+4>�󣬵�<BUFFERUNIT>������
                  fos.write(bothString.substring(pos2+4,BUFFERUNIT).getBytes(ENCODE));
                  break;
                default:
                  //bothString�仯ʱ�������������������ļ����ݵ��Ǵӿ�ʼ��BUFFERUNIT(1024byte)������
                  fos.write(bothString.substring(0,BUFFERUNIT).getBytes(ENCODE));
                  break;
              }
            }
            else
            {
              switch (state)
              {
                case 0:
                case 1:
                  //�����ļ����ݽ�����־ʧ�ܴ���Ϊ0��1
                  //�ֶ�����ΪbothString�д�(pos2+4)��pos3������
                  fos.write(bothString.substring(pos2+4,pos3).getBytes(ENCODE));
                  break;
                default:
                  //�����ļ����ݽ�����־ʧ�ܴ���Ϊ���μ��������Ϻ���ҳɹ�
                  //��ʣ����ļ�����Ҳд����Ӧ���ļ���
                  fos.write(bothString.substring(0,pos3).getBytes(ENCODE));
              }

              fos.flush();
              fos.close();
              break ;
            }
            state=state +1;//�ۼӲ����ļ����ݽ�����־����
          }
          beforeString=curString;
        }
        inStream.close();
      }
      catch(IOException e)
      {
        new mt.tools.customException(e,this.toString());
      }

      return upfilename;//�����ļ��ڷ������˵�·��

    }//getFileName over

  }//class over
