<%@ Page Title="" Language="C#" MasterPageFile="~/menumaster.Master" AutoEventWireup="true" CodeBehind="call.aspx.cs" Inherits="onlinetokensystem.call" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="page-content--bgf7">  
<div class="container">
<div class="row">
<div class="col-lg-6"> <section class="card mt-4">
                  <div class="card-body text-secondary">
        <h1 >New Call</h1>
                    <hr>
                        <br/>
                        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" CssClass="form-control" >
                            <asp:ListItem>Please Select Operator</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>Staff</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        &nbsp;<asp:DropDownList ID="DropDownList2" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
                           </asp:DropDownList><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" CssClass="form-control">
                            </asp:DropDownList>
                        <br />
                      <div class="row mt-3">
<div class="col">
                    Current Token: <asp:TextBox ID="TextBox2" runat="server" CssClass="text-primary" AutoCompleteType="Disabled" ReadOnly="True"></asp:TextBox>
                    
                </div>
    <div class="col">
                    <asp:Label ID="Label1" runat="server" CssClass="text-primary" ></asp:Label>
                    </div></div>
                      <div class="row mt-3">
<div class="col">
                 <asp:Button ID="Button2" runat="server" CssClass="btn-success btn-lg" Text="Missed" OnClick="Button2_Click"  />
    </div>
                          <div class="col">
                              <asp:Button ID="Button1" runat="server" CssClass="btn-success btn-lg" Text="Call Next" OnClick="Button1_Click" />
                 </div> </div>
                    <asp:HiddenField ID="hiddentxt" runat="server"/>

                      </div>
                </section>
    </div>
    <div class="col-lg-6"> <section class="card mt-4">
                  <div class="card-body text-secondary">

               Token Details:
             <hr/>
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive m-b-40 table-borderless table-striped" AutoGenerateColumns="False" AllowPaging="True"
        OnPageIndexChanging="OnPaging" >
         <Columns>
          <asp:BoundField DataField="date" HeaderText="Date" ItemStyle-Width="150" DataFormatString="{0:dd/MM/yyyy}" >
<ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
            <asp:BoundField DataField="mobile_no" HeaderText="Mobile_No" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
            <asp:BoundField DataField="token_no" HeaderText="Token no" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
        <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
        <asp:BoundField DataField="applydate" HeaderText="Applydate" ItemStyle-Width="150" DataFormatString="{0:dd/MM/yyyy}" >
<ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
        <asp:BoundField DataField="department" HeaderText="Department" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
             </asp:BoundField>
 </Columns>
        <EmptyDataTemplate>
            <h1>No records Found</h1>
        </EmptyDataTemplate>
  </asp:GridView>
                       </div>
                </section>

    </div>
</div></div></div>

</asp:Content>
