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
      @keyup="getItems(search)"
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

<script>
import CustomerCard from '@/components/CustomerCard'
import { getItems } from '../../mock/server'

export default {
  name: 'Searchbar',
  components: { CustomerCard },
  data () {
    return {
      search: '',
      items: [],
      selectedItemId: null,
      loading: false
    }
  },

  methods: {
    changeItem () {
      this.selectedItem = false
      this.search = this.lastSearch
      this.getItems(this.search)
    },

    async getItems () {
      if (!this.search) {
        return this.items = []
      }

      try {
        this.loading = true
        this.items = await getItems(this.search)
      } catch (err) {
        console.log(err)
      } finally {
        this.loading = false
      }
    },

    resetSearch () {
      this.search = ''
      this.items = []
    },

    selectItem (id) {
      this.selectedItemId = id
    }
  }
}
</script>

<style scoped lang="scss">
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
