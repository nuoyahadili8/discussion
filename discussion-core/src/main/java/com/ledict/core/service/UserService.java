package com.ledict.core.service;

import com.baomidou.mybatisplus.service.IService;
import com.ledict.entity.Role;
import com.ledict.entity.User;

import java.util.Set;

public interface UserService extends IService<User> {

	User findUserByLoginName(String name);

	User findUserById(Long id);

	User saveUser(User user);

	User updateUser(User user);

	void saveUserRoles(Long id, Set<Role> roleSet);

	void dropUserRolesByUserId(Long id);

	int userCount(String param);

	void deleteUser(User user);
}
