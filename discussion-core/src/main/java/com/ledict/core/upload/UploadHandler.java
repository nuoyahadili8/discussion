package com.ledict.core.upload;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class UploadHandler implements InvocationHandler {

    private UploadUtil upload;

    public UploadHandler(UploadUtil upload) {
        this.upload = upload;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        method.invoke(upload, args);
        return null;
    }
}
