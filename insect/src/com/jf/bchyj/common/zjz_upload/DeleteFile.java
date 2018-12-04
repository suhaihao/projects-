package com.jf.bchyj.common.zjz_upload;

import java.io.File;

public class DeleteFile
{
  public static void delete(String fileName)
  {
    File file = new File(fileName);
    if (file.exists())
      file.delete();
  }
}

/* Location:           C:\Users\Admin\Desktop\classes\
 * Qualified Name:     com.jf.zbzgis.common.zjz_upload.DeleteFile
 * JD-Core Version:    0.6.0
 */