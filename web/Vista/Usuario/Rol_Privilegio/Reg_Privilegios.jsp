
<%@page import="pe.edu.upeu.application.model.Privilegio"%>
<jsp:useBean id="List_Pri_Id" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title></title>
        <link rel="stylesheet" href="../../../css/Css_Formulario/form.css"  type="text/css" >
    </head>
    <body>

        <title class="title" >Registrar Privilegio</title>
        <form action="../../../Privilegio"> 
            <center><label class="title"> Registrar Rol</label>
            <table class="table" >  
                <tr><td>Nombre de Privilegio:</td><td ><input type="text" name="No_Link" class=""></td></tr>
                <tr><td>direccion url</td><td ><input type="text" name="Di_url" class=""></td></tr>
                <tr><td>direccion icono</td><td ><input type="text" name="Ic_Link" class=""></td></tr>
                <tr><td>Estado Privilegio</td><td>
                        <select name="Es_privilegio"  required="">
                            <option  value="1">Activado</option>
                            <option  value="0">Desactivado</option>
                        </select>
                    </td></tr>                           
                <tr><td colspan="2"><input type="submit" value="REGISTRAR PRIVILEGIO" name="opc"></td></tr>
            </table>
           </center>
        </form>
    </body>
</html>
<%@include file="List_Privilegios.jsp" %>