


function init() {
    size = new OpenLayers.Size(21, 25);
    offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
    mainIcon = new OpenLayers.Icon('http://www.openlayers.org/dev/img/marker.png', size, offset);

    var mapOptions = {
        //maxExtent: new OpenLayers.Bounds(2506433.34506, 5042867.48642, 3195589.59199, 5491094.22022),

        //Bulgaria Extent
        //min x,y: 2486365.86, 5045134.37, 
        //max x,y: 3185917.54, 5498864.57
        //maxExtent: new OpenLayers.Bounds(2486365.86, 5045134.37, 3185917.54, 5498864.57),
        //maxExtent: new OpenLayers.Bounds(10.2, 48.9),
        //scales: [200000, 100000, 50000, 20000, 10000, 5000, 2500, 1000, 500],
        //projection: "EPSG:900913",
        numZoomLevels: 18,
        controls: [
                        new OpenLayers.Control.Navigation(),
                        new OpenLayers.Control.PanZoomBar(),
                        new OpenLayers.Control.LayerSwitcher({ 'ascending': false }),
                        new OpenLayers.Control.Permalink(),
                        new OpenLayers.Control.ScaleLine(),
                        new OpenLayers.Control.Permalink('permalink'),
                        new OpenLayers.Control.MousePosition(),
                        new OpenLayers.Control.OverviewMap(),
                        //new OpenLayers.Control.KeyboardDefaults(),
        //new OpenLayers.Control.DragPan({ title: "Премести карта" })
                    ]
    };

    map = new OpenLayers.Map('map', mapOptions);
    map.addControl(new OpenLayers.Control.LayerSwitcher());

    var gphy = new OpenLayers.Layer.Google(
        "Google Physical",
        { type: google.maps.MapTypeId.TERRAIN }
    );
    var gmap = new OpenLayers.Layer.Google(
        "Google Streets", // the default
        {numZoomLevels: 20 }
    );
    var ghyb = new OpenLayers.Layer.Google(
        "Google Hybrid",
        { type: google.maps.MapTypeId.HYBRID, numZoomLevels: 20, isBaseLayer: true }
    );
    var gsat = new OpenLayers.Layer.Google(
        "Google Satellite",
        { type: google.maps.MapTypeId.SATELLITE, numZoomLevels: 22 }
    );

    map.addLayers([gmap, gphy, ghyb, gsat]);
    //map.addLayers([ghyb]);

    map.addControl(new OpenLayers.Control.MousePosition({ div: document.getElementById("LabelCoords"), numDigits: 2, prefix: "", separator: "," }));

    /* Взима координатите на мишката върху екрана на клиента */
    //    map.events.register("mousemove", map, function (e) {
    //        var position = this.events.getMousePosition(e);
    //        OpenLayers.Util.getElement("LabelCoords").innerHTML = position;
    //    });

    // Google.v3 uses EPSG:900913 as projection, so we have to
    // transform our coordinates
    map.setCenter(new OpenLayers.LonLat(2810458.86, 5258913.45), 7);
    //map.zoomToMaxExtent();
    var pan = new OpenLayers.Control.DragPan({ title: "Премести карта" });
    map.addControl(new OpenLayers.Control.DragPan({ title: "Премести карта", div: "map" }));


    var panel = new OpenLayers.Control.Panel({
        defaultControl: pan,
        displayClass: "olToolbar",
        "div": OpenLayers.Util.getElement("panel")
    });



    var markers = new OpenLayers.Layer.Markers("Markers");
    markers.id = "Markers";
    map.addLayer(markers);

    var size = new OpenLayers.Size(21, 25);
    var offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
    var icon = new OpenLayers.Icon('http://www.openlayers.org/dev/img/marker.png', size, offset);
    markers.addMarker(new OpenLayers.Marker(new OpenLayers.LonLat(2810458.86, 5258913.45), icon));

    ShowObjectsOnLoadMap();

}



function putMarker(){
    map.events.register("click", map, function(e) {
    //var position = this.events.getMousePosition(e);
    var position = map.getLonLatFromPixel(e.xy);
    var size = new OpenLayers.Size(21,25);
    var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
    var icon = new OpenLayers.Icon('http://www.openlayers.org/dev/img/marker.png', size, offset);   
    var markerslayer = map.getLayer('Markers');
    markerslayer.addMarker(new OpenLayers.Marker(position, icon));
        })
}
















//    var zoomtoMaxExt = new OpenLayers.Control.ZoomToMaxExtent({ title: "Цял изглед" });
//    var zoomin = new OpenLayers.Control.ZoomBox({ title: "Приближи карта" });
//    var zoomout = new OpenLayers.Control.ZoomBox({ out: true, title: "Отдалечи карта", displayClass: "olControlZoomOut" });
//    var pan = new OpenLayers.Control.DragPan({ title: "Премести карта" });
//    var nav = new OpenLayers.Control.NavigationHistory({ "previousOptions": { "title": "Предишен изглед" }, "nextOptions": { "title": "Следващ изглед"} });
//    map.addControl(nav);

//    panel.addControls([zoomtoMaxExt, zoomin, zoomout, pan]);
//    panel.addControls([nav.next, nav.previous]);
//    
//    map.addControl(panel);

    



/*
876184.41, 5988852.15
*/