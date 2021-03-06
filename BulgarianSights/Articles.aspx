﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="BulgarianSights.Articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Articles List</h2>

    <asp:EntityDataSource ID="CulturalAndHistoricSites" runat="server" 
        ConnectionString="name=SightsDBEntities" 
        DefaultContainerName="SightsDBEntities" EnableDelete="True" 
        EnableFlattening="False" EnableUpdate="True" 
        EntitySetName="CulturalAndHistoricSites" EnableInsert="True">
    </asp:EntityDataSource>




    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idsite" 
        DataSourceID="CulturalAndHistoricSites">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="idSite" HeaderText="idSite" ReadOnly="True" 
                SortExpression="idSite" />
            <asp:BoundField DataField="site" HeaderText="site" 
                SortExpression="site" />
            <asp:BoundField DataField="siteName" HeaderText="siteName" 
                SortExpression="siteName" />
            <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
            <asp:BoundField DataField="location" HeaderText="location" 
                SortExpression="location" />
            <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
            <asp:BoundField DataField="importance" HeaderText="importance" 
                SortExpression="importance" />
            <asp:BoundField DataField="culture" HeaderText="culture" 
                SortExpression="culture" />
            <asp:BoundField DataField="siteX" HeaderText="siteX" 
                SortExpression="siteX" />
            <asp:BoundField DataField="siteY" HeaderText="siteY" 
                SortExpression="siteY" />
        </Columns>
    </asp:GridView>


    <asp:TextBox ID="textbox1" runat="server">
    </asp:TextBox>

    <asp:Button ID="Button1" runat="server" Text="Button" 
    onclick="Button1_Click" />

    <br />
    <asp:TextBox ID="textbox2" runat="server">
    </asp:TextBox>

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true">
    
    </asp:GridView>

</asp:Content>
