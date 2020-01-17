<template>
  <div id="app">
    <hello-world />
	<button-counter text="Click me" @increment="count += 1"/>
	{{ count }}
	<MarkdownEditor />
	<MarkdownEditor />
	<MarkdownEditor />
  </div>
</template>

<script>
import HelloWorld from "@/components/HelloWorld"
import ButtonCounter from "@/components/ButtonCounter"
import MarkdownEditor from "@/components/MarkdownEditor"

export default {
  name: "App",
  components: {
	HelloWorld,
	ButtonCounter,
	MarkdownEditor,
  },
  data: function() {
	  return {
		  count: 0,
	  }
  },
  method: {
	  incrementCounter: function() {
		  this.count += 1
	  }
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
