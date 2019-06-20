import mapboxgl from 'mapbox-gl'

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers, center) => {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([center.lng, center.lat]);
    markers.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
      bounds.extend([2 * center.lng - marker.lng, 2 * center.lat - marker.lat]);
    });
    map.fitBounds(bounds, { padding: 50, maxZoom: 14, duration: 0 });
  };

  if (mapElement) { // only build a map if there is a dix#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const personnal_address_marker = JSON.parse(mapElement.dataset.personnal_address_marker);

    // map
    const map = new mapboxgl.Map( {
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      zoom: 3,
      attributionControl: false
    });

    // seperate current user personnal address marker
    new mapboxgl.Marker()
    .setLngLat([ personnal_address_marker[0].lng, personnal_address_marker[0].lat])
    .addTo(map);


    // try seperate company markers
    const company_around_markers = JSON.parse(mapElement.dataset.company_around_markers);
    company_around_markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const element = document.createElement('div');// Create a HTML element for your custom marker
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.backgroundRepeat = 'no-repeat';
      element.style.width = '25px';
      element.style.height = '25px';

      new mapboxgl.Marker(element)// Pass the element as an argument to the new marker
        .setLngLat([ marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    });

    fitMapToMarkers(map, company_around_markers, personnal_address_marker[0]);
  }
};

export { initMapbox };
