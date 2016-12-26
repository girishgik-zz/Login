<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetpassword.aspx.cs" Inherits="Login.forgetpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Forget Password</title>
        <link href="../css/Stylesheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">  
    <div>
    <center style="margin-left: 40px"> 
           <div align="right">
     <asp:Button ID="Signout" runat="server" Text="Signout" OnClick="Signout_Click"  />
            </div>
                <div id="main-container-panel" class="forgetPasswordContainer"><asp:Label ID="Label5" runat="server" Text="Web Based Probabilistic Simulation and Modeling"></asp:Label>  
                <br />
                <div  id="forget-password-header-panel"  style="height: 50px;font-size: 20px;font-family: 'Calibri';margin: 5px 10px 0px 10px;">
                <br />
                   &nbsp;
                   <span class="style1">
                       <strong>
                           &nbsp;&nbsp;&nbsp;&nbsp;
                            Forget Passsword
                           <br />
                     </strong>
                     <asp:Label ID="Label2" runat="server" Text=" "></asp:Label>
                 </span>
                 <br />
        <asp:Label ID="Label3" runat="server" style="font-weight: 700; color: #800000" 
            Text=" "></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" style="font-weight: 700" 
            Text="Enter  your Email address"></asp:Label>
         &nbsp;  
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="199px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:Button ID="Submit" CssClass="buttonTheam loginBTN" runat="server" Text=" Submit " onclick="Submit_Click" />
        <asp:Button ID="Clear" CssClass="buttonTheam loginBTN" runat="server" Text=" Clear " onclick="Clear_Click" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="loginFooter">
        &copy; Copyright by <a href="http://www.siemens.co.in" target="_blank" style="color:black;text-decoration:none">www.Siemens.com</a>
        <br />
        All rights reserved.
        </div>
        </div>
       </div>
      </center>
    </div>
  </form>
</body>
</html>
