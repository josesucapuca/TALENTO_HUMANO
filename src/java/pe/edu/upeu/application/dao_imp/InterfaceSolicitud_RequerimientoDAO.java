/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.V_Solicitud_Requerimiento;

/**
 *
 * @author ALFA 3
 */
public interface InterfaceSolicitud_RequerimientoDAO {

    public List<V_Solicitud_Requerimiento> Listar_solicitud();

    public String INSERT_SOLICITUD_DGP(String ID_SOLICITUD_DGP, String FE_DESDE, String ID_DGP, String ID_PLAZO, String DE_SOLICITUD, String ES_AUTORIZAR, String ES_SOLICITUD_DGP, String IP_USUARIO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String NO_USUARIO);

}