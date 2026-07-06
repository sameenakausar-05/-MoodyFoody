package com.restaurant.model;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items;

    public Cart() {
        items = new LinkedHashMap<>();
    }

    public void addItem(Menu menu) {

        int menuId = menu.getMenuId();

        if(items.containsKey(menuId)) {

            CartItem item = items.get(menuId);
            item.setQuantity(item.getQuantity() + 1);

        } else {

            items.put(menuId, new CartItem(menu, 1));
        }
    }

    public void updateItem(int menuId, int quantity) {

        if(items.containsKey(menuId)) {

            if(quantity <= 0) {
                items.remove(menuId);
            } else {
                items.get(menuId).setQuantity(quantity);
            }
        }
    }

    public void removeItem(int menuId) {
        items.remove(menuId);
    }

    public Collection<CartItem> getItems() {
        return items.values();
    }

    public double getTotalAmount() {

        double total = 0;

        for(CartItem item : items.values()) {
            total += item.getTotalPrice();
        }

        return total;
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }

    public void clearCart() {
        items.clear();
    }
    public int getRestaurantId() {

        if(items.isEmpty()) {
            return 0;
        }

        return items.values()
                    .iterator()
                    .next()
                    .getMenu()
                    .getRestaurantId();
    }
}