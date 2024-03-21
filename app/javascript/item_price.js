window.addEventListener('turbo:load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  console.log(priceInput);

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1); // 入力した金額をもとに販売手数料を計算する処理

    const profit = document.getElementById("profit");
    profit.innerHTML = Math.ceil(inputValue * 0.9); // 入力した金額をもとに販売利益を計算する処理 

    console.log("イベント発火");
  });
})