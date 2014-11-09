<%-- 
    Document   : Busc_Familiar
    Created on : 08/10/2014, 09:51:39 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Conyugue</title>

        <link rel="stylesheet" href="../../../css/Css_Sort/style.css" />
        <script type="text/javascript" src="../../../js/JQuery/jQuery.js"></script>
        <link type="text/css" rel="stylesheet" href="../../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../../css/bootstrap.min.css">

        <style>
            div{
                border: 1px solid blue;
            }
        </style>
    </head>
    <body>
        <div class="spacing">
            <center><h1 class="spacing" style="font-weight: bold;">Conyugue</h1></center> 
        </div>
    <center>
        <br>
        <div id="contenido">
            <div >

                <form class="form-inline" id="frm_filtro" method="post" name="formulario"  >

                    <div class="row">
                        <div class="form-group" >
                            <label class="control-label" >Nombres</label><br>
                            <input type="text"  class="form-control"  name="nom" maxlength="80" style="width: 250px">
                        </div>
                        <div class="form-group" >
                            <label class="control-label" >Apellido Paterno</label><br>
                            <input type="text"  class="form-control"  name="ap_pa" maxlength="80" style="width: 250px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label class="control-label" >Apellido Materno</label><br>
                            <input type="text"  class="form-control"  name="ap_ma" maxlength="80" style="width: 250px">
                        </div>

                        <div class="form-group">
                            <label class="control-label" >DNI:</label><br>
                            <input type="text"  class="form-control"  onKeyPress="return checkIt(event)"  style="width: 250px" name="dni" maxlength="8">
                        </div>
                    </div>

                    <div class="row">
                    
                            <div class="form-group">                            
                                <button type="button" class="btn btn-primary" id="btnfiltrar" style="margin:10px;">Buscar</button>
                            </div>
                            <div class="form-group">  
                                <a href="javascript:;"  id="btncancel" class="btn btn-primary" style="margin:10px;">Cancelar</a>
                            </div>
         
                    </div>

                </form>

            </div> 

            <hr/>
            <div class="container">
                <table     id="data" class="tinytable" style="width: 75%">
                    <thead class="tab_cabe">
                        <tr class="tr">
                            <td style="" ><span title="NOMBRE_AP">Nombres y Apellidos</span></td>
                            <td  ><span  >DNI</span></td>

                        </tr>
                    </thead>

                    <tbody class="tbodys">
                    </tbody>
                </table>

            </div>



        </div>
    </center>

</body>
<script>
    $(document).ready(function() {
        var b = $(".tbodys");

        $("#btnfiltrar").click(
                function() {


                    $.post("../../../ajax/Ajax_Conyugue/Ajax_Busc_Conyug.jsp", $("#frm_filtro").serialize(), function(objJson) {
                        b.empty();
                        var list = objJson.lista;
                        for (var i = 0; i < list.length; i++) {
                            b.append("<tr>");
                            b.append("<td>" + list[i].NOM + "asd" + list[i].AP_PA + list[i].AP_MA + "</td>");
                            b.append("<td>" + list[i].NU_DOC + "</td>");

                            b.append("</tr>");

                        }
                    }
                    );

                }
        );
        $("#btncancel").click(
                function() {
                    document.formulario.reset();
                    b.empty();
                    html = '<tr><td colspan="8" align="center">Haga la busqueda por algunos de los filtros...</td></tr>'
                    $(".tbodys").html(html);
                }
        );

    }
    );


</script>

</html>