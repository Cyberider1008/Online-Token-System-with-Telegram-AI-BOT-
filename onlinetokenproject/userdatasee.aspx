<%@ Page Title="" Language="C#" MasterPageFile="~/menumaster.Master" AutoEventWireup="true" CodeBehind="userdatasee.aspx.cs" Inherits="tokenproject.userdatasee" %>
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
<div class="col-lg-10 mt-4">
<div class="card ">
     <div class="card-body">
 
  Enter Customer Name :
  <asp:TextBox ID="TextBox1" runat="server" placeholder="ex.rahul,mayur etc." OnTextChanged="Search" AutoPostBack="True"></asp:TextBox>
       
    <hr size="2" />
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive m-b-40 table-borderless table-striped" AutoGenerateColumns="False" AllowPaging="True"
        OnPageIndexChanging="OnPaging" >
         <Columns>
            
            <asp:BoundField DataField="fname" HeaderText="fname" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
            <asp:BoundField DataField="lname" HeaderText="lname" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="email" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
        <asp:BoundField DataField="password" HeaderText="password" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
        <asp:BoundField DataField="Mobile_No" HeaderText="mobile_no" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
        <asp:BoundField DataField="age" HeaderText="Age" ItemStyle-Width="150" >
        
        <ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
        
      </Columns>
        <EmptyDataTemplate>
            <h1>No records Found</h1>
        </EmptyDataTemplate>
  
 </asp:GridView> 
         </div></div></div></div></div></div>

</asp:Content>
