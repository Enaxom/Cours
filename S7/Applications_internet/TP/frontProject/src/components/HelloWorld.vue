<template>
  <div class="hello">
    <input type="text" v-model="msg" />
    <h1>{{ msg }}</h1>
    <div>This message has a length of {{ msg.length }} characters</div>

	<div v-if="foods.length > 0">
      <ul>
         <li v-for="food in foods" v-bind:key="food">
			 {{ food.name }} {{ food.qty }} 
			 <input type="number" v-model="food.qty"/>
			 <input type="number" :value="food.qty" @change="food.qty=$event.target.value"/>
			</li>
      </ul>
	  <p>Total weight: {{ totalWeight }}</p>
   </div>
   
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  data: function() {
    return {
		msg: "Hi",
      	foods: [
		  { name: "Tomate", qty: 10 },
		  { name: "Boeuf", qty: 30 },
		  { name: "Jambon", qty: 5 }
		]
    };
  },
  computed: {
	  totalWeight: function() { // Ne doit pas avoir d'arguments
		  return this.foods.reduce(function(accu, food) {
			  // Concaténation sans le parseInt
			  return accu + parseFloat(food.qty)
		  }, 0)
	  },
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
p {
  text-align: left;
}
</style>
