package com.restaurant.controller;

import java.io.IOException;

import com.restaurant.daoimpl.UserDAOImpl;
import com.restaurant.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        UserDAOImpl dao =
                new UserDAOImpl();

        User user =
                dao.getUserByEmail(email);

        if (user != null && user.getPassword().equals(password)) {

            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", user);

            response.sendRedirect(request.getContextPath() + "/index.jsp");

        } else {

            response.getWriter().println("Invalid Credentials");
        }
    }
}