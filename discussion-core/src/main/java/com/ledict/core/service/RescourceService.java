package com.ledict.core.service;

import com.baomidou.mybatisplus.service.IService;
import com.ledict.entity.Rescource;

/**
 * <p>
 * 系统资源 服务类
 * </p>
 */
public interface RescourceService extends IService<Rescource> {

    int getCountByHash(String hash);

    Rescource getRescourceByHash(String hash);

}
