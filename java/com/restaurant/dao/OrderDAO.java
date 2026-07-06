package com.restaurant.dao;

import java.util.List;
import com.restaurant.model.Order;

public interface OrderDAO {

	int addOrder(Order order);

	Order getOrder(int orderId);

	List<Order> getOrdersByUser(int userId);

	List<Order> getAllOrders();

	void updateOrder(Order order);

	void deleteOrder(int orderId);
}