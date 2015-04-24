var map;
var organizations = [];
var mapOptions = {
    zoom: 15,
    maxZoom:18,
    minZoom:12
};

/**
 * Works when map is loaded.
 */
function initialize() {
    var mapCanvas = document.getElementById('map-canvas');
    map = new google.maps.Map(mapCanvas, mapOptions);
    map.setCenter(new google.maps.LatLng(53.683446, 23.83662));
    map.setMapTypeId(google.maps.MapTypeId.ROADMAP);

    clearMap();
    showMarkers();
}

/**
 * Displays all markers on map.
 */
function showMarkers() {
    var bounds = new google.maps.LatLngBounds();

    for (var index in organizations) {
        if (organizations[index].visible) {
            var marker = organizations[index].marker;

            marker.setMap(map);
            google.maps.event.addListener(marker, 'click', function () {
                marker.infoWindow.setContent(this.title);
                marker.infoWindow.open(map, this);
            });

            bounds.extend(marker.getPosition());
            if (map != null) {
                map.fitBounds(bounds);
                map.setCenter(bounds.getCenter());
            }
        }
    }
}

/**
 * Adds new organization to list.
 * @param lat
 * @param lng
 * @param name
 */
function addOrganization(id, name, lat, lng) {
    var latLng = new google.maps.LatLng(lat, lng);
    var marker = new google.maps.Marker({
        position: latLng,
        title: name
    });
    marker.infoWindow = new google.maps.InfoWindow({
    });

    var newOrganization = true;
    for (var index in organizations) {
        if (organizations[index].id === id) {
            organizations[index].visible = true;
            organizations[index].marker = marker;
            newOrganization = false;
        }
    }

    if (newOrganization) {
        organizations.push(
            {
                id: id,
                marker: marker,
                visible: true
            });
    }
}

function removeOrganization(id) {
    for (var index in organizations) {
        if (organizations[index].id == id) {
            organizations[index].marker.setMap(null);
            organizations.splice(index, 1);
        }
    }
}

function hideOrganization(id) {
    for (var index in organizations) {
        if (organizations[index].id == id) {
            organizations[index].marker.setMap(null);
            organizations[index].visible = false;
        }
    }
}

function clearMap() {
    for (var index in organizations) {
        organizations[index].visible = false;
    }
    showMarkers();
}