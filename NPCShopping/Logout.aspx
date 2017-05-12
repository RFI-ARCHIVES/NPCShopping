<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="NPCShopping.Logout" %>
<%@ MasterType  virtualPath="~/Site1.master"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CP1" runat="server">

    <p>
        Thanks for shopping with us!</p>


      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NPCShoppingConnectionString %>" SelectCommand="SELECT * FROM [Ads]"></asp:SqlDataSource>
      <asp:ScriptManager ID="ScriptManager1" runat="server" />
      <asp:Timer ID="Timer1" Interval="1000" runat="server" />
 
      <asp:UpdatePanel ID="up1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
        </Triggers>
        <ContentTemplate>
            <asp:AdRotator
            id="AdRotator1"
            Runat="server" DataSourceID="SqlDataSource1" />
        </ContentTemplate>
    </asp:UpdatePanel> 
</asp:Content>
