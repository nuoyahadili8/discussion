package com.ledict.core.annotation;

import java.lang.annotation.*;

/**
 * todo:
 * 类SysLog的功能描述:
 * 系统日志注解
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLog {
    String value() default "";
}
