<script setup>
import { fetchItemsFromServer } from '../../mock/server'
import { ref } from 'vue'
import CustomerCard from './CustomerCard.vue'

const search = ref('')
const items = ref([])
const selectedItemId = ref(null)
const loading = ref(false)

const getItems = async () => {
  if (search.value.length === 0) {
    return items.value = []
  }

  try {
    loading.value = true
    items.value = await fetchItemsFromServer(search.value)
  } catch (err) {
    console.log(err)
  } finally {
    loading.value = false
  }
}

const resetSearch = () => {
  search.value = ''
  items.value = []
}

const selectItem = (id) => {
  selectedItemId.value = id
}
</script>

<template>
  <div>
    <h1>CUSTOMERS SEARCH BAR</h1>
    <label for="item-search">Customer name : </label>
    <input
      type="text"
      id="item-search"
      class="input-search"
      placeholder="Enter firstname or lastname"
      v-model="search"
      @keyup.esc="resetSearch"
      @keyup="getItems"
    >
    <div v-if="loading">
      <p>Loading...</p>
    </div>
    <ul id="item-list" v-else>
      <CustomerCard
        v-for="item in items"
        :key="item.id"
        :firstname="item.firstname"
        :lastname="item.lastname"
        :id="item.id"
        :email="item.email"
        :selected="item.id === selectedItemId"
        @customer-selected="selectItem(item.id)"
      />
    </ul>
  </div>
</template>

<style scoped>
.input-search {
  margin: 15px 0;
}

#item-list {
  list-style: none;
  display: flex;
  width: 80%;
  margin: 0 auto;
  justify-content: center;
  flex-wrap: wrap;
  padding: 0;
}
</style>
