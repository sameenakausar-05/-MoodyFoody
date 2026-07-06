package com.restaurant.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.dao.OrderDAO;
import com.restaurant.model.Order;
import com.restaurant.util.DBConnection;

public class OrderDAOImpl implements OrderDAO {

	private static final String INSERT =
			"INSERT INTO OrderTable(UserID,RestaurantID,OrderDate,TotalAmount,Status,PaymentMethod) VALUES(?,?,?,?,?,?)";

	private static final String GET_ORDER =
			"SELECT * FROM OrderTable WHERE OrderID=?";

	private static final String GET_ALL =
			"SELECT * FROM OrderTable";

	private static final String GET_BY_USER =
			"SELECT * FROM OrderTable WHERE UserID=?";

	private static final String UPDATE =
			"UPDATE OrderTable SET Status=?, PaymentMethod=?, TotalAmount=? WHERE OrderID=?";

	private static final String DELETE =
			"DELETE FROM OrderTable WHERE OrderID=?";

	@Override
	public int addOrder(Order order) {

	    int orderId = 0;

	    try (
	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps = con.prepareStatement(
	                INSERT,
	                Statement.RETURN_GENERATED_KEYS)
	    ) {

	        ps.setInt(1, order.getUserId());
	        ps.setInt(2, order.getRestaurantId());
	        ps.setTimestamp(3, Timestamp.valueOf(order.getOrderDate()));
	        ps.setDouble(4, order.getTotalAmount());
	        ps.setString(5, order.getStatus());
	        ps.setString(6, order.getPaymentMethod());

	        int rows = ps.executeUpdate();
	        System.out.println("Rows inserted = " + rows);

	        ResultSet rs = ps.getGeneratedKeys();

	        if(rs.next()) {
	            orderId = rs.getInt(1);
	        }
	        System.out.println("Generated Key Found = " + rs.isBeforeFirst());
	        System.out.println("Order ID = " + orderId);

	    } catch (Exception e) {
	        System.out.println("========== ORDER INSERT FAILED ==========");
	        e.printStackTrace();
	    }

	    return orderId;
	}

	@Override
	public Order getOrder(int orderId) {

		Order order = null;

		try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(GET_ORDER)) {

			ps.setInt(1, orderId);

			ResultSet rs = ps.executeQuery();

			if(rs.next()) {

				order = new Order();

				order.setOrderId(rs.getInt("OrderID"));
				order.setUserId(rs.getInt("UserID"));
				order.setRestaurantId(rs.getInt("RestaurantID"));
				order.setOrderDate(rs.getTimestamp("OrderDate").toLocalDateTime());
				order.setTotalAmount(rs.getDouble("TotalAmount"));
				order.setStatus(rs.getString("Status"));
				order.setPaymentMethod(rs.getString("PaymentMethod"));
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return order;
	}

	@Override
	public List<Order> getOrdersByUser(int userId) {

		List<Order> list = new ArrayList<>();

		try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(GET_BY_USER)) {

			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while(rs.next()) {

				Order order = new Order();

				order.setOrderId(rs.getInt("OrderID"));
				order.setUserId(rs.getInt("UserID"));
				order.setRestaurantId(rs.getInt("RestaurantID"));
				order.setOrderDate(rs.getTimestamp("OrderDate").toLocalDateTime());
				order.setTotalAmount(rs.getDouble("TotalAmount"));
				order.setStatus(rs.getString("Status"));
				order.setPaymentMethod(rs.getString("PaymentMethod"));

				list.add(order);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Order> getAllOrders() {

		List<Order> list = new ArrayList<>();

		try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(GET_ALL)) {

			ResultSet rs = ps.executeQuery();

			while(rs.next()) {

				Order order = new Order();

				order.setOrderId(rs.getInt("OrderID"));
				order.setUserId(rs.getInt("UserID"));
				order.setRestaurantId(rs.getInt("RestaurantID"));
				order.setOrderDate(rs.getTimestamp("OrderDate").toLocalDateTime());
				order.setTotalAmount(rs.getDouble("TotalAmount"));
				order.setStatus(rs.getString("Status"));
				order.setPaymentMethod(rs.getString("PaymentMethod"));

				list.add(order);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateOrder(Order order) {

		try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(UPDATE)) {

			ps.setString(1, order.getStatus());
			ps.setString(2, order.getPaymentMethod());
			ps.setDouble(3, order.getTotalAmount());
			ps.setInt(4, order.getOrderId());

			ps.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrder(int orderId) {

		try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(DELETE)) {

			ps.setInt(1, orderId);

			ps.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}