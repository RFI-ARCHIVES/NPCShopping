<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addProduct1.aspx.cs" Inherits="NPCShopping.AdminPages.addProduct" %>
<%@ MasterType  virtualPath="~/Site1.master"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="tbxName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
        <asp:TextBox ID="tbxDescription" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Image"></asp:Label>
        <asp:TextBox ID="tbxImage" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Price"></asp:Label>
        <asp:TextBox ID="tbxPrice" runat="server"></asp:TextBox>
    
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NPCShoppingConnectionString %>" 
            InsertCommand="INSERT INTO [Product] ([Name], [Description], [Image], [Price], [Vendor], [Category]) VALUES (@Name, @Description, @Image, @Price, @Vendor, @Category)" >
           <InsertParameters>
                <asp:ControlParameter ControlID="tbxDescription" PropertyName="Text" Name="Name" Type="String" /> 
                <asp:ControlParameter ControlID="tbxName" PropertyName="Text" Name="Description" Type="String" /> 
                <asp:ControlParameter ControlID="tbxImage" PropertyName="Text" Name="Image" Type="String" /> 
                <asp:ControlParameter ControlID="tbxPrice" PropertyName="Text" Name="Price" Type="Int16" /> 
                <asp:Parameter Name="Vendor" Type="Int16" DefaultValue="0" />
                <asp:Parameter Name="Category" Type="Int16" DefaultValue="1" />
            </InsertParameters>
         </asp:SqlDataSource>
    
        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
    
    </div>
    </form>
</body>
</html>
