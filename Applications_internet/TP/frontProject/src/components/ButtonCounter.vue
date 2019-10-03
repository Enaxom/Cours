<template>
  <button @click="incrementCounter">{{ text }}</button>
</template>

<script>
export default {
  props: ['text'],
  methods: {
    incrementCounter: function() {
      this.$emit('increment')
    }
  }
};
</script>

<style scoped>
</style>