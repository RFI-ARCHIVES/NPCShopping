<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master"   AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NPCShopping.Login1" %>
<%@ MasterType  virtualPath="~/Site1.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CP1" runat="server">

    <div>
        <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
        <asp:TextBox ID="tbxUser" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="tbxPassword" runat="server"></asp:TextBox><br />
        <asp:Button ID="Submit" runat="server" Text="Login" OnClick="Submit_Click" />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server">Forgot Password</asp:HyperLink><br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Registration.aspx">Register</asp:HyperLink>

    </div>
        <asp:SqlDataSource ID="sqldsSubmit" runat="server" ConnectionString="<%$ ConnectionStrings:NPCShoppingConnectionString %>" 
            SelectCommand="Select ID, Name, Role, Email from [dbo].[user] where @name = name and PWDCOMPARE(@password, password) = 1">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbxUser" Name="name" PropertyName="Text" />
                <asp:ControlParameter ControlID="tbxPassword" Name="password" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

    <asp:HyperLink ID="hlAdmin" runat="server" Visible="False">Admin</asp:HyperLink>
    <br />

</asp:Content>
