package com.vdp.users.dao;

import com.vdp.users.model.User;
import com.vdp.users.model.UserRole;

public interface UserDao {

	User findByUserName(String username);
    void registerNew(User user, UserRole role);


}