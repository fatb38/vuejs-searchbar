<template>
  <div id="app">
    <item-search-engine></item-search-engine>
  </div>
</template>

<script>
import ItemSearchEngine from "@/components/Searchbar";

export default {
  name: 'app',
  components: {
      ItemSearchEngine
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
