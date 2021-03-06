package org.beangle.website.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;

public class Base64Util {

	/**
	 * 采用base64编码图片
	 * 
	 * @param imgPath
	 *            图片路径+名称
	 * @return 编码后的字符串
	 */
	public static String base64Img2Str(String imgPath) throws Exception {
		FileInputStream fis = new FileInputStream(new File(imgPath));
		byte[] buf = new byte[fis.available()];
		fis.read(buf);
		fis.close();
		return Base64.encodeBase64String(buf);
	}

	public static byte[] base64Str2Img(String base64Str,String path) throws Exception {
		if (base64Str == null || base64Str.trim().length() == 0) {
			return null;
		}

		// Base64解码
		byte[] b = Base64.decodeBase64(base64Str);
		for (int i = 0; i < b.length; ++i) {
			if (b[i] < 0) {// 调整异常数据
				b[i] += 256;
			}
		}
		if(StringUtils.isNotEmpty(path)){
			File file = new File(path);
			if (file.getParentFile() != null) {
				file.getParentFile().mkdir();
			}
			
			if(!file.exists()){
				file.createNewFile();
			}	
			OutputStream out = new FileOutputStream(file);
			out.write(b);
			out.flush();
			out.close();
		}
		return b;
	}

//	public static void main(String[] args) {
//
//		try {
//			String str = Base64Util.base64Img2Str("D:\\1.jpg");
//			Base64Util.base64Str2Img(str,);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static String GetImageStr() {// 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
//		String imgFile = "d://1.jpg";// 待处理的图片
//		InputStream in = null;
//		byte[] data = null;
//		// 读取图片字节数组
//		try {
//			in = new FileInputStream(imgFile);
//			data = new byte[in.available()];
//			in.read(data);
//			in.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		// 对字节数组Base64编码
//		BASE64Encoder encoder = new BASE64Encoder();
//		return encoder.encode(data);// 返回Base64编码过的字节数组字符串
//	}
//
//	public static boolean GenerateImage(String imgStr) {// 对字节数组字符串进行Base64解码并生成图片
//		if (imgStr == null) // 图像数据为空
//			return false;
//		BASE64Decoder decoder = new BASE64Decoder();
//		try {
//			// Base64解码
//			byte[] b = decoder.decodeBuffer(imgStr);
//			for (int i = 0; i < b.length; ++i) {
//				if (b[i] < 0) {// 调整异常数据
//					b[i] += 256;
//				}
//			}
//			// 生成jpeg图片
//			String imgFilePath = "d://2.jpg";// 新生成的图片
//			OutputStream out = new FileOutputStream(imgFilePath);
//			out.write(b);
//			out.flush();
//			out.close();
//			return true;
//		} catch (Exception e) {
//			return false;
//		}
//	}
}
