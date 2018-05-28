export { autocomplete };
import GMaps from 'gmaps/gmaps.js';

document.addEventListener("DOMContentLoaded", function() {

  var map = new GMaps({ el: '#map', lat: -33.866, lng: 151.196 });
  var mapElement = document.getElementById('map');
  const markers = JSON.parse(mapElement.dataset.markers);
console.log(markers);
if (markers != null) {

  markers.forEach(function(marker) {
    let new_marker = map.addMarker(marker);
    new_marker.addListener('click', function() {
      window.location.pathname = "pathname" + marker.id;
    });
  });
  console.log(markers)
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}
// input d'autocomplete pour le moment uniquement sur l'id pac-input
  var input = /** @type {!HTMLInputElement} */(
    document.getElementById('pac-input'));

  var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        });

        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setIcon(/** @type {google.maps.Icon} */({
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
          }));
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }


          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + place.formatted_address + '<div><strong>' + place.formatted_phone_number);

          document.getElementById('accomodation_name').value = place.name
          document.getElementById('accomodation_address').value = place.formatted_address
          document.getElementById('accomodation_phone_number').value = place.formatted_phone_number

          infowindow.open(map, marker);
          marker.setMap(map);
        });
});



