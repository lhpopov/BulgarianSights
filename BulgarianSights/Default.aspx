<%@ Page Title="Забележителностите на България." Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BulgarianSights._Default" %>



<%@ Register src="AddSiteControl.ascx" tagname="AddSiteControl" tagprefix="uc1" %>



<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">  
    <link href="scripts/openlayers/theme/default/style.css" rel="stylesheet" type="text/css" />
    <link href="Styles/MapStyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        //$("#<%=GridView1.ClientID %>").css('background', 'red');

        

        function ShowObjectOnMap(x,y) {
            var grid = document.getElementById("GridView1");
            //var x = grid.rows[1].cells[9].innerHTML;
            //var y = grid.rows[1].cells[10].innerHTML;
            var objectName = grid.rows[1].cells[2].innerHTML;
            var coords = new OpenLayers.LonLat(x, y);
            var zoomLevel = 7;

            addMarkerToMap(x, y, objectName);
            map.setCenter(coords, zoomLevel);
        }

        function addMarkerToMap(x, y, objectName) {

            var size = new OpenLayers.Size(21, 25);
            var offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
            var icon = new OpenLayers.Icon('http://www.openlayers.org/dev/img/marker.png', size, offset);
            var coords = new OpenLayers.LonLat(x, y);
            var marker = new OpenLayers.Marker(coords, icon);
            var markers = new OpenLayers.Layer.Markers(objectName);
            map.addLayer(markers);
            markers.addMarker(marker);

        }



        function ShowObjectsOnLoadMap(icon, marker) {
            var layerNames = new Array("Културно-исторически обекти", "Събития", "Документи")
            var markers; // = new OpenLayers.Layer.Markers("Културно-исторически обекти");
            var size = new OpenLayers.Size(32, 32);
            var offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
            //map.addLayer(markers);
            var site = new Object();
            var objects = new Array ("GridViewSiteObjects", "GridViewEventObjects", "GridViewDocObjects");

            for(layer in objects)
                {
                markers = new OpenLayers.Layer.Markers(layerNames[layer]);
                map.addLayer(markers);
                
                var grid = document.getElementById(objects[layer]);
                
                for (i in grid.rows) {
                    //for (j in grid.rows[i].cells) {
                    if (i == 0)
                        continue;

                    if (objects[layer] == "GridViewSiteObjects") {
                        cellX = 7;
                        cellY = 8;
                    }

                    if (objects[layer] == "GridViewEventObjects") {
                        cellX = 8;
                        cellY = 9;
                    }



                    site.x = grid.rows[i].cells[cellX].innerHTML;
                    site.y = grid.rows[i].cells[cellY].innerHTML;

                    var objectName = grid.rows[i].cells[2].innerHTML;
                    var zoomLevel = 7;
                
                    var icon;
                    //addMarkerToMap(site.x, sitey, objectName);
                     if(objects[layer] == "GridViewSiteObjects")
                        icon = new OpenLayers.Icon('images/doc.png', size, offset);
                    else if(objects[layer] == "GridViewEventObjects")
                        icon = new OpenLayers.Icon('images/event.png', size, offset);
                    else
                        icon = new OpenLayers.Icon('images/buttons/pan.png', size, offset);
                        
                    //var icon = mainIcon.clone();
                    var coords = new OpenLayers.LonLat(site.x, site.y);
                    var marker = new OpenLayers.Marker(coords, icon);

                    markers.addMarker(marker);

                    //}
                }
            }

        }
       

    </script>


</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <script type="text/ecmascript">
        function getCoordsClick() {
            var coords = $('#LabelCoords').html();
            coords = coords.split(',');
            $('#siteX').val(coords[0]);
            $('#siteY').val(coords[1]);
        }

        function showAddForm() {
            $('#addSite').css('display', 'block');
        }
    </script>


<asp:UpdatePanel ID="UpdatePanelMap" runat="server" UpdateMode="Always">
    <ContentTemplate>
    

    <div id="map" style="width: 800px; border: solid 1px red; height: 529px; color: white"
    onclick="getCoordsClick()"
    > 
    
    </div>

    <h1>
    
    map div
    width: 590px;
    height: 390px;
    ratio: 1,5
    </h1>

    <div id="addSite" runat="server" clientidmode="Static" style="border: solid 1px red; width: 400px; height: 529px; 
        
        
        background: #3A4F63;
        color: White;
        position: absolute; top: 120px; left: 850px;
        display: block;
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


<asp:GridView ID="GridViewSiteObjects" runat="server" style="display: block;" ClientIDMode="Static">
</asp:GridView>

<asp:GridView ID="GridViewEventObjects" runat="server" style="display: block;" ClientIDMode="Static">
</asp:GridView>

<asp:GridView ID="GridViewDocObjects" runat="server" style="display: block;" ClientIDMode="Static">
</asp:GridView>

<script type="text/javascript">
    $(document).ready(function () {

        

    });
    
</script>

</asp:Content>


