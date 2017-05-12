<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="NPCShopping.Registration" UnobtrusiveValidationMode ="None"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    User Registration Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CP1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
    <asp:TextBox ID="tbxName" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="tbxPassword1" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
    <asp:TextBox ID="tbxPassword2" runat="server"></asp:TextBox>
    <asp:CompareValidator ID="vldPassword" runat="server" ErrorMessage="Passwords must be the same" ControlToValidate="tbxPassword1" ControlToCompare="tbxPassword2"></asp:CompareValidator><br />
    <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="tbxEmail" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label5" runat="server" Text="Secret Question"></asp:Label>
    <asp:TextBox ID="tbxSecretQuestion" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label6" runat="server" Text="Secret Answer"></asp:Label>
    <asp:TextBox ID="tbxSecretAnswer1" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label7" runat="server" Text="Secret Answer Confirm"></asp:Label>
    <asp:TextBox ID="tbxSecretAnswer2" runat="server"></asp:TextBox>
    <asp:CompareValidator ID="vldSecretAnswer" runat="server" ErrorMessage="Answers must be the same" ControlToValidate="tbxSecretAnswer1" ControlToCompare="tbxSecretAnswer2"></asp:CompareValidator><br />
    <asp:Label ID="Label8" runat="server" Text="Phone"></asp:Label>
    <asp:TextBox ID="tbxPhone" runat="server"></asp:TextBox><br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    <asp:SqlDataSource ID="sqldsSubmit" runat="server" ConnectionString="<%$ ConnectionStrings:NPCShoppingConnectionString %>" 
        InsertCommand="INSERT INTO [User] ([name], [password], [role], [email], [secretQuestion], [secretAnswer], [phone]) VALUES (@name, PWDENCRYPT(@password), @role, @email, @secretQuestion, @secretAnswer, @phone)">
        <InsertParameters>
            <asp:ControlParameter ControlID="tbxName" PropertyName="Text"  Name="name" Type="String" />
            <asp:ControlParameter ControlID="tbxPassword1" PropertyName="Text" Name="password" Type="String" />
            <asp:Parameter Name="role" Type="String" DefaultValue="User"/>
            <asp:ControlParameter ControlID="tbxEmail" PropertyName="Text" Name="email" Type="String" />
            <asp:ControlParameter ControlID="tbxSecretQuestion" PropertyName="Text" Name="secretQuestion" Type="String" />
            <asp:ControlParameter ControlID="tbxSecretAnswer1" PropertyName="Text" Name="secretAnswer" Type="String" />
            <asp:ControlParameter ControlID="tbxPhone" PropertyName="Text" Name="phone" Type="String" />
        </InsertParameters>

    </asp:SqlDataSource>
</asp:Content>
