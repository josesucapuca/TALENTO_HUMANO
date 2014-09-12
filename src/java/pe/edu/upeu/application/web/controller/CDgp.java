/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.AutorizacionDAO;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao.RequerimientoDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UsuarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRequerimientoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO;

/**
 *
 * @author Admin
 */
public class CDgp extends HttpServlet {

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

        /*Declaramos*/
        HttpSession sesion = request.getSession(true);

        String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        String idpuesto = (String) sesion.getAttribute("PUESTO_ID");
        String iduser = (String) sesion.getAttribute("IDUSER");
        String idtr = request.getParameter("idtr");
        // String iddepa = request.getParameter("iddep");
        String idreq = request.getParameter("idreq");

        InterfacePuestoDAO pu = new PuestoDAO();
        InterfaceRequerimientoDAO IReq = new RequerimientoDAO();
        InterfaceTrabajadorDAO tr = new TrabajadorDAO();
        InterfaceDgpDAO dgp = new DgpDAO();
        InterfaceAutorizacionDAO a = new AutorizacionDAO();
        InterfaceUsuarioDAO us = new UsuarioDAO();

        String opc = request.getParameter("opc");

        //try {
        if (opc.equals("Registrar")) {
            String ID_DGP = request.getParameter("ID_DGP");
            String FE_DESDE = request.getParameter("FEC_DESDE");
            String FE_HASTA = request.getParameter("FEC_HASTA");
            double CA_SUELDO = Double.parseDouble(request.getParameter("SUELDO"));
            String DE_DIAS_TRABAJO = request.getParameter("DIAS_TRABAJO");
            String ID_PUESTO = request.getParameter("IDPUESTO");
            String ID_REQUERIMIENTO = request.getParameter("IDREQUERIMIENTO");
            String ID_TRABAJADOR = request.getParameter("IDDATOS_TRABAJADOR");
            String CO_RUC = request.getParameter("RUC");
            String DE_LUGAR_SERVICIO = request.getParameter("LUGAR_SERVICIO");
            String DE_SERVICIO = request.getParameter("DESCRIPCION_SERVICIO");
            String DE_PERIODO_PAGO = request.getParameter("PERIODO_PAGO");
            String DE_DOMICILIO_FISCAL = request.getParameter("DOMICILIO_FISCAL");
            String DE_SUBVENCION = request.getParameter("SUBVENCION");
            String DE_HORARIO_CAPACITACION = request.getParameter("HORARIO_CAPACITACION");
            String DE_HORARIO_REFRIGERIO = request.getParameter("HORARIO_REFRIGERIO");
            String DE_DIAS_CAPACITACION = request.getParameter("DIAS_CAPACITACION");
            String ES_DGP = "";
            String FE_CREACION = request.getParameter("FECHA_CREACION");
            String US_MODIF = request.getParameter("USER_MODIF");
            String FE_MODIF = request.getParameter("FECHA_MODIF");
            String IP_USUARIO = request.getParameter("USUARIO_IP");
            double CA_BONO_ALIMENTARIO = Double.parseDouble(request.getParameter("BONO_ALIMENTARIO"));
            double DE_BEV = Double.parseDouble(request.getParameter("BEV"));
            double CA_CENTRO_COSTOS = Double.parseDouble(request.getParameter("CENTRO_COSTOS"));
            String DE_ANTECEDENTES_POLICIALES = request.getParameter("ANTECEDENTES_POLICIALES");
            String DE_CERTIFICADO_SALUD = request.getParameter("CERTIFICADO_SALUD");
            String DE_MONTO_HONORARIO = request.getParameter("MONTO_HONORARIO");

            dgp.INSERT_DGP(ID_DGP, FE_DESDE, FE_HASTA, CA_SUELDO, DE_DIAS_TRABAJO, ID_PUESTO, ID_REQUERIMIENTO, ID_TRABAJADOR, CO_RUC, DE_LUGAR_SERVICIO, DE_SERVICIO, DE_PERIODO_PAGO, DE_DOMICILIO_FISCAL, DE_SUBVENCION, DE_HORARIO_CAPACITACION, DE_HORARIO_REFRIGERIO, DE_DIAS_CAPACITACION, ES_DGP, iduser, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, CA_BONO_ALIMENTARIO, DE_BEV, CA_CENTRO_COSTOS, DE_ANTECEDENTES_POLICIALES, DE_CERTIFICADO_SALUD, DE_MONTO_HONORARIO);

            String iddgp = dgp.MAX_ID_DGP();
            String idrp = IReq.id_det_req_proc(iddgp);
            List<String> list = a.Det_Autorizacion(idrp);
            a.Insert_Autorizacion("", iddgp, "1", "P1", "12312", iduser, "", "31/07/14", "3213", list.get(1), idrp, list.get(0));
            response.sendRedirect("Vista/Dgp/Horario/Reg_Horario.jsp?iddgp=" + iddgp + "&idtr=" + ID_TRABAJADOR + "&opc=rd");

        }
        if (opc.equals("Reg_form")) {

            /* TEMPORAL*/
            if (idreq.equals("1")) {
                idreq = "REQ-0001";
            }
            if (idreq.equals("2")) {
                idreq = "REQ-0002";
            }
            if (idreq.equals("3")) {
                idreq = "REQ-0003";
            }

            getServletContext().setAttribute("Listar_Requerimiento", IReq.Listar_Requerimiento());
            getServletContext().setAttribute("List_Puesto", pu.List_Puesto_Dep(iddep));
            getServletContext().setAttribute("Listar_Trabajador_id", tr.ListaridTrabajador(idtr));
            response.sendRedirect("Vista/Dgp/Reg_Dgp.jsp?idreq=" + idreq);
        }

