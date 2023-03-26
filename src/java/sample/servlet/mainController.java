/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PHAT
 */
public class mainController extends HttpServlet {

    private String url = "errorapge.html";

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
            String action = request.getParameter("action");
            if (action == null || action.equals("") || action.equals("search")) {
                url = "index.jsp";
            } else if (action.equals("login")) {
                url = "loginServlet";
            } else if (action.equals("register")) {
                url = "registerServlet";
            } else if (action.equals("logout")) {
                url = "logoutServlet";
            } else if (action.equals("orderagain")) {
                url = "orderAgainServlet";
            } else if (action.equals("cancelorder")) {
                url = "cancelOrderServlet";
            } else if (action.equals("change profile")) {
                url = "changProfileServlet";
            } else if (action.equals("addtocart")) {
                url = "addToCartServlet";
            } else if (action.equals("viewcart")) {
                url = "viewcart.jsp";
            } else if (action.equals("update")) {
                url = "updateCartServlet";
            } else if (action.equals("delete")) {
                url = "deleteCartServlet";
            } else if (action.equals("buy")) {
                url = "saveShoppingCartServlet";
            } else if (action.equals("searchOrdersByStatus")) {
                url = "searchOrdersByStatus";
            } else if (action.equals("search orders")) {
                url = "searchOrdersByDate";
            } else if (action.equals("updateStatusAccount")) {
                url = "updateStatusAccountServlet";
            } else if (action.equals("manageAccounts") || action.equals("search account")) {
                url = "manageAccountsServlet";
            } else if (action.equals("manageOrders") || action.equals("filter orders by date") || action.equals("filter orders by email") ) {
                url = "manageOrdersServlet";
            } else if (action.equals("managePlants") || action.equals("updatePlantWithAdmin")) {
                url = "managePlantsServlet";
            } else if (action.equals("manageCategories") || action.equals("updateCategory")) {
                url = "manageCategoriesServlet";
            }  else if (action.equals("save")) {
                url = "saveUpdatePlantServlet";
            } else if (action.equals("create plant")) {
                url = "createPlantServlet";
            } else if (action.equals("save updating category")) {
                url = "saveUpdateCategoryServlet";
            } else if (action.equals("create category")) {
                url = "createCategoryServlet";
            }
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
