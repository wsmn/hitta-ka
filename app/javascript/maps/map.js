import mapboxgl from "mapbox-gl/dist/mapbox-gl";

const fitMapToMarkers = (map, features) => {
  const bounds = new mapboxgl.LngLatBounds();
  features.forEach(({ geometry }) => bounds.extend(geometry.coordinates));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const handleMapBox = {
  initialize() {
    const mapElement = document.getElementById("map");
    mapboxgl.accessToken = mapElement.dataset.accessToken;
    const companies = JSON.parse(mapElement.dataset.companies);
    console.log(companies);
    const coordinates = companies.features[0].geometry.coordinates;
    console.log(coordinates);
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v10",
      center: coordinates,
      zoom: 11.8
    });

    map.addLayer({
      id: "places",
      type: "symbol",
      source: {
        type: "geojson",
        data: {
          type: "FeatureCollection",
          features: [
            {
              type: "Feature",
              properties: {
                description:
                  '<strong>Make it Mount Pleasant</strong><p><a href="http://www.mtpleasantdc.com/makeitmtpleasant" target="_blank" title="Opens in a new window">Make it Mount Pleasant</a> is a handmade and vintage market and afternoon of live entertainment and kids activities. 12:00-6:00 p.m.</p>',
                icon: "theatre"
              },
              geometry: {
                type: "Point",
                coordinates: coordinates,
              }
            }
          ]
        }
      },
      layout: {
        "icon-image": "{icon}-15",
        "icon-allow-overlap": true
      }
    });
  },
  destroy() {}
};

export default handleMapBox;
