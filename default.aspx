<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Login._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web based Probabilistic Simulation</title>

    <link href="../css/Stylesheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <div align="right">
            <asp:Button ID="Signout" runat="server" Text="Signout" OnClick="Signout_Click" />
        </div>
        <div class="menuBar">
            <asp:UpdatePanel ID="menuBarUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <asp:Panel ID="menuBarPanel" runat="server">

                        <ul class="nav">
                            <li>File
                    <ul>
                        <li>
                            <asp:LinkButton ID="createNewPrjLBTN" CssClass="link" runat="server" OnClick="createNewPrjLBTN_Click">Create&nbsp;New&nbsp;Project</asp:LinkButton>
                        </li>
                        <br />
                        <li>
                            <asp:LinkButton ID="openNewPrjLBTN" CssClass="link" runat="server" OnClick="openNewPrjLBTN_Click">Open&nbsp;Project</asp:LinkButton>
                        </li>
                        <br />
                        <li>
                            <asp:LinkButton ID="saveprojectBTN" CssClass="link" runat="server" OnClick="saveprojectBTN_Click">Save&nbsp;project</asp:LinkButton>
                        </li>
                        <br />
                        <li>
                            <asp:LinkButton ID="importBTN" CssClass="link" runat="server" OnClick="importBTN_Click">Import&nbsp;project</asp:LinkButton>
                        </li>
                        <br />

                    </ul>
                            </li>

                            <li>Edit
                        <ul>
                            <li>
                                <asp:LinkButton ID="deleteProjectLBTN" CssClass="link" runat="server" OnClick="deleteProjectLBTN_Click">Delete&nbsp;Project</asp:LinkButton>
                            </li>
                        </ul>
                            </li>

                        </ul>


                        </ul> 
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="menuBar" style="margin-left: -15px;">
            <ul class="nav">
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
        </div>
        <div>
            <table>
                <tr>
                    <td style="text-align: right; width: 20%;">
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
                    <td style="text-align: right; width: 20%">
                        <label>
                            Application :</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtApplication" runat="server"></asp:TextBox>
                        <asp:DropDownList ID="ddlApplication" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: left"></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblValidCredential" runat="server" Visible="false" ForeColor="Red">Please enter valid User Name and Password</asp:Label>
                        <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:UpdatePanel ID="workAreaUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Panel ID="workAreaPanel" runat="server" Visible="False">
                        <div class="controllBox workArea  ">
                            <div class="header">
                                <div class="ControllBoxHeader">Work Area</div>
                                <%--<input type="button" class="ControllBoxClose"  id="closeWorkAreaBTN" value="X" />--%>
                                <asp:Button CssClass="ControllBoxClose" ID="closeWorkAreaBTN" runat="server"
                                    Text="X" OnClick="closeWorkAreaBTN_Click" />
                            </div>

                            <div class="controllBody workAreaDIVHeigth" style="float: left; clear: both">
                                <asp:UpdatePanel ID="workAreaContantUpdatePanel" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Panel ID="workAreaContantPanel" runat="server">

                                            <div id="workAreaContantDIV" class="workAreaContantDIV" runat="server">
                                            </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                            <div class="toolBox">
                                <asp:UpdatePanel ID="workAreaToolBoxUpdatePanel" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>

                                        <input type="button" id="saveWorkAreaContantBTN" class="buttonTheam" value="Save" onclick='saveWorkAreaContantFun' />

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div>
                <asp:UpdatePanel ID="importUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="importPanel" runat="server" Visible="false">
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>
