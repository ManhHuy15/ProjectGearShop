/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package adminController;

import dal.ProductCategoryDao;
import dal.ProductTypeDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.ProductCategory;
import model.ProductType;

/**
 *
 * @author truong
 */
@WebServlet(name = "updateCategory", urlPatterns = {"/updateCategory"})
public class updateCategory extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateCategory</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateCategory at " + request.getContextPath() + "</h1>");
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
        ProductCategoryDao pcd = new ProductCategoryDao();
        String id_raw = request.getParameter("id");
        int id;
        try {
            id = (id_raw == null) ? 0 : Integer.parseInt(id_raw);
            request.setAttribute("category", pcd.getCategoryById(id));
            ProductTypeDao ptd = new ProductTypeDao();
            List<ProductType> listType = ptd.getAll();
            request.setAttribute("typeList", listType);
            request.getRequestDispatcher("updateCategory.jsp").forward(request, response);
        } catch (NumberFormatException e) {

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
        ProductCategoryDao pdc = new ProductCategoryDao();
        ProductTypeDao ptd = new ProductTypeDao();
        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String tid_raw = request.getParameter("tid");
        try {
            int tid = (tid_raw == null) ? 0 : Integer.parseInt(tid_raw);
            int id = (id_raw == null) ? 0 : Integer.parseInt(id_raw);
            ProductCategory p = new ProductCategory(id, name, ptd.getProductTypeById(tid));
            pdc.updateProductCategory(p);
            response.sendRedirect("manaCategory");
        } catch (NumberFormatException e) {

        }
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
