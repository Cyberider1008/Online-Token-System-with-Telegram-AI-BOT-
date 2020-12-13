<%@ Page Title="" Language="C#" MasterPageFile="~/menumaster.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="onlinetokensystem.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- Automatic Slideshow Images -->
  <div class="mySlides">
    <img src="images/home/a1.png" class="h-25 w-100">
     
     </div>
  <div class="mySlides">
    <img src="images/home/a2.png" class="h-25 w-100">
   
  </div>
  <div class="mySlides">
    <img src="images/home/a3.jpg" class="h-25 w-100" >
     
    </div>
 <div class="mySlides">
    <img src="images/home/a4.jpg" class="h-25 w-100" >
     
     </div>
   <div class="mySlides">
    <img src="images/home/a5.png" class="h-25 w-100" >
      
     </div>
<script>
// Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 5000);    
}
</script>

</asp:Content>
