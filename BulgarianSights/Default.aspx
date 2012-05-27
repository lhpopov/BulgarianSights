<%@ Page Title="Забележителностите на България." Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BulgarianSights._Default" %>



<%@ Register src="AddSiteControl.ascx" tagname="AddSiteControl" tagprefix="uc1" %>
<%@ Register src="~/ViewSiteList.ascx" tagname="ViewSiteListControl" tagprefix="uc1" %>



<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">  
    <link href="scripts/openlayers/theme/default/style.css" rel="stylesheet" type="text/css" />
    <link href="Styles/MapStyle.css" rel="stylesheet" type="text/css" />
    <script src="scripts/onLoadMap.js" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">

        function getCoordsClick() {
            var coords = $('#LabelCoords').html();
            coords = coords.split(',');
            $('#siteX').val(coords[0]);
            $('#siteY').val(coords[1]);
        }

        function showAddForm() {
            var addSiteWidth = $('#addSite').width() + 10;
            var mapWidth = $('#map').width();

            if ($("#viewSite").css('display') != 'none') {
                $('#viewSite').animate({
                    opacity: 0
                }, 300).css('display', 'none');

                addSiteWidth = 0;
            }

            if ($('#addSite').css('display') == 'none') {
                $('#addSite').css('opacity', '0');
                $('#addSite').css('display', 'block');
                $('#map').animate({
                width: mapWidth - addSiteWidth + 'px'
                }, 'slow', function(){
                    $('#addSite').animate({ opacity: 1, height: height }, 'slow');
                });


            }
            else {
                $('#addSite').animate({
                    opacity: 0
                }, 300, function () {
                    $('#map').animate({ width: '100%' }, 300);
                    $(this).css('display', 'none')
                }) ;

                
            }
        }

        function showViewForm() {
            var addSiteWidth = $('#addSite').width() + 10;
            var mapWidth = $('#map').width();
            var mapHeight = $('#map').height();

            if ($("#addSite").css('display') != 'none') {
                $('#addSite').animate({
                    opacity: 0
                }, 300).css('display', 'none');

                addSiteWidth = 0;
            }

            if ($('#viewSite').css('display') == 'none') {
                $('#viewSite').css('opacity', '0');
                $('#viewSite').css('display', 'block');
                $('#map').animate({
                    width: mapWidth - addSiteWidth + 'px'
                }, 'slow', function () {
                    $('#viewSite').animate({ opacity: 1, height: mapHeight }, 'slow');
                });


            }
            else {
                $('#viewSite').animate({
                    opacity: 0
                }, 300, function () {
                    $('#map').animate({ width: '100%' }, 300);
                    $(this).css('display', 'none')
                });


            }
        }
    </script>


<%--<asp:UpdatePanel ID="UpdatePanelMap" runat="server" UpdateMode="Always">
    <ContentTemplate>--%>

    <div id="map" onclick="getCoordsClick()" runat="server" clientidmode="static">
    </div>

    <script type="text/javascript">
        var header = 120;   
        var footer = 40;
        var height = $(window).height() - header - footer + 'px';
        var minheight = $("#map").css('min-height');

        if (height < minheight) {
            height = minheight;
        }
        $("#map").css('height', height);
    </script>

    <div id="addSite" runat="server" clientidmode="Static">
        <uc1:AddSiteControl ID="AddSiteControl1" runat="server" ClientIDMode="Static"/>
        <%--<uc1:ViewSiteListControl ID="ViewSiteListControl" runat="server" ClientIDMode="Static"/>--%>
    </div>

     <div id="viewSite" runat="server" clientidmode="Static">
        <uc1:ViewSiteListControl ID="ViewSiteListControl" runat="server" ClientIDMode="Static"/>
    </div>

    <div id="LabelCoords" style="width: auto; background: white; color: black;">
    </div>
    
    <%--<div id="panel" class="olToolbar" style="width: 400px; height: 30px; border: solid 3px blue;">
    </div>--%>


    <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="idSite" DataSourceID="SqlDataSource1" ClientIDMode="Static">
            <Columns>
                <asp:BoundField DataField="idSite" HeaderText="idSite" 
                    InsertVisible="False" ReadOnly="True" SortExpression="idSite" />
                <asp:BoundField DataField="siteText" HeaderText="site" 
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
                <asp:BoundField DataField="siteY"   HeaderText="siteY"
                    SortExpression="siteY" />
                <asp:TemplateField HeaderText="Покажи на картата">
                    <ItemTemplate>
                        <a title="Покажи обект" onclick="ShowObjectOnMap(<%# Eval("siteX")%>,<%# Eval("siteY")%> )">Покажи обект</span>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [CulturalAndHistoricSites]">
        </asp:SqlDataSource>--%>

<%--    </ContentTemplate>
</asp:UpdatePanel>--%>



<asp:UpdatePanel ID="UpdatePanelMap" runat="server" UpdateMode="Always">
<%--<Triggers>
    <asp:AsyncPostBackTrigger ControlID="SaveSiteButton" EventName="Click" />
</Triggers>--%>
    <ContentTemplate>

    <asp:GridView ID="GridViewEventObjects" runat="server" style="display: none;" ClientIDMode="Static">
    </asp:GridView>

    <asp:GridView ID="GridViewDocObjects" runat="server" style="display: none;" ClientIDMode="Static">
    </asp:GridView>

    <asp:GridView ID="GridViewSiteObjects" runat="server" style="display: none;" ClientIDMode="Static">
    </asp:GridView>

    </ContentTemplate>
</asp:UpdatePanel>

    <%--<h1>
    
    map div
    width: 590px;
    height: 390px;
    ratio: 1,5
    </h1>--%>


<script type="text/javascript">
    $(document).ready(function () {



    });
</script>

</asp:Content>


