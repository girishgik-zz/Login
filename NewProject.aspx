<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewProject.aspx.cs" Inherits="Login.NewProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div>
            <table>
                <tr>
                    <td style="text-align:right; width: 20%;">
                        <label>
                            Project Name :
                        </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProjectName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvProjectName" ControlToValidate="txtProjectName" runat="server"
                            ForeColor="Red" ErrorMessage="Please enter Project Name"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right;width: 20%">
                        <label>
                            Application :</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtApplication" runat="server"></asp:TextBox>
                        <asp:DropDownList ID="ddlApplication" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align:left">
                        <%--<asp:RequiredFieldValidator ID="rfvApplication" ControlToValidate="txtApplication" runat="server"
                            ForeColor="Red" ErrorMessage="Please enter Application"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblValidCredential" runat="server" Visible="false" ForeColor="Red">Please enter valid User Name and Password</asp:Label>
                        <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
