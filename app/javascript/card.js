const pay = () => {
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    console.log("購入ボタンが押されました！")
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);