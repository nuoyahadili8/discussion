package com.ledict.core.test;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ledict.core.exception.MyException;
import com.ledict.core.util.QETag;
import com.ledict.core.util.RestResponse;
import com.ledict.entity.Rescource;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class Demo1 {

    private static String qiniuAccess = "mGkCGydsMmcl04Jxz6RoB2ACWFwWgM3VD81oG1WJ"; //mGkCGydsMmcl04Jxz6RoB2ACWFwWgM3VD81oG1WJ
    private static String qiniuKey = "nEooXmRzL7QMQapZi-ywF1BMeUhaulFx5w_i3YHb"; 	//nEooXmRzL7QMQapZi-ywF1BMeUhaulFx5w_i3YHb
    private static String bucketName = "ledict";

    public static void main(String[] args) throws IOException, NoSuchAlgorithmException {
        Zone z = Zone.zone1();
        Configuration config = new Configuration(z);
        UploadManager uploadManager = new UploadManager(config);
        Auth auth = Auth.create(qiniuAccess, qiniuKey);
        String token = auth.uploadToken(bucketName);
        File file = new File("D:/1.jpg");
        if(!file.exists()){
            throw new MyException("本地文件不存在");
        }
//        QETag tag = new QETag();
//        String hash = tag.calcETag(file);
//        Rescource rescource = new Rescource();
//        EntityWrapper<RestResponse> wrapper = new EntityWrapper<>();
//        wrapper.eq("hash",hash);
//        rescource = rescource.selectOne(wrapper);
//        if( rescource!= null){
//            return rescource.getWebUrl();
//        }
        String filePath="",
                extName = "",
                name = UUID.randomUUID().toString();
        extName = file.getName().substring(file.getName().lastIndexOf("."));
        Response response = uploadManager.put(file,name+extName,token);
        if(response.isOK()){
            System.out.println("上传成功！");
        }
    }
}
