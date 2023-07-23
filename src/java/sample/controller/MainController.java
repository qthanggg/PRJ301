/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author louis
 */
public class MainController extends HttpServlet {

    private static final String WELCOME_PAGE = "login.html";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String CREATE = "Create";
    private static final String CREATE_CONTROLLER = "CreateController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SHOPPING_PAGE = "ShoppingPage";
    private static final String SHOPPING_PAGE_VIEW = "shopping.html";
    private static final String ADD = "Add";
    private static final String ADD_CONTROLLER = "AddController";
    private static final String VIEW = "View Cart";
    private static final String BACK_TO_CART = "Back to Cart";
    private static final String VIEW_PAGE = "viewCart.jsp";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditController";
    private static final String SHOPPING_VIEW = "shopping";
    private static final String SHOPPING_VIEW_CONTROLLER = "ViewProductController";
    private static final String CLEAR_CART = "ClearCart";
    private static final String CLEAR_CART_CONTROLLER = "ClearCartController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = WELCOME_PAGE;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SHOPPING_PAGE.equals(action)) {
                url = SHOPPING_PAGE_VIEW;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (VIEW.equals(action)) {
                url = VIEW_PAGE;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            } else if (SHOPPING_VIEW.equals(action)) {
                url = SHOPPING_VIEW_CONTROLLER;
            } else if (CLEAR_CART.equals(action)) {
                url = CLEAR_CART_CONTROLLER;
            } else if (BACK_TO_CART.equals(action)) {
                url = VIEW_PAGE;
            } else {
                request.setAttribute("ERROR", "Your ACTION is not support");
            }
        } catch (Exception e) {
            log("ERROR at MainController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
