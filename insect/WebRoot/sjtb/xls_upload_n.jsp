<%@page import="com.jspsmart.upload.File"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.jf.util.ExcelOperate"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="mt.database.extend.ExecuteConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.jf.bchyj.bean.User"%>
<%
User user = (User) request.getSession().getAttribute("user");
String BMBM = user.getBmbm();
String JFID = request.getParameter("jfid");
String KSTBRQ = request.getParameter("kstbrq");
String JZTBRQ = request.getParameter("jztbrq");
String RWSJ = request.getParameter("rwsj");
String DCRQ = request.getParameter("dcrq");
String lb = request.getParameter("lb");
String zbid = request.getParameter("zbid");
String rwid = request.getParameter("rwid");
String LRRY = user.getUsername();
Calendar c = Calendar.getInstance();
String JFNO = c.get(Calendar.YEAR) + "" + (c.get(Calendar.MONTH) + 1)+ zbid;
String BBLX = "1";

	//接收上传文件
	DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    upload.setHeaderEncoding("UTF-8"); 
    List<FileItem> list = upload.parseRequest(request);
     for(FileItem item : list){
    InputStream in = item.getInputStream();
    FileOutputStream outfile = new FileOutputStream("D:" + "\\" + "D"+zbid+".xls");
    byte buffer[] = new byte[1024];
    int len = 0;
    while((len=in.read(buffer))>0){
    outfile.write(buffer, 0, len);
    }
    }
    //如果JFID不为空删除原来的数据 
    if(JFID!=null&&!JFID.equals("null")&&!JFID.equals("")){
    String sqldel="delete from D"+zbid+" where JFID="+JFID;
    ExecuteConnection ec = new ExecuteConnection();
	Statement stmt = ec.con.createStatement();
	if (stmt.executeUpdate(sqldel) > 0) {
		ec.con.commit();
	}
	stmt.close();
	ec.close();
    }
    //判断是否重新录入
    if(JFID==null||JFID.equals("")|| JFID.equals("null")){
    try {
        //获取sequens
    	ExecuteConnection ecquen = new ExecuteConnection();
		Statement stmquent = ecquen.con.createStatement();
		ResultSet rsquen;
		if(zbid.substring(0, 1).equals("0"))
		{
		 rsquen = stmquent.executeQuery("SELECT sequ_d"+zbid+".NEXTVAL FROM DUAL");
		}else{
		 rsquen = stmquent.executeQuery("SELECT sequ_d"+zbid+"_head.NEXTVAL FROM DUAL");
		}
		if (rsquen.next()) {
			JFID = rsquen.getString(1);
		}
		rsquen.close();
		stmquent.close();
		ecquen.con.close();
	   
	} catch(Exception e) {
		e.printStackTrace();
	}
    }
    //读取表格获取数据
    ExcelOperate exop = new ExcelOperate("D:\\D"+zbid+".xls",zbid,JFID);
    exop.setJFNO(JFNO);
    exop.setKSTBRQ(KSTBRQ);
    exop.setJZTBRQ(JZTBRQ);
    exop.setRWSJ(RWSJ);
    exop.setBBLX(BBLX);
    exop.setLRRY(LRRY);
    exop.setBMBM(BMBM);
    if(DCRQ==null)
    {
    	DCRQ="";
    }
    exop.setDCRQ(DCRQ);
    exop.setRwid(rwid);
    exop.setBBLX(BBLX);
    String msg=exop.exupload_n();
	if (msg.contains("SUCCESS")) {
		String[] msgs = msg.split("@");                                
		out.print("<script>alert(\"上载成功！\");window.location='/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "&rwid=" + rwid + "&lb=" + lb+"&jfid="+JFID+"'</script>");
	} else {
		String[] msgs = msg.split("@");
		out.print("<script>alert(\"上载失败！\");window.location='/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "&rwid=" + rwid + "&lb=" + lb+"&jfid="+JFID+"'</script>");
	}
%>
