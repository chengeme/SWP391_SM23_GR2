package Dal;

import java.text.NumberFormat;
import java.util.Locale;
import Model.Categories;
import Model.Products;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

/**
 *
 * @author DucPhaoLo
 */
public class ProductDAO extends ConnectMySQL {

    public ArrayList<Products> getProductListByCategoryIDAndNameAndSort(String categoryID, String Name, String sortOrder) {
        ArrayList<Products> data = new ArrayList<>();
        try {
            String sqlSelectString = "";
            if (categoryID == null || categoryID.isEmpty()) {
                if (sortOrder.equals("rate")) {
                    sqlSelectString = "select p.ProductID, p.product_categoryID, p.name, p.desciption, p.picture, p.price, p.quantity, p.status,coalesce( p.sale,0) 'sale',\n"
                            + "COALESCE(sum(product_rate)/count(product_rate) ,0) 'rate',COALESCE(p.price-p.price*p.sale/100,p.price) 'saleprice',picture2,picture3\n"
                            + "from swp.orderdetail od right outer join swp.product p\n"
                            + "on p.ProductID=od.orderdetail_productID where p.name like '%" + Name + "%' \n"
                            + "group by productid order by rate desc";
                } else if (sortOrder.equals("ascendingSalePrice")) {
                    sqlSelectString = "select p.ProductID, p.product_categoryID, p.name, p.desciption, p.picture, p.price, p.quantity, p.status,coalesce( p.sale,0) 'sale',\n"
                            + "COALESCE(sum(product_rate)/count(product_rate) ,0) 'rate',COALESCE(p.price-p.price*p.sale/100,p.price) 'saleprice',picture2,picture3\n"
                            + "from swp.orderdetail od right outer join swp.product p\n"
                            + "on p.ProductID=od.orderdetail_productID where p.name like '%" + Name + "%'\n"
                            + "group by productid order by SalePrice asc";
                } else if (sortOrder.equals("descendingSalePrice")) {
                    sqlSelectString = "select p.ProductID, p.product_categoryID, p.name, p.desciption, p.picture, p.price, p.quantity, p.status,coalesce( p.sale,0) 'sale',\n"
                            + "COALESCE(sum(product_rate)/count(product_rate) ,0) 'rate',COALESCE(p.price-p.price*p.sale/100,p.price) 'saleprice',picture2,picture3\n"
                            + "from swp.orderdetail od right outer join swp.product p\n"
                            + "on p.ProductID=od.orderdetail_productID where p.name like '%" + Name + "%'\n"
                            + "group by productid order by SalePrice desc";
                }
            } else {
                if (sortOrder.equals("rate")) {
                    sqlSelectString = "select p.ProductID, p.product_categoryID, p.name, p.desciption, p.picture, p.price, p.quantity, p.status,coalesce( p.sale,0) 'sale',\n"
                            + "COALESCE(sum(product_rate)/count(product_rate) ,0) 'rate',COALESCE(p.price-p.price*p.sale/100,p.price) 'saleprice',picture2,picture3\n"
                            + "from swp.orderdetail od right outer join swp.product p\n"
                            + "on p.ProductID=od.orderdetail_productID where product_categoryID=? and p.name like '%" + Name + "%'\n"
                            + "group by productid order by rate desc ";
                } else if (sortOrder.equals("ascendingSalePrice")) {
                    sqlSelectString = "select p.ProductID, p.product_categoryID, p.name, p.desciption, p.picture, p.price, p.quantity, p.status,coalesce( p.sale,0) 'sale',\n"
                            + "COALESCE(sum(product_rate)/count(product_rate) ,0) 'rate',COALESCE(p.price-p.price*p.sale/100,p.price) 'saleprice',picture2,picture3\n"
                            + "from swp.orderdetail od right outer join swp.product p\n"
                            + "on p.ProductID=od.orderdetail_productID where product_categoryID=? and p.name like '%" + Name + "%'\n"
                            + "group by productid order by SalePrice asc ";
                } else if (sortOrder.equals("descendingSalePrice")) {
                    sqlSelectString = "select p.ProductID, p.product_categoryID, p.name, p.desciption, p.picture, p.price, p.quantity, p.status,coalesce( p.sale,0) 'sale',\n"
                            + "COALESCE(sum(product_rate)/count(product_rate) ,0) 'rate',COALESCE(p.price-p.price*p.sale/100,p.price) 'saleprice',picture2,picture3\n"
                            + "from swp.orderdetail od right outer join swp.product p\n"
                            + "on p.ProductID=od.orderdetail_productID where product_categoryID=? and p.name like '%" + Name + "%'\n"
                            + "group by productid order by SalePrice desc ";
                }
            }
//            DecimalFormat decimalFormat = new DecimalFormat("#");
            DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getInstance(Locale.getDefault());
            decimalFormat.applyPattern("#,###");
//            String formattedNumber = decimalFormat.format(number);
            pstm = connection.prepareStatement(sqlSelectString);
            if (categoryID != null && !categoryID.isEmpty()) {
                pstm.setInt(1, Integer.parseInt(categoryID));
            }
            rs = pstm.executeQuery();
            while (rs.next()) {
                String ProductID = String.valueOf(rs.getInt(1));
                String product_categoryID = String.valueOf(rs.getInt(2));
                String name = String.valueOf(rs.getString(3));
                String desciption = String.valueOf(rs.getString(4));
                String picture = String.valueOf(rs.getString(5));
                String price = String.valueOf(decimalFormat.format(rs.getFloat(6)));
                String quantity = String.valueOf(rs.getInt(7));
                String status = String.valueOf(rs.getInt(8));
                String sale = String.valueOf(decimalFormat.format(rs.getFloat(9)));
                String rateStar = String.valueOf(new DecimalFormat("#.0").format(rs.getFloat(10)));
                if (rs.getFloat(10) - (int) rs.getFloat(10) == 0) {
                    rateStar = String.valueOf(new DecimalFormat("#").format(rs.getFloat(10)));
                }
                String salePrice = String.valueOf(decimalFormat.format(rs.getDouble(11)));
                salePrice = salePrice.replaceAll(",", ".");
                String picture2 = String.valueOf(rs.getString(12));
                String picture3 = String.valueOf(rs.getString(13));
                data.add(new Products(ProductID, product_categoryID, name, desciption, picture, price, quantity, status, sale, rateStar, salePrice, picture2, picture3));
            }
        } catch (Exception e) {
            System.out.println("getProductListByCategoryIDAndNameAndSort: " + e);
        }
        return data;
    }

