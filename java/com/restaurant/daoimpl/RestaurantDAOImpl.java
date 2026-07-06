package com.restaurant.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.dao.RestaurantDAO;
import com.restaurant.model.Restaurant;
import com.restaurant.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

	private static final String INSERT =
			"INSERT INTO Restaurant(name,cuisineType,deliveryTime,address,rating,isActive,imagePath) VALUES(?,?,?,?,?,?,?)";

	private static final String GET_BY_ID =
			"SELECT * FROM Restaurant WHERE restaurantId=?";

	private static final String GET_ALL =
			"SELECT * FROM Restaurant";

	private static final String UPDATE =
			"UPDATE Restaurant SET name=?, cuisineType=?, deliveryTime=?, address=?, rating=?, isActive=?, imagePath=? WHERE restaurantId=?";

	private static final String DELETE =
			"DELETE FROM Restaurant WHERE restaurantId=?";
	
	private static final String SEARCH =
	        "SELECT * FROM Restaurant WHERE name LIKE ?";

	@Override
	public void addRestaurant(Restaurant restaurant) {

		try(Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(INSERT)) {

			ps.setString(1, restaurant.getName());
			ps.setString(2, restaurant.getCuisineType());
			ps.setInt(3, restaurant.getDeliveryTime());
			ps.setString(4, restaurant.getAddress());
			ps.setDouble(5, restaurant.getRating());
			ps.setBoolean(6, restaurant.isActive());
			ps.setString(7, restaurant.getImagePath());

			ps.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {

		Restaurant restaurant=null;

		try(Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(GET_BY_ID)) {

			ps.setInt(1, restaurantId);

			ResultSet rs=ps.executeQuery();

			if(rs.next()) {

				restaurant=new Restaurant();

				restaurant.setRestaurantId(rs.getInt("restaurantId"));
				restaurant.setName(rs.getString("name"));
				restaurant.setCuisineType(rs.getString("cuisineType"));
				restaurant.setDeliveryTime(rs.getInt("deliveryTime"));
				restaurant.setAddress(rs.getString("address"));
				restaurant.setRating(rs.getDouble("rating"));
				restaurant.setActive(rs.getBoolean("isActive"));
				restaurant.setImagePath(rs.getString("imagePath"));
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return restaurant;
	}

	@Override
	public List<Restaurant> getAllRestaurants() {

		List<Restaurant> list=new ArrayList<>();

		try(Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(GET_ALL)) {

			ResultSet rs=ps.executeQuery();

			while(rs.next()) {

				Restaurant restaurant=new Restaurant();

				restaurant.setRestaurantId(rs.getInt("restaurantId"));
				restaurant.setName(rs.getString("name"));
				restaurant.setCuisineType(rs.getString("cuisineType"));
				restaurant.setDeliveryTime(rs.getInt("deliveryTime"));
				restaurant.setAddress(rs.getString("address"));
				restaurant.setRating(rs.getDouble("rating"));
				restaurant.setActive(rs.getBoolean("isActive"));
				restaurant.setImagePath(rs.getString("imagePath"));

				list.add(restaurant);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {

		try(Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(UPDATE)) {

			ps.setString(1, restaurant.getName());
			ps.setString(2, restaurant.getCuisineType());
			ps.setInt(3, restaurant.getDeliveryTime());
			ps.setString(4, restaurant.getAddress());
			ps.setDouble(5, restaurant.getRating());
			ps.setBoolean(6, restaurant.isActive());
			ps.setString(7, restaurant.getImagePath());
			ps.setInt(8, restaurant.getRestaurantId());

			ps.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRestaurant(int restaurantId) {

		try(Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(DELETE)) {

			ps.setInt(1, restaurantId);

			ps.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<Restaurant> searchRestaurant(String keyword) {

	    List<Restaurant> list = new ArrayList<>();

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(SEARCH)) {

	        ps.setString(1, "%" + keyword + "%");

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {

	            Restaurant restaurant = new Restaurant();

	            restaurant.setRestaurantId(rs.getInt("restaurantId"));
	            restaurant.setName(rs.getString("name"));
	            restaurant.setCuisineType(rs.getString("cuisineType"));
	            restaurant.setDeliveryTime(rs.getInt("deliveryTime"));
	            restaurant.setAddress(rs.getString("address"));
	            restaurant.setRating(rs.getDouble("rating"));
	            restaurant.setActive(rs.getBoolean("isActive"));
	            restaurant.setImagePath(rs.getString("imagePath"));

	            list.add(restaurant);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
}