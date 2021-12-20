<template>
  <li :class="selected ? 'selected-item' : ''">
    <h3>{{ firstname }} {{ lastname }}</h3>
    <h5>Customer <span>#{{ id }}</span></h5>
    <span class="mail">{{ email }}</span>
    <a href="#" class="left-btn">Details</a>
    <a href="#" class="right-btn" @click="$emit('customer-selected')">Choose</a>
  </li>
</template>

<script>
export default {
  name: 'CustomerCard',
  props: {
    firstname: {
      type: String,
      required: true
    },
    lastname: {
      type: String,
      required: true
    },
    id: {
      type: String,
      required: true
    },
    email: {
      type: String,
      required: true
    },
    selected: {
      type: Boolean,
      default: false
    }
  }
}
</script>

<style scoped lang="scss">
$redColor: #E60447;

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
</style>
