/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Ub_Departamento;
import pe.edu.upeu.application.model.Ub_Provincia;
import pe.edu.upeu.application.model.V_Ubigeo;

/**
 *
 * @author Admin
 */
public interface InterfaceUbigeoDAO {
    public List<V_Ubigeo> List_Distrito();
    public List<Ub_Provincia> List_Provincia();
    public List<Ub_Departamento> List_Departamento();
}