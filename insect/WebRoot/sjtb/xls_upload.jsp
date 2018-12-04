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
<%
	String jfid = request.getParameter("deltid");
	String zbid = request.getParameter("zbid"); // dbbzb.jfid
	String rwid = request.getParameter("rwid");
	String lb = request.getParameter("lb");
	String hd = request.getParameter("hd"); 
	String path = request.getParameter("lujing");
	String rwsj = request.getParameter("rwsj");
	rwsj=rwsj.substring(0,rwsj.length()-2);
	String bbzt = request.getParameter("bbzt");
	bbzt="bc";
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
    //判断是否插入表头
    if(jfid==null||jfid.equals("")){
    try {
        //获取sequens
    	ExecuteConnection ecquen = new ExecuteConnection();
		Statement stmquent = ecquen.con.createStatement();
		ResultSet rsquen = stmquent.executeQuery("SELECT sequ_d"+zbid+"_head.NEXTVAL FROM DUAL");
		if (rsquen.next()) {
			jfid = rsquen.getString(1);
		}
		rsquen.close();
		stmquent.close();
		ecquen.con.close();
	    //插入head
		Calendar c = Calendar.getInstance();
		String jfno = c.get(Calendar.YEAR) + "" + (c.get(Calendar.MONTH)+1) + zbid;
		String[] sjs=hd.split("@");
		String sql="INSERT INTO D"+zbid+"_HEAD (JFID,JFNO,BMBM,JBR,LRRQ,LRRY,ZT,RWSJ) VALUES ("+jfid+",'"+jfno+"','"+sjs[0].substring(sjs[0].indexOf(",")+1,sjs[0].length())+"','"+sjs[2].substring(sjs[2].indexOf(",")+1,sjs[2].length())+"',to_date('"+sjs[4].substring(sjs[4].indexOf(",")+1,sjs[4].length())+"','yyyy-mm-dd HH24:MI:SS'),'"+sjs[3].substring(sjs[3].indexOf(",")+1,sjs[3].length())+"',0,to_date('"+rwsj+"','yyyy-mm-dd HH24:MI:SS'))";
		ExecuteConnection ec = new ExecuteConnection();
		Statement stmt = ec.con.createStatement();
		if(stmt.executeUpdate(sql)>0)
		{
        ec.con.commit();
        String table_name1="D"+zbid+"_HEAD";
        String sql_rw = "UPDATE DBBZB_RW SET JFID=JFID WHERE 1=2"; // 回改任务表的sql
			String sql_hd = "UPDATE " + table_name1 + " SET JFID=JFID WHERE 1=2"; // 提交后要修改主表的填报时间
			if ("chb".equals(lb)) {
				if ("bc".equals(bbzt)) {
					sql_rw = "UPDATE DBBZB_RW SET THBZ='1',DYID='" + jfid + "' WHERE JFID='" + rwid + "'";
				} else {
					sql_rw = "UPDATE DBBZB_RW SET THBZ='0',DYID='" + jfid + "' WHERE JFID='" + rwid + "'";
				}
			} else if ("lb".equals(lb)) {
				if ("bc".equals(bbzt)) {
					sql_rw = "UPDATE DBBZB_RW SET LBJHBZ='1',DYID='" + jfid + "' WHERE JFID='" + rwid + "'";
				} else {
					sql_hd = "UPDATE " + table_name1 + " A SET (A.KSTBRQ,A.JZTBRQ)=(SELECT TO_DATE(TO_CHAR(B.TBRQ-B.KSTBTS,'YYYY-MM-DD'),'YYYY-MM-DD'),TO_DATE(TO_CHAR(B.TBRQ+B.JZTBTS,'YYYY-MM-DD'),'YYYY-MM-DD') FROM DBBZB_RW B WHERE B.JFID='" + rwid + "') WHERE A.JFID='" + jfid + "'";
					sql_rw = "UPDATE DBBZB_RW SET LBJHBZ='0',DYID='" + jfid + "' WHERE JFID='" + rwid + "'";
				}
			} else if ("cb".equals(lb)) {
				if ("bc".equals(bbzt)) {
					sql_rw = "UPDATE DBBZB_RW SET DYID='" + jfid + "',BBZT='1' WHERE JFID='" + rwid + "'";
				} else {
					sql_hd = "UPDATE " + table_name1 + " A SET (A.KSTBRQ,A.JZTBRQ)=(SELECT TO_DATE(TO_CHAR(B.TBRQ-B.KSTBTS,'YYYY-MM-DD'),'YYYY-MM-DD'),TO_DATE(TO_CHAR(B.TBRQ+B.JZTBTS,'YYYY-MM-DD'),'YYYY-MM-DD') FROM DBBZB_RW B WHERE B.JFID='" + rwid + "') WHERE A.JFID='" + jfid + "'";
					sql_rw = "UPDATE DBBZB_RW SET DYID='" + jfid + "',SJTBRQ=SYSDATE,BBZT='3' WHERE JFID='" + rwid + "'";
				}
			} else if ("zc".equals(lb)) {
				if ("bc".equals(bbzt)) {
					sql_rw = "UPDATE DBBZB_RW SET DYID='" + jfid + "',BBZT='1' WHERE JFID='" + rwid + "'";
				} else if ("tj".equals(bbzt)) {
					sql_hd = "UPDATE " + table_name1 + " A SET (A.KSTBRQ,A.JZTBRQ)=(SELECT TO_DATE(TO_CHAR(B.TBRQ-B.KSTBTS,'YYYY-MM-DD'),'YYYY-MM-DD'),TO_DATE(TO_CHAR(B.TBRQ+B.JZTBTS,'YYYY-MM-DD'),'YYYY-MM-DD') FROM DBBZB_RW B WHERE B.JFID='" + rwid + "') WHERE A.JFID='" + jfid + "'";
					sql_rw = "UPDATE DBBZB_RW SET DYID='" + jfid + "',SJTBRQ=SYSDATE,BBZT='2' WHERE JFID='" + rwid + "'";
				}
			}
		 //更新表状态
		ExecuteConnection ecup = new ExecuteConnection();
		Statement stmtup = ecup.con.createStatement();
		if(stmtup.executeUpdate(sql_hd)>0)
		{
        ecup.con.commit();
		}
        ExecuteConnection ecrw = new ExecuteConnection();
		Statement stmtrw = ecrw.con.createStatement();
		if(stmtrw.executeUpdate(sql_rw)>0)
		{
        ecrw.con.commit();
		}
		
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
	
    }

	ExcelOperate exop = new ExcelOperate("D:\\D"+zbid+".xls",zbid,jfid);
	String msg=exop.exupload();
	if (msg.contains("SUCCESS")) {
		String[] msgs = msg.split("@");
		out.print("<script>alert(\"上载成功！\");window.location='/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "&rwid=" + rwid + "&lb=" + lb + "&jfid=" + jfid+"'</script>");
	} else {
		String[] msgs = msg.split("@");
		out.print("<script>alert(\"上载失败！\");window.location='/insect/scblei.do?ACT_TYPE=Q"+zbid+"&zbid=" + zbid + "&rwid=" + rwid + "&lb=" + lb + "&jfid=" + jfid+"'</script>");
	}
%>
