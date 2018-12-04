package com.ssh.user.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import Decoder.BASE64Decoder;

public class Base64UPLoad {
	// 加密编码
	private String imgStr;
	// 储存路径
	private String path;
	// 储存名称
	private String imgName;

	public Base64UPLoad(String imgStr, String path, String imgName) {
		this.imgStr = imgStr;
		this.path = path;
		this.imgName = imgName;

	}

	public boolean savePictrue(String imgStr, String path, String imgName) {
		try {
			String img = imgStr.replaceAll(" ", "+");
			String imgPath = path + "\\" + imgName + ".png";
			File file = new File(path);
			if (!file.exists()) {
				file.mkdirs();
			}
			BASE64Decoder decoder = new BASE64Decoder();
			byte[] bytes = decoder.decodeBuffer(img);
			for (int i = 0; i < bytes.length; ++i) {
				if (bytes[i] < 0) {
					// 调整异常数据
					bytes[i] += 256;
				}
			}
			OutputStream out = new FileOutputStream(imgPath);
			out.write(bytes);
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public String getImgStr() {
		return imgStr;
	}

	public void setImgStr(String imgStr) {
		this.imgStr = imgStr;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

}
