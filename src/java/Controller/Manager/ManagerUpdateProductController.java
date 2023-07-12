/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Manager;

import Dal.CategoriesDAO;
import Dal.ManagerDAO;
import Model.Products;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ManagerUpdateProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ManagerDAO dao = new ManagerDAO();
//        HttpSession session = req.getSession();
//        User user = (User) session.getAttribute("user");
//        if (user != null) {
        String id = req.getParameter("id");
        Products p = dao.getProductsByID(id);
        CategoriesDAO ca = new CategoriesDAO();
        req.setAttribute("categoriesList", ca.GetCategoriesList());
        req.setAttribute("o", p);
        req.getRequestDispatcher("editproduct.jsp").forward(req, resp);
//        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ManagerDAO dao = new ManagerDAO();
        String id = req.getParameter("pid");
        CategoriesDAO ca = new CategoriesDAO();
        req.setAttribute("categoriesList", ca.GetCategoriesList());

        String Cid = req.getParameter("category");
        String Name = req.getParameter("name");
        String Desciption = req.getParameter("description");
        String Image = req.getParameter("image");
        String Image2 = req.getParameter("image2");
        String Image3 = req.getParameter("image3");
        String Price = req.getParameter("price");
        String Quantity = req.getParameter("quantity");
        String Status = req.getParameter("status");
        dao.updateProduct(Cid, Name, Desciption, Image, Image2, Image3, Quantity, Status, Price, id);
        Products p = dao.getProductsByID(id);
        req.setAttribute("o", p);
        req.setAttribute("successText", "Update Successful!!!");

        req.getRequestDispatcher("editproduct.jsp").forward(req, resp);

    }

}
