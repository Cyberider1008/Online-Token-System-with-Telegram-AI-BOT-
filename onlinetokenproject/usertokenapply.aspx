<%@ Page Title="" Language="C#" MasterPageFile="~/menumaster.Master" AutoEventWireup="true" CodeBehind="usertokenapply.aspx.cs" Inherits="onlinetokensystem.usertokenapply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" >
<asp:View ID="View1" runat="server">
   
 <div class="container">
<div class="row justify-content-center">
<div class="col-md-6">
              <div class="card mt-4">
                                    <div class="card-header">
                                        <strong>Online Token Booking</strong>
                                    </div>
                                    <div class="card-body card-block">
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label  class=" form-control-label">Date</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Date" AutoPostBack="True" OnTextChanged="TextBox3_TextChanged1"></asp:TextBox>
                                                    <span class="help-block">  <asp:RequiredFieldValidator ErrorMessage="*" ForeColor = "Red" ControlToValidate="TextBox3"
            runat="server" Display = "Dynamic" />
                      
</span>
                                                </div>
                                            </div>
                     <div class="card-footer">
                                        <asp:Button ID="Button1" CssClass="btn btn-primary btn-sm" runat="server" Text="Check Availability" OnClick="Button1_Click" />

                                    </div></div>
       <asp:Label ID="lmessage" runat="server" CssClass="lmessage"  Text="*please next date to 5 days only applied"></asp:Label>

</div></div>


                </div>
  </div>
</asp:View>

      <asp:View ID="View2" runat="server">
        
<div class="container">
<div class="row justify-content-center">
<div class="col-md-6">
<div class="card mt-4">
  <div class="card-header">
                                        <strong>Online Token Booking</strong>
                                    </div>
  <div class="card-body card-block">
         <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Date</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                        <asp:Label ID="vd1" runat="server" Text=""></asp:Label>
                                                   </div></div>
         <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label  class=" form-control-label">Mobile No</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                         <asp:Label ID="Label2" runat="server"></asp:Label>
                                                   </div></div>
         <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label  class=" form-control-label">Department Name</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                       <asp:DropDownList ID="DropDownList2" runat="server" CssClass="txt" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                        </asp:DropDownList>
                                                   </div></div>
         <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label  class=" form-control-label">Token No</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                              <asp:DropDownList ID="DropDownList1" CssClass="txt" runat="server" >
                        </asp:DropDownList>
                                                   </div></div>
         <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label  class=" form-control-label">Name</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                                   </div>
   <div class="card-footer">
                                        <asp:Button ID="Button2" CssClass="btn btn-primary btn-sm" runat="server" Text="book token" OnClick="Button2_Click" />

                                    </div></div>
      
  </div>
 </div></div></div></div>
</asp:View>
    </asp:MultiView>
<asp:Label ID="lbl1" runat="server" Text=""></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tokendata %>" SelectCommand="SELECT [name] FROM [department]"></asp:SqlDataSource>











</asp:Content>
