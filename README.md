# Searchbar with Vue JS
Here is a component I've done for an online shop CMS.
This is a search bar to retrieve and select items.

## Example

This example is a Customer search bar that displays a list of customers. You can view a customer summary with name and email.<br>
You also can select one of them with the _**'choose button'**_ (**_'Details'_** button doesn't work yet, you can easily add a details link)

I've attached with the project a simple `server.php` script that query a MySQL Database to send data in JSON format.
The component use the data to display dynamically the list of customers.

## Project setup
```
Git Clone or download
npm install
npm run serve
```

Your application will be running, now you have to setup requests.

## Requests Config

The component makes HTTP GET Requests, working with fetch API or Axios (a npm package, already in package.json)

```
fetch("your-API-address")
    .then(response => response.json())
    .then(data => this.items = data)
    .catch((error) => console.error('Error with the server'))

Or with Axios

const axios = require('axios');
axios
    .get("your-API-address")
    .then(response => (this.items = response.data))
    .catch((error)) => console.error('Error with the server'))
```

Just add your API or server address, **the data returned must be in JSON format.**

---
If you want to try this example, you can do it with a local server :
- import the `itemselector.sql`  in your local database
- call the `server.php` file attached with the project in your request. It needs parameters (already configured)

You can easily arrange the component HTML template with data you receive and need to display.

This is the first version of the component, more features will be released (drag & drop...)

#### More Informations about Vue.JS
Go to <https://vuejs.org/>
