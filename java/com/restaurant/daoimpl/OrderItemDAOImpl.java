package com.restaurant.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.dao.OrderItemDAO;
import com.restaurant.model.OrderItem;
import com.restaurant.util.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

	private static final String INSERT =
			"INSERT INTO OrderItem(OrderID,MenuID,Quantity,ItemTotal) VALUES(?,?,?,?)";

	private static final String GET_ITEMS =
			"SELECT * FROM OrderItem WHERE OrderID=?";

	private static final String DELETE =
			"DELETE FROM OrderItem WHERE OrderItemID=?";

	@Override
	public void addOrderItem(OrderItem item) {

		try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(INSERT)) {

			ps.setInt(1, item.getOrderId());
			ps.setInt(2, item.getMenuId());
			ps.setInt(3, item.getQuantity());
			ps.setDouble(4, item.getItemTotal());

			ps.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderItem> getOrderItems(int orderId) {

		List<OrderItem> list = new ArrayList<>();

		try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(GET_ITEMS)) {

			ps.setInt(1, orderId);

			ResultSet rs = ps.executeQuery();

			while(rs.next()) {

				OrderItem item = new OrderItem();

				item.setOrderItemId(rs.getInt("OrderItemID"));
				item.setOrderId(rs.getInt("OrderID"));
				item.setMenuId(rs.getInt("MenuID"));
				item.setQuantity(rs.getInt("Quantity"));
				item.setItemTotal(rs.getDouble("ItemTotal"));

				list.add(item);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void deleteOrderItem(int orderItemId) {

		try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(DELETE)) {

			ps.setInt(1, orderItemId);

			ps.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}