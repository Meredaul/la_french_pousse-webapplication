import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';

import 'bootstrap.native';



import { initMapbox } from '../plugins/init_mapbox';
initMapbox();


import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();
