/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Manager;

import Dal.ManagerDAO;
import Model.Order;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ManagerAddOrderController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ManagerDAO dao = new ManagerDAO();
        String id = req.getParameter("id");
        Order order = dao.getOrderByID(id);
        req.setAttribute("o", order);
        req.setAttribute("listU", dao.getUserList());
        req.getRequestDispatcher("addorder.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ManagerDAO dao = new ManagerDAO();
        String id = req.getParameter("id");
        Order order = dao.getOrderByID(id);
        req.setAttribute("o", order);
        req.setAttribute("listU", dao.getUserList());
        
        String order_userID = req.getParameter("user");
        String order_salecodeID = req.getParameter("saler");
        String date = req.getParameter("date");
        String status = req.getParameter("status");
        String note = req.getParameter("note");
        dao.addNewOrder(date, order_userID, note, order_salecodeID, status);
        
        req.setAttribute("user", order_userID);
        req.setAttribute("saler", order_salecodeID);
        req.setAttribute("date", date);
        req.setAttribute("status", status);
        req.setAttribute("successText", "Add Successful!!!");
        req.getRequestDispatcher("addorder.jsp").forward(req, resp);
    }
    
}
