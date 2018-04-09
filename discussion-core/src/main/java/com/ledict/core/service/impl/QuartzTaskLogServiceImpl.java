package com.ledict.core.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ledict.core.service.QuartzTaskLogService;
import com.ledict.dao.QuartzTaskLogDao;
import com.ledict.entity.QuartzTaskLog;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 任务执行日志 服务实现类
 * </p>
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class QuartzTaskLogServiceImpl extends ServiceImpl<QuartzTaskLogDao, QuartzTaskLog> implements QuartzTaskLogService {

}
