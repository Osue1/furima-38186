function load_window (){
  const priceForm = document.getElementById("item-price");
  
  priceForm.addEventListener('keyup', () => {
    
    function numberExchange(str) {
      return str.replace(/[０-９]/g, function(s) {
          return String.fromCharCode(s.charCodeAt(0) - 0xFEE0);
      });
    };
    const price = numberExchange(priceForm.value);
    const taxForm = document.getElementById("add-tax-price");
    const profitForm = document.getElementById("profit");
    taxForm.innerHTML = Math.floor(price / 10);
    profitForm.innerHTML = Math.floor(price - taxForm.innerHTML);
  });
};
   
window.addEventListener('load', load_window);