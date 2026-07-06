package com.restaurant.controller;

import java.io.IOException;

import com.restaurant.dao.MenuDAO;
import com.restaurant.daoimpl.MenuDAOImpl;
import com.restaurant.model.Cart;
import com.restaurant.model.CartItem;
import com.restaurant.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private MenuDAO menuDAO;

    @Override
    public void init() {
        menuDAO = new MenuDAOImpl();
    }
    
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        HttpSession session = request.getSession();

        Cart cart =
                (Cart) session.getAttribute("cart");

        if(cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");

        // =====================
        // INCREASE QUANTITY
        // =====================

        if("increase".equals(action)) {

            int menuId =
                    Integer.parseInt(
                    request.getParameter("menuId"));

            for(CartItem item : cart.getItems()) {

                if(item.getMenu().getMenuId() == menuId) {

                    cart.updateItem(
                            menuId,
                            item.getQuantity() + 1);

                    break;
                }
            }

            response.sendRedirect("cart.jsp");
            return;
        }

        // =====================
        // DECREASE QUANTITY
        // =====================

        if("decrease".equals(action)) {

            int menuId =
                    Integer.parseInt(
                    request.getParameter("menuId"));

            for(CartItem item : cart.getItems()) {

                if(item.getMenu().getMenuId() == menuId) {

                    cart.updateItem(
                            menuId,
                            item.getQuantity() - 1);

                    break;
                }
            }

            response.sendRedirect("cart.jsp");
            return;
        }

        // =====================
        // REMOVE ITEM
        // =====================

        if("remove".equals(action)) {

            int menuId =
                    Integer.parseInt(
                    request.getParameter("menuId"));

            cart.removeItem(menuId);

            response.sendRedirect("cart.jsp");
            return;
        }
     // =====================
     // ADD TO CART
     // =====================

     int menuId =
             Integer.parseInt(
             request.getParameter("menuId"));

     Menu menu = menuDAO.getMenuById(menuId);

     /*
      * Cart Empty
      */

     if(cart.isEmpty()) {

         cart.addItem(menu);

         session.setAttribute("cart", cart);

         response.sendRedirect("cart.jsp");

         return;
     }

     /*
      * Same Restaurant
      */

     if(cart.getRestaurantId() == menu.getRestaurantId()) {

         cart.addItem(menu);

         session.setAttribute("cart", cart);

         response.sendRedirect("cart.jsp");

         return;
     }

     /*
      * Different Restaurant
      */

     session.setAttribute("newMenu", menu);

     response.sendRedirect("replaceCart.jsp");

     return;
        
    }

    
}