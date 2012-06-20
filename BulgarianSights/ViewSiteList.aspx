<%@ Page Title="Забележителностите на България." Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="ViewSiteList.aspx.cs" Inherits="BulgarianSights.ViewSiteList1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<base href="" />
    <link href="scripts/openlayers/theme/default/style.css" rel="stylesheet" type="text/css" />
    <link href="Styles/MapStyle.css" rel="stylesheet" type="text/css" />
    <script src="scripts/onLoadMap.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('a.level1[href*=showAddForm]').hide();
        });
        function loadInfo(href) {
            $("#ViewSiteContent").load(href, function () { $(this).ready(function () { bla(); }) });
        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div id="ListWrapper" style="background: #3A4F63; margin: 0px; padding: 0px;">
<script type="text/javascript">
    function bla() {
        var height = $("#ViewSiteContent").height() + 100;
        if (height < $("#viewSiteList").height())
            height = $("#viewSiteList").height();
        $("#ListWrapper").css('height', height);
        $("#ViewSiteContent").css('display', 'block');
    }

    $(document).ready(function () {
        $("#SearchBox").click(function (e) {
            var $this = $(this);
            //clickCounter += 1;
                        var clickCounter = $this.data('clickCounter') || 0;
                        clickCounter += 1;
                        $this.data('clickCounter', clickCounter);
            //alert(clickCounter);
            if (clickCounter == 1) {
                $this.val('');
            }
        });
    });
</script>
    <div id="viewSiteList" style="width: 250px;
        min-height: 400px;">
        <asp:DropDownList ID="ViewSiteType" runat="server" ClientIDMode="Static" OnSelectedIndexChanged="InitListGridView"
            OnInit="ViewSiteTypeDropDown_Init" AutoPostBack="true">
        </asp:DropDownList>
        


        <asp:TextBox ID="SearchBox" runat="server" ClientIDMode="Static" style="width: 185px; margin-top: 6px;">Търсене...</asp:TextBox><asp:Button ID="SearchButton" runat="server" ClientIDMode="Static" Text="Търси" OnClick="SearchSiteObject" />




        <asp:UpdatePanel ID="ViewSiteUpdate" runat="server" UpdateMode="Conditional">
            <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ViewSiteType" EventName="SelectedIndexChanged" />
        </Triggers>
            <ContentTemplate>
            <br />
                <asp:GridView ID="ListGridView" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" Visible="false" CssClass="ListGridAll">
                    <Columns>
                    <asp:BoundField DataField="siteName" HeaderText="Обект" ReadOnly="True" HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-CssClass="HeaderStyle"/>
                    <asp:TemplateField HeaderText="Инфо" HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-CssClass="HeaderStyle">
                        <ItemTemplate>
                            <asp:HyperLink ID="eventText" runat="server" NavigateUrl='<%# "javascript:loadInfo(\"" + Eval("siteText") + "\");" %>' Text="инфо"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>


                <asp:GridView ID="DocGridView" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" Visible="false" ShowHeader="false" CssClass="ListGridAll">
                    <Columns>
                    <asp:BoundField DataField="documentName" HeaderText="Документ" ReadOnly="True" HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-CssClass="HeaderStyle"/>
                    <asp:TemplateField HeaderText="Инфо" HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-CssClass="HeaderStyle">  
                        <ItemTemplate> 
                            <asp:HyperLink ID="eventText" runat="server" NavigateUrl='<%# "javascript:loadInfo(\"" + Eval("documentText") + "\")" %>' Text="инфо"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>


                <asp:GridView ID="EventGridView" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" Visible="false" ShowHeader="false" CssClass="ListGridAll">
                    <Columns>
                    <asp:BoundField DataField="eventName" HeaderText="Събитие" ReadOnly="True" HeaderStyle-Width="200px" ItemStyle-Width="200px" HeaderStyle-CssClass="HeaderStyle"/>
                    <asp:TemplateField HeaderText="Инфо" HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-CssClass="HeaderStyle"> 
                        <ItemTemplate> 
                            <asp:HyperLink ID="eventText" runat="server" NavigateUrl='<%# "javascript:loadInfo(\"" + Eval("eventText") + "\")" %>' Text="инфо"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script type="text/javascript">
        var header = 120;
        var footer = 80;
        var height = $(window).height() - header - footer + 'px';
        var minheight = $("#viewSiteList").css('min-height');

        if (height < minheight) {
            height = minheight;
        }
        $("#viewSiteList").css('height', height);
    </script>
    <div id="ViewSiteContent">
            

    </div>


</div>
</asp:Content>
