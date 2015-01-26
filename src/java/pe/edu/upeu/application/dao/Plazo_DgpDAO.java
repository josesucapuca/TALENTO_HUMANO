/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.dao_imp.InterfacePlazo_DgpDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.V_Dgp_Plazo;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author JAIR
 */
public class Plazo_DgpDAO implements InterfacePlazo_DgpDAO {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public List<Map<String, ?>> List_Plazo(String t_List) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select id_plazo,no_plazo,det_alerta ,to_char(fe_desde,'yyyy-mm-dd')  as fe_desde ,to_char(fe_hasta,'yyyy-mm-dd')  as fe_hasta  from rhtr_plazo where es_plazo ='1' and id_requerimiento='0' and SYSDATE BETWEEN FE_DESDE AND FE_HASTA";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {

                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_plazo"));
                rec.put("nom", rs.getString("no_plazo"));
                rec.put("det", rs.getString("DET_ALERTA"));
                rec.put("desde", rs.getString("FE_DESDE"));
                rec.put("hasta", rs.getString("FE_HASTA"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;

    }

    @Override
    public List<Map<String, ?>> Listar_Plazo() {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " select id_plazo,no_plazo,det_alerta ,to_char(fe_desde,'yyyy-mm-dd')  as fe_desde ,to_char(fe_hasta,'yyyy-mm-dd')  as fe_hasta, r.ID_TIPO_PLANILLA,p.ID_REQUERIMIENTO ,r.NO_REQ,t.TI_PLANILLA from rhtr_plazo p ,rhtr_requerimiento r , RHTR_TIPO_PLANILLA t where es_plazo ='1' and r.ID_REQUERIMIENTO = p.ID_REQUERIMIENTO and t.ID_TIPO_PLANILLA = r.ID_TIPO_PLANILLA union select id_plazo,no_plazo,det_alerta ,to_char(fe_desde,'yyyy-mm-dd')  as fe_desde ,to_char(fe_hasta,'yyyy-mm-dd')  as fe_hasta, '0','0' ,'Todos  los requerimientos','Todos las planillas' from rhtr_plazo  where es_plazo='1' and ID_REQUERIMIENTO='0'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {

                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_plazo"));
                rec.put("nom", rs.getString("no_plazo"));
                rec.put("det", rs.getString("DET_ALERTA"));
                rec.put("desde", rs.getString("FE_DESDE"));
                rec.put("hasta", rs.getString("FE_HASTA"));
                rec.put("id_req", rs.getString("id_requerimiento"));
                rec.put("req", rs.getString("no_req"));
                rec.put("planilla", rs.getString("ti_planilla"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;

    }

    @Override
    public void INSERT_PLAZO(String ID_PLAZO, String NO_PLAZO, String DET_ALERTA, String FE_DESDE, String FE_HASTA, String ES_PLAZO, String ID_REQUERIMIENTO) {
        try {

            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PLAZO( ?, ?, ?, ?, ?, ?,?)}");
            cst.setString(1, null);
            cst.setString(2, NO_PLAZO);
            cst.setString(3, DET_ALERTA);
            cst.setString(4, c.convertFecha(FE_DESDE));
            cst.setString(5, c.convertFecha(FE_HASTA));
            cst.setString(6, "1");
            cst.setString(7, ID_REQUERIMIENTO.trim());
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void UPDATE_PLAZO(String ID_PLAZO, String NO_PLAZO, String DET_ALERTA, String FE_DESDE, String FE_HASTA, String ES_PLAZO) {
        try {

            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_UPDATE_PLAZO( ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, ID_PLAZO);
            cst.setString(2, NO_PLAZO);
            cst.setString(3, DET_ALERTA);
            cst.setString(4, c.convertFecha(FE_DESDE));
            cst.setString(5, c.convertFecha(FE_HASTA));
            cst.setString(6, "1");
            cst.execute();
        } catch (SQLException ex) {
        } catch (ParseException ex) {
            Logger.getLogger(Plazo_DgpDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.conn.close();
        }
    }

    @Override
    public void REMOVE_PLAZO(String ID_PLAZO) {

        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " DELETE FROM RHTR_PLAZO WHERE ID_PLAZO='" + ID_PLAZO.trim() + "'";
            this.conn.ejecutar(sql);
        } catch (Exception e) {
            this.conn.close();
        }

    }

    @Override
    public List<V_Dgp_Plazo> Lista_detalle_plazo(String id) {

        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhvd_dgp_plazo where id_dgp='" + id + "'";
        List<V_Dgp_Plazo> list = new ArrayList<V_Dgp_Plazo>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Dgp_Plazo v = new V_Dgp_Plazo();

                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setId_plazo(rs.getString("id_plazo"));
                v.setNo_plazo(rs.getString("no_plazo"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setId_requerimiento(rs.getString("id_requerimiento"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setEs_plazo_cumplido(rs.getString("es_plazo_cumplido"));
                v.setNo_req(rs.getString("no_req"));
                v.setDet_alerta(rs.getString("det_alerta"));
                list.add(v);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;

    }

}
