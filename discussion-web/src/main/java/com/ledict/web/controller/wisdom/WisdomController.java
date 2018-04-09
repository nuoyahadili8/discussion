package com.ledict.web.controller.wisdom;

import com.ledict.core.annotation.SysLog;
import com.ledict.core.base.BaseController;
import com.xiaoleilu.hutool.log.Log;
import com.xiaoleilu.hutool.log.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/wisdom")
public class WisdomController extends BaseController {

    private static Log log = LogFactory.get();

    @GetMapping("demo")
    @SysLog("跳转智慧阅卷Demo页面")
    public String test(){
        return "/wisdom/demo";
    }

}
