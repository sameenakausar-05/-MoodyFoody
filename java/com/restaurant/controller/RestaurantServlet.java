package com.restaurant.controller;

import java.io.IOException;
import java.util.List;

import com.restaurant.daoimpl.RestaurantDAOImpl;
import com.restaurant.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
	                     HttpServletResponse response)
	        throws ServletException, IOException {

	    RestaurantDAOImpl dao = new RestaurantDAOImpl();

	    String keyword = request.getParameter("keyword");

	    List<Restaurant> restaurants;

	    if (keyword != null && !keyword.trim().isEmpty()) {

	        restaurants = dao.searchRestaurant(keyword.trim());

	    } else {

	        restaurants = dao.getAllRestaurants();
	    }

	    request.setAttribute("restaurants", restaurants);

	    request.getRequestDispatcher("restaurants.jsp")
	           .forward(request, response);
	}
}