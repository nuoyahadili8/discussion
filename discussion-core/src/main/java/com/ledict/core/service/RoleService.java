package com.ledict.core.service;

import com.baomidou.mybatisplus.service.IService;
import com.ledict.entity.Menu;
import com.ledict.entity.Role;

import java.util.List;
import java.util.Set;

/**
 * <p>
 *  服务类
 * </p>
 */
public interface RoleService extends IService<Role> {

    Role saveRole(Role role);

    Role getRoleById(Long id);

    void updateRole(Role role);

    void deleteRole(Role role);

    void saveRoleMenus(Long id, Set<Menu> menuSet);

    void dropRoleMenus(Long id);

    Integer getRoleNameCount(String name);

    List<Role> selectAll();
	
}
