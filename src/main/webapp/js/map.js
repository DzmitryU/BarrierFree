var map;
var markers = [];

function initialize() {
    var mapCanvas = document.getElementById('map-canvas');
    var mapOptions = {
        center: new google.maps.LatLng(53.683446, 23.83662),
        zoom: 16,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }

    map = new google.maps.Map(mapCanvas, mapOptions);
    var bounds = new google.maps.LatLngBounds();

    for (index = 0; index < markers.length; ++index) {
        markers[index].setMap(map);
        bounds.extend(markers[index].getPosition());
    }
    map.fitBounds(bounds);
}

function addMarker(lat, lng, name) {
    var latLng = new google.maps.LatLng(lat, lng);
    var marker = new google.maps.Marker({
        position: latLng,
        title: lat + " " + lng
    });
    markers.push(marker);
}