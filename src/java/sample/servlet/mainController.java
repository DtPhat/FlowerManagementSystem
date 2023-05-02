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
            if (action == null || action.equals("")) {
                url = "index.jsp";
            } else if (action.equals("login")) {
                url = "loginServlet";
            } else if (action.equals("search")) {
                url = "searchLaptopServlet";
            } else if (action.equals("register")) {
                url = "registerServlet";
            } else if (action.equals("logout")) {
                url = "logoutServlet";
            } else if(action.equals("check out")){
                url = "checkOutServlet";
            } else if (action.equals("manageAccounts")) {
                url = "manageAccountsServlet";
            } else if (action.equals("manageLaptops")) {
                url = "manageLaptopsServlet";
            } else if (action.equals("search account")) {
                url = "searchAccountServlet";
            } else if (action.equals("deleteAccount")) {
                url = "deleteAccountServlet";
            } else if (action.equals("viewcart")) {
                url = "viewcart.jsp";
            } else if (action.equals("update")) {
                url = "updateCartServlet";
            } else if (action.equals("delete")) {
                url = "deleteCartServlet";
            } else if (action.equals("submit updating account")) {
                url = "updateAccountServlet";
            } else if (action.equals("create account")) {
                url = "createAccountServlet";
            } else if (action.equals("submit updating laptop")) {
                url = "updateLaptopServlet";
            } else if (action.equals("deleteLaptop")) {
                url = "deleteLaptopServlet";
            } else if (action.equals("create laptop")) {
                url = "createLaptopServlet";
            } else if(action.equals("manageCategories")){
                url = "manageCategoriesServlet";
            }  else if(action.equals("submit updating category")){
                url = "updateCategoryServlet";
            } else if(action.equals("create category")){
                url = "createCategoryServlet";
            } else if(action.equals("search orders")){
                url = "searchOrdersByDate";
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
