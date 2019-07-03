import mapboxgl from 'mapbox-gl/dist/mapbox-gl';

const handleMapBox = {
  initialize() {
    const mapElement = document.getElementById('map');
    mapboxgl.accessToken = mapElement.dataset.accessToken;
    const companies = JSON.parse(mapElement.dataset.companies);
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10'
    });
  },
  destroy() {
  },
};

export default handleMapBox;
