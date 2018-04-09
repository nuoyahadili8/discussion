package com.ledict.core.util;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ledict.core.exception.MyException;
import com.ledict.entity.Rescource;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.FetchRet;
import com.qiniu.util.Auth;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class QiniuFileUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(QiniuFileUtil.class);

	private static String path = "http://p6ue8awj9.bkt.clouddn.com/";
	private static String qiniuAccess = "mGkCGydsMmcl04Jxz6RoB2ACWFwWgM3VD81oG1WJ";
	private static String qiniuKey = "nEooXmRzL7QMQapZi-ywF1BMeUhaulFx5w_i3YHb";
	private static String bucketName = "ledict";

	/***
	 * 普通上传图片
	 * @param file
	 * @return
	 * @throws QiniuException
	 * @throws IOException
	 */
	public static String upload(MultipartFile file) throws IOException, NoSuchAlgorithmException {
		Zone z = Zone.zone1();
		Configuration config = new Configuration(z);
		String fileName = "", extName = "", filePath = "";
		if (null != file && !file.isEmpty()) {
			extName = file.getOriginalFilename().substring(
					file.getOriginalFilename().lastIndexOf("."));
			fileName = UUID.randomUUID() + extName;
			UploadManager uploadManager = new UploadManager(config);
			Auth auth = Auth.create(qiniuAccess, qiniuKey);
			String token = auth.uploadToken(bucketName);
			byte[] data = file.getBytes();
			QETag tag = new QETag();
			String hash = tag.calcETag(file);
			Rescource rescource = new Rescource();
			EntityWrapper<RestResponse> wrapper = new EntityWrapper<>();
			wrapper.eq("hash",hash);
			rescource = rescource.selectOne(wrapper);
			if( rescource!= null){
				return rescource.getWebUrl();
			}
			Response r = uploadManager.put(data, fileName, token);
			if (r.isOK()) {
				filePath = path + fileName;
				rescource = new Rescource();
				rescource.setFileName(fileName);
				rescource.setFileSize(new java.text.DecimalFormat("#.##").format(file.getSize()/1024)+"kb");
				rescource.setHash(hash);
				rescource.setFileType(StringUtils.isBlank(extName)?"unknown":extName);
				rescource.setWebUrl(filePath);
				rescource.setSource("qiniu");
				rescource.insert();
			}
		}
		return filePath;
	}

	/***
	 * 删除已经上传的图片
	 * @param imgPath
	 */
	public static void deleteQiniuP(String imgPath) {
		Zone z = Zone.zone1();
		Configuration config = new Configuration(z);
		Auth auth = Auth.create(qiniuAccess, qiniuKey);
		BucketManager bucketManager = new BucketManager(auth,config);
		imgPath = imgPath.replace(path, "");
		try {
			bucketManager.delete(bucketName, imgPath);
		} catch (QiniuException e) {
			e.printStackTrace();
		}
	}

	/***
	 * 上传网络图片
	 * @param src
	 * @return
	 */
	public static String uploadImageSrc(String src){
		Zone z = Zone.zone1();
		Configuration config = new Configuration(z);
		Auth auth = Auth.create(qiniuAccess, qiniuKey);
		BucketManager bucketManager = new BucketManager(auth, config);
		String fileName = UUID.randomUUID().toString(),filePath="";
		try {
			FetchRet fetchRet = bucketManager.fetch(src, bucketName);
			filePath = path + fetchRet.key;
			Rescource rescource = new Rescource();
			rescource.setFileName(fetchRet.key);
			rescource.setFileSize(new java.text.DecimalFormat("#.##").format(fetchRet.fsize/1024)+"kb");
			rescource.setHash(fetchRet.hash);
			rescource.setFileType(fetchRet.mimeType);
			rescource.setWebUrl(filePath);
			rescource.setSource("qiniu");
			rescource.insert();
		} catch (QiniuException e) {
			filePath = src;
			e.printStackTrace();
		}
		return filePath;
	}

	/***
	 * 上传本地图片
	 * @param src
	 * @return
	 */
	public static String uploadLocalImg(String src) throws IOException, NoSuchAlgorithmException{
		Zone z = Zone.zone1();
		Configuration config = new Configuration(z);
		UploadManager uploadManager = new UploadManager(config);
		Auth auth = Auth.create(qiniuAccess, qiniuKey);
		String token = auth.uploadToken(bucketName);
		File file = new File(src);
		if(!file.exists()){
			throw new MyException("本地文件不存在");
		}
		QETag tag = new QETag();
		String hash = tag.calcETag(file);
		Rescource rescource = new Rescource();
		EntityWrapper<RestResponse> wrapper = new EntityWrapper<>();
		wrapper.eq("hash",hash);
		rescource = rescource.selectOne(wrapper);
		if( rescource!= null){
			return rescource.getWebUrl();
		}
		String filePath="",
				extName = "",
		name = UUID.randomUUID().toString();
		extName = file.getName().substring(
				file.getName().lastIndexOf("."));
		Response response = uploadManager.put(file,name,token);
		if(response.isOK()){
			filePath = path + name;
			rescource = new Rescource();
			rescource.setFileName(name);
			rescource.setFileSize(new java.text.DecimalFormat("#.##").format(file.length()/1024)+"kb");
			rescource.setHash(hash);
			rescource.setFileType(StringUtils.isBlank(extName)?"unknown":extName);
			rescource.setWebUrl(filePath);
			rescource.setSource("qiniu");
			rescource.insert();
		}
		return filePath;
	}

	/**
	 * 上传base64位的图片
	 * @param base64
	 * @return
	 */
	public static String uploadBase64(String base64,String name) {
		Zone z = Zone.zone1();
		Configuration config = new Configuration(z);
		UploadManager uploadManager = new UploadManager(config);
		Auth auth = Auth.create(qiniuAccess, qiniuKey);
		String token = auth.uploadToken(bucketName),filePath;

		byte[] data = Base64.decodeBase64(base64);
		try {
			uploadManager.put(data,name,token);
		} catch (IOException e) {
			e.printStackTrace();
		}
		filePath = path+name;
		return filePath;
	}
}
