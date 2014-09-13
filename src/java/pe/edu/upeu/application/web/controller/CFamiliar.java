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
import pe.edu.upeu.application.dao.Datos_Hijo_TrabajadorDAO;
import pe.edu.upeu.application.dao.Padre_Madre_ConyugueDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDatos_Hijo_Trabajador;
import pe.edu.upeu.application.dao_imp.InterfacePadre_Madre_ConyugueDAO;

/**
 *
 * @author Karencita
 */
public class CFamiliar extends HttpServlet {

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
        HttpSession sesion = request.getSession(true);
        String user = (String) sesion.getAttribute("IDUSER");
        String opc = request.getParameter("opc");
        CConversion c = new CConversion();
        InterfaceDatos_Hijo_Trabajador h = new Datos_Hijo_TrabajadorDAO();
        InterfacePadre_Madre_ConyugueDAO pmc = new Padre_Madre_ConyugueDAO();

        /*try {*/
        if (opc.equals("REGISTRAR")) {
            String ID_PADRE_MADRE_CONYUGUE = null;
            String AP_NOMBRES_PADRE = request.getParameter("APELLIDOS_NOMBRES_PADRE");
            String AP_NOMBRES_MADRE = request.getParameter("APELLIDOS_NOMBRES_MADRE");
            String ES_TRABAJA_UPEU_CONYUGUE = request.getParameter("TRABAJA_UPEU_CONYUGUE");
            String AP_NOMBRES_CONYUGUE = request.getParameter("APELLIDO_NOMBRES_CONYUGUE");
            String FE_NAC_CONYUGUE = c.convertFecha(request.getParameter("FECHA_NAC_CONYUGUE"));
            String TI_DOC_ID = request.getParameter("TIPO_DOC_ID");
            String NU_DOC = request.getParameter("NRO_DOC");
            String LI_INSCRIPCION_VIG_ESSALUD = request.getParameter("INSCRIPCION_VIG_ESSALUD");
            String US_CREACION = null;
            String FE_CREACION = null;
            String US_MODIF = null;
            String FE_MODIF = null;
            String IP_USUARIO = null;
            String ID_TRABAJADOR = request.getParameter("IDDATOS_TRABAJADOR");
            pmc.INSERT_PADRE_MADRE_CONYUGUE(ID_PADRE_MADRE_CONYUGUE, AP_NOMBRES_PADRE, AP_NOMBRES_MADRE, ES_TRABAJA_UPEU_CONYUGUE, AP_NOMBRES_CONYUGUE, FE_NAC_CONYUGUE, TI_DOC_ID, NU_DOC, LI_INSCRIPCION_VIG_ESSALUD, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, ID_TRABAJADOR);
            response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?idtr=" + ID_TRABAJADOR);
        }
        if (opc.equals("Detalle_Familiar")) {
            String idtr = request.getParameter("idtr");
            getServletContext().setAttribute("List_PMC", pmc.List_PMC(idtr));
            getServletContext().setAttribute("LISTA_HIJOS", h.LISTA_HIJOS(idtr));
             getServletContext().setAttribute("LISTA_HIJO", h.LISTA_HIJOS(idtr));
            // out.println(idtr);
            response.sendRedirect("Vista/Trabajador/Familiar/Detalle_Familiar.jsp?idtr="+idtr);
        }
        if (opc.equals("REGISTRAR HIJO")) {
            String ID_DATOS_HIJOS_TRABAJADOR = null;
            String ID_TRABAJADOR = request.getParameter("TRABAJADOR");
            String AP_PATERNO = request.getParameter("APELLIDO_P");
            String AP_MATERNO = request.getParameter("APELLIDO_M");
            String NO_HIJO_TRABAJADOR = request.getParameter("NOMBRE");
            String FE_NACIMIENTO = request.getParameter("FECHA_NAC");
            String ES_SEXO = request.getParameter("SEXO");
            String ES_TIPO_DOC = request.getParameter("TIPO_DOC_ID");
            String NU_DOC = request.getParameter("NRO_DOC");
            String ES_PRESENTA_DOCUMENTO = null;
            String ES_INSCRIPCION_VIG_ESSALUD = request.getParameter("INSCRIPCION_VIG_ESSALUD");
            String ES_ESTUDIO_NIV_SUPERIOR = request.getParameter("ESTUD_NIV_SUPERIOR");
            String FE_CREACION = null;
            String US_MODIF = null;
            String FE_MODIF = null;
            String IP_USUARIO = null;
            String ES_DATOS_HIJO_TRABAJADOR = null;

            h.INSERT_DATOS_HIJO_TRABAJADOR(ID_DATOS_HIJOS_TRABAJADOR, ID_TRABAJADOR, AP_PATERNO, AP_MATERNO, NO_HIJO_TRABAJADOR, FE_NACIMIENTO, ES_SEXO, ES_TIPO_DOC, NU_DOC, ES_PRESENTA_DOCUMENTO, ES_INSCRIPCION_VIG_ESSALUD, ES_ESTUDIO_NIV_SUPERIOR, user, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, ES_DATOS_HIJO_TRABAJADOR);
            getServletContext().setAttribute("LISTA_HIJO", h.LISTA_HIJOS(ID_TRABAJADOR));
            response.sendRedirect("Vista/Trabajador/Familiar/Reg_Datos_Hijo.jsp");
        }
        if(opc.equals("ELIMINAR HIJO")){
            
            
        }
        if(opc.equals("MODIFICAR HIJO")){
        }

        /* } finally {
         out.close();
         }*/
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