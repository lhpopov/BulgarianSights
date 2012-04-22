var map;

function init() {
    var mapOptions={
        //maxExtent: new OpenLayers.Bounds(2506433.34506, 5042867.48642, 3195589.59199, 5491094.22022),
        maxExtent: new OpenLayers.Bounds(10.2, 48.9)
        //scales: [200000, 100000, 50000, 20000, 10000, 5000, 2500, 1000, 500],
    };

    map = new OpenLayers.Map('map', mapOptions);
    map.addControl(new OpenLayers.Control.LayerSwitcher());
    
    var gphy = new OpenLayers.Layer.Google(
        "Google Physical",
        {type: google.maps.MapTypeId.TERRAIN}
    );
    var gmap = new OpenLayers.Layer.Google(
        "Google Streets", // the default
        {numZoomLevels: 20}
    );
    var ghyb = new OpenLayers.Layer.Google(
        "Google Hybrid",
        {type: google.maps.MapTypeId.HYBRID, numZoomLevels: 20}
    );
    var gsat = new OpenLayers.Layer.Google(
        "Google Satellite",
        {type: google.maps.MapTypeId.SATELLITE, numZoomLevels: 22}
    );

    //map.addLayers([gphy, gmap, ghyb, gsat]);
    map.addLayers([ghyb]);

    //map.addControl(new OpenLayers.Control.MousePosition());
    map.addControl(new OpenLayers.Control.MousePosition({ div: document.getElementById("LabelCoords"), numDigits: 2, prefix: "X: ", separator: "  Y: " }));

    map.events.register("mousemove", map, function (e) {
        var position = this.events.getMousePosition(e);
        OpenLayers.Util.getElement("coords").innerHTML = position;
    });

    // Google.v3 uses EPSG:900913 as projection, so we have to
    // transform our coordinates
    map.setCenter(new OpenLayers.LonLat(10.2, 48.9).transform(
        new OpenLayers.Projection("EPSG:4326"),
        map.getProjectionObject()
    ), 5);
    
    // add behavior to html
    var animate = document.getElementById("animate");
    animate.onclick = function() {a
        for (var i=map.layers.length-1; i>=0; --i) {
            map.layers[i].animationEnabled = this.checked;
        }
    };

    var markers = new OpenLayers.Layer.Markers("Markers");
    map.addLayer(markers);


    var size = new OpenLayers.Size(32, 32);
    var offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
    var icon = new OpenLayers.Icon('http://openclipart.org/image/250px/svg_to_png/140749/squat-marker-green.png', size, offset);

    //markers.AddMarker(new OpenLayers.Marker(new OpenLayers.LonLat(1096323.05,6164963.06), icon));
    markers.AddMarker(new OpenLayers.Marker(new OpenLayers.LonLat(47.353711, 11.337891).transform(
        new OpenLayers.Projection("EPSG:4326"),
        map.getProjectionObject()
    ), icon));
}
