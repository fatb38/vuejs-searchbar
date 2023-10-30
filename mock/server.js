import data from './data.json'

/**
 * @param search {String}
 * @returns {Promise<String[]>}
 */
export function fetchItemsFromServer (search) {
  const res = data.filter(customer => customer.firstname.includes(search) || customer.lastname.includes(search))
  return new Promise((resolve) => {
    setTimeout(() => resolve(res), 400);
  });
}
