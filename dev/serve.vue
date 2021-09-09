<script>
import {defineComponent} from 'vue';
import jpkMap from "../src/lib-components/jpkMap/jpkMap";

export default defineComponent({
  name: 'ServeDev',
  components: {jpkMap},
});
</script>

<template>
  <div id="app">
    <div>
      <div>
        <h1>Example of all components</h1>
      </div>
      <div>
        <jpk-map map-tiler-key="kIBJW5fNSTqo8BAOwiBH"/>
      </div>
    </div>
  </div>
</template>
