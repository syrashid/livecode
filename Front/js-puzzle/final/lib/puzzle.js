// Decorate
(() => {
  const pieces = document.querySelectorAll('td');
  pieces.forEach((piece) => {
    if (piece.dataset.number) piece.style.backgroundImage = `url(./images/${piece.dataset.number}.jpg)`;

  })
})();

// DO NOT TOUCH CODE ABOVE 👆

// Hint Button
const hintBtn = document.getElementById('show-hint');
const hint = document.querySelector('.hint');

document.addEventListener('click', () => hint.classList.toggle('active'));
