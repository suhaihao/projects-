package com.jf.bchyj.common.zjz_upload;

import java.io.File;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import mt.controller.InitAction;
import mt.controller.base.ServletObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.FileCleanerCleanup;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileCleaningTracker;

public class UploadAction extends InitAction
{
  protected void actionQuery(ServletObject so)
  {
    HttpServletRequest req = so.httpServletRequest;
    String id = req.getParameter("id");
    String tb = req.getParameter("tb");
    String wjlx = ""; String lx = ""; String msg = ""; String sql = ""; String refId = "";
    String ctxPath = getServlet().getServletContext().getRealPath("/");
    String lj = "";
    String jfid = "";

    if ((!"".equals(tb)) && (tb != null)) {
      refId = tb.toUpperCase().replace("_FJ", "_JFID");
    }
    FileItemFactory factory = newDiskFileItemFactory(getServlet().getServletContext(), 
      new File(ctxPath));
    ServletFileUpload upload = new ServletFileUpload(factory);
    upload.setHeaderEncoding("GBK");

    List items = null;
    try {
      items = upload.parseRequest(req);
      Calendar c = Calendar.getInstance();
      for (int i = 0; i < items.size(); i++) {
        FileItem fileItem = (FileItem)items.get(i);
        if ("wjlx".equalsIgnoreCase(fileItem.getFieldName())) {
          wjlx = fileItem.getString();
        }
        if (("dzj06_fj".equalsIgnoreCase(tb)) && 
          ("qtlx".equalsIgnoreCase(fileItem.getFieldName()))) {
          lx = fileItem.getString();
          req.setAttribute("lx", lx);
        }
        //信息发布。内外网都要发信息
        	jfid = "(SELECT nvl(MAX(TO_NUMBER(JFID)),0)+1 FROM "+tb+")";

        if (lx == null) lx = "";
        if (!fileItem.isFormField()) {
          String fileName = fileItem.getName();
          if ((fileName != null) && (!fileName.equals(""))) {
            if (fileName.lastIndexOf(File.separator) >= 0) {
              fileName = fileName.substring(fileName.lastIndexOf(File.separator) + 1);
            }
            if ("01".equals(wjlx))
              lj = "upload/images/";
            else {
              lj = "upload/attach/";
            }
            if("dbch_img".equals(tb)){
                lj = "upload/bch/";
                refId = "JFDBCH_ID";
            }
            if("dbchzw_img".equals(tb)){
                lj = "upload/zw/";
                refId = "JFDBCHZW_ID";
            }
            //新添加
            if("dwxjs_fj".equals(tb))
            {
            	lj = "upload/wxjs/";
                refId = "DWXJS_JFID";
            }
            String filePath = lj + c.getTimeInMillis() + "_" + i + fileName.substring(fileName.lastIndexOf("."));
            fileItem.write(new File(ctxPath + filePath));
              /*sql = "INSERT INTO " + tb + " (JFID, " + refId + ", WJLX, LJ, WJM) VALUES (S_" + tb + ".NEXTVAL,'" + 
                id + "','" + wjlx + "','" + "/zbzgis/" + filePath + "','" + fileName + "')";*/
            	sql = "INSERT INTO " + tb + " (JFID, " + refId + ",  LJ, mc) VALUES (" + jfid + ",'" + 
                	id + "','" + "/insect/" + filePath + "','" + fileName + "')";
            if (so.dc.pjdo.execute(sql) > 0)
              msg = "OK";
            else
              msg = "ERROR";
          }
        }
      }
    }
    catch (FileUploadException e) {
      e.printStackTrace();
      msg = "ERROR";
    } catch (Exception e) {
      e.printStackTrace();
      msg = "ERROR";
    }
    if ("OK".equals(msg)) {
      req.setAttribute("Message", "上传成功");
      so.dc.pjdo.dbConn.commit();
    } else {
      req.setAttribute("Message", "上传失败");
      so.dc.pjdo.dbConn.rollback();
    }
  }

  private static DiskFileItemFactory newDiskFileItemFactory(ServletContext context, File repository)
  {
    FileCleaningTracker fileCleaningTracker = 
      FileCleanerCleanup.getFileCleaningTracker(context);
    DiskFileItemFactory factory = new DiskFileItemFactory(
      10240, repository);
    factory.setFileCleaningTracker(fileCleaningTracker);
    return factory;
  }
}

/* Location:           C:\Users\Admin\Desktop\classes\
 * Qualified Name:     com.jf.zbzgis.common.zjz_upload.UploadAction
 * JD-Core Version:    0.6.0
 */