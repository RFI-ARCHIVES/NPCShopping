<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpDownCounter.aspx.cs" Inherits="NPCShopping.test32" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CP1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <ajaxToolkit:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" Minimum="1" Maximum="10" TargetControlID="TextBox1" Width="100"/>
</asp:Content>
