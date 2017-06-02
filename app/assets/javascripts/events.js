
function initMap() {
  var uluru = {lat: 40.705247, lng: -74.014034};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 17,
    center: uluru
  });
  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });
}

$(document).ready(function () {
  initMap()
})
