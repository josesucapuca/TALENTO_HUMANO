/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;

/**
 *
 * @author Andres
 */
public interface InterfaceReporte_HistorialDAO {
    
   public List<Map<String,?>> Listar_Tra_Fecha(String FE_INICIO, String FE_FIN);
   public List<Map<String,?>> Listar_His_Estado_Civil(String FE_INICIO, String FE_FIN);
    
}