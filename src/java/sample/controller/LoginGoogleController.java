/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.google_auth.GooglePojo;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.utils.GoogleUtils;

/**
 *
 * @author Louis Kien
 */
public class LoginGoogleController extends HttpServlet {

    // tomcat máy em set ở port 8082 nên login bằng google hoạt động ở port 8082 ạ
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String US_PAGE = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        try {
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
                request.setAttribute("ERROR", "Can't login to Google account");
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                String userID = googlePojo.getId();
                String fullName = googlePojo.getEmail();
                String roleID = "US";
                UserDAO dao = new UserDAO();
                if (!dao.checkDublicate(userID)) {
                    UserDTO googleUser = new UserDTO(userID, fullName, roleID, "jBafbWnF5FHeoa0ivQp2ingLF6vlOQNp");
                    boolean checkInsert = dao.insert(googleUser);
                }
                UserDTO loginUser = dao.checkGoogleLogin(userID);
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                url = US_PAGE;
            }
        } catch (Exception e) {
            log("Error at LoginGoogleController: " + e.toString());
        } finally {
            response.sendRedirect(url);
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
