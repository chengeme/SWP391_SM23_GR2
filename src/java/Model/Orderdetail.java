/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author PC
 */
public class Orderdetail {

    private String orderdetailID, orderdetail_orderID, quantity, price, orderdetail_productID, product_rate;
    private User user;

    public Orderdetail() {
    }

    public Orderdetail(String orderdetailID, String orderdetail_orderID, String quantity, String price, String orderdetail_productID, String product_rate) {
        this.orderdetailID = orderdetailID;
        this.orderdetail_orderID = orderdetail_orderID;
        this.quantity = quantity;
        this.price = price;
        this.orderdetail_productID = orderdetail_productID;
        this.product_rate = product_rate;
    }

    public Orderdetail(String orderdetailID, String orderdetail_orderID, String quantity, String price, String orderdetail_productID) {
        this.orderdetailID = orderdetailID;
        this.orderdetail_orderID = orderdetail_orderID;
        this.quantity = quantity;
        this.price = price;
        this.orderdetail_productID = orderdetail_productID;
    }

    public Orderdetail(String orderdetail_orderID, String quantity, String price, String orderdetail_productID) {
        this.orderdetail_orderID = orderdetail_orderID;
        this.quantity = quantity;
        this.price = price;
        this.orderdetail_productID = orderdetail_productID;
    }

    public String getOrderdetailID() {
        return orderdetailID;
    }

    public void setOrderdetailID(String orderdetailID) {
        this.orderdetailID = orderdetailID;
    }

    public String getOrderdetail_orderID() {
        return orderdetail_orderID;
    }

    public void setOrderdetail_orderID(String orderdetail_orderID) {
        this.orderdetail_orderID = orderdetail_orderID;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getOrderdetail_productID() {
        return orderdetail_productID;
    }

    public void setOrderdetail_productID(String orderdetail_productID) {
        this.orderdetail_productID = orderdetail_productID;
    }

    public String getProduct_rate() {
        return product_rate;
    }

    public void setProduct_rate(String product_rate) {
        this.product_rate = product_rate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Orderdetail{" + "orderdetailID=" + orderdetailID + ", orderdetail_orderID=" + orderdetail_orderID + ", quantity=" + quantity + ", price=" + price + ", orderdetail_productID=" + orderdetail_productID + ", product_rate=" + product_rate + ", user=" + user + '}';
    }

}
