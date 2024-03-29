<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/images/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/images/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>

<body>
    <div class="wrapper">
        <div class="sidebar" data-image="../assets/images/sidebar-5.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="javascript:;" class="simple-text">
                      Lecoincoin
                    </a>
                </div>
                
                <ul class="nav">
                    <li class="nav-item active">
                        <g:link class="nav-link" controller="annonce" action="index">
                             Ads
                        </g:link>
                    </li>
                    <li class="nav-item active">
                        <g:link class="nav-link" controller="user" action="index">
                            Users
                        </g:link>
                    </li>
                    
                    <!--<li class="nav-item active active-pro">
                        <a class="nav-link active" href="javascript:;">
                            <i class="nc-icon nc-alien-33"></i>
                            <p>Upgrade plan</p>
                        </a>
                    </li>-->
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <ul class="tp-breadcrumb">
                        <li>
                            <a class="navbar-brand" href="/projet">Home</a>
                        </li>
                        <li>
                            <a class="navbar-brand" href="#"><g:layoutTitle default="Grails"/></a>
                        </li>
                    </ul>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
<!--                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="dropdown">
                                    <i class="nc-icon nc-palette"></i>
                                    <span class="d-lg-none">Dashboard</span>
                                </a>
                            </li>
                            <li class="dropdown nav-item">
                                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                    <i class="nc-icon nc-planet"></i>
                                    <span class="notification">5</span>
                                    <span class="d-lg-none">Notification</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Notification 1</a>
                                    <a class="dropdown-item" href="#">Notification 2</a>
                                    <a class="dropdown-item" href="#">Notification 3</a>
                                    <a class="dropdown-item" href="#">Notification 4</a>
                                    <a class="dropdown-item" href="#">Another notification</a>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nc-icon nc-zoom-split"></i>
                                    <span class="d-lg-block">&nbsp;Search</span>
                                </a>
                            </li>-->
                        </ul>
                        <ul class="navbar-nav ml-auto">
<!--                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Account</span>
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="no-icon">Dropdown</span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </li>-->
                            <li class="nav-item">
%{--                                <a class="nav-link" href="/logout/index">--}%
%{--                                    <span class="no-icon">Logout</span>--}%
%{--                                </a>--}%
                                <g:form controller="logout">
                                    <g:submitButton class="dropdown-item navbar-dark color-light" name="Submit" value="Logout" />
                                </g:form>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                    <div class="section">
                        <div class="card">
                            <div class="card-body">
                                <g:layoutBody/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
%{--                    <nav>--}%
%{--                        <ul class="footer-menu">--}%
%{--                            <li>--}%
%{--                                <a href="#">--}%
%{--                                    Home--}%
%{--                                </a>--}%
%{--                            </li>--}%
%{--                            <li>--}%
%{--                                <a href="#">--}%
%{--                                    Company--}%
%{--                                </a>--}%
%{--                            </li>--}%
%{--                            <li>--}%
%{--                                <a href="#">--}%
%{--                                    Portfolio--}%
%{--                                </a>--}%
%{--                            </li>--}%
%{--                            <li>--}%
%{--                                <a href="#">--}%
%{--                                    Blog--}%
%{--                                </a>--}%
%{--                            </li>--}%
%{--                        </ul>--}%
%{--                        <p class="copyright text-center">--}%
%{--                            ©--}%
%{--                            <script>--}%
%{--                                document.write(new Date().getFullYear())--}%
%{--                            </script>--}%
%{--                            <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web--}%
%{--                        </p>--}%
%{--                    </nav>--}%
                </div>
            </footer>
        </div>
    </div>
    
</body>

<asset:javascript src="application.js"/>

</html>
