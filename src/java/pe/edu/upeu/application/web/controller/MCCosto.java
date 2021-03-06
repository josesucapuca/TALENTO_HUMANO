/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.CentroCostoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCentroCosto;
import pe.edu.upeu.application.factory.StringTools;

/**
 *
 * @author Andres
 */
public class MCCosto extends HttpServlet {

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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> rpta = new HashMap<String, Object>();
        String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        // String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        InterfaceCentroCosto cc = new CentroCostoDAO();
        try {
            if (opc.equals("menu")) {
                response.sendRedirect("Vista/CCosto/MantCCosto.jsp");
            }
            if (opc.equals("list_ccosto")) {
                String id = request.getParameter("id");
                List<Map<String, ?>> lista;
                if (id != null) {
                    lista = cc.listarCcosto(id);
                } else {
                    lista = cc.listarCcosto();
                }
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("list_dir")) {
                List<Map<String, ?>> lista = cc.List_Direccion();
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Asignar_cc")) {
                String id_centro_costo = request.getParameter("id_cc");
                String id_departamento = request.getParameter("dep");
                String id_area = request.getParameter("area");
                String id_seccion = request.getParameter("seccion");
                cc.AsignarCentroCosto(id_centro_costo, id_departamento, id_area, id_seccion);
                rpta.put("rpta", "1");
            }
            if (opc.equals("list_dep")) {
                String id = request.getParameter("id");
                List<Map<String, ?>> lista = cc.List_Depxdir(id);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("list_ar")) {
                String id = request.getParameter("id");
                List<Map<String, ?>> lista = cc.List_Arxdep(id);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("list_se")) {
                String id = request.getParameter("id");
                List<Map<String, ?>> lista = cc.List_SecxArea(id);
                rpta.put("rpta", lista.size());
                rpta.put("lista", lista);
            }
            if (opc.equals("edit_cc")) {
                String ID_CENTRO_COSTO, CO_CENTRO_COSTO, DE_CENTRO_COSTO, ID_DEPARTAMENTO, ID_AREA, ID_SECCION;
                ID_CENTRO_COSTO = StringTools.getString(request.getParameter("ID_CENTRO_COSTO"));
                CO_CENTRO_COSTO = StringTools.getString(request.getParameter("CO_CENTRO_COSTO"));
                DE_CENTRO_COSTO = StringTools.getString(request.getParameter("DE_CENTRO_COSTO"));
                ID_DEPARTAMENTO = StringTools.getString(request.getParameter("ID_DEPARTAMENTO"));
                ID_AREA = StringTools.getString(request.getParameter("ID_AREA"));
                ID_SECCION = StringTools.getString(request.getParameter("ID_SECCION"));
                String ID_DET_CC = StringTools.getString(request.getParameter("ID_DET_CC"));
                
                cc.editarCCosto(ID_CENTRO_COSTO, CO_CENTRO_COSTO, DE_CENTRO_COSTO, ID_DEPARTAMENTO, ID_AREA, ID_SECCION, ID_DET_CC);
                rpta.put("rpta", "1");
            }
            if (opc.equals("add_cc")) {
                String CO_CENTRO_COSTO, DE_CENTRO_COSTO, ID_DEPARTAMENTO, ID_AREA, ID_SECCION;
                CO_CENTRO_COSTO = request.getParameter("CO_CENTRO_COSTO");
                DE_CENTRO_COSTO = request.getParameter("DE_CENTRO_COSTO");
                ID_DEPARTAMENTO = request.getParameter("ID_DEPARTAMENTO");
                ID_AREA = request.getParameter("ID_AREA");
                ID_SECCION = request.getParameter("ID_SECCION");
                cc.crearCCosto(CO_CENTRO_COSTO, DE_CENTRO_COSTO, ID_DEPARTAMENTO, ID_AREA, ID_SECCION);
            }
            if (opc.equals("del_cc")) {
                String ID_CENTRO_COSTO;
                ID_CENTRO_COSTO = request.getParameter("ID_CENTRO_COSTO");
                cc.eliminarCCosto(ID_CENTRO_COSTO);
            }
        } catch (Exception e) {
            rpta.put("rpta", "-1");
            rpta.put("mensaje", e.getMessage());
        }
        Gson gson = new Gson();
        out.println(gson.toJson(rpta));
        out.flush();
        out.close();
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
