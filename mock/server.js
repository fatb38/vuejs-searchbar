import data from './data.json'

export function getItems (search) {
  const res = data.filter(customer => customer.firstname.includes(search) || customer.lastname.includes(search))
  return new Promise((resolve) => {
    setTimeout(() => resolve(res), 400);
  });
}
