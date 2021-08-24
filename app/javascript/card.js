const pay = () => {
  Payjp.setPublicKey("環境変数化の時に記述");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("bought_log_bought_user[number]"),
      cvc: formData.get("bought_log_bought_user[cvc]"),
      exp_month: formData.get("bought_log_bought_user[exp_month]"),
      exp_year: `20${formData.get("bought_log_bought_user[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);