function load_card() {
  Payjp.setPublicKey('pk_test_838624fbaee32d37696a2535');
  const submitButton = document.getElementById('button');
  submitButton.addEventListener('click', (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
     number: formData.get("record_address[card_number]"),
     cvc: formData.get("record_address[card_code]"),
     exp_month: formData.get("record_address[card_month]"),
     exp_year: `20${formData.get("record_address[card_year]")}`
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      };

      document.getElementById("card-number").removeAttribute("name")
      document.getElementById("card-exp-month").removeAttribute("name")
      document.getElementById("card-exp-year").removeAttribute("name")
      document.getElementById("card-cvc").removeAttribute("name")

      formResult.submit();
    });
  });
};

window.addEventListener("load", load_card);