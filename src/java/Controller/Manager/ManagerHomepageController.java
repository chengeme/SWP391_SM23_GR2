/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Manager;

import Dal.ManagerDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;

public class ManagerHomepageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
//        resp.setContentType("text/html;charset=UTF-8");
//        try ( PrintWriter out = resp.getWriter()) {
//            HttpSession session = req.getSession();
//            if (session.getAttribute("user") != null) {
//                req.getRequestDispatcher("/customer/homepage.jsp").forward(req, resp);
//            } else {
//                out.print("Access Denied!");
//            }
//        }
        ManagerDAO dao = new ManagerDAO();
        req.setAttribute("countP", dao.countProductByProductID());
        req.setAttribute("countO", dao.countOrder());
        dao.getNewOrder();
        req.setAttribute("listO", dao.getOrder());
        req.getRequestDispatcher("homepage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    }

}
