package com.restaurant.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.daoimpl.MenuDAOImpl;
import com.restaurant.daoimpl.OrderDAOImpl;
import com.restaurant.daoimpl.OrderItemDAOImpl;
import com.restaurant.daoimpl.RestaurantDAOImpl;
import com.restaurant.daoimpl.UserDAOImpl;
import com.restaurant.model.Menu;
import com.restaurant.model.Order;
import com.restaurant.model.OrderItem;
import com.restaurant.model.Restaurant;
import com.restaurant.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/invoice")
public class InvoiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int orderId =
                Integer.parseInt(request.getParameter("orderId"));

        OrderDAOImpl orderDAO = new OrderDAOImpl();
        Order order = orderDAO.getOrder(orderId);

        UserDAOImpl userDAO = new UserDAOImpl();
        User user = userDAO.getUserById(order.getUserId());

        RestaurantDAOImpl restaurantDAO =
                new RestaurantDAOImpl();

        Restaurant restaurant =
                restaurantDAO.getRestaurant(order.getRestaurantId());

        OrderItemDAOImpl orderItemDAO =
                new OrderItemDAOImpl();

        List<OrderItem> orderItems =
                orderItemDAO.getOrderItems(orderId);

        MenuDAOImpl menuDAO =
                new MenuDAOImpl();

        List<Menu> menuList =
                new ArrayList<>();

        for(OrderItem item : orderItems){

            menuList.add(
                    menuDAO.getMenuById(item.getMenuId()));
        }

        request.setAttribute("order", order);
        request.setAttribute("user", user);
        request.setAttribute("restaurant", restaurant);
        request.setAttribute("orderItems", orderItems);
        request.setAttribute("menuList", menuList);

        request.getRequestDispatcher("invoice.jsp")
               .forward(request, response);
    }
}