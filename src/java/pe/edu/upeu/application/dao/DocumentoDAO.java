/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Datos_Hijo_Trabajador;
import pe.edu.upeu.application.model.Documentos;
import pe.edu.upeu.application.model.Padre_Madre_Conyugue;
import pe.edu.upeu.application.model.Trabajador;
import pe.edu.upeu.application.model.V_Reg_Dgp_Tra;

/**
 *
 * @author Admin
 */
public class DocumentoDAO implements InterfaceDocumentoDAO {

    ConexionBD conn;

    @Override
    public List<Documentos> List_Id_Doc_Trab(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTV_DOCUMENTO_ADJUNTO da, RHTR_DOCUMENTOS d ,RHTM_DGP dgp, RHTR_REQUERIMIENTO r  where da.id_documentos = d.id_documentos  and r.id_requerimiento = dgp.id_requerimiento  and dgp.id_dgp = da.id_dgp and dgp.id_trabajador='" + id_trabajador + "' and da.ES_DOCUMENTO_ADJUNTO=1";
        List<Documentos> list = new ArrayList<Documentos>();
        try {
            ResultSet rs = this.conn.query(sql);
            Documentos d = new Documentos();
            while (rs.next()) {
                //falta agregar setter y getter
                list.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;
    }

    @Override
    public List<Documentos> List_Documentos() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from RHTR_DOCUMENTOS";
        List<Documentos> list = new ArrayList<Documentos>();
        try {
            ResultSet rs = this.conn.query(sql);
            Documentos d = new Documentos();
            while (rs.next()) {
                d.setEs_documento(rs.getString("es_documento"));
                d.setId_documentos(rs.getString("id_documentos"));
                d.setId_tipo_planilla(rs.getString("id_tipo_planilla"));
                d.setNo_documento(rs.getString("es_no_documento"));
                d.setTi_documento(rs.getString("ti_documento"));
                list.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Datos_Hijo_Trabajador> List_Hijos(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTD_DATOS_HIJO_TRABAJADOR where id_trabajador='" + id_trabajador + "' and (sysdate-fe_nacimiento)/360<18";
        List<Datos_Hijo_Trabajador> list = new ArrayList<Datos_Hijo_Trabajador>();
        try {
            ResultSet rs = this.conn.query(sql);
            Datos_Hijo_Trabajador dht = new Datos_Hijo_Trabajador();
            while (rs.next()) {
                dht.setAp_materno(rs.getString("ap_materno"));
                dht.setAp_paterno(rs.getString("ap_paterno"));
                dht.setEs_datos_hijo_trabajador(rs.getString("es_datos_hijo_trabajador"));
                dht.setEs_estudio_niv_superior(rs.getString("es_estudio_niv_superior"));
                dht.setEs_inscripcion_vig_essalud(rs.getString("es_inscripcion_vig_essalud"));
                dht.setEs_presenta_documento(rs.getString("es_presenta_documento"));
                dht.setEs_sexo(rs.getString("es_sexo"));
                dht.setEs_tipo_doc(rs.getString("es_tipo_doc"));
                dht.setFe_creacion(rs.getString("fe_creacion"));
                dht.setFe_modif(rs.getString("fe_modif"));
                dht.setFe_nacimiento(rs.getString("fe_nacimiento"));
                dht.setId_datos_hijos_trabajador(rs.getString("id_datos_hijos_trabajador"));
                dht.setId_trabajador(rs.getString("id_trabajador"));
                dht.setIp_usuario(rs.getString("ip_usuario"));
                dht.setNo_hijo_trabajador(rs.getString("no_hijo_trabajador"));
                dht.setNu_doc(rs.getString("nu_doc"));
                dht.setUs_creacion(rs.getString("us_creacion"));
                dht.setUs_modif(rs.getString("us_modif"));
                list.add(dht);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;

    }

    @Override
    public List<Padre_Madre_Conyugue> List_Conyugue(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM rhtd_padre_madre_conyugue where ap_nombres_conyugue is not null and id_trabajador='" + id_trabajador + "'";
        List<Padre_Madre_Conyugue> list = new ArrayList<Padre_Madre_Conyugue>();
        try {
            ResultSet rs = this.conn.query(sql);
            Padre_Madre_Conyugue pmc = new Padre_Madre_Conyugue();
            while (rs.next()) {
                pmc.setAp_nombres_conyugue(rs.getString("Ap_nombres_conyugue"));
                pmc.setAp_nombres_madre(rs.getString("ap_nombres_madre"));
                pmc.setAp_nombres_padre(rs.getString("ap_nombres_padre"));
                pmc.setEs_trabaja_upeu_conyugue(rs.getString("es_trabaja_upeu_conyugue"));
                pmc.setFe_creacion(rs.getString("fe_creacion"));
                pmc.setFe_modif(rs.getString("fe_modif"));
                pmc.setFe_nac_conyugue(rs.getString("fe_nac_conyugue"));
                pmc.setId_padre_madre_conyugue(rs.getString("id_padre_madre_conyugue"));
                pmc.setId_trabajador(rs.getString("id_trabajador"));
                pmc.setIp_usuario(rs.getString("ip_usuario"));
                pmc.setLi_inscripcion_vig_essalud(rs.getString("li_inscripcion_vig_essalud"));
                pmc.setNu_doc(rs.getString("nu_doc"));
                pmc.setTi_doc_id(rs.getString("Ti_doc_id"));
                pmc.setUs_creacion(rs.getString("us_creacion"));
                pmc.setUs_modif(rs.getString("us_modif"));
                list.add(pmc);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;
    }

    @Override
    public String List_Adventista(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select li_religion from RHTM_TRABAJADOR where li_religion = 1 and id_trabajador='" + id_trabajador + "'";
        String religion = "";
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            religion = rs.getString("li_religion");
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return religion;
    }

    @Override
    public String List_Req_nacionalidad(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_nacionalidad from rhtm_trabajador where id_trabajador not in ( select id_trabajador from rhtm_trabajador where id_nacionalidad != 'NAC-0044') and id_trabajador='" + id_trabajador + "'";
        String nacionalidad = "";
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            nacionalidad = rs.getString("id_nacionalidad");
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return nacionalidad;
    }

    @Override
    public List<V_Reg_Dgp_Tra> List_doc_req_pla(String iddgp, String idtra) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_REQ_DGP_TRA  where IDDGP='" + iddgp + "' AND ID_TRABAJADOR='" + idtra + "'";
        List<V_Reg_Dgp_Tra> x= new ArrayList<V_Reg_Dgp_Tra>();
        try {
            ResultSet rs=this.conn.query(sql);
            V_Reg_Dgp_Tra v=new V_Reg_Dgp_Tra();
            while(rs.next()){
                v.setId_document(rs.getString("id_document"));
                v.setId_tipo_plani(rs.getString("id_tipo_plani"));
                v.setId_requerimient(rs.getString("id_requerimient"));
                v.setDocumento(rs.getString("documento"));
                v.setTi_planilla(rs.getString("ti_planilla"));
                v.setPlanilla(rs.getString("planilla"));
                v.setIddgp(rs.getString("iddgp"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setCa_sueldo(rs.getDouble("ca_sueldo"));
                v.setDe_dias_trabajo(rs.getString("de_dias_trabajo"));
                v.setHorario(rs.getString("horario"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setId_requerimiento(rs.getString("id_requerimiento"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setCo_ruc(rs.getString("co_ruc"));
                v.setDe_lugar_servicio(rs.getString("de_lugar_servicio"));
                v.setDe_servicio(rs.getString("de_servicio"));
                v.setDe_periodo_pago(rs.getString("de_periodo_pago"));
                v.setDe_domicilio_fiscal(rs.getString("de_domicilio_fiscal"));
                v.setDe_subvencion(rs.getString("de_subvencion"));
                v.setDe_horario_capacitacion(rs.getString("de_horario_capacitacion"));
                v.setDe_horario_refrigerio(rs.getString("de_horario_refrigerio"));
                v.setDe_dias_capacitacion(rs.getString("de_dias_capacitacion"));
                v.setEs_dgp(rs.getString("es_dgp"));
                v.setTi_documento(rs.getString("ti_documento"));
                v.setId_documento_adjunto(rs.getString("id_documento_adjunto"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setId_documentos(rs.getString("id_documentos"));
                v.setEs_documento_adjunto(rs.getString("es_documento_adjunto"));
                v.setUs_creacion(rs.getString("us_creacion"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setFe_modif(rs.getString("fe_modif"));
                v.setIp_usuario(rs.getString("ip_usuario"));
                v.setDe_documento_adjunto(rs.getString("de_documento_adjunto"));
                v.setAr_dato_archivo(rs.getString("ar_dato_archivo"));
                v.setNo_archivo(rs.getString("no_archivo"));
                v.setTa_archivo(rs.getString("ta_archivo"));
                v.setAr_file_type(rs.getString("ar_file_type"));
                x.add(v);
            }
        } catch (SQLException e) {
        }finally{
            this.conn.close();
        }
        return x;
    }

}
