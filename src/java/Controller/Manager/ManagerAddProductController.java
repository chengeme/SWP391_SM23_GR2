/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Manager;

import Dal.CategoriesDAO;
import Dal.ManagerDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;

public class ManagerAddProductController extends HttpServlet {

    ManagerDAO dao = new ManagerDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
//        HttpSession session = req.getSession();
//        if (session.getAttribute("user") == null) {
//            req.getRequestDispatcher("/view/homepage.jsp").forward(req, resp);
//        }
        CategoriesDAO ca = new CategoriesDAO();
        req.setAttribute("categoriesList", ca.GetCategoriesList());
        req.getRequestDispatcher("addproduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String Cid = req.getParameter("category");
        String Name = req.getParameter("name");
        String Desciption = req.getParameter("mota");
        String Image1 = req.getParameter("image");
        String Image2 = req.getParameter("image2");
        String Image3 = req.getParameter("image3");
        String Price = req.getParameter("price");
        String Quantity = req.getParameter("quantity");
        String Status = req.getParameter("status");
        dao.addNewProduct(Cid, Name, Desciption, Image1, Image2, Image3, Quantity, Status, Price);

        req.setAttribute("name", Name);
        req.setAttribute("price", Price);
        req.setAttribute("image", Image1);
        req.setAttribute("image2", Image2);
        req.setAttribute("image3", Image3);
        req.setAttribute("category", Cid);
        req.setAttribute("mota", Desciption);
        req.setAttribute("quantity", Quantity);
        req.setAttribute("status", Status);
        
        req.setAttribute("successText", "Add Successful!!!");
        req.getRequestDispatcher("addproduct.jsp").forward(req, resp);
    }

}
