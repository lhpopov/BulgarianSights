/* -----------------------------------*/


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
    //marker.events.register('mousedown', marker, function (evt) { alert(this.icon.url); OpenLayers.Event.stop(evt); });
    markers.addMarker(marker);

}

var popup = new Array();
var qwe = "qw";

function ShowObjectsOnLoadMap() {
    var layerNames = new Array("Културно-исторически обекти", "Документи", "Събития")
    var markers; // = new OpenLayers.Layer.Markers("Културно-исторически обекти");
    var size = new OpenLayers.Size(48, 48);
    var offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
    var objects = new Array("GridViewSiteObjects", "GridViewDocObjects", "GridViewEventObjects");
    var grid;
    for (layer in objects) {
        markers = new OpenLayers.Layer.Markers(layerNames[layer]);
        map.addLayer(markers);

        grid = document.getElementById(objects[layer]);
        if (grid == null)
            continue;

        for (var i = 1; i < grid.rows.length; i++ ) {
            
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
            
            var cellName = 2;
            var cellLocation= 3;
            var cellArea = 4;
            var cellInfoLink = 1;

            var x = grid.rows[i].cells[cellX].innerHTML;
            var y = grid.rows[i].cells[cellY].innerHTML;
            
            var siteName = '<h2>' + grid.rows[i].cells[cellName].innerHTML + '<h2>';
            var siteLocation = '<h3>населено място: <b> ' + grid.rows[i].cells[cellLocation].innerHTML + '</b></h3>';
            var siteArea = '<h3>област: <b>' + grid.rows[i].cells[cellArea].innerHTML + '</b></h3>';
            var infoLink = grid.rows[i].cells[cellInfoLink].innerHTML;
            //alert(infoLink);

            /* alert(siteName);
            alert(siteLocation);
            alert(siteArea );*/

            //var objectName = grid.rows[i].cells[2].innerHTML;
            var zoomLevel = 7;

            var icon;
            //addMarkerToMap(site.x, sitey, objectName);
            if (objects[layer] == "GridViewSiteObjects")
                icon = new OpenLayers.Icon('images/500201300371_lrg.png', size, offset);
            else if (objects[layer] == "GridViewEventObjects")
                icon = new OpenLayers.Icon('images/event.png', size, offset);
            else if (objects[layer] == "GridViewDocObjects")
                icon = new OpenLayers.Icon('images/doc.png', size, offset);

            //var icon = mainIcon.clone();
            var coords = new OpenLayers.LonLat(x, y);
            var marker = new OpenLayers.Marker(coords, icon);

            //alert(grid.rows[i]);
            popupClass = AutoSizeFramedCloudMinSize;
            var infoButton = '<input type="button" value="информация за обекта" onclick="loadInfo(\'' + infoLink + '\')"/>';
            //var bla = "<script type='text/javascript'>loadInfo('" + infoLink + "'); </script>";
            //var bla = $("#hiddenBla").load(infoLink);

            popupContentHTML = siteName + siteLocation + siteArea + '<br /> <br />';// + infoButton + '<div id=\'blaQ\'></div>';
            addMarker(coords, popupClass, popupContentHTML, true, true, markers, marker);

        }
    }

}

AutoSizeFramedCloudMinSize = OpenLayers.Class(OpenLayers.Popup.FramedCloud, {
    'autoSize': true,
    //'minSize': new OpenLayers.Size(400, 400)
});

//anchored bubble popup small contents autosize minsize closebox
/*
ll = new OpenLayers.LonLat(-20, -15);
popupClass = AutoSizeFramedCloudMinSize;
popupContentHTML = '<img src="img/small.jpg"></img>';
addMarker(ll, popupClass, popupContentHTML, true, layerMarkers);
*/

function addMarker(ll, popupClass, popupContentHTML, closeBox, overflow, layerMarkers, markerAdded) {

    var feature = new OpenLayers.Feature(layerMarkers, ll); 
            feature.closeBox = closeBox;
            feature.popupClass = popupClass;
            feature.data.popupContentHTML = popupContentHTML;
            feature.data.overflow = (overflow) ? "auto" : "hidden";
            feature.marker = markerAdded;
            
            var marker = feature.marker; //  feature.createMarker();

            var markerClick = function (evt) {
                if (this.popup == null) {
                    this.popup = this.createPopup(this.closeBox);
                    map.addPopup(this.popup);
                    this.popup.show();
                } else {
                    this.popup.toggle();
                }
                currentPopup = this.popup;
                OpenLayers.Event.stop(evt);
            };
            marker.events.register("mousedown", feature, markerClick);

            layerMarkers.addMarker(marker);
        }


