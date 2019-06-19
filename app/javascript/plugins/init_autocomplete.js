import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('personnal_registration_town') || document.getElementById('adresse');
  if (addressInput) {
    places({
      container: addressInput
//      appId: ENV['ALGOLIA_PLACES_API_ID'],
//      apiKey: ENV['ALGOLIA_PLACES_API_KEY']
       });
  }
};

export { initAutocomplete };
