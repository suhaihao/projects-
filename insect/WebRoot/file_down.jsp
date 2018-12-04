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
	filepath=getServletContext().getRealPath("")+filepath;//文件的绝对路径
	FileInputStream file=null;
	OutputStream output=null;
    try{
      file=new FileInputStream(new File(filepath));
	  //设置响应头和下载保存的文件名
	  response.reset();
	  response.setContentType("application/octet-stream");//windows
	  response.setHeader("Content-disposition","attachment;filename="+mc);
	  output = response.getOutputStream();//新建文件输入输出流对象
      byte[] b = new byte[8192];//设置每次写入缓存大小
 	  out.print(new File(filepath).length());
  	  //把输出流写入客户端
  	  int i = 0;
  	  while((i=file.read(b,0,8192))!=-1){
        output.write(b,0,i);
  	  }
	  output.flush();
	  out.clear();
	  out=pageContext.pushBody();	  
    }catch(Exception e){
      //e.printStackTrace();
	  request.setAttribute("Message","文件不存在！");
	}finally{
	  if(file!=null){ file.close(); file=null; }
      if(output!=null){	output.close(); output=null; }
	}
  }catch (Exception e) {
    request.setAttribute("Message","文件下载失败！");
  }
%>
<html>
<head>
<title>文档下载保存中转页面</title>
</head>
</html>
<mt:messagedialog/>
<script type="text/javascript">
window.close();
</script>