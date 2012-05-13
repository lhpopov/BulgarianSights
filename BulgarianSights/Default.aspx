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


        $(document).ready(function () {
            
        });

    </script>


</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
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
            DataKeyNames="idObject" DataSourceID="SqlDataSource1" ClientIDMode="Static">
            <Columns>
                <asp:BoundField DataField="idObject" HeaderText="idObject" 
                    InsertVisible="False" ReadOnly="True" SortExpression="idObject" />
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
                <asp:BoundField DataField="objectY"   HeaderText="objectY"
                    SortExpression="objectY" />
                <asp:TemplateField HeaderText="Покажи на картата">
                    <ItemTemplate>
                        <a title="Покажи обект" onclick="ShowObjectOnMap(<%# Eval("objectX")%>,<%# Eval("objectY")%> )">Покажи обект</span>
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

</asp:Content>
