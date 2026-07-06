package com.restaurant.dao;

import java.util.List;
import com.restaurant.model.Restaurant;

public interface RestaurantDAO {

	void addRestaurant(Restaurant restaurant);

	Restaurant getRestaurant(int restaurantId);

	List<Restaurant> getAllRestaurants();

	void updateRestaurant(Restaurant restaurant);

	void deleteRestaurant(int restaurantId);
	
	List<Restaurant> searchRestaurant(String keyword);
	
}