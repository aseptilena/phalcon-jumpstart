<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        {{ get_title() }}

        <link href="{{ static_url('/plugins/bootstrap/bootstrap.min.css') }}" rel="stylesheet" type="text/css">
        <link href="{{ static_url('/min/index.php?g=cssAdmin&rev=' ~ config.cssVersion) }}" rel="stylesheet">
        <script src="{{ static_url('/min/index.php?g=jquery&rev=' ~ config.jsVersion) }}"></script>
    </head>

    <body class="signin">
        {{content()}}
        <form method="post" action="">
            <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}"/>
            <section>
                <div class="panel panel-signin">
                    <div class="panel-body">
                        {{ flash.output() }}
                        <div class="logo text-center">
                            <img src="{{ static_url('/images/logo-brand.png') }}" alt="Phalcon Jumpstart Logo" width="220">
                        </div>
                        <br />
                        <h4 class="text-center mb5">Already a member?</h4>
                        <p class="text-center">Login with your account</p>

                        <div class="mb30"></div>

                        <form action="signin.html" method="post">
                            <div class="input-group mb15">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="text" name="femail" class="form-control" placeholder="you@example.com" value="{{ formData['femail'] }}" required autofocus>
                            </div><!-- input-group -->
                            <div class="input-group mb15">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input type="password" name="fpassword" class="form-control" placeholder="Password" required>
                            </div><!-- input-group -->

                            <div class="clearfix">
                                <div class="pull-left">
                                    <div class="ckbox ckbox-primary mt10">
                                        <input type="checkbox" name="fcookie" id="rememberMe" value="remember-me" {% if formData['fcookie'] == true %}checked{% endif %}>
                                        <label for="rememberMe" style="display: inline-block">Remember me</label>
                                    </div>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" name="fsubmit" class="btn btn-success">Login <i class="fa fa-angle-right ml5"></i></button>
                                </div>
                            </div>
                        </form>
                    </div><!-- panel-body -->
                </div><!-- panel -->
            </section>
        </form>
        <script type="text/javascript" src="{{ static_url('/plugins/bootstrap/bootstrap.min.js') }}"></script>
        <script src="{{ static_url('/min/index.php?g=jsAdmin&rev=' ~ config.jsVersion) }}"></script>
    </body>
</html>
