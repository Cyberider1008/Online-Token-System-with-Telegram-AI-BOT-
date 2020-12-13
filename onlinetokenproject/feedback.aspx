<%@ Page Title="" Language="C#" MasterPageFile="~/menumaster.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="onlinetokensystem.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                              <div class="col form-group">
                             	<label>Name </label>  
                             			    <asp:TextBox ID="nametxt" runat="server" CssClass="au-input au-input--full"  AutoCompleteType="Disabled"  ></asp:TextBox>
                             		  	</div> <!-- form-group end.// -->
	                         	<div class="col form-group">
	                         		<label>Email</label>
	                         	   <asp:TextBox ID="emailtxt" runat="server" CssClass="au-input au-input--full" AutoCompleteType="Disabled"></asp:TextBox>
          		              </div> <!-- form-group end.// -->
	                        
                            	<div class="col form-group ">
		  <label>Experiance</label>
		 <asp:DropDownList ID="experiancedown" runat="server" CssClass="form-control ">
             <asp:ListItem Selected="True">Good</asp:ListItem>
             <asp:ListItem>Bad</asp:ListItem>
             <asp:ListItem>Average</asp:ListItem>
            </asp:DropDownList>
		</div> <!-- form-group end.// -->

                              <div class="col form-group">
                                    <label>Description</label>
                                  <asp:TextBox ID="descriptiontxt" runat="server" CssClass="au-input au-input--full"  TextMode="MultiLine"  AutoCompleteType="Disabled"></asp:TextBox>
        </div>                    <asp:Button ID="Button1" runat="server" CssClass="au-btn au-btn--block au-btn--green m-b-20" Text="Button" OnClick="Button1_Click" />
                                </div>
                        </div>
                                </div>
       
                </div>
            </div>
           <br> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="experiancedown" ErrorMessage="*please select option"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please enter your name" ControlToValidate="nametxt"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Please enter your email" ControlToValidate="emailtxt"></asp:RequiredFieldValidator>
        
        <br />
        
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="emailtxt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    
     
  </div>
   
</asp:Content>
