package com.ledict.core.upload;

import org.springframework.web.multipart.MultipartFile;

/**
 * todo: 阿里云上传
 */
public class OssUtil implements UploadUtil {
    @Override
    public String upload(MultipartFile file) {
        return null;
    }

    @Override
    public Boolean delet(String path) {
        return null;
    }

    @Override
    public String uploadNetFile(String url) {
        return null;
    }

    @Override
    public String uploadLocalImg(String localPath) {
        return null;
    }

    @Override
    public String uploadBase64(String base64) {
        return null;
    }
}
