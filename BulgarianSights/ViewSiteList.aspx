<%@ Page Title="Забележителностите на България." Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="ViewSiteList.aspx.cs" Inherits="BulgarianSights.ViewSiteList1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="scripts/openlayers/theme/default/style.css" rel="stylesheet" type="text/css" />
    <link href="Styles/MapStyle.css" rel="stylesheet" type="text/css" />
    <script src="scripts/onLoadMap.js" type="text/javascript"></script>
    <script type="text/javascript">

        function loadInfo(href) {
            $("#ViewSiteContent").load(href);
        }
    </script>

     <script type="text/javascript">
         var header = 120;
         var footer = 20;
         var height = $(window).height() - header - footer + 'px';
         var minheight = $("#ViewSiteWrapper").css('min-height');

         if (height < minheight) {
             height = minheight;
         }
         $("#ViewSiteWrapper").css('height', height);
    </script>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div id="viewSite" style="width: 250px;
        min-height: 200px;
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


                <asp:GridView ID="DocGridView" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" Visible="false" ShowHeader="false">
                    <Columns>
                    <asp:BoundField DataField="documentName" HeaderText="Обект" ReadOnly="True" HeaderStyle-Width="150px" ItemStyle-Width="150px"/>
                    <asp:TemplateField HeaderText="Инфо" HeaderStyle-Width="150px" ItemStyle-Width="150px">  
                        <ItemTemplate> 
                            <asp:Label ID="DocText" runat="server" Text='<%# Eval("documentText") %>'></asp:Label>, 
                        </ItemTemplate>
                    </asp:TemplateField>                     
                    </Columns>
                </asp:GridView>


                <asp:GridView ID="EventGridView" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" Visible="false" ShowHeader="false">
                    <Columns>
                    <asp:BoundField DataField="eventName" HeaderText="Обект" ReadOnly="True" HeaderStyle-Width="150px" ItemStyle-Width="200px"/>
                    <asp:TemplateField HeaderText="Инфо" HeaderStyle-Width="150px" ItemStyle-Width="50px"> 
                        <ItemTemplate> 
                            <asp:HyperLink ID="eventText" runat="server" NavigateUrl='<%# Eval("eventText") %>' Text="инфо"/>
                        </ItemTemplate>
                    </asp:TemplateField>                     
                    </Columns>
                </asp:GridView>
                
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script type="text/javascript">
        var header = 120;
        var footer = 20;
        var height = $(window).height() - header - footer + 'px';
        var minheight = $("#viewSite").css('min-height');

        if (height < minheight) {
            height = minheight;
        }
        $("#viewSite").css('height', height);
    </script>
    <asp:UpdatePanel ID="rpbla" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="ViewSiteContent" runat="server" clientidmode="Static" style="width: 700px;
                border: solid 1px blue;
                position: absolute;
                left: 350px;
                top: 0px;">
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
