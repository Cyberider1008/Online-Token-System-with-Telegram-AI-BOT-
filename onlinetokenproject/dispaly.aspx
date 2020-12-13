<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dispaly.aspx.cs" Inherits="onlinetokensystem.dispaly" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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
<body  class="page-content--bgf7">
    <form id="form1" runat="server">
        
<div class="container">
<div class="row justify-content-center">
<div class="col-md-6">
<div class="card mt-5">
     <div class="card-body text-center">
         
          <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick1" >
        </asp:Timer>
        <br />
                 <h1>Token</h1>
        <asp:Label ID="Label1" runat="server" Font-Size="100px"></asp:Label>
        <br/>
        <hr/>
        <asp:Label ID="Label2" runat="server" Font-Size="200px" ForeColor="Red"></asp:Label>
        <br/>
        <h1>Please go to Counter</h1>
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="70px" ForeColor="Red"></asp:Label>
       
       </div></div></div></div></div>

    </form>
    
</body>
</html>
