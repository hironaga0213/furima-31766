function fee (){
  const feeDisplay = document.getElementById("item-price");
  feeDisplay.addEventListener("keyup", () => {
    const price = feeDisplay.value;
    const tenPer = Math.floor(price / 10);
    const feeDis = document.getElementById("add-tax-price");
    feeDis.innerHTML = `${tenPer}`;
  });
}

window.addEventListener('load', fee);