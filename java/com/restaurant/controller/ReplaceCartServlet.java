package com.restaurant.controller;

import java.io.IOException;

import com.restaurant.model.Cart;
import com.restaurant.model.Menu;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/replaceCart")
public class ReplaceCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();

        Menu menu =
            (Menu) session.getAttribute("newMenu");

        Cart cart = new Cart();

        cart.addItem(menu);

        session.setAttribute("cart", cart);

        session.removeAttribute("newMenu");

        response.sendRedirect("cart.jsp");
    }
}