package com.ledict.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ledict.entity.Log;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 系统日志 Mapper 接口
 * </p>
 */
public interface LogDao extends BaseMapper<Log> {

    List<Map> selectSelfMonthData();
}
