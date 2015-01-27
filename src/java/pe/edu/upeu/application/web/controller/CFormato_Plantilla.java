/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upeu.application.dao.Formato_HorarioDAO;
import pe.edu.upeu.application.dao.PlantillaContractualDAO;
import pe.edu.upeu.application.dao_imp.InterfaceFormato_HorarioDAO;
import pe.edu.upeu.application.dao_imp.InterfacePlantillaContractualDAO;
import pe.edu.upeu.application.model.Formato_Horario;

/**
 *
 * @author ALFA 3
 */
public class CFormato_Plantilla extends HttpServlet {

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
        InterfaceFormato_HorarioDAO f = new Formato_HorarioDAO();
        InterfacePlantillaContractualDAO pl = new PlantillaContractualDAO();

        String opc = request.getParameter("opc");
        try {
            if (opc.equals("asignar")) {
                response.sendRedirect("Vista/Contrato/Formato_Plantilla/Reg_Formato_Plantilla.jsp");
            }
            String direccion_raiz = getServletContext().getRealPath(".").substring(0, getServletContext().getRealPath(".").length() - 1);
            if (opc.equals("Actualizar")) {
                String texto_html = request.getParameter("valor");
                String id = request.getParameter("id");
                String ubicacion = "";
                if (System.getProperty("sun.desktop").trim().equals("windows")) {
                    ubicacion = direccion_raiz + "\\Vista\\Contrato\\Formato_Plantilla\\Formato\\";
                } else {
                    ubicacion = direccion_raiz + "/Vista/Contrato/Formato_Plantilla/Formato/";
                }
                File archivo = new File(ubicacion + id);
                if (archivo.exists()) {
                    //  archivo.delete();
                    // out.print("asfsfsafsdf");
                    FileWriter escribir = new FileWriter(archivo);
                    // aqui se hace un append al archivo existente
                    //FileWriter escribir = new FileWriter(archivo,true);
                    escribir.write(texto_html);
                    escribir.close();
                } else {
                    FileWriter escribir = new FileWriter(archivo);
                    escribir.write(texto_html);
                    escribir.close();
                    out.print(ubicacion);
                }
                response.sendRedirect("Vista/Contrato/Formato_Plantilla/Reg_Formato_Plantilla.jsp");
            }

            if (opc.equals("Listar")) {
                String texto = "";
                String ubicacion = "";
                String imprimir = "";
                String no_archivo = request.getParameter("id");
                if (System.getProperty("sun.desktop").trim().equals("windows")) {
                    ubicacion = direccion_raiz + "\\Vista\\Contrato\\Formato_Plantilla\\Formato\\";
                } else {
                    ubicacion = direccion_raiz + "/Vista/Contrato/Formato_Plantilla/Formato/";
                }
                FileReader lector = new FileReader(ubicacion + no_archivo);
                BufferedReader contenido = new BufferedReader(lector);
                while ((texto = contenido.readLine()) != null) {
                    imprimir = imprimir + texto;
                }
                rpta.put("rpta", "1");
                rpta.put("imprimir", imprimir);
            }
            if (opc.equals("Cargar_Plantillas")) {
                String id = request.getParameter("id");
                List<Map<String, ?>> lista = f.Lista_Plantilla_Puesto(id);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Crear_Plantilla")) {
                String ubicacion = "";
                String no_pl = request.getParameter("no_pl");
                pl.Crear_Plantilla(no_pl);
                String no_arch=pl.Obt_no_arch();
                if (System.getProperty("sun.desktop").trim().equals("windows")) {
                    ubicacion = direccion_raiz + "\\Vista\\Contrato\\Formato_Plantilla\\Formato\\";
                } else {
                    ubicacion = direccion_raiz + "/Vista/Contrato/Formato_Plantilla/Formato/";
                }
                File archivo = new File(ubicacion + no_arch);
                FileWriter escribir = new FileWriter(archivo, true);
                escribir.write("");
                escribir.close();
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
