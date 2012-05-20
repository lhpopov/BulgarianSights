<%@ Page Title="Забележителностите на България." Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BulgarianSights._Default" %>



<%@ Register src="AddSiteControl.ascx" tagname="AddSiteControl" tagprefix="uc1" %>



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
            var addSiteWidth = $('#addSite').width();
            var mapWidth = $('#map').width();


            if ($('#addSite').css('display') == 'none') {
                $('#addSite').css('opacity', '0');
                $('#addSite').css('display', 'block');
                $('#map').animate({
                width: mapWidth - addSiteWidth - 10 + 'px'
                }, 'slow', function(){
                $('#addSite').animate({opacity: 1}, 'slow');
                });


            }
            else {
                $('#addSite').animate({
                opacity: 0}, 300, function(){
                    $('#map').animate({ width: '100%' }, 300);
                });

                //$('#addSite').css('display', 'none');
            }
        }
    </script>


<asp:UpdatePanel ID="UpdatePanelMap" runat="server" UpdateMode="Always">
    <ContentTemplate>

    <div id="map" onclick="getCoordsClick()">
    </div>

    <script type="text/javascript">
        var header = 120;   
        var footer = 20;
        var height = $(window).height() - header - footer + 'px';
        var minheight = $("#map").css('min-height');

        if (height < minheight) {
            height = minheight;
        }
        $("#map").css('height', height);
    </script>

    <div id="addSite" runat="server" clientidmode="Static" style="border: solid 1px red; width: 400px; height: 529px; 
        
        
        background: #3A4F63;
        color: White;
        position: absolute; top: 0px; 
        right: 12px;
        z-index: 150;
        display: none;
        ">

        <uc1:AddSiteControl ID="AddSiteControl1" runat="server" ClientIDMode="Static"/>

    </div>
    <div id="LabelCoords" style="width: 200px; height: 30px; background: blue; color: white;">
    </div>
    
    <%--<div id="panel" class="olToolbar" style="width: 400px; height: 30px; border: solid 3px blue;">
    </div>--%>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
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
        </asp:SqlDataSource>

    </ContentTemplate>
</asp:UpdatePanel>




<asp:GridView ID="GridViewEventObjects" runat="server" style="display: none;" ClientIDMode="Static">
</asp:GridView>

<asp:GridView ID="GridViewDocObjects" runat="server" style="display: none;" ClientIDMode="Static">
</asp:GridView>

<asp:GridView ID="GridViewSiteObjects" runat="server" style="display: none;" ClientIDMode="Static">
</asp:GridView>

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


