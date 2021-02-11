// Decorate
(() => {
  const pieces = document.querySelectorAll('td');
  pieces.forEach((piece) => {
    if (piece.dataset.number) piece.style.backgroundImage = `url(./images/${piece.dataset.number}.jpg)`;
  })
})();

// DO NOT TOUCH CODE ABOVE 👆
