package com.example.peopleSystem.repos;

import com.example.peopleSystem.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.core.userdetails.UserDetails;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
}