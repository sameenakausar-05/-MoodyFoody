package com.restaurant.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.daoimpl.MenuDAOImpl;
import com.restaurant.daoimpl.OrderItemDAOImpl;
import com.restaurant.model.Menu;
import com.restaurant.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.restaurant.daoimpl.OrderDAOImpl;
import com.restaurant.daoimpl.RestaurantDAOImpl;
import com.restaurant.daoimpl.UserDAOImpl;

import com.restaurant.model.Order;
import com.restaurant.model.Restaurant;
import com.restaurant.model.User;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int orderId =
                Integer.parseInt(request.getParameter("orderId"));

        OrderItemDAOImpl orderItemDAO =
                new OrderItemDAOImpl();

        MenuDAOImpl menuDAO =
                new MenuDAOImpl();

        List<OrderItem> orderItems =
                orderItemDAO.getOrderItems(orderId);
        
        OrderDAOImpl orderDAO = new OrderDAOImpl();

        Order order = orderDAO.getOrder(orderId);

        RestaurantDAOImpl restaurantDAO =
                new RestaurantDAOImpl();

        Restaurant restaurant =
                restaurantDAO.getRestaurant(order.getRestaurantId());

        UserDAOImpl userDAO =
                new UserDAOImpl();

        User user =
                userDAO.getUserById(order.getUserId());

        List<Menu> menuList =
                new ArrayList<>();

        for(OrderItem item : orderItems){

            Menu menu =
                    menuDAO.getMenuById(item.getMenuId());

            menuList.add(menu);
        }
        
        request.setAttribute("order", order);
        request.setAttribute("restaurant", restaurant);
        request.setAttribute("user", user);

        request.setAttribute("orderItems", orderItems);
        request.setAttribute("menuList", menuList);

        request.getRequestDispatcher("orderDetails.jsp")
               .forward(request, response);
    }
}