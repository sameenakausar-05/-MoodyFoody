package com.restaurant.dao;

import java.util.List;
import com.restaurant.model.OrderItem;

public interface OrderItemDAO {

	void addOrderItem(OrderItem item);

	List<OrderItem> getOrderItems(int orderId);

	void deleteOrderItem(int orderItemId);
}