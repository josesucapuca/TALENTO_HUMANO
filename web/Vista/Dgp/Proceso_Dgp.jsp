<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>
<%@page import="pe.edu.upeu.application.dao.AutorizacionDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
        String ID_DEP = (String) sesion_1.getAttribute("DEPARTAMENTO_ID");
%>
<%@page import="java.util.Iterator"%>
<%@page import="pe.edu.upeu.application.dao.DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDgpDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.upeu.application.model.V_Es_Requerimiento"%>

<jsp:useBean class="java.util.ArrayList" id="LIST_DGP_PROCESO" scope="session" />
<!DOCTYPE html>
<html lang="en-us">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Estado de Requerimiento </title>
        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <link href="../../css/your_style.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">


            /* Form Progress */
            .new-progress {
                //width: 100%;
                margin:0px;
                text-align: center;
            }
            .new-progress .new-circle,
            .new-progress .new-bar {
                display: inline-block;
                background: #fff;
                width: 33px; height: 33px;
                border-radius: 100%;
                border: 1px solid #d5d5da;
            }
            .new-progress .new-bar {
                position: relative;
                display: inline-block;
                width: 30px;
                height: 6px;
                //margin: 0 -0.01% 3% -5px;
                border-left: none;
                border-right: none;
                border-radius: 0;
            }

            .new-progress .new-circle .new-label {
                display: inline-block;
                width: 25px;
                height: 25px;
                // line-height: 32px;
                border-radius: 32px;
                margin-top: 3px;
                color: #b5b5ba;
                // font-size: 17px;
            }
            .new-progress .new-circle .new-title {
                color: #b5b5ba;
                font-size: 100%;
                //line-height: 30px;
                //margin-left: -5px;
            }

            /* Done / Active */
            .new-progress .new-bar.done,
            .new-progress .new-circle.done {
                background: #eee;
                color:black;
            }
            .new-progress .new-circle.rechazo {
                background: #a90329;
                color: #b5b5ba;
            }
            .new-progress .new-bar.active {
                background: linear-gradient(to right, #EEE 40%, #FFF 60%);
            }
            .new-progress .new-circle.done .new-label {
                color: #FFF;
                background: #8bc435;
                box-shadow: inset 0 0 2px rgba(0,0,0,.2);
            }
            .new-progress .new-circle.done .new-title {
                color: #b5b5ba;
            }
            .new-progress .new-circle.active .new-label {
                color: #FFF;
                background: #0c95be;
                box-shadow: inset 0 0 2px rgba(0,0,0,.2);
            }
            .new-progress .new-circle.active .new-title {
                color: black;
            }
            .new-progress .new-circle.done .new-label:hover, .new-circle:hover{

                //background-color:#739e73; 
            }

        </style>
    </head>
    <%
        if (request.getParameter("a") != null) {
            if (request.getParameter("a").equals("t")) {
    %>
    <body onload="closedthis();
            nobackbutton();">
        <%
            }
        } else {
        %>
    <body class="" onload="nobackbutton()">
        <%}%>
        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">

                <!-- widget grid -->
                <section id="widget-grid" class="">

                    <!-- row -->
                    <div class="row">

                        <!-- NEW WIDGET START -->
                        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12"  style="margin-top:2.5%;">

                            <!-- Widget ID (each widget will need unique ID)-->
                            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"   data-widget-editbutton="false"

                                 data-widget-togglebutton="false"
                                 data-widget-deletebutton="false"
                                 data-widget-fullscreenbutton="false"

                                 data-widget-sortable="false"
                                 >
                                <!-- widget options:
                                usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

                                data-widget-colorbutton="false"
                                data-widget-editbutton="false"
                                data-widget-togglebutton="false"
                                data-widget-deletebutton="false"
                                data-widget-fullscreenbutton="false"
                                data-widget-custombutton="false"
                                data-widget-collapsed="true"
                                data-widget-sortable="false"
                                -->
                                <header>
                                    <span class="widget-icon"> <i class="fa fa-user"></i> </span>
                                    <h2 class="font-md"><strong>Estado de </strong> <i>Requerimientos</i></h2>

                                </header>

                                <!-- widget div-->
                                <div>

                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->
                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding">

                                        <table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
                                            <thead>
                                                <tr>
                                                    <th data-hide="phone">Nro</th>
                                                    <th>MES</th>
                                                    <th data-hide="phone,tablet"><i class="fa fa-fw fa-building text-muted hidden-md hidden-sm hidden-xs"></i> Acciones</th>

                                                    <th data-class="expand">Nombre</th>
                                                    <th data-class="expand">Proceso</th>
                                                        <%if (ID_DEP.equals("DPT-0019")) {%>
                                                    <th data-hide="phone,tablet">Departamento</th>
                                                        <%}%>
                                                    <th >Estado</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <input type="hidden" value="<%=LIST_DGP_PROCESO.size()%>" class="tama�o"/>
                                            <%
                                                InterfaceDgpDAO d = new DgpDAO();
                                                for (int i = 0; i < LIST_DGP_PROCESO.size(); i++) {
                                                    V_Es_Requerimiento r = new V_Es_Requerimiento();
                                                    r = (V_Es_Requerimiento) LIST_DGP_PROCESO.get(i);
                                            %>
                                            <tr>
                                                <td><strong><%=i + 1%></strong></td>
                                                <td><%=r.getMes_procesamiento()%></td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                            Accion <span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="../../dgp?iddgp=<%=r.getId_dgp().trim()%>&opc=User_Aut">Usuarios - Prox. Autorizacion</a></li>
                                                            <li><a href="../../dgp?iddgp=<%=r.getId_dgp().trim()%>&opc=Seguimiento">Ver Historial</a> </li>
                                                            <li><a href="../../documento?iddgp=<%=r.getId_dgp().trim()%>&idtr=<%=r.getId_trabajador().trim()%>&opc=Ver_Documento">Ver Documentos</a></li>
                                                            <li><a data-valor="<%=r.getId_dgp().trim()%>;<%=r.getId_trabajador().trim()%>;<%=r.getAp_paterno().toUpperCase() + " " + r.getAp_materno().toUpperCase() + " " + r.getNo_trabajador().toUpperCase()%>" class="click" data-toggle="modal" data-target="#myModal" data-backdrop="static" data-keyboard="false" onclick="sendAjax('')" >Comentario</a></li>
                                                            <li><a href="../../solicitud_requerimiento?iddgp=<%=r.getId_dgp().trim()%>&opc=Reg_List_Solicitud">Hacer Solicitud</a></li>
                                                            <li class="divider"></li><li>
                                                            <li><a href="../../dgp?iddgp=<%=r.getId_dgp().trim()%>&idtr=<%=r.getId_trabajador().trim()%>&opc=Detalle">Ver Requerimiento</a> </li>


                                                        </ul>
                                                    </div>

                                                </td> 
                                                <% if (r.getAr_foto() == null) {%>
                                                <td><img class="user_avatar_<%=r.getId_trabajador()%>"  src="../../imagenes/avatar_default.jpg"  width="30"  height="30">
                                                    <a style="margin-left: 3%;" href="../../trabajador?idtr=<%=r.getId_trabajador()%>&opc=list"> 
                                                        <strong><%=r.getAp_paterno().toUpperCase() + " " + r.getAp_materno().toUpperCase() + " " + r.getNo_trabajador().toUpperCase()%></strong></a>
                                                </td>
                                                <%} else {%>
                                                <td>
                                                    <img class="user_avatar_<%=r.getId_trabajador()%>" src="<%=FactoryConnectionDB.url_archivos + "Fotos/" + r.getAr_foto()%>"  width="30"  height="30"><a href="../../trabajador?idtr=<%=r.getId_trabajador()%>&opc=list"> 
                                                        <strong><%=r.getAp_paterno().toUpperCase() + " " + r.getAp_materno().toUpperCase() + " " + r.getNo_trabajador().toUpperCase()%></strong></a> 
                                                </td>
                                                <%}%>
                                                <td>
                                                    <%
                                                        String dgp = r.getId_dgp();
                                                        String iddrp = r.getId_detalle_req_proceso();
                                                        String iddep = r.getId_departamento();
                                                    %>
                                                    <div class="new-progress prog_aut"  data-value="&dgp=<%=dgp%>&idrp=<%=iddrp%>&iddep=<%=iddep%>" >
                                                        <img src="../../img/ajax-loader/horizontal_fountain.gif" />
                                                    </div>

                                                </td>
                                                <%if (ID_DEP.equals("DPT-0019")) {%>
                                                <td><%=r.getNo_dep()%></td>
                                                <%} %>
                                                <td>
                                                    <%if (r.getEs_dgp().equals("2")) {
                                                            out.print(" <span class='label label-danger'>Fuera de Proceso</span>");
                                                        } else {
                                                            out.print(" <span class='label label-primary'>En Proceso</span>");
                                                        }%>
                                                </td>

                                            </tr>
                                            <% }
                                                LIST_DGP_PROCESO.clear();
                                            %>
                                            </tbody>
                                        </table>
                                        <!-------------- Modal  ----------->
                                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close-form close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        <div class="datos_trabajador text-left">
                                                        </div>
                                                        <h4 class="modal-title" id="myModalLabel">A�adir Comentario</h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <!--<button class="add-coment btn btn-primary btn-block">Add Comentario</button> -->
                                                        <div class="area-coment">
                                                            <form class="comentari-form" method="post">
                                                                <textarea class="mensaje"></textarea>
                                                                <p></p>
                                                                <input name="idDgp" class="idDgp" type="hidden" value="">
                                                                <div class="contador">
                                                            </form>
                                                        </div>
                                                    </div>

                                                    <div class="comentarios">
                                                        <div>
                                                            <legend>Comentarios </legend>
                                                            <div class="comentario-dgp"></div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="close-form btn btn-default" data-dismiss="modal">Close</button>
                                                        <button type="button" onclick="Registrar()" class="comet btn btn-success">Comentar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        <!-----Modal------------------------------------------->
                                </div>
                                <!-- end widget content -->

                            </div>
                            <!-- end widget div -->

                    </div>
                                            
                    <!-- end widget -->



                    </article>
                    <!-- WIDGET END -->

            </div>
                                            <div class="row"></div>

            <!-- end row -->

            <!-- end row -->

        </section>
        <!-- end widget grid -->

    </div>
    <!-- END MAIN CONTENT -->

</div>
<!-- END MAIN PANEL -->





<!--================================================== -->

<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
<script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plugin/pace/pace.min.js"></script>

<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>

<script>
                                                            if (!window.jQuery) {
                                                                document.write('<script src="../../js/libs/jquery-2.0.2.min.js"><\/script>');
                                                            }
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>


<script>
                                                            if (!window.jQuery.ui) {
                                                                document.write('<script src="../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
                                                            }
</script>

<!-- IMPORTANT: APP CONFIG -->
<script src="../../js/app.config.js"></script>

<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
<script src="../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

<!-- BOOTSTRAP JS -->
<script src="../../js/bootstrap/bootstrap.min.js"></script>

<!-- CUSTOM NOTIFICATION -->
<script src="../../js/notification/SmartNotification.min.js"></script>

<!-- JARVIS WIDGETS -->
<script src="../../js/smartwidgets/jarvis.widget.min.js"></script>

<!-- EASY PIE CHARTS
<script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script> -->

<!-- SPARKLINES 
<script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>-->

<!-- JQUERY VALIDATE 
<script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>-->

<!-- JQUERY MASKED INPUT 
<script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>-->

<!-- JQUERY SELECT2 INPUT
<script src="../../js/plugin/select2/select2.min.js"></script> -->

<!-- JQUERY UI + Bootstrap Slider 
<script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>-->


<!-- browser msie issue fix -->
<script src="../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

<!-- FastClick: For mobile devices -->
<script src="../../js/plugin/fastclick/fastclick.min.js"></script>

<!--[if IE 8]>

<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

<![endif]-->

<!-- Demo purpose only -->
<script src="../../js/demo.min.js"></script>

<!-- MAIN APP JS FILE -->
<script src="../../js/app.min.js"></script>


<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
<!-- Voice command : plugin
<script src="../../js/speech/voicecommand.min.js"></script> -->

<!-- PAGE RELATED PLUGIN(S) -->

<script src="../../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
<script src="../../js/plugin/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<script src="../../js/coment/comenth.js" type="text/javascript"></script>
<script type="text/javascript">

                                                            // DO NOT REMOVE : GLOBAL FUNCTIONS!
                                                            function closedthis() {
                                                                $.smallBox({
                                                                    title: "�DGP registrada correctamente!",
                                                                    content: "Ya puede visualizar la informacion del DGP",
                                                                    color: "#739E73",
                                                                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                                    timeout: 6000
                                                                });
                                                            }
                                                            function closedthis2() {
                                                                $.smallBox({
                                                                    title: "�Documentos del trabajador registrados correctamente!",
                                                                    content: "ya puede visualizar toda los documentos del trabajador...",
                                                                    color: "#739E73",
                                                                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                                                    timeout: 6000
                                                                });
                                                            }
                                                            function Imprimir_det_proceso(objProg_aut) {
                                                                objProg_aut.empty();
                                                                objProg_aut.append('<img src="../../img/ajax-loader/horizontal_fountain.gif" />');
                                                                $.ajax({
                                                                    url: "../../dgp", data: "opc=Imprimir_det_proceso" + objProg_aut.data("value"), type: 'POST', success: function (data, textStatus, jqXHR) {
                                                                        if (data.rpta === "1") {
                                                                            objProg_aut.empty();
                                                                            objProg_aut.append(data.html);
                                                                            objProg_aut.find(".new-circle").popover({trigger: 'hover click'});
                                                                        }
                                                                    }
                                                                });
                                                            }
                                                            function nobackbutton() {
                                                                window.location.hash = "no-back-button";
                                                                window.location.hash = "Again-No-back-button" //chrome

                                                                window.onhashchange = function () {
                                                                    window.location.hash = "";
                                                                };
                                                            }

                                                            $(document).ready(function () {
                                                                pageSetUp();
                                                                $.sound_path = "../../sound/", $.sound_on = !0, jQuery(document).ready(function () {
                                                                    $("body").append("<div id='divSmallBoxes'></div>"), $("body").append("<div id='divMiniIcons'></div><div id='divbigBoxes'></div>")
                                                                });
                                                                $('#coment-1').click(function () {
                                                                    console.log("jalar comentario");
                                                                    $.get('../../comentario?iddgp=DGP-000119&opc=Comentar_Dgp', function (responseJson) {
                                                                        var $select = $('.comentarios');
                                                                        $select.find('h2').remove();
                                                                        $.each(responseJson, function (value) {
                                                                            $('<p>').text(value).appendTo($select);
                                                                        });
                                                                    });
                                                                });

                                                                var responsiveHelper_dt_basic = undefined;
                                                                var breakpointDefinition = {
                                                                    tablet: 1024,
                                                                    phone: 480
                                                                };
                                                                var table_req = $('#dt_basic').dataTable({
                                                                    "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
                                                                            "t" +
                                                                            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                                                                    "autoWidth": true,
                                                                    "preDrawCallback": function () {
                                                                        // Initialize the responsive datatables helper once.
                                                                        if (!responsiveHelper_dt_basic) {
                                                                            responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
                                                                        }
                                                                    },
                                                                    "rowCallback": function (nRow) {
                                                                        responsiveHelper_dt_basic.createExpandIcon(nRow);
                                                                    },
                                                                    "drawCallback": function (oSettings) {
                                                                        responsiveHelper_dt_basic.respond();
                                                                    }
                                                                });

                                                                /* END BASIC */
                                                                var rows = table_req.fnGetNodes();
                                                                for (var i = 0; i < rows.length; i++) {
                                                                    var obj = $(rows[i]).find(".prog_aut");
                                                                    Imprimir_det_proceso(obj);
                                                                }

                                                            });

</script>

</body>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
