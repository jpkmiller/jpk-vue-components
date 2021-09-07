<template>
  <div id="map" class="map" />
</template>

<script>
import {Map, View} from 'ol'
import {Tile} from "ol/layer"
import * as proj from "ol/proj";
import TileJSON from "ol/source/TileJSON";

export default {
  name: 'jpkMap',
  props: {
    coordinates: {
      type: Object,
      required: false,
      default: {}
    },
    mapTilerKey: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      // https://support.maptiler.com/i722-protect-your-map-key
      source: TileJSON.constructor({
        url: `https://api.maptiler.com/maps/streets/tiles.json?key=${this.mapTilerKey}`,
        tileSize: 512,
        crossOrigin: 'anonymous'
      }),
      map: null
    }
  },
  computed: {
    centerCoordinates: function () {
      if (this.coordinates && typeof this.coordinates !== 'undefined') {
        return this.coordinates.centerCoordinates
      }
      return []
    }
  },
  mounted() {
    this.map = new Map({
      layers: [
        new Tile({
          source: this.source
        })
      ],
      target: 'map',
      view: new View({
        constrainResolution: true,
        center: proj.fromLonLat(this.centerCoordinates),
        zoom: 12
      })
    })
  },
  watch: {
    centerCoordinates: function (newCoordinates) {
      this.map.getView().setCenter(proj.fromLonLat(newCoordinates))
      this.map.getView().setZoom(15)
    }
  }
}
</script>