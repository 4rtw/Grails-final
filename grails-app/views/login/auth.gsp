<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
%{--    <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">--}%
%{--    <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">--}%
%{--    <link type="text/css" href="css/theme.css" rel="stylesheet">--}%
    <asset:stylesheet src="bootstrap/css/bootstrap.min.css"/>
    <asset:stylesheet src="bootstrap/css/bootstrap-responsive.min.css"/>
    <asset:stylesheet src="bootstrap/theme.css"/>
</head>
<body>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <i class="icon-reorder shaded"></i>
            </a>

            <a class="brand" href="/projet">
                Lecoincoin
            </a>

            <div class="nav-collapse collapse navbar-inverse-collapse">

            </div><!-- /.nav-collapse -->
        </div>
    </div><!-- /navbar-inner -->
</div><!-- /navbar -->



<div class="wrapper">
    <div class="container">
        <div class="row">
            <div class="module module-login span4 offset4">
                <form class="form-vertical" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
                    <div class="module-head">
                        <h3>Sign In</h3>
                    </div>
                    <div class="module-body">
                        <div class="control-group">
                            <div class="controls row-fluid">
                                <input class="span12" type="text" name="${usernameParameter ?: 'username'}" id="inputEmail" placeholder="Username">
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls row-fluid">
                                <input class="span12"  name="${passwordParameter ?: 'password'}" type="password" id="inputPassword" placeholder="Password">
                            </div>
                        </div>
                    </div>
                    <div class="module-foot">
                        <div class="control-group">
                            <div class="controls clearfix">
                                <button type="submit" class="btn btn-primary pull-right">Se connecter</button>
%{--                                <label class="checkbox">--}%
%{--                                    <input type="checkbox"> Remember me--}%
%{--                                </label>--}%
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div><!--/.wrapper-->

<div class="footer">
%{--    <div class="container">--}%
%{--        <b class="copyright">&copy; 2014 Edmin - EGrappler.com </b> All rights reserved.--}%
%{--    </div>--}%
</div>
%{--<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>--}%
%{--<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>--}%
%{--<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>--}%
</body>