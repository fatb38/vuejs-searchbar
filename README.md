# Searchbar with Vue JS

Here is a component I've done for an online shop CMS.  
It's a search bar that fetches items.

## Description

This example is a Customer search bar that displays a list of customers. You can view a customer summary with name and
email.<br>
You also can select one of them with the _**'choose button'**_ (**_'Details'_** button doesn't work yet, you can easily
add a details link)

I've attached with the project a simple `server.php` script that query a MySQL Database to send data in JSON format. The
component use the data to display dynamically the list of customers.

## Installation

```bash
# clone or download the project
$ git clone https://github.com/fatb38/nuxt-aws-auth-starter-pack.git

# install dependencies
$ npm install

# serve with hot reload at localhost:8080
$ npm run serve
```

## Getting Started

If you want to try this example, you can do it with a local server :

- import the `itemselector.sql`  in your local database (MySQL)
- call the `server.php` file attached with the project in your request. It needs parameters (already configured)

Your application will be running, now you have to setup requests.

## Requests Config

The component makes http Get requests, working either
with [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)
or [Axios](https://www.npmjs.com/package/axios).  
See the examples below :

```javascript
// Axios with async/await
async function getItems (search) {
  if (search) {
    try {
      const { data } = await axios.get('your-API-url')
      items = data
    } catch (err) {
      console.error(err)
    }
  }
}

// Fetch and Axios with promises
fetch('your-API-url')
  .then(response => response.json())
  .then(data => items = data)
  .catch(error => console.error(error))

axios
  .get('your-API-url')
  .then(response => (items = response.data))
  .catch(error => console.error(error)
)
```

Just add your API or server address.

#### More Informations about Vue.JS

Go to <https://vuejs.org/>
