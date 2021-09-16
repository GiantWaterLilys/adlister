package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Register;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;


@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        creates a blank register form that fills the forms in with empty strings
        Register blankRegister = new Register();

//        sets register attribute to a blank register object if its the first time seeing this form
        if (request.getSession().getAttribute("register") == null){
            request.getSession().setAttribute("register", blankRegister);
        }else{
//            sets the register attribute to the object that's saved in the session during the post request
            Register register = (Register) request.getSession().getAttribute("register");
            request.setAttribute("register", register);
        }

        if(request.getParameter("error") != null){
            request.setAttribute("wasAnError", "error");
        }
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");


        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
//            saves the username and email in a register object to the session
            Register register = new Register(username, email);

            request.getSession().setAttribute("register", register);
            response.sendRedirect("/register?error=error");
            return;
        }

        // create and save a new user
        User user = new User(username, email, password);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
