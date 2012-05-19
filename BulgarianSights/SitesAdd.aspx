<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SitesAdd.aspx.cs" Inherits="BulgarianSights.SitesAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%--<asp:UpdatePanel ID="AddSiteUpdatePanel" runat="server" UpdateMode="Always">
<ContentTemplate>
--%>
    <h2>
        Add Site</h2>
    <table>
        <th width="200"></th>
        <th width="180"></th>
        <tr>
            <td>
                Изберете тип обект:
            </td>
            <td>
                <asp:DropDownList runat="Server" ID="SiteTypeDropDown" 
                    OnInit="SiteTypeDropDown_Init"  OnSelectedIndexChanged="ShowForm_Index" AutoPostBack="true"
                    ToolTip="Изберете тип обект, който искате да създадете." width="180px" />
            </td>
            <td id="ErrorSiteType" runat="server" clientidmode="Static"></td>
        </tr>
        <tr>
            <td>
                Име:
            </td>
            <td>
                <asp:TextBox ID="NameSite" runat="server" ToolTip="Име на обекта." width="174" />
            </td>
        </tr>
        <tr>
            <td>
                Област:
            </td>
            <td>
                <asp:TextBox ID="area" runat="server" ToolTip="Област в която се намира обекта." width="100%" />
            </td>
        </tr>
        <tr>
            <td>
                Населено място:
            </td>
            <td>
                <asp:TextBox ID="location" runat="server" ToolTip="Населено място, където се намира обекта." width="100%" />
            </td>
        </tr>
        <tr>
            <td>
                Епоха:
            </td>
            <td>
                <asp:TextBox ID="age" runat="server" ToolTip="Епоха." width="100%" />
            </td>
        </tr>
        <tr>
            <td>
                Значение:
            </td>
            <td>
                <asp:TextBox ID="importance" runat="server" ToolTip="Историческо значение на обекта." width="100%" />
            </td>
        </tr>
        <tr>
            <td>
                Култура:
            </td>
            <td>
                <asp:TextBox ID="culture" runat="server" ToolTip="Култура." width="100%" />
            </td>
        </tr>
        <tr id="DateTr" runat="server" visible="false">
            <td>
                Дата на събитието:
            </td>
            <td>
                <asp:TextBox ID="DateEvent" runat="server" ToolTip="Датата на която се е случило събитието." />
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
            <td>
                <asp:Button ID="SaveSite" runat="server" Text="Запази обект" OnClick="SaveSite_Click"/>
            </td>
        </tr>
    </table>

<%--
    </ContentTemplate>
</asp:UpdatePanel>--%>
</asp:Content>
