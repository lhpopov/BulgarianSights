<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddSiteControl.ascx.cs" Inherits="BulgarianSights.AddSiteControl" %>


<%--<asp:UpdatePanel ID="AddSiteUpdatePanel" runat="server" UpdateMode="Always">
<Triggers>
    <asp:AsyncPostBackTrigger ControlID="SiteTypeDropDown" EventName="SelectedIndexChanged" />
</Triggers>
<ContentTemplate>--%>
<div id="AddSiteControlWrapper" runat="server" clientidmode="Static" style="">
<h2 style="color: White; font-family: verdana">
        Добавете обект </h2>
    <table>
        <th width="140"></th>
        <th width="200"></th>
        <tr>
            <td>
                Тип обект:
            </td>
            <td>
                <asp:DropDownList runat="Server" ID="SiteTypeDropDown" 
                    OnInit="SiteTypeDropDown_Init"  OnSelectedIndexChanged="ShowForm_Index" AutoPostBack="true"
                    ToolTip="Изберете тип обект, който искате да създадете." CssClass="AddSiteSelect" ClientIDMode="Static" />
            </td>
            <td id="ErrorSiteType" runat="server" clientidmode="Static"></td>
        </tr>
        <tr>
            <td>
                Име: *
            </td>
            <td>
                <asp:TextBox ID="NameSite" runat="server" ToolTip="Име на обекта." CssClass="AddSiteInputElem"/>
            </td>
        </tr>
        <tr>
            <td>
                Област:
            </td>
            <td>
                <asp:TextBox ID="area" runat="server" ToolTip="Област в която се намира обекта." CssClass="AddSiteInputElem" />
            </td>
        </tr>
        <tr>
            <td>
                Населено място:
            </td>
            <td>
                <asp:TextBox ID="location" runat="server" ToolTip="Населено място, където се намира обекта." CssClass="AddSiteInputElem" />
            </td>
        </tr>
        <tr>
            <td>
                Епоха:
            </td>
            <td>
                <asp:TextBox ID="age" runat="server" ToolTip="Епоха." CssClass="AddSiteInputElem" />
            </td>
        </tr>
        <tr id="ImportanceTr" runat="server">
            <td>
                Значение:
            </td>
            <td>
                <asp:TextBox ID="importance" runat="server" ToolTip="Историческо значение на обекта." CssClass="AddSiteInputElem" />
            </td>
        </tr>
        <tr>
            <td>
                Култура:
            </td>
            <td>
                <asp:TextBox ID="culture" runat="server" ToolTip="Култура." CssClass="AddSiteInputElem" />
            </td>
        </tr>
        <tr id="DateTr" runat="server" visible="false">
            <td>
                Дата на събитието:
            </td>
            <td>
                <asp:TextBox ID="DateEvent" runat="server" ToolTip="Датата на която се е случило събитието." CssClass="AddSiteInputElem" />
            </td>
        </tr>
        <tr>
            <td>
                Географска дължина: *
            </td>
            <td>
                <asp:TextBox ID="siteX" runat="server" ToolTip="Натиснете върху картата, за да вземете координати на дадена точка." ClientIDMode="Static" Enabled="false"  CssClass="AddSiteInputElem"/>
            </td>
        </tr>
        <tr>
            <td>
                Географска ширина: *
            </td>
            <td>
                <asp:TextBox ID="siteY" runat="server" 
                ToolTip="Натиснете върху картата, за да вземете координати на дадена точка." 
                ClientIDMode="Static" Enabled="false"  CssClass="AddSiteInputElem"/>
            </td>
        </tr>

        <tr id="TextTr">
            <td style="vertical-align: top;">
                Текст: *
            </td>
            <td>
                <asp:TextBox ID="siteText" runat="server" ToolTip="Допълнителна информация  за обекта." 
                ClientIDMode="Static" Wrap="True" TextMode="MultiLine" rows="8" />
            </td>
        </tr>




        <tr>
            <td>
                
            </td>
            <td>
                <br />
                <asp:Button ID="SaveSiteButton" runat="server" Text="Запази обект" OnClick="SaveSite_Click" ClientIDMode="Static" />
            </td>
        </tr>
    </table>

    </div>
<%--</ContentTemplate>
</asp:UpdatePanel>--%>