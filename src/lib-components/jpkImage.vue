<template>
  <img :src="imgSrc" alt="Image was not found" :class="['img-fluid', 'mx-auto', {'rounded': !!rounded }, {'shadow-lg': !!shadow }]"/>
</template>

<script>
export default {
  name: 'jpkImage',
  props: {
    imgSrc: {
      type: String,
      required: true
    },
    shadow: {
      type: Boolean,
      required: false,
      default: false
    },
    rounded: {
      type: Boolean,
      required: false,
      default: false
    }
  }
}
</script>
