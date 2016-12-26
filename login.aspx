<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Login.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Web based Probabilistic Simulation</title>

    <link href="../css/Stylesheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div style="background-color: #3A4F63">

            <div id="header1" style="background-color: #4B6C9E">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
            <%-- Logo of application--%>
        </div>
        <div style="background-color: #B6B7BC">
            <center>
            <div class="loginDiv"  style="background-color:#B6B7BC">
                <div class="loginHeader" style="background-color: #4B6C8E">
                    <asp:Label ID="loginHeaderLBL" runat="server" Text="Web Based Probabilistic Simulation and Modeling"></asp:Label>  
                                <br />
                                <br />
                </div>
                           
                <%--<hr style="/*border:1px solid rgba(77, 77, 78, 0.74);*/"/>--%>
                <div class="loginContantDiv">
                    
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode ="Conditional">
                <ContentTemplate>
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:Label ID="loginIDLBL" CssClass="loginSpan" runat="server" Text="User ID"></asp:Label>
                    <asp:TextBox ID="txtUserName" CssClass="loginTextBox" runat="server" OnTextChanged="txtUserName_TextChanged"  ></asp:TextBox>
         <br />
                        
                        <asp:RequiredFieldValidator ID="rfvUserName" ControlToValidate="txtUserName" runat="server"
                            ForeColor="Red" ErrorMessage="Please enter User Name"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="passwordLBL" CssClass="loginSpan" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="txtPassword" CssClass="loginTextBox" runat="server" TextMode="Password" OnTextChanged="txtPassword_TextChanged"></asp:TextBox>
        <br />  
                        <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword" runat="server"
                            ForeColor="Red" ErrorMessage="Please enter Password"></asp:RequiredFieldValidator> <br />
                    
                    </asp:Panel>

                </ContentTemplate>
            </asp:UpdatePanel>
          <asp:Panel ID="Panel2" runat="server" >
         <asp:Button ID="loginBTN" CssClass="buttonTheam loginBTN" runat="server" Text=" Log In " CausesValidation="True" onclick="loginBTN_Click" />
                    <asp:Button ID="cancelBTN" CssClass="buttonTheam loginBTN" runat="server" Text=" Reset "  CausesValidation="False" onclick="cancelBTN_Click" />
                   <br /><br /><br />
                            <asp:Label ID="errorMSGLBL" CssClass="errorMSGLBL" runat="server" Text="Label" Visible="False"></asp:Label>
                    <asp:LinkButton ID="forgetPassLBTN" CssClass="linkBTNTheam" runat="server" 
                                onclick="forgetPassLBTN_Click" ToolTip="In case if you forget your password"><br /> <br />
  Forgot password</asp:LinkButton>
                    </asp:Panel>
 
                </div>   
                <div class="loginFooter" style="background-color: #4B6C9E">
                                &copy; Copyright by <a href="http://www.siemens.co.in" target="_blank" style="color:black;text-decoration:none">www.Siemens.com</a>
                                <br />
                                All rights reserved.
                </div>
                </div>
            </center>
        </div>

    </form>
</body>
</html>
