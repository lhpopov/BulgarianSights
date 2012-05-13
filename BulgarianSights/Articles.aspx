<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="BulgarianSights.Articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Articles List</h2>

    <asp:EntityDataSource ID="CulturalAndHistoricSites" runat="server" 
        ConnectionString="name=SightsDBEntities1" 
        DefaultContainerName="SightsDBEntities1" EnableDelete="True" 
        EnableFlattening="False" EnableUpdate="True" 
        EntitySetName="CulturalAndHistoricSites" EnableInsert="True">
    </asp:EntityDataSource>




    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idObject" 
        DataSourceID="CulturalAndHistoricSites">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="idObject" HeaderText="idObject" ReadOnly="True" 
                SortExpression="idObject" />
            <asp:BoundField DataField="object" HeaderText="object" 
                SortExpression="object" />
            <asp:BoundField DataField="objectName" HeaderText="objectName" 
                SortExpression="objectName" />
            <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
            <asp:BoundField DataField="location" HeaderText="location" 
                SortExpression="location" />
            <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
            <asp:BoundField DataField="importance" HeaderText="importance" 
                SortExpression="importance" />
            <asp:BoundField DataField="culture" HeaderText="culture" 
                SortExpression="culture" />
            <asp:BoundField DataField="eventId" HeaderText="eventId" 
                SortExpression="eventId" />
            <asp:BoundField DataField="objectX" HeaderText="objectX" 
                SortExpression="objectX" />
            <asp:BoundField DataField="objectY" HeaderText="objectY" 
                SortExpression="objectY" />
        </Columns>
    </asp:GridView>


    <asp:Button ID="Button1" runat="server" Text="Button" 
    onclick="Button1_Click" />

</asp:Content>
