package mt.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
/**
 * <p>Title: 用于处理文件上载</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2005</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public class FileUpload
{
  private static final String FILEHEAD="Content-Disposition: form-data; name=\"";//文件名及字段名开始标志

  private static final String FIELDEND="\r\n-----------------------------";//字段所存放的内容结束标志

  private static final String FILENAME="filename=\"";//上传文件的文件名开始标志

  private static final String ENCODE="ISO8859_1";//ISO8859_1英文编码方式

  public String singlefilename=""; //文件名(不包含路径)
  private static final  int BUFFERUNIT=1024;//缓存区大小(1024byte)
  HttpServletRequest request;
  public FileUpload(HttpServletRequest httpServletRequest)
  {
    request=httpServletRequest;
  }

  /**用于将页面内容写到user.dir\\upload\\temp文件中*/
  public void savefile()
  {
    int byteread=0;
    int arraylength=BUFFERUNIT * 100;        //buffer容量100K
    byte[] buffer =new byte[arraylength];
    FileOutputStream fos=null;

    try
    {
      String path=System.getProperty("user.dir")+"\\upload";  //取得存放上传文件的文件夹的路径
      CreateDirectory(path);
      fos= new FileOutputStream(path+"\\temp");

      //将页面内容存放到user.dir\\upload\\temp (上传文件的内容也包含在页面中，一并放到该文件中)
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

  //用路径建立文件关联 如果路径不存在建立该路径
  private void CreateDirectory(String dirName)
  {
    File f1=new File(dirName);
    if (!f1.isDirectory())
    {
      f1.mkdirs() ;
    }
  }

  /**得到fildname指定的字段的值*/
  public String getFieldName(String fieldname)
  {
    int arraylength=BUFFERUNIT;  //缓存区大小1K(1024byte)
    byte[] buffer =new byte[arraylength];
    String fieldvalue="";
    try
    {
      String curString="";    //存放本次读入的内容
      String beforeString=""; //存放上次读入的内容
      String bothString="";   //存放上次读入内容(curString) + 本次读入内容(beforeString)
      int state=0;            //记录寻找pos3失败的次数
      int pos=-1;             //记录输入参数filename所指字段对应内容的开始
      int pos2=-1;            //记录其后"\r\n\r\n"的位置，"\r\n\r\n"后面紧跟的是该字段的内容
      int pos3=-1;            //记录字段内容结束的位置
      String bString="";      //字段名开始标志+字段名

      InputStream inStream=new FileInputStream(System.getProperty("user.dir")+"\\upload\\temp");
      bString=FILEHEAD + fieldname;

      //循环读取user.dir\\upload\\temp中的内容查找filename字段的内容
      zhj:   while( ( inStream.read(buffer) )!=-1 )
      {
        curString = new String(buffer,ENCODE); //将buffer中本次读入部分转成字符串
        bothString =beforeString +  curString; //每次只存上次内容和本次内容(2K)

        if (pos==-1)
        {//如果还没有找到"字段名开始标志+字段名"的位置 继续在bothString中查找其位置
          pos = bothString.indexOf(bString);
        }

        if (pos!=-1 && pos2==-1)
        {
          //如果找到了"字段名开始标志+字段名"的位置并且没有找到"\r\n\r\n"的位置 继续查找其位置
          pos2=bothString.indexOf("\r\n\r\n",  pos );

          if (pos2==-1)
          {
            //如果没有找到"\r\n\r\n"的位置而"字段名开始标志+字段名"的位置>1K
            //在下次bothString内容变化时"字段名开始标志+字段名"的位置也要变化
            pos=  ( pos >= BUFFERUNIT ? pos - BUFFERUNIT : pos );
          }
        }

        if (pos2!=-1 && pos3==-1)
        {
          //如果找到了"\r\n\r\n"的位置，但还没有找到字段内容结束标志，继续找
          switch (state)
          {
            case 0:
              //查找字段内容结束标志失败次数为0，说明是第一次查找
              //本次查找是在找到了"\r\n\r\n"的位置后紧跟着进行的，在一次循环里面，故pos2所指位置不必调整
              //从(pos2 + 4)开始找起，原因是pos2是"\r\n\r\n"的位置，(pos2+4)才是内容开始位置
              pos3 = bothString.indexOf(FIELDEND,pos2 + 4);
              break;
            case 1:
              //查找字段内容结束标志失败次数为1，说明是第二次查找
              //bothString内容发生变化，故要调整pos2所指位置
              pos2=  (pos2 >= BUFFERUNIT?pos2 - BUFFERUNIT :pos2);
              pos3 = bothString.indexOf(FIELDEND,pos2 + 4);
              break;
            default:
              //查找字段内容结束标志失败次数是两次及两次以上，要从bothString开始找起
              //失败两次及两次以上说明字段内容大于2K，以前的内容存在fieldvalue里面
              pos3 = bothString.indexOf(FIELDEND,0);
              break;
          }


          if (pos3==-1)
          {
            //没有找到字段内容结束标志，把bothString变化时即将被丢弃掉的属于字段内容存起来
            switch (state)
            {
              case 0:
                //查找字段内容结束标志失败次数为0，说明是第一次查找，bothString变化时不会有字段内容被丢弃
                break;
              case 1:
                //bothString变化时即将被丢弃掉的属于字段内容是<pos+4>后，到<BUFFERUNIT>的内容
                fieldvalue+=bothString.substring(pos2+4,BUFFERUNIT);
                break;
              default:
                //bothString变化时即将被丢弃掉的属于字段内容是从开始到BUFFERUNIT(1024byte)的内容
                fieldvalue+=bothString.substring(0,BUFFERUNIT);
                break;
            }
          }
          else
          {
            //如果找到了字段内容结束标志，将字段内容记下
            switch (state)
            {
              case 0:
              case 1:
                //查找字段内容结束标志失败次数为0，1 字段内容为bothString中从(pos2+4)到pos3的内容
                fieldvalue+=bothString.substring(pos2+4,pos3);
                break;
              default:
                //查找字段内容结束标志失败次数为2及以上
                //字段内容为以前保存的被bothString丢弃掉的内容(也是存放在fieldvalue中) + bothString从开始到pos3内容
                fieldvalue+=bothString.substring(0,pos3);
            }
            break zhj; //得到了字段内容，跳出循环zhj
          }
          state=state +1;//累加查找字段内容结束标志失败次数
        }
        beforeString=curString;
      }

      //把fieldvalue的编码方式转为用gb2312
      //以为开始的编码方式为8859_1(英文编码方式)，如果有中文必须转否则会出现乱码
      fieldvalue=new String(fieldvalue.getBytes(ENCODE),"gb2312");
    }
    catch(IOException e)
    {
      e.printStackTrace();
    }

    return fieldvalue; //返回字段内容

  }//getFiledName over

  /**
   * 根据filename得到上传文件的文件名，
   * 并且将该文件内容从user.dir\\upload\\temp文件中读出，
   * 写到user.dir\\upload\\下相应的文件中，做为往数据库上传的文件。<br>
   * 注：filename字段的内容为上传文件的文件名以及上传文件的内容 格式为 "文件名"\r\n\r\n文件内容
   * filename字段的内容前面是(FILEHEAD+filename+"\"; filename=")。
   */
  public String getFileName(String filename)
  {
    int arraylength=BUFFERUNIT;          //缓存区大小(1K)
    byte[] buffer =new byte[arraylength];//缓存区
    String upfilename="";                //上传文件的文件名
    String xgupfilename="";              //修改后的上传文件的文件名
    try
    {
      String curString="";               //本次读入内容
      String beforeString="";            //上次读入内容
      String bothString="";              //两次读入内容之和bothString=curString+beforeString

      int state=0;           //记录寻找pos3失败的次数
      int pos=-1;            //bString的位置
      int pos1=-1;           //文件名结束位置
      int pos2=-1;           //bString后"\r\n\r\n"位置 pos2+4为文件内容开始位置
      int pos3=-1;           //文件内容结束位置
      String bString="";     //文件开始标志+filename+文件名开始标志
      FileOutputStream fos=null;

      InputStream inStream=new FileInputStream(System.getProperty("user.dir")+"\\upload\\temp");
      bString=FILEHEAD+filename+"\"; filename=";

      //循环读取user.dir\\upload\\temp中的内容查找filename对应的内容，
      //取出上传文件的文件名，并将文件内容读出写入相应的文件
      while (inStream.read(buffer)!=-1)
      {
        curString = new String(buffer,ENCODE);   //取得本次读入的内容
        bothString =beforeString +  curString;   //合并上次读入内容与本次读入内容

        if (pos==-1)
        {
          //如果没有找到bString位置,继续查找
          pos = bothString.indexOf(bString);
        }

        if (pos !=-1 && pos1==-1)
        {
          //如果找到了bString位置，还没找到文件名结束标志，继续查找
          //bothString从< pos +  bString.length() + 1 >开始到下一个<">的之间的内容为上传文件的文件名
          pos1=bothString.indexOf("\"",  pos +  bString.length() + 1 );
          if (pos1==-1)
          {
            //没有找到文件名结束，调整pos位置，以适应bothString的变化
            pos=  (pos >= BUFFERUNIT?pos - BUFFERUNIT :pos);
          }
        }

        if (pos1!=-1 && pos2==-1   )
        {
          //找到了文件名结束位置但还没找到文件内容开始标志
          if (upfilename.equals(""))
          {
              //找文件名，发生在找到pos1的那次循环
              upfilename = bothString.substring(pos + bString.length() + 1, pos1);//取出上传文件的客户端路径
              upfilename = upfilename.substring(upfilename.lastIndexOf("\\") + 1);//取得文件名

              if (upfilename == null || upfilename.trim().equals("")) {
                return "";
              }
              singlefilename = upfilename;

              upfilename = System.getProperty("user.dir") + "\\upload\\" + upfilename;//取得文件的服务器端路径
              upfilename = new String(upfilename.getBytes(ENCODE), "gb2312");//将路径转为中文编码方式
              singlefilename = new String(singlefilename.getBytes(ENCODE),"gb2312");//将文件名转为中文编码方式
              fos = new FileOutputStream(upfilename);
            }

            pos2=bothString.indexOf("\r\n\r\n",pos1);//文件内容开始
            if (pos2==-1)
            {
              //没有找到文件内容开始，调整pos1，适应bothString的变化
              pos1 = (pos1 >= BUFFERUNIT ? pos1 - BUFFERUNIT : pos1);
            }
          }

          if (pos2!=-1 && pos3==-1)
          {
            //找到了文件开始，没找到文件内容结束
            switch (state)
            {
              case 0:
                //查找文件内容结束标志失败次数为0，说明是第一次查找
                //本次查找是在找到了文件开始的位置后紧跟着进行的，在一次循环里面，故pos2所指位置不必调整
                //从(pos2 + 4)开始找起，原因是pos2是"\r\n\r\n"的位置，(pos2+4)才是内容开始位置
                pos3 = bothString.indexOf(FIELDEND,pos2 + 4);    //
                break;
              case 1:
                //查找文件内容结束标志失败次数为1，说明是第二次查找
                //bothString内容可能发生变化，故要调整pos2所指位置
                pos2 = ( pos2 >= BUFFERUNIT ? pos2 - BUFFERUNIT : pos2 );
                pos3 = bothString.indexOf( FIELDEND, pos2 + 4 );
                break;
              default:
                //查找文件内容结束标志失败次数是两次及两次以上，要从bothString开始找起
                //失败两次及两次以上说明文件内容大于2K，以前的内容存在相应的文件里面
                pos3 = bothString.indexOf(FIELDEND,0);
                break;
            }

            if (pos3==-1)
            {
              //没有找到文件结束标志
              //在找查找的同时将bothString丢弃的内容存入文件中
              switch (state)
              {
                case 0:
                  //查找文件内容结束标志失败次数为0，
                  //说明是第一次查找，bothString变化时不会有文件内容被丢弃
                  break;
                case 1:
                  //bothString变化时即将被丢弃掉的属于文件内容的是<pos+4>后，到<BUFFERUNIT>的内容
                  fos.write(bothString.substring(pos2+4,BUFFERUNIT).getBytes(ENCODE));
                  break;
                default:
                  //bothString变化时即将被丢弃掉的属于文件内容的是从开始到BUFFERUNIT(1024byte)的内容
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
                  //查找文件内容结束标志失败次数为0，1
                  //字段内容为bothString中从(pos2+4)到pos3的内容
                  fos.write(bothString.substring(pos2+4,pos3).getBytes(ENCODE));
                  break;
                default:
                  //查找文件内容结束标志失败次数为两次及两次以上后查找成功
                  //将剩余的文件内容也写到对应的文件中
                  fos.write(bothString.substring(0,pos3).getBytes(ENCODE));
              }

              fos.flush();
              fos.close();
              break ;
            }
            state=state +1;//累加查找文件内容结束标志次数
          }
          beforeString=curString;
        }
        inStream.close();
      }
      catch(IOException e)
      {
        new mt.tools.customException(e,this.toString());
      }

      return upfilename;//返回文件在服务器端的路径

    }//getFileName over

  }//class over
