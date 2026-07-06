package com.restaurant.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import com.restaurant.daoimpl.OrderDAOImpl;
import com.restaurant.daoimpl.OrderItemDAOImpl;
import com.restaurant.model.Cart;
import com.restaurant.model.CartItem;
import com.restaurant.model.Order;
import com.restaurant.model.OrderItem;
import com.restaurant.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);

    	if(session == null || session.getAttribute("loggedUser") == null){

    	    response.sendRedirect("login.jsp");

    	    return;
    	}

        User user = (User) session.getAttribute("loggedUser");

        Cart cart = (Cart) session.getAttribute("cart");

        if (user == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        if (cart == null || cart.isEmpty()) {

            response.sendRedirect("cart.jsp");
            return;
        }

        // Create Order

        Order order = new Order();

        order.setUserId(user.getUserId());

        order.setRestaurantId(
                cart.getItems()
                    .iterator()
                    .next()
                    .getMenu()
                    .getRestaurantId());

        order.setOrderDate(LocalDateTime.now());

        order.setTotalAmount(cart.getTotalAmount());

        order.setStatus("PLACED");

        order.setPaymentMethod(
                request.getParameter("paymentMethod"));

        // Save Order

        OrderDAOImpl orderDAO = new OrderDAOImpl();

        int orderId = orderDAO.addOrder(order);
        System.out.println("Payment = " + request.getParameter("paymentMethod"));
        System.out.println("Generated Order ID = " + orderId);

        if(orderId == 0){
            System.out.println("Order was NOT inserted into database.");
        }

        // Save Order Items

        OrderItemDAOImpl itemDAO =
                new OrderItemDAOImpl();

        for (CartItem cartItem : cart.getItems()) {

            OrderItem item = new OrderItem();

            item.setOrderId(orderId);

            item.setMenuId(
                    cartItem.getMenu().getMenuId());

            item.setQuantity(
                    cartItem.getQuantity());

            item.setItemTotal(
                    cartItem.getTotalPrice());

            itemDAO.addOrderItem(item);
        }

        // Clear Cart

        session.removeAttribute("cart");

        // Redirect

        response.sendRedirect("orderSuccess.jsp");
    }
}