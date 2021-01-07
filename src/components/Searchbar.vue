<template>
  <div>
    <h1>CUSTOMERS SEARCH BAR</h1>
    <label for="item-search">Customer name : </label>
    <input
        type="text"
        id="item-search"
        placeholder="Enter firstname or lastname"
        v-model="search"
        @keyup.esc="resetSearch"
        @keyup="getItems(search)"
    >
    <ul id="item-list" v-show="search || selectedItem">
      <li v-for="item in items" :key="item.id">
        <h3>{{ item.firstname }} {{ item.lastname }}</h3>
        <h5>Customer <span>#{{ item.id }}</span></h5>
        <span class="mail">{{ item.email }}</span>
        <a href="#" class="left-btn">Details</a>
        <a href="#" class="right-btn" @click="selectItem(item)">Choose</a>
      </li>
      <li v-show="selectedItem" class="selected-item">
        <h3>{{ selectedItem.firstname }} {{ selectedItem.lastname }}</h3>
        <h5>Customer <span>#{{ selectedItem.id }}</span></h5>
        <span>{{ selectedItem.email }}</span>
        <a href="#" class="left-btn">Details</a>
        <a href="#" class="right-btn" @click="changeItem">Change</a>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Searchbar',

  data () {
    return {
      search: '',
      lastSearch: '',
      items: [],
      selectedItem: false
    }
  },

  methods: {
    changeItem () {
      this.selectedItem = false
      this.search = this.lastSearch
      this.getItems(this.search)
    },

    async getItems (search) {
      if (search) {
        try {
          const { data } = await axios.get(`http://localhost:8888/server.php?q=${search}`)
          this.items = data
        } catch (error) {
          console.error(error)
        }
        /* former version with promises
        fetch(`http://localhost:8888/server.php?q=${search}`)
            .then(response => response.json())
            .then(data => this.items = data)
            .catch((error) => console.error('Error with the server' + error))

        axios
            .get(`http://localhost:8888/server.php?q=${search}`)
            .then(response => (this.items = response.data))
            .catch((error)) => console.error('Error with the server' + error))
        */
      }
    },

    resetSearch () {
      this.search = ''
      this.items = []
    },

    selectItem (customer) {
      this.selectedItem = customer
      this.lastSearch = this.search
      this.resetSearch()
    }
  }
}
</script>

<style scoped lang="scss">

$redColor: #E60447;

#item-list {
  list-style: none;
  display: flex;
  width: 80%;
  margin: 0 auto;
  justify-content: center;
  flex-wrap: wrap;
  padding: 0;

  li {
    border: 1px solid #2c3e50;
    border-radius: 4px;
    padding: 10px;
    width: 250px;
    height: 110px;
    margin: 10px 10px 0 0;
    position: relative;
    background-color: #e3e3e3;
    box-shadow: 2px 2px 2px -1px black;

    h3 {
      margin-bottom: 10px;
    }

    h5 {
      position: absolute;
      top: -15px;
      right: 10px;
      font-style: italic;
      font-weight: normal;

      span {
        color: $redColor;
      }
    }

    .mail {
      display: block;
    }

    a {
      display: block;
      padding: 2px 4px;
      border-radius: 4px;
      text-decoration: none;
      color: inherit;
      border: 1px solid #35495E;
      position: absolute;
      bottom: 6px;
      font-size: 14px;
      font-style: italic;
      background-color: white;

      &.left-btn {
        left: 10px;
      }

      &.right-btn {
        right: 10px;
      }

      &:hover {
        color: $redColor;
        border-color: $redColor;
      }
    }

    &.selected-item {
      border: 2px solid #48c774;

    }

  }
}
</style>
