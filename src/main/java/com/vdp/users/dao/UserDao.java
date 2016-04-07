package com.vdp.users.dao;

import com.vdp.users.model.User;

public interface UserDao {

	User findByUserName(String username);

}