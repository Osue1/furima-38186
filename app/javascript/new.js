function load_window (){
  const priceForm = document.getElementById("item-price");
  
  priceForm.addEventListener('keyup', () => {
    const price = priceForm.value;
    const taxForm = document.getElementById("add-tax-price");
    const profitForm = document.getElementById("profit");
    taxForm.innerHTML = Math.floor(price / 10);
    profitForm.innerHTML = Math.floor(price - taxForm.innerHTML);
  });
};
   
window.addEventListener('load', load_window);