package com.ledict.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ledict.entity.Menu;
import com.ledict.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.Set;

/**
 * <p>
  *  Mapper 接口
 * </p>
 */
public interface RoleDao extends BaseMapper<Role> {

    Role selectRoleById(@Param("id") Long id);

    void saveRoleMenus(@Param("roleId") Long id, @Param("menus") Set<Menu> menus);

    void dropRoleMenus(@Param("roleId") Long roleId);

    void dropRoleUsers(@Param("roleId") Long roleId);
}