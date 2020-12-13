<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="onlinetokensystem.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Register</title>
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
  <form id="form1" runat="server">
     <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6">
               <div class="card">
                  <header class="card-header">
	<a href="login.aspx" class="float-right btn btn-outline-primary mt-1" >Log in</a>
	<h4 class="card-title mt-2">Sign up</h4>
</header>
                     <article class="card-body">
                    	<div class="form-row">
	                    	<div class="col form-group">
		                	    <label>First name </label>  
		                	    <asp:TextBox ID="t1" runat="server" CssClass="form-control"  AutoCompleteType="Disabled"  ></asp:TextBox>
		                  	</div> <!-- form-group end.// -->
		                    <div class="col form-group">
	                    		<label>Last name</label>
	                    	   <asp:TextBox ID="t2" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                            </div> <!-- form-group end.// -->
	</div> <!-- form-row end.// -->
	<div class="form-group">
		<label>Age</label>
		   <asp:TextBox ID="t3" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TextMode="Number"></asp:TextBox>
     <label>Email address</label>
		<asp:TextBox ID="t4" runat="server"  CssClass="form-control"  AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
       		<small class="form-text text-muted">We'll never share your email with anyone else.</small>
	</div> <!-- form-group end.// -->
	<div class="form-group">
        	<label class="form-check form-check-inline">Gender</label>
                 <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-check-label"  RepeatDirection="Horizontal" Width="200px">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            
	</div> <!-- form-group end.// -->
	<div class="form-row">
		<div class="form-group col-md-6">
		  <label>City</label>
		<asp:TextBox ID="citytxt" runat="server"  CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
   		</div> <!-- form-group end.// -->
		<div class="form-group col-md-6">
		  <label>States</label>
		 <asp:DropDownList ID="statedown" runat="server" CssClass="form-control">
             <asp:ListItem Selected="True">Maharastra</asp:ListItem>
             <asp:ListItem>Gujrat</asp:ListItem>
             <asp:ListItem>Odisha</asp:ListItem>
             <asp:ListItem>Bihar</asp:ListItem>
            </asp:DropDownList>
		</div> <!-- form-group end.// -->
	</div> <!-- form-row.// -->
	<div class="form-group">
		<label>Username</label>
		<asp:TextBox ID="usrtxt" runat="server"  CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
   		<label>Create password</label>
	    <asp:TextBox ID="t5" runat="server"  CssClass="form-control"  TextMode="Password"  AutoCompleteType="Disabled" ></asp:TextBox>
       <label>confirm password</label>
		<asp:TextBox ID="t6" runat="server"  CssClass="form-control"  TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
        <label>Contact No.</label>
		 <asp:TextBox ID="t7" runat="server"  CssClass="form-control"   MaxLength="10"  AutoCompleteType="Disabled" ></asp:TextBox>
 </div> <!-- form-group end.// -->  
    <div class="form-group">
        <asp:Button ID="Button1" runat="server" Text=" Register" CssClass="btn btn-primary btn-block" OnClick="Button1_Click1" />
         </div> <!-- form-group// -->      
    <small class="text-muted">By clicking the 'Sign Up' button, you confirm that you accept our <br/> Terms of use and Privacy Policy.</small>                                          

</article> <!-- card-body end .// -->
<div class="border-top card-body text-center">Have an account? <a href="login.aspx">Log In</a></div>
</div> <!-- card.// -->
<div class="message">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="t1" ErrorMessage="*please enter a Fname" ForeColor="Red"></asp:RequiredFieldValidator>
       <br/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="usrtxt" ErrorMessage="*please enter a username" ForeColor="Red"></asp:RequiredFieldValidator>
                  <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="t2" ErrorMessage="*please enter a Lname" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="t3" ErrorMessage="*Enter Age" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="t3" ErrorMessage="*Between 18 to 100" MaximumValue="100" MinimumValue="18" Type="Integer" ForeColor="Red"></asp:RangeValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="t4" ErrorMessage="*Enter Gmail" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="t4" ErrorMessage="*please recheck your email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="t5" ErrorMessage="enter password" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="citytxt" ErrorMessage="enter city" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="statedown" ErrorMessage="enter states" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="enter gender" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
          <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="t6" ControlToValidate="t5" ErrorMessage="*Please recheck password" ForeColor="Red"></asp:CompareValidator>
       <br/>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*correct phone number" ControlToValidate="t7" ForeColor="Red" ValidationExpression="^[7-9][0-9]{9}$"></asp:RegularExpressionValidator>
   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="get a strong password" ControlToValidate="t5" ForeColor="Red" ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})"></asp:RegularExpressionValidator>
          </div>
</div> <!-- col.//-->
</div> <!-- row.//-->
<!--container end.//-->
        <br/>
      
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
  </form>
</body>
</html>
      
