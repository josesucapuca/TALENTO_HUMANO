<%@page import="pe.edu.upeu.application.model.V_Usuario"%>
<%@page import="pe.edu.upeu.application.model.V_Var_Usuario"%>
<jsp:useBean id="Lista_Usuarios" scope="application" class="java.util.ArrayList" />
<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

        <title> Perfil de Usuario </title>
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
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">

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

    </head>
    <body class="">
        <!-- possible classes: minified, fixed-ribbon, fixed-header, fixed-width-->




        <!-- MAIN PANEL -->
        <div id="main" role="main" style="margin-left:0px;">


            <!-- MAIN CONTENT -->
            <div id="content">

                <!-- Bread crumb is created dynamically -->

                <!-- row -->

                <div class="row">

                    <div class="col-sm-12">


                        <div class="well well-sm">

                            <div class="row">

                                <div class="col-sm-12 col-md-12 col-lg-6">
                                    <div class="well well-light well-sm no-margin no-padding">

                                        <div class="row">
                                            <%

                                            V_Usuario  vu=  new V_Usuario();
                                            vu=(V_Usuario)Lista_Usuarios.get(0);
                                            %>
                                            <div class="col-sm-12">
                                                <div id="myCarousel" class="carousel fade profile-carousel">
                                                    <div class="air air-bottom-right padding-10">
                                                        <a href="javascript:void(0);" class="btn txt-color-white bg-color-teal btn-sm"><i class="fa fa-check"></i> Follow</a>&nbsp; <a href="javascript:void(0);" class="btn txt-color-white bg-color-pinkDark btn-sm"><i class="fa fa-link"></i> Connect</a>
                                                    </div>
                                                    <div class="air air-top-left padding-10">
                                                        <h4 class="txt-color-white font-md">Jan 1, 2014</h4>
                                                    </div>
                                                    <ol class="carousel-indicators">
                                                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                                                        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                                                    </ol>
                                                    <div class="carousel-inner">
                                                        <!-- Slide 1 -->
                                                        <div class="item active">
                                                            <img src="../../img/demo/s1.jpg" alt="demo user">
                                                        </div>
                                                        <!-- Slide 2 -->
                                                        <div class="item">
                                                            <img src="../../img/demo/s2.jpg" alt="demo user">
                                                        </div>
                                                        <!-- Slide 3 -->
                                                        <div class="item">
                                                            <img src="../../img/demo/m3.jpg" alt="demo user">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-12">

                                                <div class="row">

                                                    <div class="col-sm-3 profile-pic">
                                                        <img src="../../img/avatars/sunny-big.png" alt="demo user">
                                                        <div class="padding-10">
                                                            <h4 class="font-md"><strong>1,543</strong>
                                                                <br>
                                                                <small>Followers</small></h4>
                                                            <br>
                                                            <h4 class="font-md"><strong>419</strong>
                                                                <br>
                                                                <small>Connections</small></h4>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <h1><%=vu.getNo_usuario()%> <span class="semi-bold"><%=vu.getCl_tra()%></span>
                                                            <br>
                                                            <small> CEO, SmartAdmin</small></h1>

                                                        <ul class="list-unstyled">
                                                            <li>
                                                                <p class="text-muted">
                                                                    <i class="fa fa-phone"></i>&nbsp;&nbsp;(<span class="txt-color-darken">313</span>) <span class="txt-color-darken">464</span> - <span class="txt-color-darken">6473</span>
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p class="text-muted">
                                                                    <i class="fa fa-envelope"></i>&nbsp;&nbsp;<a href="mailto:simmons@smartadmin">ceo@smartadmin.com</a>
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p class="text-muted">
                                                                    <i class="fa fa-skype"></i>&nbsp;&nbsp;<span class="txt-color-darken">john12</span>
                                                                </p>
                                                            </li>
                                                            <li>
                                                                <p class="text-muted">
                                                                    <i class="fa fa-calendar"></i>&nbsp;&nbsp;<span class="txt-color-darken">Free after <a href="javascript:void(0);" rel="tooltip" title="" data-placement="top" data-original-title="Create an Appointment">4:30 PM</a></span>
                                                                </p>
                                                            </li>
                                                        </ul>
                                                        <br>
                                                        <p class="font-md">
                                                            <i>A little about me...</i>
                                                        </p>
                                                        <p>

                                                            Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio
                                                            cumque nihil impedit quo minus id quod maxime placeat facere

                                                        </p>
                                                        <br>
                                                        <a href="javascript:void(0);" class="btn btn-default btn-xs"><i class="fa fa-envelope-o"></i> Send Message</a>
                                                        <br>
                                                        <br>

                                                    </div>
                                                    <div class="col-sm-3">
                                                        <h1><small>Connections</small></h1>
                                                        <ul class="list-inline friends-list">
                                                            <li><img src="img/avatars/1.png" alt="friend-1">
                                                            </li>
                                                            <li><img src="img/avatars/2.png" alt="friend-2">
                                                            </li>
                                                            <li><img src="img/avatars/3.png" alt="friend-3">
                                                            </li>
                                                            <li><img src="img/avatars/4.png" alt="friend-4">
                                                            </li>
                                                            <li><img src="img/avatars/5.png" alt="friend-5">
                                                            </li>
                                                            <li><img src="img/avatars/male.png" alt="friend-6">
                                                            </li>
                                                            <li>
                                                                <a href="javascript:void(0);">413 more</a>
                                                            </li>
                                                        </ul>

                                                        <h1><small>Recent visitors</small></h1>
                                                        <ul class="list-inline friends-list">
                                                            <li><img src="img/avatars/male.png" alt="friend-1">
                                                            </li>
                                                            <li><img src="img/avatars/female.png" alt="friend-2">
                                                            </li>
                                                            <li><img src="img/avatars/female.png" alt="friend-3">
                                                            </li>
                                                        </ul>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                        <div class="row">

                                            <div class="col-sm-12">

                                                <hr>

                                                <div class="padding-10">

                                                    <ul class="nav nav-tabs tabs-pull-right">
                                                        <li class="active">
                                                            <a href="#a1" data-toggle="tab">Recent Articles</a>
                                                        </li>
                                                        <li>
                                                            <a href="#a2" data-toggle="tab">New Members</a>
                                                        </li>
                                                        <li class="pull-left">
                                                            <span class="margin-top-10 display-inline"><i class="fa fa-rss text-success"></i> Activity</span>
                                                        </li>
                                                    </ul>

                                                    <div class="tab-content padding-top-10">
                                                        <div class="tab-pane fade in active" id="a1">

                                                            <div class="row">

                                                                <div class="col-xs-2 col-sm-1">
                                                                    <time datetime="2014-09-20" class="icon">
                                                                        <strong>Jan</strong>
                                                                        <span>10</span>
                                                                    </time>
                                                                </div>

                                                                <div class="col-xs-10 col-sm-11">
                                                                    <h6 class="no-margin"><a href="javascript:void(0);">Allice in Wonderland</a></h6>
                                                                    <p>
                                                                        Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi Nam eget dui.
                                                                        Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero,
                                                                        sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel.
                                                                    </p>
                                                                </div>

                                                                <div class="col-sm-12">

                                                                    <hr>

                                                                </div>

                                                                <div class="col-xs-2 col-sm-1">
                                                                    <time datetime="2014-09-20" class="icon">
                                                                        <strong>Jan</strong>
                                                                        <span>10</span>
                                                                    </time>
                                                                </div>

                                                                <div class="col-xs-10 col-sm-11">
                                                                    <h6 class="no-margin"><a href="javascript:void(0);">World Report</a></h6>
                                                                    <p>
                                                                        Morning our be dry. Life also third land after first beginning to evening cattle created let subdue you'll winged don't Face firmament.
                                                                        You winged you're was Fruit divided signs lights i living cattle yielding over light life life sea, so deep.
                                                                        Abundantly given years bring were after. Greater you're meat beast creeping behold he unto She'd doesn't. Replenish brought kind gathering Meat.
                                                                    </p>
                                                                </div>

                                                                <div class="col-sm-12">

                                                                    <br>

                                                                </div>

                                                            </div>

                                                        </div>
                                                        <div class="tab-pane fade" id="a2">

                                                            <div class="alert alert-info fade in">
                                                                <button class="close" data-dismiss="alert">
                                                                    �
                                                                </button>
                                                                <i class="fa-fw fa fa-info"></i>
                                                                <strong>51 new members </strong>joined today!
                                                            </div>

                                                            <div class="user" title="email@company.com">
                                                                <img src="img/avatars/female.png" alt="demo user"><a href="javascript:void(0);">Jenn Wilson</a>
                                                                <div class="email">
                                                                    travis@company.com
                                                                </div>
                                                            </div>
                                                            <div class="user" title="email@company.com">
                                                                <img src="img/avatars/male.png" alt="demo user"><a href="javascript:void(0);">Marshall Hitt</a>
                                                                <div class="email">
                                                                    marshall@company.com
                                                                </div>
                                                            </div>
                                                            <div class="user" title="email@company.com">
                                                                <img src="img/avatars/male.png" alt="demo user"><a href="javascript:void(0);">Joe Cadena</a>
                                                                <div class="email">
                                                                    joe@company.com
                                                                </div>
                                                            </div>
                                                            <div class="user" title="email@company.com">
                                                                <img src="img/avatars/male.png" alt="demo user"><a href="javascript:void(0);">Mike McBride</a>
                                                                <div class="email">
                                                                    mike@company.com
                                                                </div>
                                                            </div>
                                                            <div class="user" title="email@company.com">
                                                                <img src="img/avatars/male.png" alt="demo user"><a href="javascript:void(0);">Travis Wilson</a>
                                                                <div class="email">
                                                                    travis@company.com
                                                                </div>
                                                            </div>
                                                            <div class="user" title="email@company.com">
                                                                <img src="img/avatars/male.png" alt="demo user"><a href="javascript:void(0);">Marshall Hitt</a>
                                                                <div class="email">
                                                                    marshall@company.com
                                                                </div>
                                                            </div>
                                                            <div class="user" title="Joe Cadena joe@company.com">
                                                                <img src="img/avatars/male.png" alt="demo user"><a href="javascript:void(0);">Joe Cadena</a>
                                                                <div class="email">
                                                                    joe@company.com
                                                                </div>
                                                            </div>
                                                            <div class="user" title="email@company.com">
                                                                <img src="img/avatars/male.png" alt="demo user"><a href="javascript:void(0);">Mike McBride</a>
                                                                <div class="email">
                                                                    mike@company.com
                                                                </div>
                                                            </div>
                                                            <div class="user" title="email@company.com">
                                                                <img src="img/avatars/male.png" alt="demo user"><a href="javascript:void(0);">Marshall Hitt</a>
                                                                <div class="email">
                                                                    marshall@company.com
                                                                </div>
                                                            </div>
                                                            <div class="user" title="email@company.com">
                                                                <img src="img/avatars/male.png" alt="demo user"><a href="javascript:void(0);">Joe Cadena</a>
                                                                <div class="email">
                                                                    joe@company.com
                                                                </div>
                                                            </div>
                                                            <div class="user" title="email@company.com">
                                                                <img src="img/avatars/male.png" alt="demo user"><a href="javascript:void(0);"> Mike McBride</a>
                                                                <div class="email">
                                                                    mike@company.com
                                                                </div>
                                                            </div>

                                                            <div class="text-center">
                                                                <ul class="pagination pagination-sm">
                                                                    <li class="disabled">
                                                                        <a href="javascript:void(0);">Prev</a>
                                                                    </li>
                                                                    <li class="active">
                                                                        <a href="javascript:void(0);">1</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:void(0);">2</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:void(0);">3</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:void(0);">...</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:void(0);">99</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="javascript:void(0);">Next</a>
                                                                    </li>
                                                                </ul>
                                                            </div>

                                                        </div><!-- end tab -->
                                                    </div>

                                                </div>

                                            </div>

                                        </div>
                                        <!-- end row -->

                                    </div>

                                </div>
                                <div class="col-sm-12 col-md-12 col-lg-6">

                                    <form method="post" class="well padding-bottom-10" onsubmit="return false;">
                                        <textarea rows="2" class="form-control" placeholder="What are you thinking?"></textarea>
                                        <div class="margin-top-10">
                                            <button type="submit" class="btn btn-sm btn-primary pull-right">
                                                Post
                                            </button>
                                            <a href="javascript:void(0);" class="btn btn-link profile-link-btn" rel="tooltip" data-placement="bottom" title="Add Location"><i class="fa fa-location-arrow"></i></a>
                                            <a href="javascript:void(0);" class="btn btn-link profile-link-btn" rel="tooltip" data-placement="bottom" title="Add Voice"><i class="fa fa-microphone"></i></a>
                                            <a href="javascript:void(0);" class="btn btn-link profile-link-btn" rel="tooltip" data-placement="bottom" title="Add Photo"><i class="fa fa-camera"></i></a>
                                            <a href="javascript:void(0);" class="btn btn-link profile-link-btn" rel="tooltip" data-placement="bottom" title="Add File"><i class="fa fa-file"></i></a>
                                        </div>
                                    </form>

                                    <div class="timeline-seperator text-center"> <span>10:30PM January 1st, 2013</span>
                                        <div class="btn-group pull-right">
                                            <a href="javascript:void(0);" data-toggle="dropdown" class="btn btn-default btn-xs dropdown-toggle"><span class="caret single"></span></a>
                                            <ul class="dropdown-menu text-left">
                                                <li>
                                                    <a href="javascript:void(0);">Hide this post</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);">Hide future posts from this user</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);">Mark as spam</a>
                                                </li>
                                            </ul>
                                        </div> 
                                    </div>
                                    <div class="chat-body no-padding profile-message">
                                        <ul>
                                            <li class="message">
                                                <img src="img/avatars/sunny.png" class="online" alt="sunny">
                                                <span class="message-text"> <a href="javascript:void(0);" class="username">John Doe <small class="text-muted pull-right ultra-light"> 2 Minutes ago </small></a> Can't divide were divide fish forth fish to. Was can't form the, living life grass darkness very
                                                    image let unto fowl isn't in blessed fill life yielding above all moved </span>
                                                <ul class="list-inline font-xs">
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-info"><i class="fa fa-reply"></i> Reply</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-danger"><i class="fa fa-thumbs-up"></i> Like</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-muted">Show All Comments (14)</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-primary">Edit</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-danger">Delete</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="message message-reply">
                                                <img src="img/avatars/3.png" class="online" alt="user">
                                                <span class="message-text"> <a href="javascript:void(0);" class="username">Serman Syla</a> Haha! Yeah I know what you mean. Thanks for the file Sadi! <i class="fa fa-smile-o txt-color-orange"></i> </span>

                                                <ul class="list-inline font-xs">
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-muted">1 minute ago </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-danger"><i class="fa fa-thumbs-up"></i> Like</a>
                                                    </li>
                                                </ul>

                                            </li>
                                            <li class="message message-reply">
                                                <img src="img/avatars/4.png" class="online" alt="user">
                                                <span class="message-text"> <a href="javascript:void(0);" class="username">Sadi Orlaf </a> Haha! Yeah I know what you mean. Thanks for the file Sadi! <i class="fa fa-smile-o txt-color-orange"></i> </span>

                                                <ul class="list-inline font-xs">
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-muted">a moment ago </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-danger"><i class="fa fa-thumbs-up"></i> Like</a>
                                                    </li>
                                                </ul>
                                                <input class="form-control input-xs" placeholder="Type and enter" type="text">
                                            </li>
                                        </ul>

                                    </div>

                                    <div class="timeline-seperator text-center"> <span>11:30PM November 27th, 2013</span>
                                        <div class="btn-group pull-right">
                                            <a href="javascript:void(0);" data-toggle="dropdown" class="btn btn-default btn-xs dropdown-toggle"><span class="caret single"></span></a>
                                            <ul class="dropdown-menu text-left">
                                                <li>
                                                    <a href="javascript:void(0);">Hide this post</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);">Hide future posts from this user</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);">Mark as spam</a>
                                                </li>
                                            </ul>
                                        </div> 
                                    </div>
                                    <div class="chat-body no-padding profile-message">
                                        <ul>
                                            <li class="message">
                                                <img src="img/avatars/1.png" class="online" alt="user">
                                                <span class="message-text"> <a href="javascript:void(0);" class="username">John Doe <small class="text-muted pull-right ultra-light"> 2 Minutes ago </small></a> Can't divide were divide fish forth fish to. Was can't form the, living life grass darkness very image let unto fowl isn't in blessed fill life yielding above all moved </span>
                                                <ul class="list-inline font-xs">
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-info"><i class="fa fa-reply"></i> Reply</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-danger"><i class="fa fa-thumbs-up"></i> Like</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-muted">Show All Comments (14)</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-primary">Hide</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="message message-reply">
                                                <img src="img/avatars/3.png" class="online" alt="user">
                                                <span class="message-text"> <a href="javascript:void(0);" class="username">Serman Syla</a> Haha! Yeah I know what you mean. Thanks for the file Sadi! <i class="fa fa-smile-o txt-color-orange"></i> </span>

                                                <ul class="list-inline font-xs">
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-muted">1 minute ago </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-danger"><i class="fa fa-thumbs-up"></i> Like</a>
                                                    </li>
                                                </ul>

                                            </li>
                                            <li class="message message-reply">
                                                <img src="img/avatars/4.png" class="online" alt="user">
                                                <span class="message-text"> <a href="javascript:void(0);" class="username">Sadi Orlaf </a> Haha! Yeah I know what you mean. Thanks for the file Sadi! <i class="fa fa-smile-o txt-color-orange"></i> </span>

                                                <ul class="list-inline font-xs">
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-muted">a moment ago </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-danger"><i class="fa fa-thumbs-up"></i> Like</a>
                                                    </li>
                                                </ul>

                                            </li>
                                            <li class="message message-reply">
                                                <img src="img/avatars/4.png" class="online" alt="user">
                                                <span class="message-text"> <a href="javascript:void(0);" class="username">Sadi Orlaf </a> Haha! Yeah I know what you mean. Thanks for the file Sadi! <i class="fa fa-smile-o txt-color-orange"></i> </span>

                                                <ul class="list-inline font-xs">
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-muted">a moment ago </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);" class="text-danger"><i class="fa fa-thumbs-up"></i> Like</a>
                                                    </li>
                                                </ul>

                                            </li>
                                            <li>
                                                <div class="input-group wall-comment-reply">
                                                    <input id="btn-input" type="text" class="form-control" placeholder="Type your message here...">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-primary" id="btn-chat">
                                                            <i class="fa fa-reply"></i> Reply
                                                        </button> </span>
                                                </div>
                                            </li>
                                        </ul>

                                    </div>


                                </div>
                            </div>

                        </div>


                    </div>

                </div>

                <!-- end row -->

            </div>
            <!-- END MAIN CONTENT -->

        </div>
        <!-- END MAIN PANEL -->

        <!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
        Note: These tiles are completely responsive,
        you can add as many as you like
        -->

        <!-- END SHORTCUT AREA -->

        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>

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

        <!-- EASY PIE CHARTS -->
        <script src="../../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!-- SPARKLINES -->
        <script src="../../js/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

        <!-- JQUERY SELECT2 INPUT -->
        <script src="../../js/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="../../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

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
        <!-- Voice command : plugin -->
        <script src="../../js/speech/voicecommand.min.js"></script>

        <!-- PAGE RELATED PLUGIN(S) 
        <script src="..."></script>-->

        <script type="text/javascript">

                                        // DO NOT REMOVE : GLOBAL FUNCTIONS!

                                        $(document).ready(function () {

                                            pageSetUp();

                                        })

        </script>

        <!-- Your GOOGLE ANALYTICS CODE Below -->
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();

        </script>

    </body>

</html>
