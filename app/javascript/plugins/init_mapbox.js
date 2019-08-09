import mapboxgl from 'mapbox-gl'

const profilePousseHomepage = document.getElementById('profile_pousse_homepage');

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers, center) => {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([center.lng, center.lat]);
    markers.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
      bounds.extend([2 * center.lng - marker.lng, 2 * center.lat - marker.lat]);
    });
    map.fitBounds(bounds, { padding: 25, maxZoom: 14, duration: 0 });
  };

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

// map
    const map = new mapboxgl.Map( {
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      // style: 'mapbox://styles/mapbox/outdoors-v11',
      zoom: 3,
      attributionControl: false
    });

// seperate current user personnal address marker
    const center_address_marker = JSON.parse(mapElement.dataset.center_address_marker);
    const centerElement = document.createElement('div');
    centerElement.className = 'marker';
// enlever centerElement pour avoir indicateur position
    new mapboxgl.Marker(centerElement)
    .setLngLat([ center_address_marker[0].lng, center_address_marker[0].lat])
    .addTo(map);

// seperate company markers
    const company_around_markers = JSON.parse(mapElement.dataset.company_around_markers);

    company_around_markers.forEach((marker) => {
      // const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const element = document.createElement('div');// Create a HTML element for your custom marker
      element.className = 'marker';
      element.className = 'company_marker';
      // element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundImage = `url("${marker.icon_url}")`;
      element.style.backgroundSize = 'contain';
      element.style.backgroundRepeat = 'no-repeat';
      // element.style.width = '28px';

      element.style.width = `${(35 * marker.passages_counter / center_address_marker[1].maximum_passages).toFixed(1)}px`;
      // element.style.height = '28px';
      element.style.height = `${(35 * marker.passages_counter / center_address_marker[1].maximum_passages).toFixed(1)}px`;
      element.style.filter = 'drop-shadow(-2px 3px 1px rgba(0, 0, 0, 0.1))';
      element.dataset.company_id = `${marker.company_id}`;
      element.addEventListener('mouseover', (event)=>{
        element.style.filter = 'drop-shadow(-3px 5px 2px rgba(0, 0, 0, 0.3))';
        element.style.opacity = '1';
      })
      element.addEventListener('mouseout', (event)=>{
        element.style.filter = 'drop-shadow(-2px 3px 1px rgba(0, 0, 0, 0.1))';
        element.style.opacity = '0.75';
      })

      let linkToControllerCompanyProfil = document.createElement("a");// js actualisation company profil
      linkToControllerCompanyProfil.setAttribute('data-method', 'get');
      linkToControllerCompanyProfil.setAttribute('href', `/companies/${marker.company_id}`);
      linkToControllerCompanyProfil.setAttribute('data-remote', 'true');

      let submitLinkToControllerCompanyProfil = document.createElement("div");// espace du lien
      submitLinkToControllerCompanyProfil.style.width = '100%';
      submitLinkToControllerCompanyProfil.style.height = '100%';

      linkToControllerCompanyProfil.appendChild(submitLinkToControllerCompanyProfil);
      element.appendChild(linkToControllerCompanyProfil);

      new mapboxgl.Marker(element)// Pass the element as an argument to the new marker
        .setLngLat([ marker.lng, marker.lat])
        // .setPopup(popup)
        .addTo(map);
    });

    fitMapToMarkers(map, company_around_markers.slice(0, 10), center_address_marker[0]);
  }
};

export { initMapbox };
