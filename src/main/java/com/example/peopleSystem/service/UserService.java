package com.example.peopleSystem.service;

import com.example.peopleSystem.domain.User;
import com.example.peopleSystem.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;

    @Override
    public  UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepo.findByUsername(username);
        Date date = new Date();
        user.setDateOfLastConnect(date.toString().substring(4));
        userRepo.save(user);
        return userRepo.findByUsername(username);
    }

}