<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="NPCShopping.ShoppingCart1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CP1" runat="server">

    <asp:GridView ID="GridView1" runat="server"></asp:GridView>

    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" />
</asp:Content>
