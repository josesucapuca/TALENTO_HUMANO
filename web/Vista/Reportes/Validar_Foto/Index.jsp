<%@page import="pe.edu.upeu.application.model.V_Solicitud_Requerimiento"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Validar Foto</title>

        <meta name="description" content="">
        <meta name="author" content="">

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/smartadmin-skins.min.css">

        <!-- SmartAdmin RTL Support is under construction
                 This RTL CSS will be released in version 1.5
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

        <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/demo.min.css">

        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../../img/favicon/favicon.ico" type="image/x-icon">

        <!-- GOOGLE FONT -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

        <!-- Specifying a Webpage Icon for Web Clip 
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
        <link rel="apple-touch-icon" href="../../../img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../../img/splash/touch-icon-ipad-retina.png">

        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">

        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">

        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
        <script type="text/javascript" src="../../../js/Js_Alerta/alertify.js"></script>
        <link rel="stylesheet" href="../../../css/Css_Alerta/alertify.core.css" />
        <link rel="stylesheet" href="../../../css/Css_Alerta/alertify.default.css" />
        <script type="text/javascript"  src="../../../js/Js_Alerta/Alertas.js"></script>
        <link href="../../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../../css/your_style.css" rel="stylesheet" type="text/css"/>
        <style>
          .noti{ 
              width:40px;
            height: 40px; 
            border-radius:50%;
            background: #e74c3c; 
            color: white;
            font-size: 20px;
            padding-left:6px;
            padding-top: 9px;
            margin-left: 230px;
            position:fixed;
            z-index: 5;
               }
        </style>
    </head>
    <body class="body"  >
        <div class="col-lg-offset-1 col-md-offset-1">
        <!-- widget grid -->
        <section id="widget-grid" class="">

            <!-- row -->
            <div class="row">
                <article class="col-sm-11">
                    <!-- new widget -->
                    <div class="jarviswidget" id="wid-id-0" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">

                        <header>
                            <span class="widget-icon"> <i class="glyphicon glyphicon-stats txt-color-darken"></i> </span>
                            <h2>Validar Fotos</h2>
                            
                            <ul class="nav nav-tabs pull-right in" id="myTab"> 
                                <li class="active">
                                    <a data-toggle="tab" href="#s1"><i class="fa fa-check-circle"></i> <span class="hidden-mobile hidden-tablet">Fotos Para Validar</span></a>
                                   
                                </li>

                                <li>
                                    <a data-toggle="tab" href="#s2"><i class="fa fa-facebook"></i> <span class="hidden-mobile hidden-tablet">Fotos Validadas</span></a>
                                </li>
                            </ul>

                        </header>

                        <!-- widget div-->
                        <div class="no-padding">
                            <!-- end widget edit box -->

                            <div class="widget-body">
                                <!-- content -->
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade active in padding-10 no-padding-bottom" id="s1">
                                        
                                                <div class="contenido-1"> 
                                                    
                                                    <div style="border-radius: 13px; padding: 10px;" class="ContFoto  text-center bg-info">
                                                        <h1 class="namet"></h1>
                                                         <span class="badge noti"></span>
                                                        <div class="foto-tr"></div>
                                                        <small>Validar la Foto  ? </small>
                                                        <div class="Validar">
                                                            <form>
                                                                <input class="id-tr" type="hidden" >
                                                                <input name=""type="hidden" value="">

                                                                <button class="acep btn btn-success btn-md"><samp class="fa fa-check"></samp> Aceptar</button>
                                                                <button class="recha btn btn-danger btn-md"><samp class="fa fa-ban"></samp> Rechazar</button>
                                                                
                                                            </form>   
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div style="border-radius: 13px; margin:2%; padding: 40px; display:none" class="n_img bg-info">
                                                    <div class="text-center">
                                                    <h1>No hay m�s Fotos para Validar </h1>
                                                    <span style="font-size: 100px" class="glyphicon glyphicon-check"></span>
                                                    </div>
                                                </div>
                                          
                                       <div class="padding-10">
                                       </div>
                                    </div>
                                    <!-- end s1 tab pane -->

                                    <div class="tab-pane fade" id="s2">
                                        <div class="widget-body-toolbar bg-color-white">
                                            <div class="row">
                                                <div class="acep2 col-lg-6" >
                                                    
                                                </div>
                                                <div class="recha2 col-lg-6" >
                                                    
                                                </div>
                                            </div>

                                                <div style="border-radius: 13px; margin: 2%;display: none; padding: 40px;" class="imagen-val bg-info">
                                                    <div class="text-center">
                                                    <h1>No hay m�s im�genes Validadas  </h1>
                                                    <span style="font-size: 100px" class="glyphicon glyphicon-ban-circle"></span>
                                                    </div>
                                                </div>

                                        </div>
                                        <div class="padding-10">
                                        </div>

                                    </div>

                                </div>

                                <!-- end content -->
                            </div>

                        </div>
                        <!-- end widget div -->
                    </div>
                    <!-- end widget -->

                </article>
            </div>

            <!-- end row -->

        </section>
        <!-- end widget grid -->
    </div>
    </body>



    <!--================================================== -->

    <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
    <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../../js/plugin/pace/pace.min.js"></script>

    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script>
        if (!window.jQuery) {
            document.write('<script src="../../../js/libs/jquery-2.0.2.min.js"><\/script>');
        }
    </script>

    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script>
        if (!window.jQuery.ui) {
            document.write('<script src="../../../js/libs/jquery-ui-1.10.3.min.js"><\/script>');
        }
    </script>

    <!-- IMPORTANT: APP CONFIG -->
    <script src="../../../js/app.config.js"></script>

    <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
    <script src="../../../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

    <!-- BOOTSTRAP JS -->
    <script src="../../../js/bootstrap/bootstrap.min.js"></script>

    <!-- CUSTOM NOTIFICATION -->
    <script src="../../../js/notification/SmartNotification.min.js"></script>

    <!-- JARVIS WIDGETS -->
    <script src="../../../js/smartwidgets/jarvis.widget.min.js"></script>

    <!-- EASY PIE CHARTS -->
    <script src="../../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

    <!-- SPARKLINES -->
    <script src="../../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

    <!-- JQUERY VALIDATE -->
    <script src="../../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

    <!-- JQUERY MASKED INPUT -->
    <script src="../../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

    <!-- JQUERY SELECT2 INPUT -->
    <script src="../../../js/plugin/select2/select2.min.js"></script>

    <!-- JQUERY UI + Bootstrap Slider -->
    <script src="../../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

    <!-- browser msie issue fix -->
    <script src="../../../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

    <!-- FastClick: For mobile devices -->
    <script src="../../../js/plugin/fastclick/fastclick.min.js"></script>

    <!--[if IE 8]>
    
    <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
    
    <![endif]-->

    <!-- Demo purpose only -->
    <script src="../../../js/demo.min.js"></script>

    <!-- MAIN APP JS FILE -->
    <script src="../../../js/app.min.js"></script>

    <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
    <!-- Voice command : plugin -->
    <script src="../../../js/speech/voicecommand.min.js"></script>

    <!-- PAGE RELATED PLUGIN(S) -->
    <script src="../../../js/plugin/jquery-form/jquery-form.min.js"></script>
    <script src="../../../js/plugin/datatables/jquery.dataTables.min.js"></script>
    <script src="../../../js/plugin/datatables/dataTables.colVis.min.js"></script>
    <script src="../../../js/plugin/datatables/dataTables.tableTools.min.js"></script>
    <script src="../../../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
    <script src="../../../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
    <script type="text/javascript" src="../../../js/JQuery/jquery.numeric.js"></script>
    <script type="text/javascript">
        var term;
        

        $(document).ready(function () {
         cargar_f("0");
         cargar_NV("1");
         cargar_NV("2");

        });
        
        function cargar_f(estado){
             console.log("val fotos ============0");
           $.ajax({
               url : "../../../validar_foto",
               type: "POST",
               data: "opc=getFotos&estado="+estado,
               success: getImg,
               error: error
           });
          function getImg(data){
              
              var total;
              $.each( data, function( i, obj){
                  if(obj.length === 0){
                   $('.ContFoto').hide(300);
                   $('.n_img').show(200);
               }
                  $.each(obj, function(p,objt){
                     total = p;
                     $('.noti').text(total+1);
                      });
                  $.each(obj, function(j,objt){
                      if(j === total){ 
                         total =+1; term=+1; }
                     if(j == total-1){
                       $('.foto-tr').append('<img class="img-tr" style="width:230px; height:230px; border-radius:50%;" src="../../Usuario/Fotos/'+objt.AR_FOTO+'" />');   
                       $('.namet').text(objt.NO_TRABAJADOR+' '+objt.AP_PATERNO+' '+objt.AP_MATERNO);
                       $('.id-tr').val(objt.ID_TRABAJADOR);
                       ;
                     } 
                  });
              });
           }
          function error(data){
             console.log(data.responseText);
          } 
         }
        
        function cargar_NV(estado){
             console.log("val fotos ============0");
           $.ajax({
               url : "../../../validar_foto",
               type: "POST",
               data: "opc=getFotos&estado="+estado,
               success: getImgn
           });
          function getImgn(data){
             $.each( data, function( i, obj){
                  if(obj.length === 0){
                     
                 //  $('.imagen-val').show(300);
               }
                  
                  $.each(obj, function(j,objt){
                     if(estado === "2"){
                       var htms = '<div class="col-md-5"> '+
                                '<div style="border-radius: 13px; padding: 5px;height:280px;" class="text-center bg-danger">'+
                                '<small> � Foto Rechazada ! </small>'+
                                '<h3>'+objt.NO_TRABAJADOR+' '+objt.AP_PATERNO+' '+objt.AP_MATERNO+'</h3>'+
                                '<img class="img-thumbnail" style="width:230px; height:170px;" src="../../Usuario/Fotos/'+objt.AR_FOTO+'" />'+
                                '</div><br/>'+
                                '</div>';
                         $('.recha2').append(htms);
                     }else if(estado === "1"){
                      var htm = '<div class="col-md-5"> '+
                                 '<div style="border-radius: 13px; padding:5px;height:280px;" class="text-center bg-success">'+
                                 '<small> � Foto Aceptada ! </small>'+
                                 '<h3>'+objt.NO_TRABAJADOR+' '+objt.AP_PATERNO+' '+objt.AP_MATERNO+'</h3>'+
                                 '<img class="img-thumbnail" style="width:230px; height:170px; " src="../../Usuario/Fotos/'+objt.AR_FOTO+'" />'+
                                 '</div><br/>'+
                                 '</div>';
                        $('.acep2').append(htm);
                     } 
                  });
              });
           }
         }
        
        
        $('.acep').click(function(){
            var idtr = $('.id-tr').val();
            //$.post( "../../../validar_foto", { opc: "aceptar", idtr: idtr, estado : "1" },function(dat){
           // });
            $.ajax({
                type: 'POST',
                url: '../../../validar_foto',
                data: 'opc=validar&idtr='+idtr+'&estado=1',
                success: function(r){
                    
                }
               });

        });
        
        $('.recha').click(function(){
            var idtr = $('.id-tr').val();
            $.ajax({
                type: 'POST',
                url: '../../../validar_foto',
                data: 'opc=validar&idtr='+idtr+'&estado=2',
                success: function(r){
                }
              });
        });

    </script>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
