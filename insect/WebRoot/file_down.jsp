<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%@ page import="mt.database.extend.ExecuteConnection,java.sql.*"%>
<%@ taglib uri="/WEB-INF/mt.tld" prefix="mt" %>
<%
String filepath = request.getParameter("path");
String mc = request.getParameter("mc");
try{
	filepath=filepath.substring(7, filepath.length());
	mc=mc.substring(10, mc.length()-1);
	filepath=getServletContext().getRealPath("")+filepath;//�ļ��ľ���·��
	FileInputStream file=null;
	OutputStream output=null;
    try{
      file=new FileInputStream(new File(filepath));
	  //������Ӧͷ�����ر�����ļ���
	  response.reset();
	  response.setContentType("application/octet-stream");//windows
	  response.setHeader("Content-disposition","attachment;filename="+mc);
	  output = response.getOutputStream();//�½��ļ��������������
      byte[] b = new byte[8192];//����ÿ��д�뻺���С
 	  out.print(new File(filepath).length());
  	  //�������д��ͻ���
  	  int i = 0;
  	  while((i=file.read(b,0,8192))!=-1){
        output.write(b,0,i);
  	  }
	  output.flush();
	  out.clear();
	  out=pageContext.pushBody();	  
    }catch(Exception e){
      //e.printStackTrace();
	  request.setAttribute("Message","�ļ������ڣ�");
	}finally{
	  if(file!=null){ file.close(); file=null; }
      if(output!=null){	output.close(); output=null; }
	}
  }catch (Exception e) {
    request.setAttribute("Message","�ļ�����ʧ�ܣ�");
  }
%>
<html>
<head>
<title>�ĵ����ر�����תҳ��</title>
</head>
</html>
<mt:messagedialog/>
<script type="text/javascript">
window.close();
</script>