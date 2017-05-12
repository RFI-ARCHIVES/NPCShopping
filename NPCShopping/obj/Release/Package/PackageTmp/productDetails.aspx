<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="productDetails.aspx.cs" Inherits="NPCShopping.productDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ MasterType  virtualPath="~/Site1.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CP1" runat="server">
    PRODUCT Details
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPCShoppingConnectionString %>" 
        SelectCommand="SELECT Name, Description, Image, Price, Vendor FROM [Product] where ID = @ID">
    </asp:SqlDataSource>
    <!--  ScriptManager is required to make AJAX control work below
        -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
    <asp:TextBox ID="tbxName" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
    <asp:TextBox ID="tbxDescription" runat="server"></asp:TextBox><br />
    <asp:Image ID="productImage" runat="server" /><br />
    <asp:TextBox ID="tbxPrice" runat="server"></asp:TextBox><br />
    <asp:HiddenField ID="hdnPrice" runat="server" />
    <asp:TextBox ID="tbxVendor" runat="server"></asp:TextBox><br />
    <asp:Button ID="btnAddToCart" runat="server" Text="Add To Shopping Cart" OnClick="btnAddToCart_Click" />
    <!--
        Added AJAX NumericUpDownExtender to allow user to change the item count in the text box before
        adding it to the shopping cart. Requires installation of AJAX Control Tool Kit into Visual Studio
        UpDown counter is attached to the textbox using the TargetControlID parameter
         -->
    <ajaxToolkit:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" Minimum="1" Maximum="10" TargetControlID="tbxItemQty" Width="50"/>
    <asp:TextBox ID="tbxItemQty" runat="server"></asp:TextBox>    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/products.aspx">Continue Shopping</asp:HyperLink>
</asp:Content>
