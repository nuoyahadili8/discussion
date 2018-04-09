package com.ledict.core.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ledict.core.service.RescourceService;
import com.ledict.dao.RescourceDao;
import com.ledict.entity.Rescource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 系统资源 服务实现类
 * </p>
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class RescourceServiceImpl extends ServiceImpl<RescourceDao, Rescource> implements RescourceService {

    @Override
    public int getCountByHash(String hash) {
        EntityWrapper<Rescource> wrapper = new EntityWrapper<>();
        wrapper.eq("hash",hash);
        return selectCount(wrapper);
    }

    @Override
    public Rescource getRescourceByHash(String hash) {
        EntityWrapper<Rescource> wrapper = new EntityWrapper<>();
        wrapper.eq("hash",hash);
        return selectOne(wrapper);
    }
}
