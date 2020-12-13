<%@ Page Title="" Language="C#" MasterPageFile="~/menumaster.Master" AutoEventWireup="true" CodeBehind="feedbackdatasee.aspx.cs" Inherits="tokenproject.feedbackdatasee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    input{
        border:0;
  outline: 0;
  border-bottom:2px solid;
  border-color: blue
}
input:focus{
  border-color: green
}
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-content--bgf7">  
<div class="container">
<div class="row justify-content-center">
<div class="col-md-6">
<div class="card mt-5">
     <div class="card-body">
 

    Enter Experiance Detail:<br></br>
    <asp:TextBox ID="TextBox1" runat="server" placeholder="ex.good,bad or average" OnTextChanged="Search" AutoPostBack="true"></asp:TextBox>
    

    <hr size="2">
   
     <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive m-b-40 table-borderless table-striped" AutoGenerateColumns="False" AllowPaging="True"
        OnPageIndexChanging="OnPaging" >
        <Columns>
            <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="Email" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="experiance" HeaderText="Experiance" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="description" HeaderText="Description" ItemStyle-Width="150" >
       
            
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
       
            
             </Columns>
         <EmptyDataTemplate>
            <h1>No records Found</h1>
        </EmptyDataTemplate>
  
         </asp:GridView>


         </div></div></div></div></div></div>




</asp:Content>
