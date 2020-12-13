<%@ Page Title="" Language="C#" MasterPageFile="~/menumaster.Master" AutoEventWireup="true" CodeBehind="dashbord.aspx.cs" Inherits="onlinetokensystem.dashbord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   

            <!-- PAGE CONTENT-->
        <div class="page-content--bgf7">
            <!-- BREADCRUMB-->
            <section class="au-breadcrumb2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="au-breadcrumb-content">
                                <div class="au-breadcrumb-left">
                                    <span class="au-breadcrumb-span">You are here:</span>
                                    <ul class="list-unstyled list-inline au-breadcrumb__list">
                                        <li class="list-inline-item active">
                                            <a href="#">Home</a>
                                        </li>
                                        <li class="list-inline-item seprate">
                                            <span>/</span>
                                        </li>
                                        <li class="list-inline-item">Dashboard</li>
                                    </ul>
                                </div>
                              </div>
                        </div>
                    </div>
                </div>
            </section>
            </div>
            <!-- END BREADCRUMB-->


            <!-- WELCOME-->
            <section class="welcome p-t-10">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="title-4">Welcome back
                                <span>Admin!</span>
                            </h1>
                            <hr class="line-seprate">
                        </div>
                    </div>
                </div>
            </section>
            <!-- END WELCOME-->
          
           
            <!-- STATISTIC-->
            <section class="statistic statistic2">
                <div class="container">
                      <div class="row">
                        <div class="mx-auto m-5">
                   
                   <h3>select your Department: <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                     </h3> </div>
                          </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-3">
                            <div class="statistic__item statistic__item--green">
                                <h2 class="number"><asp:Label ID="tq" runat="server" Text="" ></asp:Label></h2>
                                <span class="desc">Today Queue</span>
                                <div class="icon">
                                    <i class="zmdi zmdi-account-o"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="statistic__item statistic__item--orange">
                                <h2 class="number"><asp:Label ID="ts" runat="server" Text="" ></asp:Label></h2>
                                <span class="desc">Today Served</span>
                                <div class="icon">
                                    <i class="zmdi zmdi-shopping-cart"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="statistic__item statistic__item--blue">
                                <h2 class="number"><asp:Label ID="tm" runat="server" ></asp:Label></h2>
                                <span class="desc">Remaining Queues</span>
                                <div class="icon">
                                    <i class="zmdi zmdi-calendar-note"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="statistic__item statistic__item--red">
                                <h2 class="number"><asp:Label ID="rq" runat="server" ></asp:Label></h2>
                                <span class="desc">Today Missed</span>
                                <div class="icon">
                                    <i class="zmdi zmdi-money"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END STATISTIC-->



              <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="title-5 m-b-35 text-center">statistics</h3>
                        </div>
                    </div>
             <div class="row">
              <div class="col">
                <section class="card">
                  <div class="card-body text-secondary">
                      <label>Customer Records</label> <br/> 
                        <asp:Button ID="Button2" runat="server" Text="Check" CssClass="btn btn-primary" PostBackUrl="userdatasee.aspx" />
        </div>
                </section>
              </div>
              <div class="col">
                <section class="card">
                  <div class="card-body text-secondary">
                          <label>Token Records</label>  <br/>                      
                        <asp:Button ID="Button1" runat="server" Text="Check" CssClass="btn btn-primary" PostBackUrl="tokendatasee.aspx" />
       </div>
                </section>
              </div>
              <div class="col">
                <section class="card">
                  <div class="card-body text-secondary">
                         <label>Feedback Records</label> <br/>
                     <asp:Button ID="Button3" runat="server" Text="Check" CssClass="btn btn-primary" PostBackUrl="feedbackdatasee.aspx" />
   </div>
                </section>
              </div>
              <div class="col">
                <section class="card">
                  <div class="card-body text-secondary">
                        <label>Call Records</label> <br/>
                            <asp:Button ID="Button4" runat="server" CssClass="btn btn-primary" Text="Check"  PostBackUrl="calldatasee.aspx" />
        </div>
                </section>
              </div>
                  <div class="col">
                <section class="card">
                  <div class="card-body text-secondary">
                        <label>Missed Records</label> <br/>
                            <asp:Button ID="Button5" runat="server" CssClass="btn btn-primary" Text="Check"  PostBackUrl="misseddatasee.aspx" />
        </div>
                </section>
              </div>

            </div>
                    </div>

</asp:Content>
