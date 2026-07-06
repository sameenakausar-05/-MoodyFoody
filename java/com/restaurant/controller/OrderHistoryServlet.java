package com.restaurant.controller;

import java.io.IOException;
import java.util.List;

import com.restaurant.daoimpl.OrderDAOImpl;
import com.restaurant.model.Order;
import com.restaurant.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null ||
                session.getAttribute("loggedUser") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        User user =
                (User) session.getAttribute("loggedUser");

        OrderDAOImpl dao =
                new OrderDAOImpl();

        List<Order> orders =
                dao.getOrdersByUser(user.getUserId());

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("orderHistory.jsp")
               .forward(request, response);
    }
}