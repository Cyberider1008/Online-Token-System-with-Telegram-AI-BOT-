<%@ Page Title="" Language="C#" MasterPageFile="~/menumaster.Master" AutoEventWireup="true" CodeBehind="counter.aspx.cs" Inherits="tokenproject.counter" %>
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

<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

 <asp:View ID="View1" runat="server">
 <div class="page-content--bgf7">  
<div class="container">
<div class="row justify-content-center">
<div class="col-md-6">
<div class="card mt-5">
     <div class="card-body">
   
<button type="button" runat="server" onserverclick="Button1_Click"  ToolTip="Add Department" class="btn btn-success btn-circle btn-xl"><i class="fa fa-plus "></i></button>
         <hr/>
             Search:<br>
              <asp:TextBox ID="TextBox1" runat="server" CssClass="input mb-3" OnTextChanged="Search" AutoPostBack="true" TextMode="Search"></asp:TextBox>
         
          <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive p-l-140 table-striped" AutoGenerateColumns="False" AllowPaging="True" PageSize="6"
        OnPageIndexChanging="OnPaging" >
        <Columns>
            <asp:BoundField DataField="coname" HeaderText="Name" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            
             </Columns>
             <EmptyDataTemplate>
            <h1>No records Found</h1>
        </EmptyDataTemplate>
  
          </asp:GridView>
  
    </div></div></div></div></div></div>

      </asp:View>

       <asp:View ID="View2" runat="server">
           <div class="page-content--bgf7">  
<div class="container">
<div class="row justify-content-center">
<div class="col-md-6">
<div class="card mt-5">
     <div class="card-body">


         <div class=row>
<div class="input-field col s12">
<label class="mr-5"> Name:</label><br>
   <asp:TextBox ID="TextBox2" runat="server" placeholder="Department Name" AutoCompleteType="Disabled" ></asp:TextBox><br><br>
 <div class=name>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="TextBox2" ErrorMessage="*please enter your Counter Name"></asp:RequiredFieldValidator>
</div>
</div>
</div>


<div class=row>
<div class="input-field col s12 mt-4">
     <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="SAVE" CssClass="btn btn-success  waves-light right" />
               
</div>
</div> 
           
               
           </div></div></div></div></div></div>
           </asp:View>

</asp:MultiView>



</asp:Content>
