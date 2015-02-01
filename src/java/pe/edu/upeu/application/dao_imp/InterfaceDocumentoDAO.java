/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Cuenta_Sueldo;
import pe.edu.upeu.application.model.Datos_Hijo_Trabajador;
import pe.edu.upeu.application.model.Documentos;
import pe.edu.upeu.application.model.Padre_Madre_Conyugue;
import pe.edu.upeu.application.model.V_Documento_Trabajador;
import pe.edu.upeu.application.model.V_Reg_Dgp_Tra;

/**
 *
 * @author Admin
 */
public interface InterfaceDocumentoDAO {
    public List<V_Documento_Trabajador> List_Id_Doc_Trab(String id_trabajador);
    public List<Documentos> List_Documentos();
    //public List<Documentos> List_Doc_Req_Pla(String id_dgp,String id_trabajador);
    public List<Datos_Hijo_Trabajador> List_Hijos(String id_trabajador);
    public List<Padre_Madre_Conyugue> List_Conyugue(String id_Trabajador);
    public int List_Adventista (String id_trabajador);
    public int List_Req_nacionalidad(String id_trabajador);
    public List<V_Reg_Dgp_Tra> List_doc_req_pla(String iddg,String idtra);
     public void INSERT_DOCUMENTO_ADJUNTO(String ID_DOCUMENTO_ADJUNTO, String ID_DGP, String ID_DOCUMENTOS, String ES_DOCUMENTO_ADJUNTO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String DE_DOCUMENTO_ADJUNTO, String AR_DATO_ARCHIVO, String NO_ARCHIVO, String TA_ARCHIVO, String AR_FILE_TYPE , String ID_CONTRATO);
     public List<V_Reg_Dgp_Tra> List_Doc_CE ();
     
}
