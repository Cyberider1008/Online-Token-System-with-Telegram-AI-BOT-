<%@ Page Title="" Language="C#" MasterPageFile="~/menumaster.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="onlinetokensystem.account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="page-content--bgf7">  
<div class="container">
<div class="row justify-content-center">
  <div class="col-md-4">
                                <div class="card mt-5">
                                    <div class="card-header">
                                        <i class="fa fa-user"></i>
                                        <strong class="card-title pl-2">Profile Card</strong>
                                    </div>
                                    <div class="card-body">
                                        <div class="mx-auto d-block">
                                            <img class="rounded-circle mx-auto d-block" src="images/icon/avatar.jpg" alt="Card image cap">
                                            <h5 class="text-sm-center mt-2 mb-1">
                                                <asp:Label ID="Label1" runat="server" ></asp:Label></h5>
                                            <div class="location text-sm-center">
                                                <i class="fa fa-map-marker"></i>
                                                <asp:Label ID="Label2" runat="server" ></asp:Label>,<asp:Label ID="Label3" runat="server" ></asp:Label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="card-text text-sm-center">
                                            <a href="#">
                                                <i class="fa fa-facebook pr-1"></i>
                                            </a>
                                            <a href="#">
                                                <i class="fa fa-twitter pr-1"></i>
                                            </a>
                                            <a href="#">
                                                <i class="fa fa-linkedin pr-1"></i>
                                            </a>
                                            <a href="#">
                                                <i class="fa fa-pinterest pr-1"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

    </div></div></div>

</asp:Content>
