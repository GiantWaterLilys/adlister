package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.*;
import java.io.IOException;

@WebServlet(name = "UpdateProfilesServlet", value = "/UpdateProfilesServlet")
public class UpdateProfilesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = (User) request.getSession().getAttribute("user");

        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || password.isEmpty();

        if (inputHasErrors) {
            JOptionPane.showMessageDialog(null, "Please fill out all the requested information to register!");
            response.sendRedirect("/profile");
            return;
        }

        // create and save a new user
        User user1 = new User(username, email, password);
        DaoFactory.getUsersDao().updateProfile(user1, user.getId());
        response.sendRedirect("/profile");
    }
}
