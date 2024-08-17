/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DictionaryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import model.Dictionary;

/**
 *
 * @author NHAT
 */
public class TestController extends HttpServlet {

    DictionaryDAO dictiotnaryDAO = new DictionaryDAO();
    ArrayList<Dictionary> dictionaryList = dictiotnaryDAO.getAllDictionary();

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
            out.println("<title>Servlet TestController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TestController at " + request.getContextPath() + "</h1>");
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
        String uri = request.getRequestURI();
        if (uri.endsWith("/Test")) {
            DictionaryDAO dictDAO = new DictionaryDAO();
            ArrayList<Dictionary> dictList = dictDAO.getAllDictionary();
            int n = dictList.size();
            request.setAttribute("size", n);
            request.getRequestDispatcher("Test.jsp").forward(request, response);
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
        String typeTest = request.getParameter("typeTest");
        String typeRange = request.getParameter("typeRange");
        int size = Integer.parseInt(request.getParameter("size"));
        int from = 0;
        int to = 0;
        if (typeRange.equalsIgnoreCase("All")) {
            from = 0;
            to = size;
        } else if (typeRange.equalsIgnoreCase("Specific")) {
            String rangeOption = request.getParameter("rangeOption");
            if (rangeOption.equalsIgnoreCase("1")) {
                from = Integer.parseInt(request.getParameter("from1"));
                to = Integer.parseInt(request.getParameter("to1"));
            } else if (rangeOption.equalsIgnoreCase("2")) {
                from = Integer.parseInt(request.getParameter("from2"));
                to = Integer.parseInt(request.getParameter("to2"));
            }
        }

        if (typeTest.equalsIgnoreCase("Random")) {
            generateUniqueRandomNumbers(from, to, request, response);
            request.getRequestDispatcher("/Testing.jsp").forward(request, response);
        } else if (typeTest.equalsIgnoreCase("Linear")) {

        }
    }

    public void generateUniqueRandomNumbers(int from, int to, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Integer> numbers = new ArrayList<>();
        for (int i = from; i <= to; i++) {
            numbers.add(i);
        }

        // Trộn danh sách để các số trở thành ngẫu nhiên
        Collections.shuffle(numbers);
        request.setAttribute("testingList", numbers);
        request.setAttribute("dictList", dictionaryList);
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
