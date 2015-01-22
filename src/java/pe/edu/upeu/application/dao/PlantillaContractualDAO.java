/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pe.edu.upeu.application.dao_imp.InterfacePlantillaContractualDAO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author joserodrigo
 */
public class PlantillaContractualDAO implements InterfacePlantillaContractualDAO {

    ConexionBD cnn;

    @Override
    public List<Map<String, ?>> List_PLantillas(String id_puesto) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_PUESTO='"+id_puesto.trim()+"' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_SECCION=(SELECT ID_SECCION FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='"+id_puesto.trim()+"') AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_AREA=(SELECT ID_AREA FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='"+id_puesto.trim()+"')AND p.ID_SECCION='0'AND p.ID_PUESTO='0'AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1'UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DEPARTAMENTO=(SELECT ID_DEPARTAMENTO FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='"+id_puesto.trim()+"') AND p.ID_AREA='0'AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL,pl.NO_PLANTILLA,pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p,RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION=(SELECT ID_DIRECCION FROM RHVD_PUESTO_DIRECCION WHERE ID_PUESTO='"+id_puesto.trim()+"')AND p.ID_DEPARTAMENTO='0'AND p.ID_AREA='0' AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1' UNION SELECT pl.ID_PLANTILLA_CONTRACTUAL, pl.NO_PLANTILLA, pl.NO_ARCHIVO FROM RHTC_PLANTILLA_PUESTO p, RHTC_PLANTILLA_CONTRACTUAL pl WHERE p.ID_DIRECCION='0' AND p.ID_DEPARTAMENTO='0' AND p.ID_AREA='0' AND p.ID_SECCION='0' AND p.ID_PUESTO='0' AND pl.ID_PLANTILLA_CONTRACTUAL = p.ID_PLANTILLA_CONTRACTUAL AND p.ES_PLANTILLA_PUESTO='1'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_PLANTILLA_CONTRACTUAL"));
                rec.put("nombre", rs.getString("NO_PLANTILLA"));
                rec.put("nombre", rs.getString("NO_ARCHIVO"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

}
