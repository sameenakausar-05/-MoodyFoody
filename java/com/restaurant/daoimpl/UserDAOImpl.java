package com.restaurant.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.restaurant.dao.UserDAO;
import com.restaurant.model.User;
import com.restaurant.util.DBConnection;

public class UserDAOImpl implements UserDAO {

	private static final String INSERT_USER =
			"INSERT INTO `User`(Username,Password,Email,Address,Role) VALUES(?,?,?,?,?)";
	
    private static final String GET_USER =
            "SELECT * FROM User WHERE email=?";
    private static final String GET_USER_BY_EMAIL =
            "SELECT * FROM `User` WHERE Email=?";
    private static final String UPDATE_USER =
            "UPDATE User SET Username=?, Email=?, Address=? WHERE UserID=?";
    
    private static final String GET_USER_BY_ID =
            "SELECT * FROM User WHERE UserID=?";

    @Override
    public boolean addUser(User user) {

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(INSERT_USER)
        ) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getRole());

            int rows = ps.executeUpdate();

            System.out.println("Rows inserted = " + rows);

            return rows > 0;
            
            

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
    @Override
    public User getUserByEmail(String email) {

        User user = null;

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(GET_USER_BY_EMAIL)
        ) {

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("Email"));
                user.setAddress(rs.getString("Address"));
                user.setRole(rs.getString("Role"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    @Override
    public boolean updateUser(User user) {

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(UPDATE_USER)
        ) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getAddress());
            ps.setInt(4, user.getUserId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
    @Override
    public User getUserById(int userId) {

        User user = null;

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(GET_USER_BY_ID)
        ) {

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("Email"));
                user.setAddress(rs.getString("Address"));
                user.setRole(rs.getString("Role"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}