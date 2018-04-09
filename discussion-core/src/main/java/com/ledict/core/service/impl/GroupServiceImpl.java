package com.ledict.core.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ledict.core.service.GroupService;
import com.ledict.dao.GroupDao;
import com.ledict.entity.Group;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class GroupServiceImpl extends ServiceImpl<GroupDao, Group> implements GroupService {
	
}
