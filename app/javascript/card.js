const pay = () => {
  const payjp = Payjp('pk_test_8356f34e1d3bd0c9799c57b8')// PAY.JPテスト公開鍵

  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        console.log(token)
      }
    });
    
    e.preventDefault();
  });
};

window.addEventListener("load", pay);






//const pay = () => {
  //const form = document.getElementById('charge-form')
  //form.addEventListener("submit", (e) => {
    //console.log("購入ボタンが押されました！")
   // e.preventDefault();
  //});
//};

//window.addEventListener("turbo:load", pay);