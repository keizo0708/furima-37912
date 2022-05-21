window.addEventListener('load', () => {
  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener('input', () => {
    const input = price.value;
    const price_tax = parseInt(input * 0.1, 10);
    tax.innerHTML = price_tax;
    profit.innerHTML = input - price_tax;
  });
});