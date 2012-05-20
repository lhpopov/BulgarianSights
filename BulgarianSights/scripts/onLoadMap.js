function ShowObjectOnMap(x, y) {
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
    var layerNames = new Array("Културно-исторически обекти", "Събития", "Документи")
    var markers; // = new OpenLayers.Layer.Markers("Културно-исторически обекти");
    var size = new OpenLayers.Size(32, 32);
    var offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
    var objects = new Array("GridViewSiteObjects", "GridViewDocObjects", "GridViewEventObjects");
    var grid;
    for (layer in objects) {
        markers = new OpenLayers.Layer.Markers(layerNames[layer]);
        map.addLayer(markers);

        var grid = document.getElementById(objects[layer]);

        for (i in grid.rows) {
            //for (j in grid.rows[i].cells) {
            if (i == 0)
                continue;
            if (objects[layer] == "GridViewSiteObjects") {
                cellX = 8;
                cellY = 9;
            }
            if (objects[layer] == "GridViewEventObjects") {
                cellX = 8;
                cellY = 9;
            }

           var cellX = 8;
           var cellY = 9;


           var x = grid.rows[i].cells[cellX].innerHTML;
           var y = grid.rows[i].cells[cellY].innerHTML;

            //var objectName = grid.rows[i].cells[2].innerHTML;
            var zoomLevel = 7;

            var icon;
            //addMarkerToMap(site.x, sitey, objectName);
            if (objects[layer] == "GridViewSiteObjects")
                icon = new OpenLayers.Icon('images/doc.png', size, offset);
            else if (objects[layer] == "GridViewEventObjects")
                icon = new OpenLayers.Icon('images/event.png', size, offset);
            else
                icon = new OpenLayers.Icon('images/buttons/pan.png', size, offset);

            //var icon = mainIcon.clone();
            var coords = new OpenLayers.LonLat(x, y);
            var marker = new OpenLayers.Marker(coords, icon);

            markers.addMarker(marker);

            //}
        }
    }

}