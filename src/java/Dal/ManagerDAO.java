/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.DetailOrder;
import Model.Feedback;
import Model.Order;
import Model.Orderdetail;
import Model.Products;
import Model.User;
import java.sql.Array;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

/**
 *
 * @author laptop
 */
public class ManagerDAO extends ConnectMySQL {

    private ArrayList<Products> product;
    private ArrayList<Order> order;
    private ArrayList<Feedback> feedback;

    public ManagerDAO() {
    }

    public ArrayList<Products> getProduct() {
        return product;
    }

    public void setProduct(ArrayList<Products> product) {
        this.product = product;
    }

    public ArrayList<Order> getOrder() {
        return order;
    }

    public void setOrder(ArrayList<Order> order) {
        this.order = order;
    }

    public ArrayList<Feedback> getFeedback() {
        return feedback;
    }

    public void setFeedback(ArrayList<Feedback> feedback) {
        this.feedback = feedback;
    }

    //PRODUCT MANAGER
    public ArrayList<Products> getAllProduct() {
        product = new ArrayList<>();
        String sql = "SELECT * FROM swp.product;";
        try {
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getInstance(Locale.getDefault());
            decimalFormat.applyPattern("#,###");
            while (rs.next()) {
                String ProductID = String.valueOf(rs.getInt(1));
                String product_categoryID = String.valueOf(rs.getInt(2));
                String name = String.valueOf(rs.getString(3));
                String desciption = String.valueOf(rs.getString(4));
                String picture = String.valueOf(rs.getString(5));
                String picture2 = String.valueOf(rs.getString(6));
                String picture3 = String.valueOf(rs.getString(7));
                String price = String.valueOf(decimalFormat.format((int) rs.getFloat(8)));
                String quantity = String.valueOf(rs.getInt(9));
                String status = String.valueOf(rs.getInt(10));
                String date = String.valueOf(rs.getString(10));
                product.add(new Products(ProductID, product_categoryID, name, desciption, picture, price, quantity, status, picture2, picture3, date));
            }

        } catch (Exception e) {
            System.out.println("getAllProduct: " + e.getMessage());
        }
        return product;
    }

    public Products getProductsByID(String id) {
        try {
            String sqlSelect = "Select * from product where ProductID=" + id;
            pstm = connection.prepareStatement(sqlSelect);
            rs = pstm.executeQuery();
            DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getInstance(Locale.getDefault());
            decimalFormat.applyPattern("#,###");
            while (rs.next()) {
                Products p = new Products();
                p.setProductID(String.valueOf(rs.getInt(1)));
                String categories = String.valueOf(rs.getInt(2));
                p.setProduct_categoryID(categories);

                p.setName(String.valueOf(rs.getString(3)));
                p.setDesciption(String.valueOf(rs.getString(4)));
                p.setPicture(rs.getString(5));
                p.setPicture2(rs.getString(6));
                p.setPicture3(rs.getString(7));
                p.setPrice(String.valueOf(decimalFormat.format((int) rs.getFloat(8))));
                p.setQuantity(String.valueOf(rs.getInt(9)));
                p.setStatus(String.valueOf(rs.getInt(10)));
                p.setCategories(new CategoriesDAO().getCategoryById(categories));
                return p;
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }

    public void addNewProduct(String cid, String pname, String desciption, String img1, String img2, String img3, String quantity, String status, String price) {
        try {
            String sql = "insert into product (product_categoryID, name, desciption, picture, picture2, picture3, price, quantity, status)\n"
                    + "values (?, ?, ?, ?,?, ?, ?, ?, ?);";
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, Integer.parseInt(cid));
            pstm.setString(2, pname);
            pstm.setString(3, desciption);
            pstm.setString(4, img1);
            pstm.setString(5, img2);
            pstm.setString(6, img3);
            price = price.replace(",", "");
            pstm.setFloat(7, Float.parseFloat(price));
            pstm.setInt(8, Integer.parseInt(quantity));
            pstm.setBoolean(9, status.equals("1"));

            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("addNewProduct: " + e.getMessage());

        }
    }

    public void updateProduct(String cid, String pname, String desciption, String img1, String img2, String img3, String quantity, String status, String price, String pid) {
        try {
            String sql = "UPDATE product set product_categoryID=?, name=?, desciption=?,picture=?,picture2=?,picture3=?,\n"
                    + "price=?,quantity=?, status=? where ProductID = ?;";
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, Integer.parseInt(cid));
            pstm.setString(2, pname);
            pstm.setString(3, desciption);
            pstm.setString(4, img1);
            pstm.setString(5, img2);
            pstm.setString(6, img3);
            price = price.replace(",", "");
            pstm.setFloat(7, Float.parseFloat(price));
            pstm.setInt(8, Integer.parseInt(quantity));
            pstm.setInt(9, Integer.parseInt(status));
            pstm.setInt(10, Integer.parseInt(pid));

            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("updateProduct: " + e.getMessage());

        }
    }

