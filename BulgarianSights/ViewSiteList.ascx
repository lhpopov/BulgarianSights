<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewSiteList.ascx.cs"
    Inherits="BulgarianSights.ViewSiteList" %>
<div id="ViewSiteWrapper" runat="server" clientidmode="Static">

    
  <%--  <asp:DropDownList ID="ViewSiteType" runat="server" ClientIDMode="Static" OnSelectedIndexChanged="InitListGridView"
            OnInit="ViewSiteTypeDropDown_Init">
        </asp:DropDownList>
    <asp:UpdatePanel ID="ViewSiteUpdate" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ViewSiteType" EventName="SelectedIndexChanged" />
        </Triggers>
        <ContentTemplate>
        
            
            <asp:GridView ID="ListGridView" runat="server" ClientIDMode="Static" AutoGenerateColumns="true">
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>--%>




    <div id="Div1" runat="server" clientidmode="Static" style="width: 250px;
        border: solid 1px;">
        <asp:DropDownList ID="ViewSiteType" runat="server" ClientIDMode="Static" OnSelectedIndexChanged="InitListGridView"
            OnInit="ViewSiteTypeDropDown_Init" AutoPostBack="true">
        </asp:DropDownList>
        <asp:UpdatePanel ID="ViewSiteUpdate" runat="server" UpdateMode="Conditional">
            <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ViewSiteType" EventName="SelectedIndexChanged" />
        </Triggers>
            <ContentTemplate>
                <asp:GridView ID="ListGridView" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" Visible="false">
                    <Columns>
                    <asp:BoundField DataField="siteName" HeaderText="Обект" ReadOnly="True" HeaderStyle-Width="200px" ItemStyle-Width="200px"/>
                    <asp:TemplateField HeaderText="Инфо" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <asp:HyperLink ID="eventText" runat="server" NavigateUrl='<%# "javascript:loadInfo(\"" + Eval("siteText") + "\")" %>' Text="инфо"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </ContentTemplate></asp:UpdatePanel>
</div>
</div>
