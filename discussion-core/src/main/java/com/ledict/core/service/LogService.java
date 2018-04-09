package com.ledict.core.service;

import com.baomidou.mybatisplus.service.IService;
import com.ledict.entity.Log;

import java.util.List;

/**
 * <p>
 * 系统日志 服务类
 * </p>
 */
public interface LogService extends IService<Log> {

    public List<Integer> selectSelfMonthData();

}
