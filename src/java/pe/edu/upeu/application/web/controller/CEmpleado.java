/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.EmpleadoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;

/**
 *
 * @author Admin
 */
public class CEmpleado extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        InterfaceEmpleadoDAO Iem = new EmpleadoDAO();

        HttpSession sesion = request.getSession(true);
        String opc = request.getParameter("opc");

        if (opc.equals("Eva_Emp")) {
            response.sendRedirect("Vista/Empleado/Evaluacion_Empleado.jsp");
        }
        if (opc.equals("Reg_Evaluar_Emp")) {
          
        }
        if (opc.equals("Reporte")) {

            String iddepa = (String) sesion.getAttribute("DEPARTAMENTO_ID");
            getServletContext().setAttribute("List_Empleado", Iem.Listar_Empleado(iddepa));

            out.print(Iem.Listar_Empleado(iddepa).size());

            response.sendRedirect("Vista/Empleado/Filtro_Empleado.jsp?iddepa");
        }

        try {

        } finally {
            out.close();
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
