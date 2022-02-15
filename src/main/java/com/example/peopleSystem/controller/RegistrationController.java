package com.example.peopleSystem.controller;

import com.example.peopleSystem.domain.Role;
import com.example.peopleSystem.domain.User;
import com.example.peopleSystem.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Date;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            model.put("message", "User exists!");
            return "registration";
        }
        Date date = new Date();
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setDateOfRegistration(date.toString().substring(4));
        user.setDateOfLastConnect(date.toString().substring(4));
        userRepo.save(user);

        return "redirect:/login";
    }
}