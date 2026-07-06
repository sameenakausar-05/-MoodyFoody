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

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null ||
           session.getAttribute("loggedUser") == null){

            response.sendRedirect("login.jsp");
            return;
        }

        request.getRequestDispatcher("editProfile.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null ||
           session.getAttribute("loggedUser") == null){

            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("loggedUser");

        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setAddress(request.getParameter("address"));

        UserDAOImpl dao = new UserDAOImpl();

        if(dao.updateUser(user)) {

            session.setAttribute("loggedUser", user);

            response.sendRedirect("profile");

        } else {

            response.getWriter().println("Profile Update Failed.");
        }
    }
}