        if (opc.equals("rd")) {

            String ID_DGP = request.getParameter("iddgp");
            String ID_TRABAJADOR = request.getParameter("idtr");
            getServletContext().setAttribute("LIST_ID_DGP", dgp.LIST_ID_DGP(ID_DGP));
            int num = dgp.VALIDAR_DGP_CONTR(ID_DGP, ID_TRABAJADOR);
            getServletContext().setAttribute("LIST_ID_USER", us.List_ID_User(iduser));

            response.sendRedirect("Vista/Dgp/Detalle_Dgp.jsp?idtr=" + ID_TRABAJADOR + "&num=" + num + "&iddgp=" + ID_DGP + "&opc=reg_doc");
        }
        if (opc.equals("Detalle")) {

            String ID_DGP = request.getParameter("iddgp");
            String ID_TRABAJADOR = request.getParameter("idtr");
            getServletContext().setAttribute("LIST_ID_DGP", dgp.LIST_ID_DGP(ID_DGP));
            int num = dgp.VALIDAR_DGP_CONTR(ID_DGP, ID_TRABAJADOR);
            getServletContext().setAttribute("LIST_ID_USER", us.List_ID_User(iduser));

            response.sendRedirect("Vista/Dgp/Detalle_Dgp.jsp?idtr=" + ID_TRABAJADOR + "&num=" + num + "&idgp=" + ID_DGP);
        }
        if (opc.equals("Seguimiento")) {
            String iddgp = request.getParameter("iddgp");
            String idrp = IReq.id_det_req_proc(iddgp);
            getServletContext().setAttribute("Det_Autorizacion", a.List_Detalle_Autorizacion(iddgp, idrp));

            response.sendRedirect("Vista/Dgp/Detalle_Seguimiento_Dgp.jsp");
        }
        if (opc.equals("Proceso")) {
            getServletContext().setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO(iddep));
            response.sendRedirect("Vista/Dgp/Proceso_Dgp.jsp");
        }
        if (opc.equals("User_Aut")) {
            String iddgp = request.getParameter("iddgp");
            getServletContext().setAttribute("USER_DGP", dgp.USER_DGP(iddgp));

            response.sendRedirect("Vista/Dgp/User_Dgp.jsp");
        }
        if (opc.equals("List_Dgp_Tr")) {

            getServletContext().setAttribute("LIST_ID_TRAB_DGP", dgp.LIST_ID_TRAB_DGP(idtr));
            response.sendRedirect("Vista/Trabajador/List_Dgp_Trabajador.jsp");
        }
        if (opc.equals("Terminar")) {
            String iddgp = request.getParameter("iddgp");
            dgp.REG_DGP_FINAL(iddgp);
            getServletContext().setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO(iddep));
            response.sendRedirect("Vista/Dgp/Proceso_Dgp.jsp");
        }

        if (opc.equals("Listar")) {

            getServletContext().setAttribute("List_Det_Dgp", dgp.LIST_DET_DGP(iddep));
            // out.print(Idgp.LIST_DET_DGP(iddep).size());
            response.sendRedirect("Vista/Dgp/List_Dgp.jsp?iddep");

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
