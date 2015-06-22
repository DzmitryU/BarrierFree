var map;
var organizations = {};
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

var tmp;
var contentString = "<div class='organization-title'>" + this.title + "</div>" +
    "<div>Отзывы:</div>" +
    "<div class='user-name'>D d:</div>";
var inputArea = "<input type='text' id='comment'/>" +
    "<button name='submitComment' onclick='addComment()'>Отправить</button>";

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

                tmp = marker;
                marker.infoWindow.setContent(contentString + inputArea);
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

function addComment() {
    var newComment = $("#comment").val();
    tmp.infoWindow.setContent(contentString + newComment + inputArea);
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

    if (typeof organizations[id] !== 'undefined') {
        organizations[id].visible = true;
        organizations[id].marker = marker;
    } else {
        organizations[id] =
        {
            id: id,
            marker: marker,
            visible: true
        }
    }
}

function hideOrganization(id) {
    if (typeof organizations[id] !== 'undefined') {
        organizations[id].marker.setMap(null);
        organizations[id].visible = false;
    }
}

function clearMap() {
    for (var index in organizations) {
        hideOrganization(organizations[index].id)
    }
    showMarkers();
}