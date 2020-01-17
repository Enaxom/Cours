<template>
  <div>
	<br>
    <textarea v-model="mkText" />
	<div v-html="parsedText"> </div>
  </div>
</template>

<script>
import marked from 'marked'

export default {
  data: function() {
    return {
      mkText: "# Titre principal",
    }
  },
  computed: {
	  parsedText: function() {
		  return marked(this.mkText)
	  }
  }
}
</script>
