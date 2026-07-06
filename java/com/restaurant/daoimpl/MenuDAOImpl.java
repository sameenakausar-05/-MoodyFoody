package com.restaurant.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.dao.MenuDAO;
import com.restaurant.model.Menu;
import com.restaurant.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    private static final String INSERT =
            "INSERT INTO Menu(RestaurantID, ItemName, Description, Price, IsAvailable, ImagePath) VALUES(?,?,?,?,?,?)";

    private static final String GET_BY_ID =
            "SELECT * FROM Menu WHERE MenuID=?";

    private static final String GET_ALL =
            "SELECT * FROM Menu";

    private static final String GET_BY_RESTAURANT =
            "SELECT * FROM Menu WHERE RestaurantID=?";

    private static final String UPDATE =
            "UPDATE Menu SET ItemName=?, Description=?, Price=?, IsAvailable=?, ImagePath=? WHERE MenuID=?";

    private static final String DELETE =
            "DELETE FROM Menu WHERE MenuID=?";

    @Override
    public void addMenu(Menu menu) {

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(INSERT)) {

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setBoolean(5, menu.isAvailable());
            ps.setString(6, menu.getImagePath());

            ps.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Menu getMenu(int menuId) {

        Menu menu = null;

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(GET_BY_ID)) {

            ps.setInt(1, menuId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                menu = new Menu();

                menu.setMenuId(rs.getInt("MenuID"));
                menu.setRestaurantId(rs.getInt("RestaurantID"));
                menu.setItemName(rs.getString("ItemName"));
                menu.setDescription(rs.getString("Description"));
                menu.setPrice(rs.getDouble("Price"));
                menu.setAvailable(rs.getBoolean("IsAvailable"));
                menu.setImagePath(rs.getString("ImagePath"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menu;
    }

    @Override
    public List<Menu> getAllMenus() {

        List<Menu> menus = new ArrayList<>();

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(GET_ALL)) {

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("MenuID"));
                menu.setRestaurantId(rs.getInt("RestaurantID"));
                menu.setItemName(rs.getString("ItemName"));
                menu.setDescription(rs.getString("Description"));
                menu.setPrice(rs.getDouble("Price"));
                menu.setAvailable(rs.getBoolean("IsAvailable"));
                menu.setImagePath(rs.getString("ImagePath"));

                menus.add(menu);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menus;
    }

    @Override
    public List<Menu> getMenusByRestaurant(int restaurantId) {

        List<Menu> menus = new ArrayList<>();

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(GET_BY_RESTAURANT)) {

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("MenuID"));
                menu.setRestaurantId(rs.getInt("RestaurantID"));
                menu.setItemName(rs.getString("ItemName"));
                menu.setDescription(rs.getString("Description"));
                menu.setPrice(rs.getDouble("Price"));
                menu.setAvailable(rs.getBoolean("IsAvailable"));
                menu.setImagePath(rs.getString("ImagePath"));

                menus.add(menu);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menus;
    }

    @Override
    public void updateMenu(Menu menu) {

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(UPDATE)) {

            ps.setString(1, menu.getItemName());
            ps.setString(2, menu.getDescription());
            ps.setDouble(3, menu.getPrice());
            ps.setBoolean(4, menu.isAvailable());
            ps.setString(5, menu.getImagePath());
            ps.setInt(6, menu.getMenuId());

            ps.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMenu(int menuId) {

        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(DELETE)) {

            ps.setInt(1, menuId);

            ps.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public Menu getMenuById(int menuId) {

        Menu menu = null;

        String query = "SELECT * FROM Menu WHERE MenuID=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query)
        ) {

            ps.setInt(1, menuId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                menu = new Menu();

                menu.setMenuId(rs.getInt("MenuID"));
                menu.setRestaurantId(rs.getInt("RestaurantID"));
                menu.setItemName(rs.getString("ItemName"));
                menu.setDescription(rs.getString("Description"));
                menu.setPrice(rs.getDouble("Price"));
                menu.setAvailable(rs.getBoolean("IsAvailable"));
                menu.setImagePath(rs.getString("ImagePath"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menu;
    }
    
}