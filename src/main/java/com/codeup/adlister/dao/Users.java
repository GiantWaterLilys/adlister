package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.sql.SQLException;
import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
    User findById(Long id);
    User findByEmail(String email);
    void updateProfile(User user, Long id);
}
