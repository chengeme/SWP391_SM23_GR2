/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.View;

import Dal.CategoriesDAO;
import Dal.ProductDAO;
import Model.Categories;
import Model.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class EditProductController extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProductController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        Products p = productDAO.getProductsByID(id);
        if (p != null) {
            
            CategoriesDAO ca = new CategoriesDAO();
            request.setAttribute("categoriesList", ca.GetCategoriesList());
            request.setAttribute("p", p);
            request.getRequestDispatcher("addproduct.jsp").forward(request, response);
        } else {
            CategoriesDAO ca = new CategoriesDAO();
            request.setAttribute("categoriesList", ca.GetCategoriesList());
            request.getRequestDispatcher("addproduct.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        Products p = productDAO.getProductsByID(id);
        if (p != null) {
            String category = request.getParameter("category");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String image = request.getParameter("image");
            String image2 = request.getParameter("image2");
            String image3 = request.getParameter("image3");
            String quantity = request.getParameter("quantity");
            String price = request.getParameter("price");
            String status = request.getParameter("status");
            
            p.setProductID(id);
            p.setProduct_categoryID(category);
            p.setName(name);
            p.setDesciption(description);
            p.setPicture(image);
            p.setPicture2(image2);
            p.setPicture3(image3);
            p.setQuantity(quantity);
            p.setPrice(price);
            p.setStatus(status);
            productDAO.updateProduct(p);
            
        } 
        else {
            p = new Products();
            String category = request.getParameter("category");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String image = request.getParameter("image");
            String image2 = request.getParameter("image2");
            String image3 = request.getParameter("image3");
            String quantity = request.getParameter("quantity");
            String price = request.getParameter("price");
            String status = request.getParameter("status");
            
           p.setProduct_categoryID(category);
            p.setName(name);
            p.setDesciption(description);
            p.setPicture(image);
            p.setPicture2(image2);
            p.setPicture3(image3);
            p.setQuantity(quantity);
            p.setPrice(price);
            p.setStatus(status);
            productDAO.addNewProduct(p);
        }
        response.sendRedirect("AdminController");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
