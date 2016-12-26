<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Login.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web based Probabilistic Simulation</title>
    <script src="Scripts/JavaScriptJS.js"></script>
    <link href="../css/Stylesheet1.css" rel="stylesheet" />
</head>
<body style="background-color: #636161">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <table style="width: 100%;">
            <tr>
                <td colspan="3">
                    <div id="header1" style="background-color: #4B6C8E">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="width: 100%; background-color: #636161">
                        <asp:UpdatePanel ID="menuBarUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="menuBarPanel" runat="server" Style="width: 100%">
                                    <ul class="nav">
                                        <li>File
                    <ul>
                        <li>
                            <asp:LinkButton ID="lnkbtnCreate" CssClass="link" CausesValidation="false" runat="server" OnClick="lnkbtnCreate_Click">Create&nbsp;New&nbsp;Project</asp:LinkButton>
                        </li>
                        <br />
                        <li>
                            <asp:LinkButton ID="lnkbtnOpen" CssClass="link" CausesValidation="false" runat="server" OnClick="lnkbtnOpen_Click">Open&nbsp;Project</asp:LinkButton>
                        </li>
                        <br />
                        <li>
                            <asp:LinkButton ID="lnkbtnSave" CssClass="link" CausesValidation="false" runat="server" OnClick="lnkbtnSave_Click">Save&nbsp;project</asp:LinkButton>
                        </li>
                        <br />
                        <li>
                            <asp:LinkButton ID="lnkbtnImport" CssClass="link" CausesValidation="false" runat="server" OnClick="lnkbtnImport_Click">Import&nbsp;project</asp:LinkButton>
                        </li>
                        <br />

                    </ul>
                                        </li>
                                        <li>Edit
                        <ul>
                            <li>
                                <asp:LinkButton ID="lnkbtnDelete" CausesValidation="false" CssClass="link" runat="server" OnClick="lnkbtnDelete_Click">Delete&nbsp;Project</asp:LinkButton>
                            </li>
                        </ul>
                                        </li>
                                        <li>Help
                                       <ul>
                                           <li>
                                               <a class="link" href="instuction.aspx">Instuctions</a>

                                           </li>
                                           <li>
                                               <a class="link" href="../DOC/User manual-Physics Explorer.docx">Documentation</a>
                                           </li>
                                       </ul>

                                        </li>
                                    </ul>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="align-content: center">
                    <div style="background-color: #B6B7BC">
                        <asp:UpdatePanel ID="upnlCreate" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="pnlCreate" runat="server">
                                    <table>
                                        <tr>
                                            <td style="text-align: right;">
                                                <label>
                                                    Project Name :
                                                </label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtProjectName" runat="server" MaxLength="50" Width="100%" Visible="true"></asp:TextBox>
                                                <asp:DropDownList ID="ddlProjects" runat="server" Width="100%" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="ddlProjects_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvProjectName" ControlToValidate="txtProjectName" runat="server"
                                                    ForeColor="Red" ErrorMessage="Please enter Project Name"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;">
                                                <label>
                                                    Application :</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlApplication" runat="server" Width="100%">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="text-align: left"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblValidCredential" runat="server" Visible="false" ForeColor="Red">Please enter valid User Name and Password</asp:Label>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnCreate" CssClass="button" runat="server" Text="Create" OnClick="btnCreate_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="background-color: #B6B7BC">
                        <asp:UpdatePanel ID="upnlWorkArea" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="pnlWorkArea" runat="server" Visible="False">
                                    <div class="controllBox workArea ">
                                        <div class="header">
                                            <div class="ControllBoxHeader">
                                                 <asp:Label ID="lblWorkAreaHeader" runat="server" Text="Work Area" Font-Size="Larger"></asp:Label>
                                                     </div>
                                            <%--<input type="button" class="ControllBoxClose"  id="closeWorkAreaBTN" value="X" />--%>
                                            <asp:Button CssClass="ControllBoxClose" ID="btnClose" runat="server"
                                                Text="X" OnClick="btnClose_Click" />
                                        </div>

                                        <div class="controllBody workAreaDIVHeigth" style="float: left; align-content: stretch; clear: both">
                                            <asp:UpdatePanel ID="upnlWorkAreaContent" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Panel ID="pnlWorkAreaContent" runat="server">
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 47%; height: 350px">
                                                                    <div id="divWorkAreaContentLeft" runat="server" style="border-style: groove; background-color: #B6B7BC; height: 95%">
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="background-color: #4B6C8E; width: 100%;">
                                                                                    <h2 style="color: white; align-self: center">Methods and relevant settings</h2>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:CheckBoxList ID="chklMethods" runat="server" AutoPostBack="true" OnSelectedIndexChanged="chklMethods_SelectedIndexChanged">
                                                                                    </asp:CheckBoxList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </td>
                                                                <td style="width: 6%"></td>
                                                                <td style="width: 47%; height: 350px">
                                                                    <div id="divWorkAreaContentRight" runat="server" style="border-style: groove; background-color: #B6B7BC; height: 95%">
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="background-color: #4B6C8E; width: 100%;">
                                                                                    <h2 style="color: white; align-self: center">Problem definition</h2>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:CheckBoxList ID="chklSubmethods" runat="server">
                                                                                    </asp:CheckBoxList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" style="text-align:right">
                                                                    <asp:Button ID="btnSave" CssClass="button" runat="server" Text="Save" OnClick="btnSave_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="toolBox">
                                            <%--<asp:UpdatePanel ID="workAreaToolBoxUpdatePanel" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>--%>
                                                    
                                              <%--  </ContentTemplate>
                                            </asp:UpdatePanel>--%>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
