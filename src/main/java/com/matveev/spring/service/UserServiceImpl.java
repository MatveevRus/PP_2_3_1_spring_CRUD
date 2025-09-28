package com.matveev.spring.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import com.matveev.spring.entity.User;
import com.matveev.spring.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository repo;

    public UserServiceImpl(UserRepository repo) {
        this.repo = repo;
    }

    @Override
    @Transactional(readOnly = true)
    public List<User> getAll() {
        return repo.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public User get(Long id) {
        return repo.findById(id);
    }

    @Override
    @Transactional
    public void save(User user) {
        if (user.getAge() < 0 || user.getAge() > 120) {
            throw new IllegalArgumentException("Возраст должен быть от 0 до 120 лет");
        }

        if (user.getName() != null && !user.getName().isBlank()) {
            user.setName(capitalize(user.getName()));
        }
        if (user.getLastName() != null && !user.getLastName().isBlank()) {
            user.setLastName(capitalize(user.getLastName()));
        }
        repo.save(user);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        repo.deleteById(id);
    }


    private String capitalize(String str) {
        str = str.trim().toLowerCase();
        if (str.isEmpty()) return str;
        return str.substring(0, 1).toUpperCase() + str.substring(1);
    }
}
