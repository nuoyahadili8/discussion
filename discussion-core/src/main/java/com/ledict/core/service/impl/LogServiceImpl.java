package com.ledict.core.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import com.ledict.core.service.LogService;
import com.ledict.dao.LogDao;
import com.ledict.entity.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 系统日志 服务实现类
 * </p>
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class LogServiceImpl extends ServiceImpl<LogDao, Log> implements LogService {

    @Override
    public List<Integer> selectSelfMonthData() {
        List<Map> list =  baseMapper.selectSelfMonthData();
        List<Integer> pv = Lists.newArrayList();
        for(Map map : list){
            pv.add(Integer.valueOf(map.get("total").toString()));
        }
        return pv;
    }
}
