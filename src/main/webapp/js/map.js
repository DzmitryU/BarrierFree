var map;
var markers = [];
var mapOptions = {
    zoom: 15,
    maxZoom:18,
    minZoom:12
}

function initialize() {
    var mapCanvas = document.getElementById('map-canvas');
    map = new google.maps.Map(mapCanvas, mapOptions);
    map.setCenter(new google.maps.LatLng(53.683446, 23.83662));
    map.setMapTypeId(google.maps.MapTypeId.ROADMAP);

    var bounds = new google.maps.LatLngBounds();

    for (index = 0; index < markers.length; ++index) {
        markers[index].setMap(map);
        bounds.extend(markers[index].getPosition());
    }
    map.fitBounds(bounds);
    map.setCenter(bounds.getCenter());
}

function addMarker(lat, lng, name) {
    var latLng = new google.maps.LatLng(lat, lng);
    var marker = new google.maps.Marker({
        position: latLng,
        title: lat + " " + lng
    });
    markers.push(marker);
}