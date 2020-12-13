<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="onlinetokensystem.login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>login</title>
        <!-- Required meta tags-->
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="au theme template"/>
    <meta name="author" content="Hau Nguyen"/>
    <meta name="keywords" content="au theme template"/>
    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all"/>
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all"/>
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all"/>
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all"/>
    <!-- Bootstrap CSS-->
    <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all"/>
    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all"/>
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all"/>
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all"/>
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all"/>
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all"/>
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all"/>
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all"/>
    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all"/>
</head>
<body class="animsition">
           <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="#">
                                <img src="images/icon/logo.png" alt="CoolAdmin"/>
                            </a>
                        </div>
                        <div class="login-form">
                          <form id="form1" runat="server">
                              <div class="form-group">
                                    <label>Email Address</label>
                                  <asp:TextBox ID="usrtxt" runat="server" CssClass="au-input au-input--full" placeholder="UserName" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="usrpwd" runat="server" CssClass="au-input au-input--full" placeholder="Password" TextMode="Password" ></asp:TextBox>
                                </div>
                                <div class="login-checkbox">
                                    <label>
                                          <input type="checkbox" onchange="document.getElementById('usrpwd').type = this.checked ? 'text' : 'password'"/>
            Show password
                                    </label>
                                    <label>
                                        <a href="forgetpassword.aspx">Forgotten Password?</a>
                                    </label>
                                </div>
                                  <asp:Button ID="loginbtn" runat="server" CssClass="au-btn au-btn--block au-btn--green m-b-20" Text="sign in" OnClick="loginbtn_Click" />
                               </form>
                              </div>
                         <div class="register-link">
                                <p>
                                    Don't you have account?
                                    <a href="register.aspx">Sign Up Here</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- Jquery JS-->
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="js/main.js"></script>
</body>
</html>
