function profit (){
  const profitDisplay = document.getElementById("item-price");
  profitDisplay.addEventListener("keyup", () => {
    const price = profitDisplay.value;
    const tenPer = Math.floor(price / 10);
    const profit = price - tenPer;
    const profitDis = document.getElementById("profit");
    profitDis.innerHTML = `${profit}`;
  });
}

window.addEventListener('load', profit);