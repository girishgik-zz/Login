<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Login.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <script type="text/javascript">
        function deleteConfirm(info) {
            var result = confirm('Do you want to delete ' + info + ' ?');
            if (result) {
                return true;
            }
            else {
                return false;
            }
        }
</script>
<link href="../css/Stylesheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div align="right">
     <asp:Button ID="Signout" runat="server" Text="Signout" OnClick="Signout_Click"  />
            </div>
    <div>
          <div class="adminLeftPanel">
                        <asp:UpdatePanel ID="adminLeftPanelUpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="adminLeftPanelPanel" runat="server">

                                    <ul>

                                        <li class="adminLinkRight">
                                            <asp:Button CssClass="adminBTNRightPanel" ID="modifyAppBTN" runat="server" Text="Manage Application" OnClick="modifyAppBTN_Click" />
                                        </li>
                                        <li class="adminLinkRight">
                                            <asp:Button CssClass="adminBTNRightPanel" ID="manageLibraryBTN" runat="server" Text="Manage Library" OnClick="manageLibraryBTN_Click" />
                                        </li>
                                        <li class="adminLinkRight">
                                            <asp:Button CssClass="adminBTNRightPanel" ID="manageUsersBTN" runat="server" Text="Manage Users" OnClick="manageUsersBTN_Click" />
                                        </li>
                                    </ul>

                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
        
           <asp:UpdatePanel ID="headPanelManageUsersUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="headPanelManageUsersPanel" runat="server" Visible="False">
                                  
                                   <div class="headPanel">
                                  <%--      <asp:Button CssClass="headPanelBTN" ID="headPanelCreateUserBTN" runat="server" Text="Create User" OnClick="headPanelCreateUserBTN_Click1" />
                                        <asp:Label ID="Label15" runat="server" Text="|"></asp:Label>
                                        <asp:Button CssClass="headPanelBTN" ID="headPanelEditUserBTN" runat="server" Text="Edit/View User" OnClick="headPanelEditUserBTN_Click" />
                                        <asp:Label ID="Label16" runat="server" Text="|"></asp:Label>
                                        <asp:Button CssClass="headPanelBTN" ID="headPaneldeleteUserBTN" runat="server" Text="Delete User" OnClick="headPaneldeleteUserBTN_Click" />
                                    </div> --%>
                                    <div>
                                    <asp:GridView ID="gridView" DataKeyNames="Uid" runat="server"
                                            AutoGenerateColumns="false" ShowFooter="true" HeaderStyle-Font-Bold="true"
                                            onrowcancelingedit="gridView_RowCancelingEdit"
                                            onrowdeleting="gridView_RowDeleting"
                                            onrowediting="gridView_RowEditing"
                                            onrowupdating="gridView_RowUpdating"
                                            onrowcommand="gridView_RowCommand"
                                            OnRowDataBound="gridView_RowDataBound">
                                    <Columns>
                                    <asp:TemplateField HeaderText="Uid">
                                        <ItemTemplate>
                                            <asp:Label ID="txtUid" runat="server" Text='<%#Eval("Uid") %>'/>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="lblUid" runat="server" width="40px" Text='<%#Eval("Uid") %>'/>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="inUid" width="40px" runat="server"/>
                                            <asp:RequiredFieldValidator ID="vUid" runat="server" ControlToValidate="inUid" Text="?" ValidationGroup="validaiton"/>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Username">
                                          <ItemTemplate>
                                             <asp:Label ID="lblUsername" runat="server" Text='<%#Eval("Username") %>'/>
                                         </ItemTemplate>
                                         <EditItemTemplate>
                                             <asp:TextBox ID="txtUsername" width="70px"  runat="server" Text='<%#Eval("Username") %>'/>
                                         </EditItemTemplate>
                                         <FooterTemplate>
                                             <asp:TextBox ID="inUsername"  width="120px" runat="server"/>
                                             <asp:RequiredFieldValidator ID="vUsername" runat="server" ControlToValidate="inUsername" Text="?" ValidationGroup="validaiton"/>
                                         </FooterTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Password">
                                         <ItemTemplate>
                                             <asp:Label ID="lblPassword" runat="server" Text='<%#Eval("Password") %>'/>
                                         </ItemTemplate>
                                         <EditItemTemplate>
                                             <asp:TextBox ID="txtPassword" width="70px"  runat="server" Text='<%#Eval("Password") %>'/>
                                         </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="inPassword" width="110px"  runat="server"/>
                                            <asp:RequiredFieldValidator ID="vPassword" runat="server" ControlToValidate="inPassword" Text="?" ValidationGroup="validaiton"/>
                                        </FooterTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Email">
                                           <ItemTemplate>
                                             <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>'/>
                                         </ItemTemplate>
                                         <EditItemTemplate>
                                             <asp:TextBox ID="txtEmail" width="50px"   runat="server" Text='<%#Eval("Email") %>'/>
                                         </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="inEmail" width="60px"  runat="server"/>
                                            <asp:RequiredFieldValidator ID="vEmail" runat="server" ControlToValidate="inEmail" Text="?" ValidationGroup="validaiton"/>
                                        </FooterTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update"  Text="Update"  />
                                            <asp:Button ID="ButtonCancel" runat="server" CommandName="Cancel"  Text="Cancel" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Button ID="ButtonEdit" runat="server" CommandName="Edit"  Text="Edit"  />
                                            <asp:Button ID="ButtonDelete" runat="server" CommandName="Delete"  Text="Delete"  />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Button ID="ButtonAdd" runat="server" CommandName="AddNew"  Text="Add New Row" ValidationGroup="validaiton" />
                                        </FooterTemplate>
                                     </asp:TemplateField>
                                     </Columns>
                                    </asp:GridView>
                                        </div>
                                    <div >
                                    <br />&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                    </div>
                                        </div>
                                        </div>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
</div>
</form>
</body>
</html>