    public void deleteProduct(String productID) {
        try {
            String sql = "delete from Product where ProductID=?;";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, productID);
            pstm.executeUpdate();

        } catch (Exception e) {
            System.out.println("deleteProduct: " + e.getMessage());

        }
    }

    //ORDER MANAGER
    public ArrayList<Order> getListOrder() {
        order = new ArrayList<>();
        String sql = "select o.*,u.name,od.price from swp.order o, swp.orderdetail od, swp.user u\n"
                + "where od.orderdetail_orderID=o.orderID and u.userID=o.order_userID ORDER BY date DESC;";
        DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getInstance(Locale.getDefault());
        decimalFormat.applyPattern("#,###");
        try {
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String orderID = String.valueOf(rs.getInt(1));
                String order_userID = String.valueOf(rs.getInt(2));
                String sale = String.valueOf(rs.getInt(3));
                String note = String.valueOf(rs.getString(4));
                String date = String.valueOf(rs.getTimestamp(5));
                String status = rs.getString(6);
                String name_user = rs.getString(7);
                String price_order = String.valueOf(decimalFormat.format((int) rs.getFloat(8)));
                order.add(new Order(orderID, order_userID, order_userID, note, date, status, name_user, price_order));
            }

        } catch (Exception e) {
            System.out.println("getListOrder: " + e.getMessage());
        }
        return order;
    }

    public Order getOrderByID(String id) {
        try {
            String sqlSelect = "SELECT * FROM swp.order where orderID=" + id;
            pstm = connection.prepareStatement(sqlSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String orderID = String.valueOf(rs.getInt(1));
                String order_userID = String.valueOf(rs.getInt(2));
                String sale = String.valueOf(rs.getInt(3));
                String note = String.valueOf(rs.getString(4));
                String date = String.valueOf(rs.getTimestamp(5));
                String status = rs.getString(6);
                String name_user = rs.getString(7);
                String price_order = String.valueOf(rs.getInt(8));
                return (new Order(orderID, order_userID, sale, note, date, status, name_user, price_order));
            }
        } catch (Exception e) {
            System.out.println("getOrderByID: " + e.getMessage());
        }

        return null;
    }

    public void addNewOrder(String date, String order_userID, String note, String order_salecodeID, String status) {
        try {
            String sql = "insert into swp.order ( date, order_userID, note, order_salecodeID, status)\n"
                    + "  values (?,?,?,?,?);";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, date);
            pstm.setString(2, order_userID);
            pstm.setString(3, note);
            pstm.setString(4, order_salecodeID);
            pstm.setString(5, status);

            pstm.executeUpdate();
        } catch (Exception e) {
            System.out.println("addNewOrder: " + e.getMessage());

        }
    }

    public ArrayList<User> getUserList() {
        ArrayList<User> data = new ArrayList<>();
        try {
            String sqlSelectString = "SELECT * FROM swp.user;";
            pstm = connection.prepareStatement(sqlSelectString);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String userID = String.valueOf(rs.getString(1));
                String name = String.valueOf(rs.getString(5));
                String address = String.valueOf(rs.getString(8));
                String phone_number = String.valueOf(rs.getInt(9));
                String email = String.valueOf(rs.getString(12));
                data.add(new User(userID, name, address, phone_number, email));
            }
        } catch (Exception e) {
            System.out.println("getUserList: " + e);
        }
        return data;
    }

    public User getUserById(String id) {
        try {
            String sqlSelectString = "SELECT * FROM swp.user where userID=?;";
            pstm = connection.prepareStatement(sqlSelectString);
            pstm.setInt(1, Integer.parseInt(id));
            rs = pstm.executeQuery();
            while (rs.next()) {
                String userID = String.valueOf(rs.getString(1));
                String name = String.valueOf(rs.getString(5));
                String address = String.valueOf(rs.getString(8));
                String phone_number = String.valueOf(rs.getInt(9));
                String email = String.valueOf(rs.getString(12));
                return new User(userID, name, address, phone_number, email);
            }
        } catch (Exception e) {
            System.out.println("getUserById: " + e);
        }
        return null;
    }

    
    //ORDER DETAIL
    public ArrayList<DetailOrder> getAllDetailOrderByOrderID(String id) {
        ArrayList<DetailOrder> data = new ArrayList<>();
        try {
            String sqlSelect = "SELECT  u.name, u.phone_number, u.address, od.orderdetail_orderID,\n"
                    + "od.orderdetail_productID, od.orderdetailID, od.price, od.quantity, p.name, p.price\n"
                    + "FROM swp.user u, swp.orderdetail od, swp.product p ,swp.order o \n"
                    + "WHERE u.userID = o.order_userID and od.orderdetail_orderID = o.orderID \n"
                    + "and p.ProductID = od.orderdetail_productID  and orderid =" + id;
            DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getInstance(Locale.getDefault());
            decimalFormat.applyPattern("#,###");
            pstm = connection.prepareStatement(sqlSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String name_user = rs.getString(1);
                String phone_number = rs.getString(2);
                String address = rs.getString(3);
                String orderdeatil_orderID = String.valueOf(rs.getInt(4));
                String orderdetail_productID = String.valueOf(rs.getInt(5));
                String orderdetailID = String.valueOf(rs.getInt(6));
                String price = String.valueOf(decimalFormat.format((int) (rs.getFloat(7))));
                System.out.println("price: " + price);
                String quantity = String.valueOf(rs.getInt(8));
                String name_product = rs.getString(9);
                String price_product = String.valueOf(decimalFormat.format((int) rs.getFloat(10)));
                data.add(new DetailOrder(name_user, phone_number, address, orderdetailID, orderdeatil_orderID,
                        quantity, price, orderdetail_productID, name_product, price_product));
            }
        } catch (Exception e) {
            System.out.println("getAllOrderDetailByOrderID: " + e.getMessage());
        }
        return data;
    }

    public ArrayList<DetailOrder> getOrderIDList() {
        ArrayList<DetailOrder> data = new ArrayList<>();
        try {
            String sqlSelect = "";
            DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getInstance(Locale.getDefault());
            decimalFormat.applyPattern("#,###");
            pstm = connection.prepareStatement(sqlSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String name_user = rs.getString(1);
                String phone_number = rs.getString(2);
                String address = rs.getString(3);
                String orderdeatil_orderID = String.valueOf(rs.getInt(4));
                String orderdetail_productID = String.valueOf(rs.getInt(5));
                String orderdetailID = String.valueOf(rs.getInt(6));
                String price = String.valueOf(decimalFormat.format((int) (rs.getFloat(7))));
                String quantity = String.valueOf(rs.getInt(8));
                String name_product = rs.getString(9);
                String price_product = String.valueOf(decimalFormat.format((int) rs.getFloat(10)));
                data.add(new DetailOrder(name_user, phone_number, address, orderdetailID, orderdeatil_orderID,
                        quantity, price, orderdetail_productID, name_product, price_product));
            }
        } catch (Exception e) {
            System.out.println("getAllOrderDetailByOrderID: " + e.getMessage());
        }
        return data;
    }

    
    //FEEDBACK
    public ArrayList<Feedback> getFeedbackList() {
        feedback = new ArrayList<>();
        try {
            String sqlSelectString = "select FeedbackID,f.FeedbackID_ProductID, feedbackID_userID, information,\n"
                    + "f.status, f.date, u.name,od.orderdetailID, p.name\n"
                    + "from feedback f,user u  ,orderdetail od  ,swp.order o, swp.product p \n"
                    + "where f.feedbackID_userID=u.userID  and u.userID=o.order_userID\n"
                    + "and o.orderID=od.orderdetail_orderID and f.orderdetailID=od.orderdetailID";
            pstm = connection.prepareStatement(sqlSelectString);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String FeedbackID = String.valueOf(rs.getInt(1));
                String FeedbackID_ProductID = String.valueOf(rs.getInt(2));
                String feedbackID_userID = String.valueOf(rs.getInt(3));
                String information = String.valueOf(rs.getString(4));
                String status = String.valueOf(rs.getString(5));
                String date = String.valueOf(rs.getTimestamp(6));
                String username = String.valueOf(rs.getString(7));
                String orderdetailID = String.valueOf(rs.getInt(8));
                String productName = String.valueOf(rs.getString(9));
                feedback.add(new Feedback(FeedbackID, FeedbackID_ProductID, feedbackID_userID, information,
                        status, date, username, orderdetailID, productName));
            }
        } catch (Exception e) {
            System.out.println("getFeedbackList: " + e);
        }
        return feedback;
    }

    
    //HOMEPAGE
    public int countProductByProductID() {
        int count = 0;
        try {
            String sqlSelectString = "SELECT count(ProductID) FROM swp.product;";
            pstm = connection.prepareStatement(sqlSelectString);
            rs = pstm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("countProductByProductID: " + e);
        }
        return count;
    }

    public int countOrder() {
        int count = 0;
        try {
            String sqlSelectString = "SELECT count(OrderID) FROM swp.order;";
            pstm = connection.prepareStatement(sqlSelectString);
            rs = pstm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("countOrder: " + e);
        }
        return count;
    }

    public ArrayList<Order> getNewOrder() {
        order = new ArrayList<>();
        String sql = "select o.*,u.name,od.price from swp.order o, swp.orderdetail od, swp.user u\n"
                + "where od.orderdetail_orderID=o.orderID and u.userID=o.order_userID ORDER BY date DESC LIMIT 5;";
        DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getInstance(Locale.getDefault());
        decimalFormat.applyPattern("#,###");
        try {
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String orderID = String.valueOf(rs.getInt(1));
                String order_userID = String.valueOf(rs.getInt(2));
                String sale = String.valueOf(rs.getInt(3));
                String note = String.valueOf(rs.getString(4));
                String date = String.valueOf(rs.getTimestamp(5));
                String status = rs.getString(6);
                String name_user = rs.getString(7);
                String price_order = String.valueOf(decimalFormat.format((int) rs.getFloat(8)));
                order.add(new Order(orderID, order_userID, order_userID, note, date, status, name_user, price_order));
            }

        } catch (Exception e) {
            System.out.println("getListOrder: " + e.getMessage());
        }
        return order;
    }

    public static void main(String[] args) {
        ManagerDAO dao = new ManagerDAO();

        System.out.println(dao.countProductByProductID());
        System.out.println(dao.countOrder());
    }
}
