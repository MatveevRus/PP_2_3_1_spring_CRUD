package com.matveev.spring.service;

import com.matveev.spring.entity.User;

import java.util.List;

public interface UserService {
    List<User> getAll();
    User get(Long id);
    void save(User user);
    void delete(Long id);
}
