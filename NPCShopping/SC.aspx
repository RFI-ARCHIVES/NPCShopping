<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SC.aspx.cs" Inherits="NPCShopping.SC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CP1" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPCShoppingConnectionString %>" 
        SelectCommand="SELECT * FROM [Product] where id = @ID">

    </asp:SqlDataSource>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <hr />
            <h3><%#Eval("Name") %></h3>
            <p><%#Eval("Description") %></p>
            <img src='<%#Eval("Image") %>' width="75" height="75"/><br />
            <span>Price/Each: <%#Eval("Price") %></span><br />
            <span>Quantity: <%#Eval("Quantity") %></span><br />
            <span>Item Total: <%#Eval("Total") %></span>

        </ItemTemplate>

    </asp:Repeater><br />
    <h2>Order Totals:</h2>
    <asp:Label ID="Label1" runat="server" Text="Quantity:"></asp:Label>
    <asp:Label ID="lblTotalQty" runat="server" Text="Label"></asp:Label><br />
    <asp:Label ID="Label2" runat="server" Text="Cost:"></asp:Label>
    <asp:Label ID="lblTotalPrice" runat="server" Text="Label"></asp:Label><br />
    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" />
</asp:Content>
