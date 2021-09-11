<template>
  <div id="map" class="map"/>
</template>

<script>
import {Map, View} from 'ol'
import {Tile} from "ol/layer"
import * as proj from "ol/proj";
import { TileJSON } from "ol/source";

export default {
  name: 'jpkMap',
  props: {
    coordinates: {
      type: Object,
      required: false
    },
    mapTilerKey: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      source: new TileJSON({
        url: `https://api.maptiler.com/maps/streets/tiles.json?key=${this.mapTilerKey}`,
        tileSize: 512,
        crossOrigin: 'anonymous'
      }),
      map: null
    }
  },
  computed: {
    centerCoordinates: function () {
      if (typeof this.coordinates !== 'undefined') {
        return this.coordinates.centerCoordinates
      }
      return [8.85, 47.76]
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

<style scoped>
.map {
  height: 400px;
}
</style>