    public ArrayList<Products> BestSellerProducts() {
        ArrayList<Products> data = new ArrayList<>();

        CategoriesDAO categoriesDAO = new CategoriesDAO();
        DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getInstance(Locale.getDefault());
        decimalFormat.applyPattern("#,###");
        ArrayList<Categories> categoryIdList = categoriesDAO.GetCategoriesList();
        try {
            for (Categories c : categoryIdList) {
                ArrayList<String> productidList = new ArrayList<>();
                // find most rate productId
                String sqlSelect = "select p.productid,coalesce(sum(product_rate)/count(product_rate),0) 'rate'  \n"
                        + "from swp.orderdetail od right outer join swp.product p\n"
                        + "on p.ProductID=od.orderdetail_productID where product_categoryID=?\n"
                        + "group by p.productid\n"
                        + "order by rate desc\n"
                        + "limit 2; ";
                pstm = connection.prepareStatement(sqlSelect);
                pstm.setInt(1, Integer.parseInt(c.getCategoryID()));
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String orderdetail_productid = String.valueOf(rs.getInt(1));
                    productidList.add(orderdetail_productid);
                }
                // maxrate productdetail
                int count = 0;
                while (count < productidList.size()) {
                    String sqlSelectString = "select p.ProductID, p.product_categoryID, p.name, p.desciption, p.picture, p.price, p.quantity, p.status,coalesce( p.sale,0) 'sale',\n"
                            + "COALESCE(sum(product_rate)/count(product_rate) ,0) 'rate',COALESCE(p.price-p.price*p.sale/100,p.price) 'saleprice',picture2,picture3\n"
                            + "from swp.orderdetail od right outer join swp.product p\n"
                            + "on p.ProductID=od.orderdetail_productID where p.ProductID=? -- where product_categoryID='1'\n"
                            + "group by productid ";
                    pstm = connection.prepareStatement(sqlSelectString);
                    pstm.setInt(1, Integer.parseInt(productidList.get(count)));
                    rs = pstm.executeQuery();
                    while (rs.next()) {
                        String ProductID = String.valueOf(rs.getInt(1));
                        String product_categoryID = String.valueOf(rs.getInt(2));
                        String name = String.valueOf(rs.getString(3));
                        String desciption = String.valueOf(rs.getString(4));
                        String picture = String.valueOf(rs.getString(5));
                        String price = String.valueOf(decimalFormat.format(rs.getFloat(6)));
                        String quantity = String.valueOf(rs.getInt(7));
                        String status = String.valueOf(rs.getInt(8));
                        String sale = String.valueOf(decimalFormat.format(rs.getFloat(9)));
                        String rateStar = String.valueOf(new DecimalFormat("#.0").format(rs.getFloat(10)));
                        if (rs.getFloat(10) - (int) rs.getFloat(10) == 0) {
                            rateStar = String.valueOf(new DecimalFormat("#").format(rs.getFloat(10)));
                        }
                        String salePrice = String.valueOf(decimalFormat.format(rs.getDouble(11)));
                        salePrice = salePrice.replaceAll(",", ".");
                        String picture2 = String.valueOf(rs.getString(12));
                        String picture3 = String.valueOf(rs.getString(13));
                        data.add(new Products(ProductID, product_categoryID, name, desciption, picture, price, quantity, status, sale, rateStar, salePrice, picture2, picture3));
                    }
                    ++count;
                }
            }
        } catch (Exception e) {
            System.out.println("BestSellerProductsByCategoryID: " + e);
        }
        return data;
    }
    
   public List<Products> searchProducts(String keyword) {
       
       List<Products> data = new ArrayList<>();
        try {
            String sqlSelect = "Select * from product where name like ?  ";
            pstm = connection.prepareStatement(sqlSelect);
              pstm.setString(1, "%" + keyword + "%");
             rs = pstm.executeQuery();
            while (rs.next()) {
                       Products p = new Products();
                       p.setProductID(String.valueOf(rs.getInt(1)));
                       String categories = String.valueOf(rs.getInt(2));
                       p.setProduct_categoryID(categories);
                       p.setName(String.valueOf(rs.getString(3)));
                       p.setDesciption(String.valueOf(rs.getString(4)));
                       p.setPicture( rs.getString(5));
                       p.setPicture2( rs.getString(6));
                       p.setPicture3( rs.getString(7));
                       p.setPrice(String.valueOf(rs.getFloat(8)));
                       p.setQuantity(String.valueOf(rs.getInt(9)));
                       p.setStatus(String.valueOf(rs.getInt(10)));
                       p.setDate(String.valueOf(rs.getDate(12)));
                       p.setCategories(new CategoriesDAO().getCategoryById(categories));
                       data.add(p);
                    }          
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return data;
   }
    public Products getProductsByID(String id) {
       
        try {
            String sqlSelect = "Select * from product where ProductID="+ id;
            pstm = connection.prepareStatement(sqlSelect);
             rs = pstm.executeQuery();
            if (rs.next()) {
                       Products p = new Products();
                       p.setProductID(String.valueOf(rs.getInt(1)));
                       String categories = String.valueOf(rs.getInt(2));
                       p.setProduct_categoryID(categories);
                       
                       p.setName(String.valueOf(rs.getString(3)));
                       p.setDesciption(String.valueOf(rs.getString(4)));
                       p.setPicture( rs.getString(5));
                       p.setPicture2( rs.getString(6));
                       p.setPicture3( rs.getString(7));
                       p.setPrice(String.valueOf(rs.getFloat(8)));
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
    public void updateProduct(Products p){
        try {
            String sql = "UPDATE product\n" +
                    "SET product_categoryID=?,name=?,desciption=?,picture=?,picture2=?,picture3=?,price=?,quantity=?,status=?\n" +
                    "WHERE productID=?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(p.getProduct_categoryID()));
            stm.setString(2, p.getName());
            stm.setString(3, p.getDesciption());
            stm.setString(4, p.getPicture());
            stm.setString(5, p.getPicture2());
            stm.setString(6, p.getPicture3());
            stm.setFloat(7, Float.parseFloat(p.getPrice()) );
            stm.setInt(8, Integer.parseInt(p.getQuantity()));
            stm.setBoolean(9, p.getStatus().equals("1"));
            stm.setInt(10, Integer.parseInt(p.getProductID()));
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void addNewProduct(Products p){
        try {
            String sql ="INSERT INTO swp.`product` "
                    + "(product_categoryID, name, desciption, picture, picture2, picture3, price, quantity, status) "
                    + "VALUES\n" +
                    " (?, ?, ?, ?, ?, \n" +
                    "?, ?, ?, ?);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Integer.parseInt(p.getProduct_categoryID()));
            stm.setString(2, p.getName());
            stm.setString(3, p.getDesciption());
            stm.setString(4, p.getPicture());
            stm.setString(5, p.getPicture2());
            stm.setString(6, p.getPicture3());
            stm.setFloat(7, Float.parseFloat(p.getPrice()) );
            stm.setInt(8, Integer.parseInt(p.getQuantity()));
            stm.setBoolean(9, p.getStatus().equals("1"));
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

    public ArrayList<Products> getProductListByType(String type) {
        ArrayList<Products> data = new ArrayList<>();
        try {
            String sqlSelectString;
            if (type.equals("HighPrice")) {
                sqlSelectString = "select p.ProductID, p.product_categoryID, p.name, p.desciption, p.picture, p.price, p.quantity, p.status,coalesce( p.sale,0) 'sale',\n"
                        + "COALESCE(sum(product_rate)/count(product_rate) ,0) 'rate',COALESCE(p.price-p.price*p.sale/100,p.price) 'saleprice',picture2,picture3\n"
                        + "from swp.earphone e, swp.orderdetail od right outer join swp.product p \n"
                        + "on p.ProductID=od.orderdetail_productID  where e.earphone_ProductID=p.ProductID and COALESCE(p.price-p.price*p.sale/100,p.price) >'1000000'\n"
                        + "group by productid ,e.type\n"
                        + "order by rate desc;";
            } else {
                sqlSelectString = "select p.ProductID, p.product_categoryID, p.name, p.desciption, p.picture, p.price, p.quantity, p.status,coalesce( p.sale,0) 'sale',\n"
                        + "COALESCE(sum(product_rate)/count(product_rate) ,0) 'rate',COALESCE(p.price-p.price*p.sale/100,p.price) 'saleprice',picture2,picture3\n"
                        + "from swp.earphone e, swp.orderdetail od right outer join swp.product p \n"
                        + "on p.ProductID=od.orderdetail_productID  where e.earphone_ProductID=p.ProductID and e.type=?\n"
                        + "group by productid ,e.type\n"
                        + "order by rate desc;";
            }
            DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getInstance(Locale.getDefault());
            decimalFormat.applyPattern("#,###");
            pstm = connection.prepareStatement(sqlSelectString);
            if (!type.equals("HighPrice")) {
                pstm.setString(1, type);
            }
            rs = pstm.executeQuery();
            while (rs.next()) {
                String ProductID = String.valueOf(rs.getInt(1));
                String product_categoryID = String.valueOf(rs.getInt(2));
                String name = String.valueOf(rs.getString(3));
                String desciption = String.valueOf(rs.getString(4));
                String picture = String.valueOf(rs.getString(5));
                String price = String.valueOf(decimalFormat.format(rs.getFloat(6)));
                String quantity = String.valueOf(rs.getInt(7));
                String status = String.valueOf(rs.getInt(8));
                String sale = String.valueOf(decimalFormat.format(rs.getFloat(9)));
                String rateStar = String.valueOf(new DecimalFormat("#.0").format(rs.getFloat(10)));
                if (rs.getFloat(10) - (int) rs.getFloat(10) == 0) {
                    rateStar = String.valueOf(new DecimalFormat("#").format(rs.getFloat(10)));
                }
                String salePrice = String.valueOf(decimalFormat.format(rs.getDouble(11)));
                salePrice = salePrice.replaceAll(",", ".");
                String picture2 = String.valueOf(rs.getString(12));
                String picture3 = String.valueOf(rs.getString(13));
                data.add(new Products(ProductID, product_categoryID, name, desciption, picture, price, quantity, status, sale, rateStar, salePrice, picture2, picture3));
            }
        } catch (Exception e) {
            System.out.println("getProductListByType: " + e);
        }
        return data;
    }

//    public int getProductAmount(String ProductID) {
//        try {
//            String sqlSelect = "select quantity from product where ProductID=? ;";
//            pstm = connection.prepareStatement(sqlSelect);
//            pstm.setInt(1, Integer.parseInt(ProductID));
//            rs = pstm.executeQuery();
//            while (rs.next()) {
//                return rs.getInt(1);
//            }
//        } catch (Exception e) {
//            System.out.println("getProductAmount: " + e);
//        }
//        return 0;
//    }

    public Products getProductByID(String productID) {
        try {
            String sqlSelect = "select p.ProductID, p.product_categoryID, p.name, p.desciption, p.picture, p.price, p.quantity, p.status,coalesce( p.sale,0) 'sale',\n"
                    + "COALESCE(sum(product_rate)/count(product_rate) ,0) 'rate',COALESCE(p.price-p.price*p.sale/100,p.price) 'saleprice',picture2,picture3\n"
                    + "from swp.orderdetail od right outer join swp.product p\n"
                    + "on p.ProductID=od.orderdetail_productID where p.ProductID=? \n"
                    + "group by productid ";
            pstm = connection.prepareStatement(sqlSelect);
            pstm.setInt(1, Integer.parseInt(productID));
            rs = pstm.executeQuery();
            while (rs.next()) {
                String ProductID = String.valueOf(rs.getInt(1));
                String product_categoryID = String.valueOf(rs.getInt(2));
                String name = String.valueOf(rs.getString(3));
                String desciption = String.valueOf(rs.getString(4));
                String picture = String.valueOf(rs.getString(5));
                String price = String.valueOf((rs.getFloat(6)));
                String quantity = String.valueOf(rs.getInt(7));
                String status = String.valueOf(rs.getInt(8));
                String sale = String.valueOf((rs.getFloat(9)));
                String rateStar = String.valueOf(new DecimalFormat("#.0").format(rs.getFloat(10)));
                if (rs.getFloat(10) - (int) rs.getFloat(10) == 0) {
                    rateStar = String.valueOf(new DecimalFormat("#").format(rs.getFloat(10)));
                }
                String salePrice = String.valueOf((rs.getDouble(11)));
                salePrice = salePrice.replaceAll(",", ".");
                String picture2 = String.valueOf(rs.getString(12));
                String picture3 = String.valueOf(rs.getString(13));
                Products p = new Products(ProductID, product_categoryID, name, desciption, picture, price, quantity, status, sale, rateStar, salePrice, picture2, picture3);
                return p;
            }
        } catch (Exception e) {
            System.out.println("getProductByID: " + e);
        }
        return null;
    }
    public boolean decreaseProductAmount(String productID, String quantity) {
        try {   
            Products p = getProductByID(productID);
            String sqlSelect = "update product set quantity =?  where productid =?;";
            pstm = connection.prepareStatement(sqlSelect);
            pstm.setInt(1, Integer.parseInt(p.getQuantity())- Integer.parseInt(quantity));
            pstm.setInt(2, Integer.parseInt(productID));
            pstm.execute();
            return true;
        } catch (Exception e) {
            System.out.println("decreaseProductAmount: " + e);
        }
        return false;
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        
        for(Products p  :productDAO.searchProducts("")){
            System.out.println(p.getCategories().getName());
            
        }
 //         System.out.println(productDAO.getProductsByID("1").getName());
//            
//        for (Products p : productDAO.getProductListByCategoryIDAndSort("", "descendingSalePrice")) {
//            System.out.println("productid: " + p.getProductID() + " ");
//            System.out.println("categoriID: " + p.getProduct_categoryID()+ " ");
//            System.out.println("Name: " + p.getName() + " ");
//            System.out.println("Description: " + p.getDesciption()+ " ");
//            System.out.println("picture: " + p.getPicture()+ " ");
//            System.out.println("picture2: " + p.getPicture2()+ " ");
//            System.out.println("picture3: " + p.getPicture3()+ " ");
//            System.out.println("price: " + p.getPrice() + " ");
//            System.out.println("quantity: " + p.getQuantity()+ " ");
//            System.out.println("status: " + p.getStatus()+ " ");
//            System.out.println("sale: " + p.getSale() + " ");
//            System.out.println("rateStar: " + p.getRateStar() + " ");
//            System.out.println("saleprice: " + p.getSalePrice() + " ");
//            System.out.println("");
//        }

//        for (Products p : productDAO.BestSellerProducts()) {
//            if (p.getProductID().equals("1")) {
//
//                System.out.print("productid: " + p.getProductID() + " ");
//                System.out.print("productName: " + p.getName() + " ");
////            System.out.print("price: " + p.getPrice() + " ");
//                System.out.println("picture: " + p.getPicture());
//            }
////            System.out.print("sale: " + p.getSale() + " ");
////            System.out.print("rateStar: " + p.getRateStar() + " ");
////            System.out.print("saleprice: " + p.getSalePrice() + " ");
//            System.out.println("");
//        }
//        String linkImage1 = productDAO.imageLink();
//        System.out.println(linkImage1);
//        DecimalFormat decimalFormat = (DecimalFormat) NumberFormat.getInstance(Locale.getDefault());
//        decimalFormat.applyPattern("#,###");
//        double x = 123.1;
//        double y = 2.3;
//        String s = decimalFormat.format(x + y);
//        System.out.println("s: " + s);
//        double x = 3.44;
//        System.out.println(new DecimalFormat("#.0").format(x));
//        for (Products p : productDAO.getProductListByType("wired")) {
//            System.out.println("productid: " + p.getProductID() + " ");
//            System.out.println("categoriID: " + p.getProduct_categoryID() + " ");
//            System.out.println("Name: " + p.getName() + " ");
//            System.out.println("Description: " + p.getDesciption() + " ");
//            System.out.println("picture: " + p.getPicture() + " ");
//            System.out.println("picture2: " + p.getPicture2() + " ");
//            System.out.println("picture3: " + p.getPicture3() + " ");
//            System.out.println("price: " + p.getPrice() + " ");
//            System.out.println("quantity: " + p.getQuantity() + " ");
//            System.out.println("status: " + p.getStatus() + " ");
//            System.out.println("sale: " + p.getSale() + " ");
//            System.out.println("rateStar: " + p.getRateStar() + " ");
//            System.out.println("saleprice: " + p.getSalePrice() + " ");
//            System.out.println("");
//        }
    }

}
