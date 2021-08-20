function post() {
  const price = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener("input", () =>{
    const tax = price.value / 10
    addTaxPrice.innerHTML = tax.toLocaleString()
    profit.innerHTML = (price.value - tax).toLocaleString()
  })
}

window.addEventListener("load", post)