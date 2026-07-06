package com.restaurant.dao;

import java.util.List;
import com.restaurant.model.Menu;

public interface MenuDAO {

	void addMenu(Menu menu);

	Menu getMenu(int menuId);
	
	Menu getMenuById(int menuId);

	List<Menu> getAllMenus();

	List<Menu> getMenusByRestaurant(int restaurantId);

	void updateMenu(Menu menu);

	void deleteMenu(int menuId);
	
}