<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="NPCShopping.products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CP1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" Visible="False" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    
    <img src=" " id="quickView" style="float:right" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPCShoppingConnectionString %>" 
        SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NPCShoppingConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM [Category] ORDER BY [Name]"></asp:SqlDataSource>

    <asp:Button ID="btnShoppingCart" runat="server" Text="View Cart" OnClick="btnShoppingCart_Click" />
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>


    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />


</asp:Content>
