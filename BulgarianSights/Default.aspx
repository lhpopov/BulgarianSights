<%@ Page Title="Забележителностите на България." Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BulgarianSights._Default" %>

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



        function ShowObjectsOnLoadMap() {

            var markers = new OpenLayers.Layer.Markers("Културно-исторически обекти");
            map.addLayer(markers);
            var site = new Object();
            var objects = new Array ("GridViewSiteObjects", "GridViewEventObjects", "GridViewDocObjects");

            for(layer in objects)
                {

                var grid = document.getElementById(objects[layer]);
                for (i in grid.rows) {
                    //for (j in grid.rows[i].cells) {
                    if (i == 0)
                        continue;
                    site.x = grid.rows[i].cells[9].innerHTML;
                    site.y = grid.rows[i].cells[10].innerHTML;

                    var objectName = grid.rows[i].cells[2].innerHTML;
                    var zoomLevel = 7;

                    //addMarkerToMap(site.x, sitey, objectName);

                    var icon = mainIcon.clone();
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
<asp:TextBox ID="Textbox1" runat="server">
    
    </asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="bla_Click" />



<asp:UpdatePanel ID="UpdatePanelMap" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <h1>
    
    map div
    width: 590px;
    height: 390px;
    ratio: 1,5
    </h1>

    <div id="map" style="width: 1000px; border: solid 1px red; height: 661px; color: white"> 
    
    </div>
    <div id="LabelCoords" style="width: 200px; height: 30px; background: blue; color: white;">
    </div>
    
    <%--<div id="panel" class="olToolbar" style="width: 400px; height: 30px; border: solid 3px blue;">
    </div>--%>

    
        <input type="button" value="Бургас" onclick="putMarker();" />
        

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="idSite" DataSourceID="SqlDataSource1" ClientIDMode="Static">
            <Columns>
                <asp:BoundField DataField="idSite" HeaderText="idSite" 
                    InsertVisible="False" ReadOnly="True" SortExpression="idSite" />
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
                <asp:BoundField DataField="eventId" HeaderText="eventId" 
                    SortExpression="eventId" />
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


<asp:GridView ID="GridViewSiteObjects" runat="server" style="display: none;" ClientIDMode="Static">
</asp:GridView>


<script type="text/javascript">
    $(document).ready(function () {

        

    });
    
</script>

</asp:Content>


