
function item_price (){
  const priceInput = document.getElementById("item-price");
  
    if (!priceInput){ return false;}
    priceInput.addEventListener("input", () => {
       const inputValue = priceInput.value;
       const addTaxDom = document.getElementById("add-tax-price");
       addTaxDom.innerHTML = Math.floor(inputValue*0.1)
       const itemProfit = document.getElementById("profit");
       itemProfit.innerHTML = Math.floor(inputValue*0.9)
    })
  }
  
window.addEventListener('load', item_price);