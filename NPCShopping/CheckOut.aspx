<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="NPCShopping.CheckOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CP1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Credit Card"></asp:Label>
    <asp:TextBox ID="tbxCreditCard" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label2" runat="server" Text="Address"></asp:Label>
    <asp:TextBox ID="tbxAddress" runat="server"></asp:TextBox><br />





    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NPCShoppingConnectionString %>"  
        InsertCommand="INSERT INTO [Transactions] ([UserID], [ProdID], [Date], [ProdPrice], [Quanity], [TransID]) VALUES (@UserID, @ProdID, @Date, @ProdPrice, @Quanity, @TransID)" >
    </asp:SqlDataSource>



</asp:Content>
