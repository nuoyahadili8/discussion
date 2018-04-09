package com.ledict.dao;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ledict.entity.Role;
import com.ledict.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.Map;
import java.util.Set;

/**
 * <p>
  *  Mapper 接口
 * </p>
 */
public interface UserDao extends BaseMapper<User> {
	User selectUserByMap(Map<String, Object> map);

	void saveUserRoles(@Param("userId") Long id, @Param("roleIds") Set<Role> roles);

	void dropUserRolesByUserId(@Param("userId") Long userId);
}