package com.matveev.spring.repository;

import com.matveev.spring.entity.User;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public class UserRepository {

    @PersistenceContext
    private EntityManager em;

    public List<User> findAll() {
        return em.createQuery("select u from User u", User.class).getResultList();
    }

    public User findById(Long id) {
        return em.find(User.class, id);
    }

    public void save(User user) {
        if (user.getId() == null) em.persist(user);
        else em.merge(user);
    }

    public void deleteById(Long id) {
        User managed = em.find(User.class, id);
        if (managed != null) em.remove(managed);
    }
}

