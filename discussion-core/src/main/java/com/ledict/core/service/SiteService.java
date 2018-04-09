package com.ledict.core.service;

import com.baomidou.mybatisplus.service.IService;
import com.ledict.entity.Site;

/**
 * <p>
 *  服务类
 * </p>
 */
public interface SiteService extends IService<Site> {

    Site getCurrentSite();

    void updateSite(Site site);
	
}
