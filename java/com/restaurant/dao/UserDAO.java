package com.restaurant.dao;

import com.restaurant.model.User;

public interface UserDAO {

    boolean addUser(User user);
    boolean updateUser(User user);

    User getUserByEmail(String email);
    
    User getUserById(int userId);
}