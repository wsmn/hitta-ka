<template>
  <div class="w-full" style="height:100%" id="map"></div>
</template>

<script>
import "mapbox-gl/dist/mapbox-gl.css";
import mapboxgl from "mapbox-gl/dist/mapbox-gl";
import Vue from "vue/dist/vue.esm";
import CompanyPopup from "./company_popup.vue";

export default {
  name: "Mapbox",
  props: ["accessToken", "companies", "company", "resize"],
  data: () => ({
    mapbox: null,
    map: null,
    mapStyle: "mapbox://styles/wsmn/ck1jfxf161o851cq9tg7dbgce?optimize=true",
    popup: null
  }),
  mounted() {
    this.requireMap();
    this.createMap();
    this.addClusters();
  },
  methods: {
    requireMap() {
      this.mapbox = require("mapbox-gl/dist/mapbox-gl");
      this.mapbox.accessToken = this.accessToken;
    },
    createMap() {
      this.map = new mapboxgl.Map({
        container: "map",
        style: this.mapStyle,
        center: [14.5, 63], // starting position
        zoom: 4,
        pitch: 0
      });

      this.popup = new mapboxgl.Popup({
        closeOnClick: false
      });
    },
    addClusters() {
      this.map.on("load", () => {
        //this.map.addControl(new mapboxgl.NavigationControl(), "top-right");
        this.map.addSource("companies", {
          type: "geojson",
          data: this.companyGeojson,
          cluster: true,
          clusterMaxZoom: 4,
          clusterRadius: 50
        });
        this.map.addLayer({
          id: "clusters",
          type: "circle",
          source: "companies",
          filter: ["has", "point_count"],
          paint: {
            "circle-color": [
              "step",
              ["get", "point_count"],
              "#51bbd6",
              100,
              "#f1f075",
              750,
              "#f28cb1"
            ],
            "circle-radius": [
              "step",
              ["get", "point_count"],
              20,
              100,
              30,
              750,
              40
            ]
          }
        });
        this.map.addLayer({
          id: "cluster-count",
          type: "symbol",
          source: "companies",
          filter: ["has", "point_count"],
          layout: {
            "text-field": "{point_count_abbreviated}",
            "text-font": ["DIN Offc Pro Medium", "Arial Unicode MS Bold"],
            "text-size": 12
          }
        });
        this.map.addLayer({
          id: "unclustered-point",
          type: "circle",
          source: "companies",
          filter: ["!", ["has", "point_count"]],
          paint: {
            "circle-color": "#11b4da",
            "circle-radius": 10,
            "circle-stroke-width": 1,
            "circle-stroke-color": "#fff"
          }
        });
        this.map.on("click", "clusters", event => {
          const features = this.map.queryRenderedFeatures(event.point, {
            layers: ["clusters"]
          });
          const clusterId = features[0].properties.cluster_id;
          this.map
            .getSource("companies")
            .getClusterExpansionZoom(clusterId, (err, zoom) => {
              if (err) return;
              this.map.easeTo({
                center: features[0].geometry.coordinates,
                offset: [this.mapboxOffset, -20],
                zoom: zoom
              });
            });
        });
        this.map.on("click", "unclustered-point", event => {
          const features = this.map.queryRenderedFeatures(event.point, {
            layers: ["unclustered-point"]
          });
          const companyId = features[0].properties.companyId;
          this.$emit("select", companyId);
          this.map.easeTo({
            center: features[0].geometry.coordinates,
            offset: [this.mapboxOffset, -20]
          });
          this.addPopup(
            features[0].properties,
            features[0].geometry.coordinates
          );
        });
        this.fitBounds();
      });
    },
    addPopup(properties, coordinates) {
      const popup = new Vue({
        ...CompanyPopup,
        parent: this,
        propsData: { company: properties }
      }).$mount();
      this.popup
        .setLngLat(coordinates)
        .setDOMContent(popup.$el)
        .addTo(this.map);
    },
    fitBounds() {
      const bounds = new mapboxgl.LngLatBounds();
      this.companies.forEach(company => {
        bounds.extend(company.coordinates);
      });
      if (bounds.isEmpty()) {
        console.log("No bounds!");
        let sweden = [10.510684, 55.037336, 24.177166, 69.060151];
        bounds.extend([sweden[0], sweden[1]]);
        bounds.extend([sweden[2], sweden[3]]);
      }
      if (this.map) {
        this.map.fitBounds(bounds, { padding: 70, maxZoom: 8 });
      }
    }
  },
  computed: {
    companyGeojson() {
      let features = this.companies.map(company => ({
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: company.coordinates
        },
        properties: {
          companyId: company.id,
          name: company.name
        }
      }));
      return {
        type: "FeatureCollection",
        features: features
      };
    },
    mapboxOffset() {
      const element = document.getElementById("width-of-sidebar");
      let offset = 0;
      if (element) {
        offset = element.offsetWidth / 2;
      }
      return offset;
    }
  },
  watch: {
    companies: {
      immediate: true,
      handler: function(companies, old_companies) {
        if (this.map == null) {
          return;
        }
        let source = this.map.getSource("companies");
        if (source) {
          source.setData(this.companyGeojson);
          this.fitBounds();
        }
      }
    },
    company: {
      immediate: true,
      handler: function(company, old_company) {
        if (company == null) {
          this.fitBounds();
          if (this.popup) {
            this.popup.remove();
          }
          return;
        }
        if (this.map.getSource == undefined) {
          return;
        }
        let source = this.map.getSource("companies");
        if (source) {
          const element = document.getElementById("width-of-sidebar");
          this.map.flyTo({
            center: company.coordinates,
            offset: [this.mapboxOffset, -20]
          });
        }
        if (this.map != null) {
          this.map.resize();
        }
        this.addPopup({ name: company.name }, company.coordinates);
      }
    },
    resize: {
      immediate: true,
      handler: function(resize, old_value) {
        if (this.map === null || this.map.resize === undefined) {
          return;
        }
        this.map.resize();
      }
    }
  }
};
</script>
